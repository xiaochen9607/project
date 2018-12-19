//
//  TerribleSJIOS.m
//  1120
//
//  Created by mac on 2018/11/20.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "TerribleSJIOS.h"
#import "WoodpeckerSJIOS.h"
#import "JapaneseSJIOS.h"
@interface TerribleSJIOS ()

@end

@implementation TerribleSJIOS


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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
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
        _pathData = [[TerribleSJIOS alloc] initWithData:[(NSArray *)data firstObject]];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        _pathData = [[TerribleSJIOS alloc] initWithData:data];
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
            TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithKeyframe:currentFrame];
            [keys addObject:key];
            previousFrame = keyframe;
        }
        _keyframes= keys;
    } else {
        TerribleSJIOS *key = [[TerribleSJIOS alloc] initWithValue:data];
        _keyframes = @[key];
    }
    _nationalSJIOSK = [data decodeObjectForKey:@"nationalSJIOSK"];
    _possibleSJIOSK = [data decodeObjectForKey:@"possibleSJIOSK"];
    _possibleSJIOSLengthSJIOSOnly = [data decodeObjectForKey:@"possibleSJIOSLengthSJIOSOnly"];
    _exampleNumber = [data decodeObjectForKey:@"exampleNumber"];
    _nationalSJIOSRMatcherData = [data decodeObjectForKey:@"nationalSJIOSRMatcherData"];
    _possibleSJIOSRMatcherData = [data decodeObjectForKey:@"possibleSJIOSRMatcherData"];
    
    [data encodeObject:self.nationalSJIOSK forKey:@"nationalSJIOSK"];
    [data encodeObject:self.possibleSJIOSK forKey:@"possibleSJIOSK"];
    [data encodeObject:self.possibleSJIOSLength forKey:@"possibleSJIOSLength"];
    [data encodeObject:self.possibleSJIOSLengthSJIOSOnly forKey:@"possibleSJIOSLengthSJIOSOnly"];
    [data encodeObject:self.exampleNumber forKey:@"exampleNumber"];
    [data encodeObject:self.nationalSJIOSRMatcherData forKey:@"nationalSJIOSRMatcherData"];
    [data encodeObject:self.possibleSJIOSRMatcherData forKey:@"possibleSJIOSRMatcherData"];
    TerribleSJIOS *other = data;
    [self.nationalSJIOSK isEqual:other.nationalSJIOSK] &&
    [self.possibleSJIOSK isEqual:other.possibleSJIOSK] &&
    [self.possibleSJIOSLength isEqual:other.possibleSJIOSLength] &&
    [self.possibleSJIOSLengthSJIOSOnly isEqual:other.possibleSJIOSLengthSJIOSOnly] &&
    [self.exampleNumber isEqual:other.exampleNumber] &&
    [self.nationalSJIOSRMatcherData isEqualToData:other.nationalSJIOSRMatcherData] &&
    [self.possibleSJIOSRMatcherData isEqualToData:other.possibleSJIOSRMatcherData];
}






@end
