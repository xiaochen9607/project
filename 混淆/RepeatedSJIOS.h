//
//  RepeatedSJIOS.h
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


@interface RepeatedSJIOS : NSObject
- (instancetype)initWithKeyframe:(NSDictionary *)keyframe;
- (instancetype)initWithValue:(id)value;
- (void)reSJIOSValueWithBlock:(CGFloat (^)(CGFloat inValue))remapBlock;
- (RepeatedSJIOS *)copyWithData:(id)data;

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
@property (nonatomic, readonly, nullable) RepeatedSJIOS *pathData;
@property (nonatomic, readonly) NSArray *arrayValue;
@property (nonatomic, readonly) NSArray<RepeatedSJIOS *> *keyframes;

/*  2 */ @property(nonatomic, strong, readonly) NSString *nationalSJIOSK;
/*  3 */ @property(nonatomic, strong, readonly) NSString *possibleSJIOSK;
/*  9 */ @property(nonatomic, strong, readonly) NSArray<NSNumber *> *possibleSJIOSLength;
/* 10 */ @property(nonatomic, strong, readonly) NSArray<NSNumber *> *possibleSJIOSLengthSJIOSOnly;
/*  6 */ @property(nonatomic, strong, readonly) NSString *exampleNumber;
/*  7 */ @property(nonatomic, strong, readonly) NSData *nationalSJIOSRMatcherData;
/*  8 */ @property(nonatomic, strong, readonly) NSData *possibleSJIOSRMatcherData;

- (instancetype)initWithEntry:(NSArray *)entry;

@end
