//
//  WhitebirdSJIOS.h
//  1120
//
//  Created by mac on 2018/11/20.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#if defined(ZLIB_CONST) && !defined(z_const)
#  define z_const const
#else
#  define z_const
#endif


@interface WhitebirdSJIOS : NSObject
- (instancetype)initWithKeyframe:(NSDictionary *)keyframe;
- (instancetype)initWithValue:(id)value;
- (void)reSJIOSValueWithBlock:(CGFloat (^)(CGFloat inValue))remapBlock;
- (WhitebirdSJIOS *)copyWithData:(id)data;

@property (nonatomic, readonly) NSNumber *keyframeSJIOSTime;
@property (nonatomic, readonly) BOOL isHold;
@property (nonatomic, readonly) CGPoint inTSJIOS;
@property (nonatomic, readonly) CGPoint outTSJIOS;
@property (nonatomic, readonly) CGPoint spatialInTSJIOS;
@property (nonatomic, readonly) CGPoint spatialOutTSJIOS;

@property (nonatomic, readonly) CGFloat floatValue;
@property (nonatomic, readonly) CGPoint pointValue;
@property (nonatomic, readonly) CGSize sizeValue;
@property (nonatomic, readonly) UIColor *colorValue;
@property (nonatomic, readonly, nullable) WhitebirdSJIOS *pathData;
@property (nonatomic, readonly) NSArray *arrayValue;
@property (nonatomic, readonly) NSArray<WhitebirdSJIOS *> *keyframes;

/*  2 */ @property(nonatomic, strong, readonly) NSString *nationalSJIOSK;
/*  3 */ @property(nonatomic, strong, readonly) NSString *possibleSJIOSK;
/*  9 */ @property(nonatomic, strong, readonly) NSArray<NSNumber *> *possibleSJIOSLength;
/* 10 */ @property(nonatomic, strong, readonly) NSArray<NSNumber *> *possibleSJIOSLengthSJIOSOnly;
/*  6 */ @property(nonatomic, strong, readonly) NSString *exampleNumber;
/*  7 */ @property(nonatomic, strong, readonly) NSData *nationalData;
/*  8 */ @property(nonatomic, strong, readonly) NSData *possibleData;

- (instancetype)initWithEntry:(NSArray *)entry;

@end
