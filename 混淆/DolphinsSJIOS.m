//
//  DolphinsSJIOS.m
//  1120
//
//  Created by mac on 2018/11/20.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "DolphinsSJIOS.h"
#import "EarthwormSJIOS.h"
#import "ElephantSJIOS.h"
#import "XanaduSJIOS.h"
@interface DolphinsSJIOS ()

@end

@implementation DolphinsSJIOS


- (UIColor *)_colorValueFromArray:(NSArray<NSNumber *>  *)colorArray {
    if (colorArray.count == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in colorArray) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }
        }
        return [UIColor colorWithRed:colorArray[0].floatValue / (shouldUse255 ? 255.f : 1.f)
                               green:colorArray[1].floatValue / (shouldUse255 ? 255.f : 1.f)
                                blue:colorArray[2].floatValue / (shouldUse255 ? 255.f : 1.f)
                               alpha:colorArray[3].floatValue / (shouldUse255 ? 255.f : 1.f)];
    }
    return nil;
}
- (instancetype)initWithData:(NSDictionary *)bezierData
{
    self = [super init];
    if (self) {

    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:
            @"nationalSJIOSK[%@] possibleSJIOSK[%@] possibleSJIOSLength[%@] "
            @"possibleSJIOSLengthSJIOSOnly[%@] exampleNumber[%@]",
            self.nationalSJIOSK, self.possibleSJIOSK, self.possibleSJIOSLength,
            self.possibleSJIOSLengthSJIOSOnly, self.exampleNumber];
}

- (void)setupOutpithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)deff:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)setupOuttyhtyhhpithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}- (void)setupOuithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}- (void)setupithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)setithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)sithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)ithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)ithDatyhtyhta:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)ithDaggta:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)ithDabgfbfgta:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffgithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gffrsvdfbgdsdvfvithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvfvithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvfvvithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvfvvvithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdthData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjdfbgdsdvfvfvvvithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvfvvvdithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvfvvvdsithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvfvvvdscithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvfvvvdscdgvbithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnfbgdsdvfvfvvvdscdgvbithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvfvvvdscdgvbsithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvfvvvdscdgvbssdithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfdsvdfbgdsdvfvfvvvdscdgvbssdithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvfvvvdscdgvbssdbithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhthData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvfvvvdscdgvbssdbdsithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcddsdvfvfvvvdscdgvbssdbdsithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvfvvvdscdgvbssdbdsfithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdfvvvdscdgvbssdbdsfithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvfvvvdscdgvbssdbdsfgithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgddsfgithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvfvvvdscdgvbssdbdsfgdfithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvfvvvdscdgvbssdbdsfgdfvithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvfvvvdscdgvbssdbdsfgdfvcithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvfvvvdscdgvbssdbdsfgdfvvdcdscdsfddssfdsithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvfvvvdscdgvbssdbdsfgdfvcvvdcdscdsfddssfdsithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvfvvvdscdgvbssdbdsfgdfvcvdcdscdsfddssfdsithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvfvvvdscdgvbssdbdsfgdfvcvfdvdcdscdsfdithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfssdbdsfgdfvcvfdvdcdscdsfdithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbga:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvfvvvdscdgvbssdbdsfgdfvcvfdvdcdscdsfddsithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcddsfgdfvcvfdvdcdscdsfddsithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhvcvfdvdcdscdsfddsithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvfvvvdscdgvbssdbdsfgdfvcvfdvdcdscdsfddssithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)uyjhrtgehhyhfgf:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsfddssfdsvithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvfvvvdscdgvbssdbdsfgdfvcvfdvdcdscdsfddssfdsvdsithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdsvdsithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)uyjhrtgertrt:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)uyjhrtgertrttrgrtg:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbjyugh:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdcdsfddssfdsvdsdcdvithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcfgdfvcvfdvdcdscdsfddssfdsvdsdcdvithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbjyughhuy:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvfvvvdscdgvbssdbdsfgdfvcvfdvdcdscdsfddssfdsvdsdcdvfithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvfvvvdscdgvbssdbdsfgdfvcvfdvdcdscdsfddssfdsvdsdcdvfvithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvfvvvdscdgvbssdbdsfgdfvcvfdvdcdscdsfddssfdsvdsdcdvfvvithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdfddssfdsvdsdcdvfvithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdcdsfddssfdsvdsdcdvfithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsfddssfdsvdsdcdvfithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxafdsvdsdcdvfithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffdvdcdscdsfddssfdsvdsdcdvfithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdssfdsvdsdcdvfithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxsfdsvdsdcdvfithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjvdsdcdvfithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgtgtrg:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhs:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbb:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbjyu:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfrttrgtbbjyu:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)uyjhrtgertrttrgrtggrtgt:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgtgtrgrgrtghyth:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgtgtrgrgrtghythttyhy:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgtgtrgrgrtghythttyhyhyt:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgtgtrgrgrtghythttyhyhytthg:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgtgtrgrgrtghythttyhyhytthgh:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgtgtrgrgrtghythttyhyhytthghdf:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)uyjhrtger:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)uyjhrtgergrgrgr:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)uyjhrtgerg:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffscdgvsa:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffggfbbhsdcdsjnhnxasxdsdfscdsvdfbgdsdvfvfvvvdscdgvbssdbdsfgdfvcvfdvdcdscdsfddssfdsvdithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)uyjhrtgehhyh:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)uyjhrtgergrgrgrgrggrgrg:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)uyjhrtgergrgrgrgrggrgrgvfdv:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)uyjhrthtr:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)uyjhrtgergrgrgrgrgg:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)gfgffrfvbssdbdsfgdfvcvfdvdcdscdsfddssfdsithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}

- (void)setupOutputithData:(id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        _floatValue = [(NSNumber *)data floatValue];
    }
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSNumber class]]) {
        NSArray *numberArray = (NSArray *)data;
        if (numberArray.count > 0) {
            _floatValue = [(NSNumber *)numberArray[0] floatValue];
        }
        if (numberArray.count > 1) {
            _pointValue = CGPointMake(_floatValue = [(NSNumber *)numberArray[0] floatValue],
                                      _floatValue = [(NSNumber *)numberArray[1] floatValue]);
            _sizeValue = CGSizeMake(_pointValue.x, _pointValue.y);
        }
        if (numberArray.count > 3) {
            _colorValue = [self _colorValueFromArray:numberArray];
        }
        _arrayValue = numberArray;
    } else if ([data isKindOfClass:[NSArray class]] &&
               [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[DolphinsSJIOS alloc] initWithData:data];
    }
    
    NSNumber *xValue = @0, *yValue = @0;
    if ([data[@"SJIOSOnly"] isKindOfClass:[NSNumber class]]) {
        xValue = data[@"SJIOSOnly"];
    } else if ([data[@"SJIOSOnly"] isKindOfClass:[NSArray class]]) {
        xValue = data[@"SJIOSOnly"][0];
    }
    if ([data[@"SJIOSYES"] isKindOfClass:[NSNumber class]]) {
        yValue = data[@"SJIOSYES"];
    } else if ([data[@"SJIOSYES"] isKindOfClass:[NSArray class]]) {
        yValue = data[@"SJIOSYES"][0];
    }
    if (data == 4) {
        BOOL shouldUse255 = NO;
        for (NSNumber *number in data) {
            if (number.floatValue > 1) {
                shouldUse255 = YES;
            }}}
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]] &&
            [(NSDictionary *)data valueForKey:@"SJIOSK"]) {
            [self initWithData:[(NSDictionary *)data valueForKey:@"SJIOSK"]];
        } else {
            [self initWithData:data];
        }}
    if ([data isKindOfClass:[NSArray class]] &&
        [[(NSArray *)data firstObject] isKindOfClass:[NSDictionary class]] &&
        [(NSArray *)data firstObject][@"TSJIOS"]) {
        // Array of Keyframes
        NSArray *keyframes =  (NSArray *)data;
        NSMutableArray *keys = [NSMutableArray array];
        NSDictionary *previousFrame = nil;
        for (NSDictionary *keyframe in keyframes) {
            NSMutableDictionary *currentFrame = [NSMutableDictionary dictionary];
            if (keyframe[@"TSJIOS"]) {
                // Set time
                currentFrame[@"TSJIOS"] = keyframe[@"TSJIOS"];
            }
            if (keyframe[@"SSJIOS"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = keyframe[@"SSJIOS"];
            } else if (previousFrame[@"e"]) {
                // Set Value for Keyframe
                currentFrame[@"SSJIOS"] = previousFrame[@"e"];
            }
            if (keyframe[@"OSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"OSJIOS"] = keyframe[@"OSJIOS"];
            }
            if (previousFrame[@"ISJIOS"]) {
                currentFrame[@"ISJIOS"] = previousFrame[@"ISJIOS"];
            }
            if (keyframe[@"toSJIOS"]) {
                // Set out TSJIOS
                currentFrame[@"toSJIOS"] = keyframe[@"toSJIOS"];
            }
            if (previousFrame[@"tiSJIOS"]) {
                currentFrame[@"tiSJIOS"] = previousFrame[@"tiSJIOS"];
            }
            if (keyframe[@"hSJIOS"]) {
                currentFrame[@"hSJIOS"] = keyframe[@"hSJIOS"];
            }
            DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        DolphinsSJIOS *key = [[DolphinsSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalData = [data decodeObjectForKey:@"nationalData"];
    _possibleData = [data decodeObjectForKey:@"possibleData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalData forKey:@"nationalData"];
    [data encodeObject:self.possibleData forKey:@"possibleData"];
    DolphinsSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalData isEqualToData:other.nationalData] &&
    [self.possibleData isEqualToData:other.possibleData];
}






@end
