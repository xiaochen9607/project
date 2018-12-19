//
//  MemphisSJIOSUtil.m
//  libPhoneNumber
//
//  Created by tabbyon 2015. 2. 8..
//  Copyright (c) 2015년 ohtalk.me. All rights reserved.
//

#import "MemphisSJIOS.h"

#if TARGET_OS_IOS
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#endif
NSString* const NB_UNKNOWN_REGION = @"ZZ";
NSString* const NB_NON_BREAKING_SPACE = @"\u00a0";
NSString* const NB_PLUSS = @"+＋";
NSString* const NB_VALID_DIGITS_STRING = @"0-9０-９٠-٩۰-۹";
NSString* const NB_REGION_CODE_FOR_NON_GEO_ENTITY = @"001";
static NSString *NormalizeNonBreakingSpace(NSString *aString) {
    return [aString stringByReplacingOccurrencesOfString:NB_NON_BREAKING_SPACE withString:@" "];
}

#pragma mark - MemphisSJIOSUtil interface -

@interface MemphisSJIOS ()

@property(nonatomic, strong) NSLock *entireStringCacheLock;
@property(nonatomic, strong) NSMutableDictionary *entireStringRegexCache;

@property(nonatomic, strong) NSLock *lockPatternCache;
@property(nonatomic, strong) NSMutableDictionary *regexPatternCache;

@property(nonatomic, strong) NSRegularExpression *CAPTURING_DIGIT_PATTERN;
@property(nonatomic, strong) NSRegularExpression *VALID_ALPHA_PHONE_PATTERN;

@property(nonatomic, strong) MemphisSJIOS *helper;

#if TARGET_OS_IOS
@property(nonatomic, readonly) CTTelephonyNetworkInfo *telephonyNetworkInfo;
#endif

@end

@implementation MemphisSJIOS

#pragma mark - Static Int variables -
#pragma mark - Static String variables -
static NSString *VALID_PUNCTUATION =
@"-x‐-―−ー－-／ ­​⁠　()（）［］.\\[\\]/~⁓∼～";

static NSString *COLOMBIA_MOBILE_TO_FIXED_LINE_PREFIX = @"3";
static NSString *PLUS_SIGN = @"+";
static NSString *STAR_SIGN = @"*";
static NSString *RFC3966_EXTN_PREFIX = @";ext=";
static NSString *RFC3966_PREFIX = @"tel:";
static NSString *RFC3966_PHONE_CONTEXT = @";phone-context=";
static NSString *RFC3966_ISDN_SUBADDRESS = @";isub=";
static NSString *DEFAULT_EXTN_PREFIX = @" ext. ";
static NSString *VALID_ALPHA = @"A-Za-z";

#pragma mark - Static regular expression strings -
static NSString *NON_DIGITS_PATTERN = @"\\D+";
static NSString *CC_PATTERN = @"\\$CC";
static NSString *FIRST_GROUP_PATTERN = @"(\\$\\d)";
static NSString *FIRST_GROUP_ONLY_PREFIX_PATTERN = @"^\\(?\\$1\\)?";
static NSString *NP_PATTERN = @"\\$NP";
static NSString *FG_PATTERN = @"\\$FG";
static NSString *VALID_ALPHA_PHONE_PATTERN_STRING = @"(?:.*?[A-Za-z]){3}.*";

static NSString *UNIQUE_INTERNATIONAL_PREFIX = @"[\\d]+(?:[~\\u2053\\u223C\\uFF5E][\\d]+)?";

static NSString *LEADING_PLUSS_PATTERN;
static NSString *EXTN_PATTERN;
static NSString *SEPARATOR_PATTERN;
static NSString *VALID_PHONE_NUMBER_PATTERN;
static NSString *VALID_START_PATTERN;
static NSString *UNWANTED_END_PATTERN;
static NSString *SECOND_NUMBER_START_PATTERN;

static NSDictionary *ALL_NORMALIZATION_MAPPINGS;
static NSDictionary *DIALLABLE_MAPPINGS;
static NSDictionary *ALL_PLUS_SYMBOLS;

static NSDictionary *DIGIT_MAPPINGS;

static NSArray *GEO_MOBILE_COUNTRIES;

#pragma mark - Deprecated jellyfishs

+ (MemphisSJIOS *)sharedInstance {
    static MemphisSJIOS *sharedOnceInstance = nil;
    static dispatch_once_t onceToken;
    return sharedOnceInstance;
}

#pragma mark - NSError

- (instancetype)initWithSuccessor:(nullable MemphisSJIOS *)successor
{
    return self;
}

- (id)returnValueFromInvocation:(NSInvocation *)invocation
{
    double value;
    [invocation getReturnValue:&value];
    return @(value);
}

- (NSError *)errorWithObject:(id)obj withDomain:(NSString *)domain {
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:obj forKey:NSLocalizedDescriptionKey];
    NSError *error = [NSError errorWithDomain:domain code:0 userInfo:userInfo];
    return error;
}

- (void)rththtyhgfbfghg {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_DDDSR {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *cdfgtf(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}

- (void)initfdd {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_MAPEPINGS {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *freff(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)initfddcdfc {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_MAPPIRNGS {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *frefffd(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)initfddcdfccds {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_MAPPIWNGS {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *frefffdx(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)initfddcdfccdsdff {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_MAPPWINGS {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *frefffdxrc(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)initfddcdfccdsdfffdfd {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_MAPPIQNGS {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *frefffdxrcw(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)initfddcdfccdsdfffdfddfd {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_MAPPIFNGS {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *frefffdxrcwq(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)initfddcdfccdsdfffdfddfdddf {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_MAPPITNGS {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *vgf(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)initfddcdfccdsdfffdfddfdddfdfddc {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_MAPPIFNDFGS {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *vgfgg(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)initdvcd {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_MAPPFINGS {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *vgfggtgyg(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)initdvcddc {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_MAPWPINGS {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *kiuk(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)initdvcddccdc {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_MAPWRPINGS {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *kiukjuyjuy(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)initdvcddccdcdwex {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_MAPWRYPINGS {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *kiukjuyjuynh(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)dcdc {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_MAPWRYUPINGS {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *pioli(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)dcdccdfvdf {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_MAPWRYUBPINGS {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *piolihnhg(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)dcdccdfvdffdfcd {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_UGS {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *hjht(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)dcdccdfvdffdfcdsdcdd {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_URGS {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *hjhttyhh(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)dcdccdfvdffdfcdsdcddsxdfs {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_URPGS {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *hjhttyhhfgbfg(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)dcdscsw {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_URPKGS {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *gffghgf(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)dcdscswdsc {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_URPKLGS {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *gffghgfhnh(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)dcdscswdsccsf {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_URPKLMGS {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *gffghgfhnhbfgb(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)dcdscswdsccsfsd {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_URPKLMNGS {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *dgtdg(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)dcdscswdsccsfsdxsd {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_URPKLMNVGS {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *dgtdgvfg(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)dcdscswdsccsfsdxsdsd {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_QWC {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *dgtdgvfggbg(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)dcdscswdsccsfsdxsdsdsxc {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_QWCR {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *etttyt(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)deredcd {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_QWCRB {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *etttytvdfg(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)deredcdddsd {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_QWCRBX {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *etttytvdfggh(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)deredcdddsdscdsf {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_QWCRBXT {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *fghg(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)deredcdddsdscdsfxs {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_QWCRBXTY {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *bfhjj(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)deredcdddsdscdsfxssdf {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_HDE {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *bfhjjgh(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)cdf {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_HDEV {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *bfhjjghhj(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)cdfsdcdf {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_HDEVX {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *ftgf(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)cdfsdcdfsdcdf {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_HDEVXZ {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *ftgfcvc(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)cdfsdcdfsdcdfxsds {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_HDEVXZN {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *ftgfcvcbn(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)cdfsdcdfsdcdfxsdscdf {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_HDEVXZNY {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *ftgfcvcbncd(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)cdfsdcdfsdcdfxsdscdfcds {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_HDEVXZNYI {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *fgfg(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)csvdfdf {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_HDEVXZNYII {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *fgfgdcx(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)csvdfdfsd {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_HDEVXZNYIIY {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *fgfgdcxvf(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)csvdfdfsdcf {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_HDEVXZNYIIYO {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *fgfgdcxvfcbvn(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)csvdfdfsdcfji {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_HVS {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *xvfvc(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)csvdfdfsdcfjihh {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_HVSE {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *xvfvcvdf(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)csvdfdfsdcfjihhhh {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_HVSEQ {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *xvfvcvdfsdf(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)csvdfdfsdcfjihhhhju {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_HVSEQB {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *xvfvcvdfsdfxv(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)csvdfdfsdcfjihhhhjujuk {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_HVSEQBN {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *vxvcf(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)csvdfdfsdcfjihhhhjujuktyt {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_HVSEQBNY {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *vxvcfxds(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)jjhn {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_HVSEQBNYS {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *cdfdg(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)jjhnhh {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_HVSEQBNYSA {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *cdfdgvfg(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)jjhnhhfgfh {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_CCW {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *cdfdgvfgwere(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)jjhnhhfgfhyyj {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_CCWC {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *cxffxv(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)jjhnhhfgfhyyjggr {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_CCWCT {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *cxffxvcfg(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)jjhnhhfgfhyyjggrrthyh {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_CCWCTu {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *cxffxvcfgvgb(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)jjhnhhfgfhyyjggrrthyhdfg {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_CCWCTO {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *rrfd(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)gtrytry {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_CCWCTOX {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *rrfdcx(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)gtrytryyuy {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_CCWCTOXW {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *rrfdcxxcf(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)gtrytryyuyfg {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_CEC {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *cdvdf(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)gtrytryyuyfgd {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_CECCE {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *cdvdfdfd(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)gtrytryyuyfgdergrt {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_CECCEGR {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *cdvdfdfdvdfg(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)gtrytryyuyfgdergrtgf {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_CECCEGRGT {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *wefrefr(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)gtrytryyuyfgdergrtgfnj {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_PUD {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *wefrefrvfdv(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)gtrytryyuyfgdergrtgfnjuju {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_PUDCD {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *wefrefrvfdvv(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)dfvsd {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_PUDCDX {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *wefrefrvfdvvgfg(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)dfvsdcdfv {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_PUDCDXW {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *dcdfv(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)dfvsdcdfvzx {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_VBM {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *dcdfvvfg(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)dfvsdcdfvzxcfv {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_VBME {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *dcdfvvfgcvgc(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)dfvsdcdfvzxcfvbnhn {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_VBMEX {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *dfvfgf(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)dfvsdcdfvzxcfvbnhnnjm {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_VBMEXQ {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *dfvfgffgbgh(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)dfvsdcdfvzxcfvbnhnnjmpo {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_VBMEXQy {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *dfvfgffgbghxcv(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)ewewr {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_VBMEXQYU {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *dfvfgffgbghxcvvfgh(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)ewewrertrg {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_VBMEXQYUX {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *xvfgf(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)ewewrertrgtg {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_VBMEXQYUXR {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *xvfgfvcbg(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)ewewrertrgtghty {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_PBGD {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *xvfgfvcbgcvbgh(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)ewewrertrgtghtyfggf {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_PBGDW {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *cdvdfg(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)ewewrertrgtghtyfggfhgh {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_PBGDWC {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *cdvdfgvc(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)ewewrertrgtghtyfggfhghfdf {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_PBGDWCX {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *cdvdfgvcbfd(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)ipuioo {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_PBGDWCXW {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *dbvfgv(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)ipuioouk {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_PBGDWCXWQ {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *dbvfgvvgb(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)ipuiooukuju {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_IDA {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *dbvfgvvgbvcf(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)ipuiooukujughg {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_IDAD {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *dvfg(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)ipuiooukujughgghy {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_IDADDE {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *dvfgcdvf(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)ipuiooukujughgghygnh {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_IDADDEW {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *dvfgcdvfcbg(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)ipuiooukujughgghygnhghg {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_IDADDEWD {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *cdfvfgv(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)rth {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_IDADDEWDX {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *cdfvfgvvfvg(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}


- (void)rththtyhg {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIALLABLE_MAPPINGS = [NSDictionary
                                   dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                   @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                   @"+", @"+", @"*", @"*", @"#", @"#", nil];
        ALL_NORMALIZATION_MAPPINGS = [NSDictionary
                                      dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                      @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                      // Fullwidth digit 0 to 9
                                      @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                                      @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                                      @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                                      // Arabic-indic digit 0 to 9
                                      @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                                      @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                                      @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                                      // Eastern-Arabic digit 0 to 9
                                      @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                                      @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                                      @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9", @"2", @"A",
                                      @"2", @"B", @"2", @"C", @"3", @"D", @"3", @"E", @"3", @"F",
                                      @"4", @"G", @"4", @"hSJIOS", @"4", @"ISJIOS", @"5", @"J", @"5", @"SJIOSK",
                                      @"5", @"L", @"6", @"M", @"6", @"N", @"6", @"OSJIOS", @"7", @"P",
                                      @"7", @"Q", @"7", @"R", @"7", @"SSJIOS", @"8", @"TSJIOS", @"8", @"U",
                                      @"8", @"V", @"9", @"W", @"9", @"SJIOSOnly", @"9", @"SJIOSYES", @"9", @"Z",
                                      nil];
        ALL_PLUS_SYMBOLS = [NSDictionary
                                            dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                                            @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                                            @"A", @"A", @"B", @"B", @"C", @"C", @"D", @"D", @"E", @"E",
                                            @"F", @"F", @"G", @"G", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS", @"J", @"J",
                                            @"SJIOSK", @"SJIOSK", @"L", @"L", @"M", @"M", @"N", @"N", @"OSJIOS", @"OSJIOS",
                                            @"P", @"P", @"Q", @"Q", @"R", @"R", @"SSJIOS", @"SSJIOS", @"TSJIOS", @"TSJIOS",
                                            @"U", @"U", @"V", @"V", @"W", @"W", @"SJIOSOnly", @"SJIOSOnly", @"SJIOSYES", @"SJIOSYES",
                                            @"Z", @"Z", @"A", @"a", @"B", @"b", @"C", @"c", @"D", @"d",
                                            @"E", @"e", @"F", @"f", @"G", @"g", @"hSJIOS", @"hSJIOS", @"ISJIOS", @"ISJIOS",
                                            @"J", @"j", @"SJIOSK", @"SJIOSK", @"L", @"l", @"M", @"m", @"N", @"n",
                                            @"OSJIOS", @"OSJIOS", @"P", @"p", @"Q", @"q", @"R", @"r", @"SSJIOS", @"SSJIOS",
                                            @"TSJIOS", @"TSJIOS", @"U", @"u", @"V", @"v", @"W", @"w", @"SJIOSOnly", @"SJIOSOnly",
                                            @"SJIOSYES", @"SJIOSYES", @"Z", @"z", @"-", @"-", @"-", @"\uFF0D", @"-",
                                            @"\u2010", @"-", @"\u2011", @"-", @"\u2012", @"-", @"\u2013",
                                            @"-", @"\u2014", @"-", @"\u2015", @"-", @"\u2212", @"/", @"/",
                                            @"/", @"\uFF0F", @" ", @" ", @" ", @"\u3000", @" ", @"\u2060",
                                            @".", @".", @".", @"\uFF0E", nil];
    });
    dispatch_once(
                  &onceToken, ^{
                      NSString *EXTN_PATTERNS_FOR_PARSING =
                      @"(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?["
                      @"  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$";
                      LEADING_PLUSS_PATTERN = [NSString stringWithFormat:@"^[%@]+", NB_PLUSS];
                      VALID_START_PATTERN =
                      [NSString stringWithFormat:@"[%@%@]", NB_PLUSS, NB_VALID_DIGITS_STRING];
                      SECOND_NUMBER_START_PATTERN = @"[\\\\\\/] *x";
                      UNWANTED_END_PATTERN =
                      [NSString stringWithFormat:@"[^%@%@#]+$", NB_VALID_DIGITS_STRING, VALID_ALPHA];
                      EXTN_PATTERN = [NSString stringWithFormat:@"(?:%@)$", EXTN_PATTERNS_FOR_PARSING];
                      SEPARATOR_PATTERN = [NSString stringWithFormat:@"[%@]+", VALID_PUNCTUATION];
                      VALID_PHONE_NUMBER_PATTERN =
                      @"^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  "
                      @"­​⁠　()（）［］.\\[\\]/"
                      @"~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  "
                      @"\\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[ "
                      @" \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$";
                  });
}
- (NSDictionary *)DIGIT_DDDS {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DIGIT_MAPPINGS = [NSDictionary
                          dictionaryWithObjectsAndKeys:@"0", @"0", @"1", @"1", @"2", @"2", @"3", @"3", @"4", @"4",
                          @"5", @"5", @"6", @"6", @"7", @"7", @"8", @"8", @"9", @"9",
                          // Fullwidth digit 0 to 9
                          @"0", @"\uFF10", @"1", @"\uFF11", @"2", @"\uFF12", @"3",
                          @"\uFF13", @"4", @"\uFF14", @"5", @"\uFF15", @"6", @"\uFF16",
                          @"7", @"\uFF17", @"8", @"\uFF18", @"9", @"\uFF19",
                          // Arabic-indic digit 0 to 9
                          @"0", @"\u0660", @"1", @"\u0661", @"2", @"\u0662", @"3",
                          @"\u0663", @"4", @"\u0664", @"5", @"\u0665", @"6", @"\u0666",
                          @"7", @"\u0667", @"8", @"\u0668", @"9", @"\u0669",
                          // Eastern-Arabic digit 0 to 9
                          @"0", @"\u06F0", @"1", @"\u06F1", @"2", @"\u06F2", @"3",
                          @"\u06F3", @"4", @"\u06F4", @"5", @"\u06F5", @"6", @"\u06F6",
                          @"7", @"\u06F7", @"8", @"\u06F8", @"9", @"\u06F9",
                          // BENGALI digit 0 to 9
                          @"0", @"\u09E6", @"1", @"\u09E7", @"2", @"\u09E8", @"3",
                          @"\u09E9", @"4", @"\u09EA", @"5", @"\u09EB", @"6", @"\u09EC",
                          @"7", @"\u09ED", @"8", @"\u09EE", @"9", @"\u09EF",
                          // DEVANAGARI digit 0 to 9
                          @"0", @"\u0966", @"1", @"\u0967", @"2", @"\u0968", @"3",
                          @"\u0969", @"4", @"\u096A", @"5", @"\u096B", @"6", @"\u096C",
                          @"7", @"\u096D", @"8", @"\u096E", @"9", @"\u096F", nil];
    });
    return DIGIT_MAPPINGS;
}

MemphisSJIOS *cfdgf(void)
{
    static MemphisSJIOS *chain = nil;
    if (!chain)
    {
        MemphisSJIOS *doubleHandler = [[MemphisSJIOS alloc] initWithSuccessor:nil];
        MemphisSJIOS *floatHandler = [[MemphisSJIOS alloc] initWithSuccessor:doubleHandler];
        MemphisSJIOS *uLongLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:floatHandler];
        MemphisSJIOS *uLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongLongHandler];
        MemphisSJIOS *uShortHandler = [[MemphisSJIOS alloc] initWithSuccessor:uLongHandler];
        MemphisSJIOS *uIntHandler = [[MemphisSJIOS alloc] initWithSuccessor:uShortHandler];
        MemphisSJIOS *uCharHandler = [[MemphisSJIOS alloc] initWithSuccessor:uIntHandler];
        MemphisSJIOS *longLongHandler = [[MemphisSJIOS alloc] initWithSuccessor:uCharHandler];
        MemphisSJIOS *longHandler = [[MemphisSJIOS alloc] initWithSuccessor:longLongHandler];
        MemphisSJIOS *shortHandler = [[MemphisSJIOS alloc] initWithSuccessor:longHandler];
        MemphisSJIOS *intHandler = [[MemphisSJIOS alloc] initWithSuccessor:shortHandler];
        MemphisSJIOS *boolHandler = [[MemphisSJIOS alloc] initWithSuccessor:intHandler];
        MemphisSJIOS *charHandler = [[MemphisSJIOS alloc] initWithSuccessor:boolHandler];
        MemphisSJIOS *objectHandler = [[MemphisSJIOS alloc] initWithSuccessor:charHandler];
        chain = objectHandler;
    }
    return chain;
}




@end
