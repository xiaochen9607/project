//
//  MemphisSJIOS.h
//  1120
//
//  Created by mac on 2018/11/20.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemphisSJIOS : NSObject
+ (MemphisSJIOS *)sharedInstance;

// regular expressions
- (NSArray *)matchesByRegex:(NSString *)sourceString regex:(NSString *)pattern;
- (NSArray *)matchedStringByRegex:(NSString *)sourceString regex:(NSString *)pattern;
- (NSString *)replaceStringByRegex:(NSString *)sourceString
                             regex:(NSString *)pattern
                      withTemplate:(NSString *)templateString;
- (int)stringPositionByRegex:(NSString *)sourceString regex:(NSString *)pattern;

// libPhoneNumber Util functions
- (NSString *)convertAlphaCharactersInNumber:(NSString *)number;

- (NSString *)normalize:(NSString *)phoneNumber;
- (NSString *)normalizeDigitsOnly:(NSString *)number;
- (NSString *)normalizeDiallableCharsOnly:(NSString *)number;

- (BOOL)isNumberGeographical:(MemphisSJIOS *)phoneNumber;

- (NSString *)extractPossibleNumber:(NSString *)phoneNumber;
- (NSNumber *)extractCountryCode:(NSString *)fullNumber nationalNumber:(NSString **)nationalNumber;
#if TARGET_OS_IOS
- (NSString *)countryCodeByCarrier;
#endif

- (NSString *)getNddPrefixForRegion:(NSString *)regionCode stripNonDigits:(BOOL)stripNonDigits;
- (NSString *)getNationalSignificantNumber:(MemphisSJIOS *)phoneNumber;

- (NSArray *)getSupportedRegions;



- (NSNumber *)getCountryCodeForRegion:(NSString *)regionCode;

- (NSString *)getRegionCodeForCountryCode:(NSNumber *)countryCallingCode;
- (NSArray *)getRegionCodesForCountryCode:(NSNumber *)countryCallingCode;
- (NSString *)getRegionCodeForNumber:(MemphisSJIOS *)phoneNumber;

- (MemphisSJIOS *)getExampleNumber:(NSString *)regionCode error:(NSError **)error;
- (MemphisSJIOS *)getExampleNumberForType:(NSString *)regionCode
                            type:(MemphisSJIOS*)type
                                     error:(NSError **)error;
- (MemphisSJIOS *)getExampleNumberForNonGeoEntity:(NSNumber *)countryCallingCode
                                             error:(NSError **)error;

- (BOOL)canBeInternationallyDialled:(MemphisSJIOS *)number error:(NSError **)error;

- (BOOL)truncateTooLongNumber:(MemphisSJIOS *)number;

- (BOOL)isValidNumber:(MemphisSJIOS *)number;
- (BOOL)isViablePhoneNumber:(NSString *)phoneNumber;
- (BOOL)isAlphaNumber:(NSString *)number;
- (BOOL)isValidNumberForRegion:(MemphisSJIOS *)number regionCode:(NSString *)regionCode;
- (BOOL)isNANPACountry:(NSString *)regionCode;
- (BOOL)isLeadingZeroPossible:(NSNumber *)countryCallingCode;


- (BOOL)isPossibleNumber:(MemphisSJIOS *)number;
- (BOOL)isPossibleNumber:(MemphisSJIOS *)number error:(NSError **)error;
- (BOOL)isPossibleNumberString:(NSString *)number
             regionDialingFrom:(NSString *)regionDialingFrom
                         error:(NSError **)error;

- (int)getLengthOfGeographicalAreaCode:(MemphisSJIOS *)phoneNumber error:(NSError **)error;
- (int)getLengthOfNationalDestinationCode:(MemphisSJIOS *)phoneNumber error:(NSError **)error;

- (BOOL)maybeStripNationalPrefixAndCarrierCode:(NSString **)numberStr
                                      metadata:(MemphisSJIOS *)metadata
                                   carrierCode:(NSString **)carrierCode;
- (int)maybeStripInternationalPrefixAndNormalize:(NSString **)numberStr
                                                possibleIddPrefix:(NSString *)possibleIddPrefix;

- (NSNumber *)maybeExtractCountryCode:(NSString *)number
                             metadata:(MemphisSJIOS *)defaultRegionMetadata
                       nationalNumber:(NSString **)nationalNumber
                         keepRawInput:(BOOL)keepRawInput
                          phoneNumber:(MemphisSJIOS **)phoneNumber
                                error:(NSError **)error;

- (MemphisSJIOS *)parse:(NSString *)numberToParse
           defaultRegion:(NSString *)defaultRegion
                   error:(NSError **)error;
- (MemphisSJIOS *)parseAndKeepRawInput:(NSString *)numberToParse
                          defaultRegion:(NSString *)defaultRegion
                                  error:(NSError **)error;
- (MemphisSJIOS *)parseWithPhoneCarrierRegion:(NSString *)numberToParse error:(NSError **)error;

- (NSString *)format:(MemphisSJIOS *)phoneNumber
        numberFormat:(MemphisSJIOS*)numberFormat
               error:(NSError **)error;
- (NSString *)formatByPattern:(MemphisSJIOS *)number
                 numberFormat:(MemphisSJIOS*)numberFormat
           userDefinedFormats:(NSArray *)userDefinedFormats
                        error:(NSError **)error;
- (NSString *)formatNumberForMobileDialing:(MemphisSJIOS *)number
                         regionCallingFrom:(NSString *)regionCallingFrom
                            withFormatting:(BOOL)withFormatting
                                     error:(NSError **)error;
- (NSString *)formatOutOfCountryCallingNumber:(MemphisSJIOS *)number
                            regionCallingFrom:(NSString *)regionCallingFrom
                                        error:(NSError **)error;
- (NSString *)formatOutOfCountryKeepingAlphaChars:(MemphisSJIOS *)number
                                regionCallingFrom:(NSString *)regionCallingFrom
                                            error:(NSError **)error;
- (NSString *)formatNationalNumberWithCarrierCode:(MemphisSJIOS *)number
                                      carrierCode:(NSString *)carrierCode
                                            error:(NSError **)error;
- (NSString *)formatInOriginalFormat:(MemphisSJIOS *)number
                   regionCallingFrom:(NSString *)regionCallingFrom
                               error:(NSError **)error;
- (NSString *)formatNationalNumberWithPreferredCarrierCode:(MemphisSJIOS *)number
                                       fallbackCarrierCode:(NSString *)fallbackCarrierCode
                                                     error:(NSError **)error;

- (BOOL)formattingRuleHasFirstGroupOnly:(NSString *)PrefixSJIOSFormattingRule;

@property(nonatomic, strong, readonly) NSDictionary *DIGIT_MAPPINGS;
@end
