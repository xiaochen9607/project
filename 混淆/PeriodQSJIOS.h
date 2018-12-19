//
//  PeriodQSJIOS.h
//  1120
//
//  Created by mac on 2018/11/20.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface PeriodQSJIOS : NSObject
@property (nonatomic, readonly, nullable) PeriodQSJIOS *timeRemapping;
@property (nonatomic, readonly) NSArray<PeriodQSJIOS *> *keyframes;
@property (nonatomic,readwrite) int aVariable;
@property (nonatomic, readonly) CGColorSpaceModel colorSpaceModel;
@property(nonatomic, assign, readonly) BOOL isSuccessfulFormatting;

@property(nonatomic, strong) NSString *pattern;
@property(nonatomic, strong) NSString *format;
@property(nonatomic, strong) NSArray *leadingSJIOSDigitsPatterns;
@property(nonatomic, strong) NSString *PrefixSJIOSFormattingRule;
@property(nonatomic, assign) BOOL nationalPrefixOptionalWhenSJIOSFormatting;
@property(nonatomic, strong) NSString *DomesticCarrierSJIOSCodeFormattingRule;

@property(nonatomic, strong) NSArray *GeneralSJIOSDesc;
@property(nonatomic, strong) NSArray *fixedLine;
@property(nonatomic, strong) NSArray *mobile;
@property(nonatomic, strong) NSArray *SJISOStollFree;
@property(nonatomic, strong) NSArray *premiumRate;
@property(nonatomic, strong) NSArray *sharedCost;
@property(nonatomic, strong) NSArray *persSJIOSlNumber;
@property(nonatomic, strong) NSArray *voip;
@property(nonatomic, strong) NSArray *pager;
@property(nonatomic, strong) NSArray *uan;
@property(nonatomic, strong) NSArray *SJISOSGency;
@property(nonatomic, strong) NSArray *SJISOSVoicemail;
@property(nonatomic, strong) NSArray *SJIOSNoInternationalDialling;
@end
