//
//  ZebraSJIOS.m
//  1120
//
//  Created by mac on 2018/11/20.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZebraSJIOS.h"
#import "LittlesnailSJIOS.h"

#import "ZebraSJIOS.h"
#import "StarfishSJIOS.h"

@interface ZebraSJIOS ()

@property(nonatomic, strong) NSString *codeID;
@property(nonatomic, strong) NSString *countryCode;
@property(nonatomic, strong) NSString *internationalPrefix;
@property(nonatomic, strong) NSString *PreferredSJIOSInternationalPrefix;
@property(nonatomic, strong) NSString *nationalPrefix;
@property(nonatomic, strong) NSString *preferredExtnPrefix;
@property(nonatomic, strong) NSString *nationalPrefixForParsing;
@property(nonatomic, strong) NSString *nationalPrefixTransformRule;
@property(nonatomic, assign) BOOL sameMobileAndSJIOSFixedLinePattern;
@property(nonatomic, strong) NSArray<NSNumberFormatter *> *numberFormats;
@property(nonatomic, strong) NSArray<NSNumberFormatter *> *intlNumberFormats;
@property(nonatomic, assign) BOOL mainCountryForCode;
@property(nonatomic, strong) NSString *leadingDigits;
@property(nonatomic, assign) BOOL leadingZeroPossible;
@end

@implementation ZebraSJIOS



- (CGColorSpaceModel)colorSpaceModel {
   return CGColorSpaceGetModel;
}

- (instancetype)initWithCoder:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)description {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}
- (instancetype)initWithPattern:(NSString *)pattern
                     withFormat:(NSString *)format
      withleadingSJIOSDigitsPatterns:(NSArray *)leadingSJIOSDigitsPatterns
withPrefixSJIOSFormattingRule:(NSString *)PrefixSJIOSFormattingRule
                 whenFormatting:(BOOL)nationalPrefixOptionalWhenSJIOSFormatting
withDomesticCarrierSJIOSCodeFormattingRule:(NSString *)DomesticCarrierSJIOSCodeFormattingRule {
    self;
    if (self) {
        _pattern = pattern;
        _format = format;
        _leadingSJIOSDigitsPatterns = leadingSJIOSDigitsPatterns;
        _PrefixSJIOSFormattingRule = PrefixSJIOSFormattingRule;
        _nationalPrefixOptionalWhenSJIOSFormatting = nationalPrefixOptionalWhenSJIOSFormatting;
        _DomesticCarrierSJIOSCodeFormattingRule = DomesticCarrierSJIOSCodeFormattingRule;
    }
    return self;
}
- (id)copyWithZone:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                                        withFormat:self.format
                         withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
                  withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                                    whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
             withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)fgg {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)errr:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                 forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)fgghbghn:(NSString *)pattern
                        withFormat:(NSString *)format
         withleadingSJIOSDigitsPatterns:(NSArray *)leadingSJIOSDigitsPatterns
  withPrefixSJIOSFormattingRule:(NSString *)PrefixSJIOSFormattingRule
                    whenFormatting:(BOOL)nationalPrefixOptionalWhenSJIOSFormatting
withDomesticCarrierSJIOSCodeFormattingRule:(NSString *)DomesticCarrierSJIOSCodeFormattingRule {
    if (self) {
        _pattern = pattern;
        _format = format;
        _leadingSJIOSDigitsPatterns = leadingSJIOSDigitsPatterns;
        _PrefixSJIOSFormattingRule = PrefixSJIOSFormattingRule;
        _nationalPrefixOptionalWhenSJIOSFormatting = nationalPrefixOptionalWhenSJIOSFormatting;
        _DomesticCarrierSJIOSCodeFormattingRule = DomesticCarrierSJIOSCodeFormattingRule;
    }
    return self;
}
- (instancetype)fgghbghn:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)jhhggcgjmjnmhjnjh {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejjrhtqtrthqrg:(SEL)fdghcdgchd:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)reyhyrtg {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)jjhgngh:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}

- (instancetype)initWiewffrn:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)desdfption {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)forwardingTafdstor:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)frfdcdr {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)edfsdce:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)initWfn:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)descsdon {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fergge:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)dfgb {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)jujhjh:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)fghgjnh:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)descrdfredeiption {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)forwardlector:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)ffvvrr {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)edefrfrde:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)initWiedetrfrhPattern:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)descrdrfrfedeiption {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)forwarrelector:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)dfgbfdfr {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)edefrfrfde:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)iniattern:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)descrdefrion {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)forwardfetForSelector:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)frfccdcrfr {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)edeccde:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)inithPattern:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)desfveiption {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)forwoklector:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)frikifr {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)ekkikyde:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)initWieiuykttern:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)descition {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)forwardinictor:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)ikiy {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)euje:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)initWiuuytern:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)descyjtion {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)forwardingtor:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)frfrhhrrfr {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)ederhhe:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)initWrrtern:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)descrdrttion {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)forwardingTargrctor:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)frrr {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)edergde:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)initWrgern:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)descrrption {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)forwardingTctor:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)frfbgbgr {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)edebgbg:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)initWfgfbdgrn:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)dedfgdption {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)forwardgelector:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)grgrggr {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)ewfrfde:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)initWiewfrn:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)descwfon {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)forwardingwefctor:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)frwefr {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)ewefrde:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)initwfwattern:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)descwfreion {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)forwardingwefrlector:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)fefefr {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)edefwede:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)initWwefern:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)deewfeffon {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)forwardferfector:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)fwefrerfr {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)edewefde:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)iniwefhPattern:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)dfption {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)forrfector:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)fwefwr {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)edwfwfe:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)iniwefttern:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)desweftion {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)forweflector:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)fwef {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)edewfde:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)initweftern:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)desefrtion {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)forwardinweflector:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)dfgbhttr {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)pjmjm:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)fghgjnhfgn:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)jhhggcgjmjnmhjnjhnhjmch {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ferggegtgr:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)gjyh {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)bghh:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)fghgjnhfgnjmj:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)uykjujh {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ferggegtgrdf:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)ghtgg {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)bghhtrg:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)ffdfdgddg:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)vdfvdf {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ferggeg:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)ghtggdgfbfgeq {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)fdgrt:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)ffdfdgddgv:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)vdfvdffvsdfv {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)aefrf:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)ghtggdgfbfggdfbgfbeqg {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)fdgrtagr:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)ffdfdgddgvdfvv:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)vdfvdffvsdfvvfds {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)aefrffaef:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)ghtggdgfbfggdfbgfbhreqgrdfr {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)ferf:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)ffdfdgddgvdfvvgvdfv:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)grg {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)aefrffaefde:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)abd {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)ferfvfd:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)frtgdf:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)grgdgbdfgb {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)aefrffaefdecdcd:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)abdb {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)dv:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)frtgdftgdf:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)ggfh {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)aefrffaefdecdcdd:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)abgbgfbgdb {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)dvgrt:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)frtgdftgdffgtf:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)fggdfgdffvg{
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fgbfgbfg:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)abdbrf {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)dvgfdvdfrt:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)frtgdftgdffgtfxcc:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)gvffvdf {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fddvfdv:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)abdbrff {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)dvgrtght:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)frtgdftgdffgtfxcccdc:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)gvffvdfdfgf {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fddvfdvdfdfdf:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)abdbrffts {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)grdfd:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)cdcvdfv:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)jgytjhyth {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)vdfvdffrf:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)abdbrfftsgt {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)grdfdfreg:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)cdcvdfvdfv:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)jgytjhythjt {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fvdfdffrfccw:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)asgt {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)vdcxv:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)cdcvdfvdfvvdfvdf:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)jgytjhythjtdhh {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fdfdfddffrfccwtgt:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

-(NSString *)fvfvdfvdfvf{
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)ferfrf:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)cdcvdfvdfvvdfvdffef:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)jgytjhythjtdhhstrg {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fvfdffrfccwtgteds:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)asgtgre {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)ferfrfcx:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)werew:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)jgbghb {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fvffdffrfccwtgtedscgs:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)asgtgretgrtgfdg {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)rgr:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)werewdsfse:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)jgbghbthth {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)dffrfccwtgtedscgsf:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)ht {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)rgrdfdf:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)werewdsfsefer:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)jgbghbththhtr {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)dffrfccwtgtedscgsfsdcdcg:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)hthyt {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)efe:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)werewdsfsefergrt:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)htyh {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)awhy:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)hyjy {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)efergrtgv:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)wrer:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)htyherhgb {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)awhyhf:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)hyjyrhg {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)efergrtgvcd:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)wrerfrgrt:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)htyherhgbwgr {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)awhyhffgvf:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)hhhrgr {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)refref:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)wrerfrgrtgrth:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)htyherhgbwgrbfgb {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)awhyhffgvfsfdg:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)hhhrgrhyth {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)refrefcdfvd:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)wrerfrgrtgrthdfdg:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)gfgfdg {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)awhyhffgvfsfdgf:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)fefwed {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)ertff:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)fvdfc:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)gfgfdgddfvf {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)awhyhffgvfsfdgfdg:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)fefwedfrfd {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)dcvfg:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)fvdfcbgf:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)gfgfdgddfvfgth {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ahtrg:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)htrhrgr {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)reffrf:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)ggfbv:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)gfgfdgddfvfgthsg {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ahtrgs:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)htrhrgrrthtrh {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)reffrfdcd:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)ggfbvnghbg:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)fdfdgfdg {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ahtrgsdf:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)hthtg {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)frtfdv:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)ggfbvnghbgvcbfg:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)fdfdgfdgyfb {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ahtrgsdfgg:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)hthtgthh {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)frtfdvcdfvd:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)dfvdfv:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)fdfdgfdgyfbghyh {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ahtrgsdfggsfg:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)kujuy {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)ere:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)dfvdfvfdfgb:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)fhgtg {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ahtrgsdfggsfgdvgb:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)kbt {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)ererfdf:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)dfvdfvfdfgbbghb:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)fhgtghyhfd {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ahtrgsdfggsfgdvgbsdfg:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)kbtgf {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)ererfdffdfvdf:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)dfvdfvfdfgbbghbvxf:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)fhgtghyhfdyt {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ahtrgsdfggsfgdvgbsdfgsvb:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)kgrtytjht {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)refrff:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)vfvdfv:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)fhgtghyhfdytsdg {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ahth:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

-(NSString *)fgfdvdfvf{
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)refrffvdfvfg:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)vfvdfvgfb:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)jhtyh {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ahthgert:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)grgrfe {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)rfrrfr:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)vfvdfvgfbghn:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)jhtyhegtyr {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ahthgertvfg:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)grjyth {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)rfrrfrfth:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)vfvdfvgfbghnbnb :(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)jhtyhegtyrhtrsfw {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ahthgertvfgfrg:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)htgrg {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)rfrrfrfthvfg:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)vfvdfvgfbghnbnbbgb:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)jhtyhegtyrhtrsfwr {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ahthgertvfgfrgwg:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)htrgrt {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)trgty:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)fvfgb:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)jhtyhegtyrhtrsfwrbyh {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ahthgertvfgfrgwgtgg:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)htrn {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)trgtyfdv:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)fvfgbbfgb:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)jhtyhegtyrhtrsfwrbyhsgdth {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ahthgertvfgfrgwgtggg:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)htrnde {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)juyjuj:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)fvfgbbfgbbfgv:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)nhgyh{
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ahthgertvfgfrgwgtgggwggwfv:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)htrndehy {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)juyjujbfgv:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)fvfgbbfgbbfgvgbfgb:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)gggfbfg{
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ahtujy:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)fwefw {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)recdf:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)gfvdfv:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
-(NSString *)fgdhgdh{
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ahtujyi:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)fwefwgrt {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)recdfgt:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)gfvdfvdvfhfgb:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)grgrhhr {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ahtujyiiku:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)gfefe {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)recdfgtgh:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)gfvdfvdvfhfgbvc:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)tgtgffgf {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ahtujyiikuuku:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)gfefegrthr {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)recdfgtghxcdf:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)gfvdfvdvfhfgbvcbg:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)dvdfv {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ahtujyiikuukujn:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)grtgr {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)recdfgtghxcdffdvf:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)dfvxvvcv:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)dvdfvvdfvg {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ahtujyiikuukujnuy:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)htrgrg {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)xc:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)dfvxvvcvvfbfg:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)dvdfvvdfvsfdg {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ahtujyiikuukujnuyhf:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)htrgrgergrt {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)xcvvdf:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)dfvxvvcvvfbfgfgbgb:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)dvdfvvdfvsfdfghbtfh {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ahtujyiikuukujnuyhfy:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)httrg {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)xcvvdfdd:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)dvcvvdfv:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)dvdfvvdfvsfdffvghbtfhhyt {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ahtujyiikuukujnuyhfyhuyju:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)httrghyhy {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)xvfgv:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)vfvffgfv:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)ghbtfhhytgfh {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)art:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)jiuk {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)xvfgvvdfb:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)vfvffgfvbvn:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)ggbg {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)artrttgrt:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)jiukkiuj {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)bfgbc:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)vfvffgfvbvnvcbvc:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)ggbgb {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)artrttgrtgrgw:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)jiukkiujiukuy {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)bfgbcvxc:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)vfvffgfvbvnvcbvcnbvm:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)ggbgbet {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)hg:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)jiujuy {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)fegrtg:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)cvcbv:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)ggbgbetfgh {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)hgfvg:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)jiujuyjyuj {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)fegrtgvdfv:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)cvcbvdfvc:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)ggbgbetfghrhty {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)hgfvgdgg:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)loikiu {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)vxvxv:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)cvcbvdfvcngh:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)ggbgbetfghrhtydbfgb {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)hgfvgdgggh:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)loukjy {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)vxvxvvdfb:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)cvvb:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)hrt {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)hgfvgdggghsgh:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)lohtyhy {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)gdvvdf:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)cvvbbgbgh:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)hrtrtyhty {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)hgfvgdggghsghs:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)lohtyhyyhty {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)gdvvdfvdfv:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)cvvbbgbghnghngbcvb:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)hrtrtyhtyrhtyh {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)hhrth:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)oukuyj {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)fcdc:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)cvvbbgbghnghngbcvbbhgn:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)hrtrtyhtyrhtyhnhrn {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)hhrthegthwg:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)ou {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)fcdcdf:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)cvvbbgbghnghngbcvbbhgnbn:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)hrtrtyhtyrhtyhnhrngdrt {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)hhrthegthwgrgtr:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)ouhtht {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)fcdcdfvdfbg:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)ngbbfgbf:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)hrtrtyhtyrhtyhnhrngdrtgfh {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)hhrthegthwgrgtrhwg:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)ouhgf {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)fdvfdv:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)ngbbfgbfhnj:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)hrtrtyhtyrhtyhnhrngdrtgfhdgt {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)hhrthegthwgrgtrhwgtgthyh:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)oyhf {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)fdvfdvvdfv:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)hghngb:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)gdftrb {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)ferg:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)oyhhtf {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)fvdfv:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)hghngbcbvc:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)gdftrbg {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

-(id)gfggfdg:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)oytht {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)fvdfvbfgb:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)hghngbcbvchnh:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)fgbfgbfg{
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fergrgtg:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)ot {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)fvdfvbfgbbfgb:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)hghngbcbvchnhxcbc:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)gdftrbgdb {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fergrgtgwg:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)otytj {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)fvdfvbfgbbfgbxcv:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)hgfb:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)gdftrbgdbgnghf {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fergrgtgwgggt:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)otytjjtuyj {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)vdfvd:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)hgfbhnhjn:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)ghf {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fergrgtgwgggtw:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)ogdgfdg {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)vdfvdcdf:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)hgfbhnhjnfgbg:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)ghfgdbdfb {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

-(id)dfvdfv:(SEL)vdfvfdv:(NSZone *)zone{
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)rtger {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)eferg:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)hgngb:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)ghfgdbdfbjhg {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fergrgtgwgggtwwgth:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)ruhuyth {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)eferggfd:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)hgngbcv:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)ghfgdbdfbjhgdvdfg {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fergrgtgwgggtwwgthsre:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)rutyht {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)kil:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)hgngbcvgg:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)sfs {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejty:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)rythrt {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)kilgn :(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)hgngbcvgggfhyg:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)sfsfgt {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

-(id)fgdfdfgf:(SEL)fgfdgfd:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)rythrthrtrt {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)kilgnnhn:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)hgngbcvgggfhygb:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)sfsfgtdsfr {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejtyeh:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)httrgrt {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)kilgnnhnnhn:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)hgngbcvgggfhygbn:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)wreew {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejtyeheh:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)hrtg {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)bhg:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)bcvb:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
-(NSString *)ffghhhgf{
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejtyeheheh:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)hrtghg {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)bhgnhjh:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)bcvbbghb:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)wreewsvfdf {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejtyehehehh:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)hrtghghtyh {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)pjmjmjjbg:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)bcvbbghbgh:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)wreewsvfdfewf {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejtyehehehhteh:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)hfgf {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)pjmjmjjjbgmhn:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)bcvbbghbghncxvg:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)wreewsvfdfewffds {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejtyehehehhtehtg:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)hfgfgd {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)bgbn:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)gnghnghn:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)qewf {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejtyehehehhtehtghh:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)hfgfgdggtg {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)bgbnngm:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)gnghnghnbghn:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)qewfwrfef {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejtyehehehhtehtghhjw:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)jytht {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)bgbnngmjhmjm:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)gnghnghnbghnfgbg:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)qewfwrfefcsd {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejtyehehehhtehtghhjweh:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)jythtsdfs {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)jmhjmnb:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)gnghnghnbghnfgbgvb:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)qewfwrfefcsdv {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejtyehehehhtehtghhjwehtwrgt:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

-(NSString *)vfvfbdfv {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)bgbghn:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)gnghnghnbghnfgbgvbbgh:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)qewfwrfefcsdvvgb {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejtyehehehhtehtghhjwehtwrgtth:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)ghfgdg {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)bgbghnghj:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)gnghnghnbghnfgbgvbbghvdfv:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)etr {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejtyehehehhtehtghhjwehtwrgtthh:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)ghfgdgyhbf {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)hgjjhm:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)gnhb:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)etrg {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

-(id)vfvfvf:(SEL)fvfvf:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)ggref {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)hgjjhmnhjmjm:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)gnhbfgb:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)etrgf {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejtyehehehhtehtghhjwehtwrgtthhterht:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)ggreftrg {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)hgjjhmnhjmjmmjkmnb:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)gnhbfgbvdf:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)etrgffdg {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejtyehehehhtehtghhjwehtwrgtthhterhth:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)ggreftrgvdvfdg {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)hjh:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype) ghghg:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)etrgffdgfgtt {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejjrty:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)ggfvdf {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)hjhnhjmjm:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype) ghghghnhg:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)etrgffdgfgttfthy {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejjrtywtr:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)thregre {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)hjhhjm:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype) ghghghnhgbghn:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)etrgffdgfgttfthyvfghf {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejjrtywtrhyh:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)thjuhty {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)hjhhjmmjm:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype) ghghghnhgbghndvd:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)etrgffdgfgttfthyvfghfbfg {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejjrtywtrhyhwgth:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)thjuhtyrtgrgse {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)lolhk:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)ghjhg:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)trhty {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejjrtywtrhyhwgthwgtr:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)jrthrtg {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)lolhkngn:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)ghjhgn:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)trhtybghg {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejjrtywtrhyhwgthwgtrbb:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)jr {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)lolhkngnmjk:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)ghg:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)trhtybghgvcgc {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejjrtywtrhyhwgthwgtrbbsg:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)jrrtgg {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)lolhkngnmjkmhj:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)ghgfb:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)trhtybghgvcgcc {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejjrtywtrhyhwgthwgtrbbsgyhe:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)jrgjh {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)lloluhjn:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)ghgfbhnghn:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)jhhgg {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejjrht:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)jrgjhdfgg {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)lloluhjnnh:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)ghgfbhnghnnghj:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)jhhggcg {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejjrhtqtr:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)jrgjhdfggdvdf {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)lloluhjnnhgj:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)ghgfbhnghnnghjghn:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)jhhggcgjmj {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejjrhtqtrth:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)regfeg {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)hjkhhjm:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}
- (instancetype)ghgfbhnghnnghjghnbf:(NSCoder *)buckle {
    if (self) {
        _pattern = [buckle decodeObjectForKey:@"pattern"];
        _format = [buckle decodeObjectForKey:@"format"];
        _leadingSJIOSDigitsPatterns = [buckle decodeObjectForKey:@"leadingSJIOSDigitsPatterns"];
        _PrefixSJIOSFormattingRule = [buckle decodeObjectForKey:@"PrefixSJIOSFormattingRule"];
        _nationalPrefixOptionalWhenSJIOSFormatting =
        [[buckle decodeObjectForKey:@"nationalPrefixOptionalWhenSJIOSFormatting"] boolValue];
        _DomesticCarrierSJIOSCodeFormattingRule =
        [buckle decodeObjectForKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
    }
    self;
    
    if (self) {
        _numberFormats = [[NSMutableArray alloc] init];
        _intlNumberFormats = [[NSMutableArray alloc] init];
        
        _leadingZeroPossible = NO;
        _mainCountryForCode = NO;
        _sameMobileAndSJIOSFixedLinePattern = NO;
        _internationalPrefix = @"NA";
    }
    return self;
}
- (NSString *)jhhggcgjmjnmhj {
    return [NSString
            stringWithFormat:
            @"[pattern:%@, format:%@, leadingDigitsPattern:%@, PrefixSJIOSFormattingRule:%@, "
            @"nationalPrefixOptionalWhenSJIOSFormatting:%@, DomesticCarrierSJIOSCodeFormattingRule:%@]",
            self.pattern, self.format, self.leadingSJIOSDigitsPatterns, self.PrefixSJIOSFormattingRule,
            self.nationalPrefixOptionalWhenSJIOSFormatting ? @"SJIOSYES" : @"N",
            self.DomesticCarrierSJIOSCodeFormattingRule];
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelUnknown:
            return @"kCGSJIOSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGSJIOSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGSJIOSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGSJIOSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGSJIOSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGSJIOSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGSJIOSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGSJIOSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (id)fejjrhtqtrthqr:(SEL)aSelector:(NSZone *)zone {
    return [[ZebraSJIOS alloc] initWithPattern:self.pattern
                               withFormat:self.format
                withleadingSJIOSDigitsPatterns:self.leadingSJIOSDigitsPatterns
         withPrefixSJIOSFormattingRule:self.PrefixSJIOSFormattingRule
                           whenFormatting:self.nationalPrefixOptionalWhenSJIOSFormatting
    withDomesticCarrierSJIOSCodeFormattingRule:self.DomesticCarrierSJIOSCodeFormattingRule];
}

- (NSString *)regfeghh {
    return [NSString
            stringWithFormat:
            @"* codeID[%@] countryCode[%@] GeneralSJIOSDesc[%@] fixedLine[%@] mobile[%@] SJISOStollFree[%@] "
            @"premiumRate[%@] sharedCost[%@] persSJIOSlNumber[%@] voip[%@] pager[%@] uan[%@] "
            @"SJISOSGency[%@] SJISOSVoicemail[%@] SJIOSNoInternationalDialling[%@] internationalPrefix[%@] "
            @"PreferredSJIOSInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] "
            @"nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] "
            @"sameMobileAndSJIOSFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] "
            @"mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]",
            _codeID, _countryCode, _GeneralSJIOSDesc, _fixedLine, _mobile, _SJISOStollFree, _premiumRate,
            _sharedCost, _persSJIOSlNumber, _voip, _pager, _uan, _SJISOSGency, _SJISOSVoicemail,
            _SJIOSNoInternationalDialling, _internationalPrefix, _PreferredSJIOSInternationalPrefix,
            _nationalPrefix, _preferredExtnPrefix, _nationalPrefixForParsing,
            _nationalPrefixTransformRule, _sameMobileAndSJIOSFixedLinePattern ? @"SJIOSYES" : @"N",
            _numberFormats, _intlNumberFormats, _mainCountryForCode ? @"SJIOSYES" : @"N", _leadingDigits,
            _leadingZeroPossible ? @"SJIOSYES" : @"N"];
}


- (void)jjjijhg:(NSCoder *)buckle {
    
    [buckle encodeObject:_GeneralSJIOSDesc forKey:@"GeneralSJIOSDesc"];
    [buckle encodeObject:_fixedLine forKey:@"fixedLine"];
    [buckle encodeObject:_mobile forKey:@"mobile"];
    [buckle encodeObject:_SJISOStollFree forKey:@"SJISOStollFree"];
    [buckle encodeObject:_premiumRate forKey:@"premiumRate"];
    [buckle encodeObject:_sharedCost forKey:@"sharedCost"];
    [buckle encodeObject:_persSJIOSlNumber forKey:@"persSJIOSlNumber"];
    [buckle encodeObject:_voip forKey:@"voip"];
    [buckle encodeObject:_pager forKey:@"pager"];
    [buckle encodeObject:_uan forKey:@"uan"];
    [buckle encodeObject:_SJISOSGency forKey:@"SJISOSGency"];
    [buckle encodeObject:_SJISOSVoicemail forKey:@"SJISOSVoicemail"];
    [buckle encodeObject:_SJIOSNoInternationalDialling forKey:@"SJIOSNoInternationalDialling"];
    [buckle encodeObject:_codeID forKey:@"codeID"];
    [buckle encodeObject:_countryCode forKey:@"countryCode"];
    [buckle encodeObject:_internationalPrefix forKey:@"internationalPrefix"];
    [buckle encodeObject:_PreferredSJIOSInternationalPrefix forKey:@"PreferredSJIOSInternationalPrefix"];
    [buckle encodeObject:_nationalPrefix forKey:@"nationalPrefix"];
    [buckle encodeObject:_preferredExtnPrefix forKey:@"preferredExtnPrefix"];
    [buckle encodeObject:_nationalPrefixForParsing forKey:@"nationalPrefixForParsing"];
    [buckle encodeObject:_nationalPrefixTransformRule forKey:@"nationalPrefixTransformRule"];
    [buckle encodeObject:[NSNumber numberWithBool:_sameMobileAndSJIOSFixedLinePattern]
                  forKey:@"sameMobileAndSJIOSFixedLinePattern"];
    [buckle encodeObject:_numberFormats forKey:@"numberFormats"];
    [buckle encodeObject:_intlNumberFormats forKey:@"intlNumberFormats"];
    [buckle encodeObject:[NSNumber numberWithBool:_mainCountryForCode] forKey:@"mainCountryForCode"];
    [buckle encodeObject:_leadingDigits forKey:@"leadingDigits"];
    [buckle encodeObject:[NSNumber numberWithBool:_leadingZeroPossible] forKey:@"leadingZeroPossible"];
    [buckle encodeObject:self.pattern forKey:@"pattern"];
    [buckle encodeObject:self.format forKey:@"format"];
    [buckle encodeObject:self.leadingSJIOSDigitsPatterns forKey:@"leadingSJIOSDigitsPatterns"];
    [buckle encodeObject:self.PrefixSJIOSFormattingRule forKey:@"PrefixSJIOSFormattingRule"];
    [buckle encodeObject:[NSNumber numberWithBool:self.nationalPrefixOptionalWhenSJIOSFormatting]
                  forKey:@"nationalPrefixOptionalWhenSJIOSFormatting"];
    [buckle encodeObject:self.DomesticCarrierSJIOSCodeFormattingRule
                  forKey:@"DomesticCarrierSJIOSCodeFormattingRule"];
}


@end
