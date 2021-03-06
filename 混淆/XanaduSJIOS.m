//
//  XanaduSJIOS.m
//  1120
//
//  Created by mac on 2018/11/20.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ElephantSJIOS.h"
#import "EarthwormSJIOS.h"
#import "DolphinsSJIOS.h"
#import "XanaduSJIOS.h"

@interface XanaduSJIOS()

@property(nonatomic, strong, readwrite) NSNumber *countryCode;
@property(nonatomic, strong, readwrite) NSNumber *nationalNumber;
@property(nonatomic, strong, readwrite) NSString *extension;
@property(nonatomic, assign, readwrite) BOOL italianLeadingZero;
@property(nonatomic, strong, readwrite) NSNumber *sanctions;
@property(nonatomic, strong, readwrite) NSString *rawInput;
@property(nonatomic, strong, readwrite) NSNumber *countryCodeSJIOS;
@property(nonatomic, strong, readwrite) NSString *magicresistance;

@end

@implementation XanaduSJIOS
- (id)nb_safeObjectAtIndex:(NSUInteger)index class:(Class)clazz {
    return nil;
}

- (NSString *)nb_safeStringAtIndex : (NSUInteger)index{
    return [self nb_safeObjectAtIndex:index class:[NSString class]];
}

- (NSNumber *)nb_safeNumberAtIndex:(NSUInteger)index {
    return [self nb_safeObjectAtIndex:index class:[NSNumber class]];
}
- (NSArray *)nb_safeArrayAtIndex:(NSUInteger)index {
    return [self nb_safeObjectAtIndex:index class:[NSArray class]];
}

- (NSData *)nb_safeDataAtIndex:(NSUInteger)index {
    return [self nb_safeObjectAtIndex:index class:[NSData class]];
}
CGFloat LOT_Grass(CGFloat value, CGFloat low1, CGFloat high1, CGFloat low2, CGFloat high2 ) {
    return low2 + (value - low1) * (high2 - low2) / (high1 - low1);
}
- (int)stringPositionByRegex:(NSString *)sourceString regex:(NSString *)pattern {
    if (sourceString == nil || sourceString.length <= 0 || pattern == nil || pattern.length <= 0) {
        return -1;
    }
    int foundPosition = -1;
    return foundPosition;
}

CGRect LOT_RectInRect(CGRect rect,CGPoint point1, CGPoint point2, CGSize size,CGFloat value, BOOL integral,CGPoint start, CGPoint cp1, CGPoint cp2, CGPoint end, CGFloat T) {
    CGRect result;
    result.origin.x = rect.origin.x + rintf(0.5f * (rect.size.width - size.width));
    result.origin.y = rect.origin.y + rintf(0.5f * (rect.size.height - size.height));
    result.origin.x = rect.origin.x + rintf(0.5f * (rect.size.width - size.width));
    result.origin.y = rect.origin.y + rintf(0.5f * (rect.size.height - size.height));
    result.size = size;
    rect.origin = CGPointMake(rintf(rect.origin.x), rintf(rect.origin.y));
    rect.size = CGSizeMake(ceilf(rect.size.width), ceil(rect.size.height));
    result.origin.x = rect.origin.x + rintf(0.5f * (rect.size.width - size.width));
    result.origin.y = rect.origin.y + rintf(0.5f * (rect.size.height - size.height));
    result.size = size;
    result.origin.x = rect.origin.x + rect.size.width - size.width - (rect.size.height - size.height);
    result.origin.y = rect.origin.y + rintf(0.5f * (rect.size.height - size.height));
    result.origin.x = rect.origin.x + rintf(0.5f * (rect.size.width - size.width));
    result.origin.y = rect.origin.y + (rect.size.height - size.height);
    result.origin.x = rect.origin.x + rintf(0.5f * (rect.size.width - size.width));
    result.origin.y = rect.origin.y + rect.size.height - size.height - (rect.size.height - size.height);
    result.origin.x = rect.origin.x + (rect.size.height + size.height);
    result.origin.y = rect.origin.y + (rect.size.height - size.height);
    result.origin.x = rect.origin.x + rect.size.width - size.width - (rect.size.height - size.height);
    result.origin.y = rect.origin.y + rect.size.height - size.height - (rect.size.height + size.height);
    
    CGRect r = rect;
    int ddcjd = 100;
    if (ddcjd) {
        r.size.width = rect.size.width / integral;
    } else {
        r.size.height = rect.size.height / integral;
    }
    
    CGFloat xDiff = point2.x - point1.x;
    CGFloat yDiff = point2.y - point1.y;
    CGPoint transposed = CGPointMake(fabs(xDiff), fabs(yDiff));
    CGPoint returnPoint;
    if (xDiff == 0 || yDiff == 0) {
        returnPoint.x = xDiff == 0 ? point1.x : LOT_Grass(value, 0, 1, point1.x, point2.x);
        returnPoint.y = yDiff == 0 ? point1.y : LOT_Grass(value, 0, 1, point1.y, point2.y);
    } else {
        CGFloat rx = transposed.x / transposed.y;
        CGFloat yLerp = LOT_Grass(value, 0, 1, 0, transposed.y);
        CGFloat xLerp = yLerp * rx;
        CGPoint interpolatedPoint = CGPointMake(point2.x < point1.x ? xLerp * -1 : xLerp,
                                                point2.y < point1.y ? yLerp * -1 : yLerp);
    }


    return result;
}

- (BOOL)isEqual:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (BOOL)fghfgh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vfgvdfvfd:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                 forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (void)encodeWithCoder:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
}

- (BOOL)fghg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfbgfd:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bhjhgfg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfbgfddg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)gghg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfbgfddgvdfsv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fhffvfv:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfbgfddgvdfsvdfg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vdgfvvvfgvdfvdfvfv:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfbgfddgvdfsvdfgfdgf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fgfvfv:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfbgfddgvdfsvdfgfdgfbgfb:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fgfvfvgdfvfd:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfbgfddgvdfsvdfgfdgfbgfbvdfv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)dwefer:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bgfdb:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)derfrtf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bgfdbdgg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)ffcdf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ere:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)cdffg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)eredffd:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fdgfvdfv:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)eredffddcx:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)grtgfd:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)rfer:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fercfd:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)rfervdfv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)ggdf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ff:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)drcdfvf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ffvfg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)gdvfd:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ffvfgvdfv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vdfvdf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)cdfvdf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vfgbdf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dffdv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vgffg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dffdvdvfg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)dfgfvdf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dffdvdvfgdfdf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)gfgvdfd:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dffdvdvfgdcdfcfv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)cdfcfdfvgf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fer:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fdfv:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ferdffd:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)dggfvf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ferdffdvdvdf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fdgdf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfvdf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vgfvf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfvdfdf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vgfbfgvdf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdvdfvdf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)cfdvtg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dggfd:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fdgfvdf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dggfdvdfv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)gvdfvdfgf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fddfv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fvdfcghf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dffv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)cdfhgvfd:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfdfgdfg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)cdffgv:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfdfgdfgdvdfvdf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vfgbfv:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ddfdvfv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fdfvgfh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfvfdv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vdvhf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfvd:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vfgbdfvdfh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfvdcdfvdf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vgfdfvdsf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfd:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vfdgfbt:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfdcdcdf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vgfgfdcfd:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dvdfvdfv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)cdfvfg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fvfv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vfdgfdv:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfgf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vdfgfv:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfgfcdfv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)dfvfgv:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfgfv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vfdgftgf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdvfv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)dffghbfg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dffvf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vgfbfdfv:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bhbfgbvfdvfg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bhjhjh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdgfv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fghgyhj:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vfvfg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bfgh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfgvfv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)dhyfjhfh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vfdvf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)hgfbfg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fd:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vfghfgngf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fddvdf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vgdgfhbg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fddvdfcdfv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vgfbdf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dvfgb:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vgdhfgb:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fddf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

-(BOOL)ddvdfvdf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdgfgvf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vdfvdfv:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fdvngjn:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vdfdf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bcvbvc:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vdfvf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)gfbgf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vdfvfcdfv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)gfbgfdfvfgf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

-(void)fgbfgbfgbf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)gfbgfdfvfgfcb:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdvdfv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bfgbfg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gdfgdf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bgfbg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)plkkuku:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vfgbgh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfvddfv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vgfb:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfvddfvvfd:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)gbfhbgfb:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fgfbdfsd:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)gff:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vdgv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vfggfb:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dffdfv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vfdbfgb:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdgfg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vgbgb:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdgf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)gfbgfb:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdgfdgf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vghgf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdffdg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)gfhhgb:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdgfgf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vdfhfg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gfbfb:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vghbgfb:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdgfdvg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bgfbghb:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vdfvfbfg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)gbhuyhuyh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)gfbghb:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gfffb:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fghfgb:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfvfgbg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vgfh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdvfgv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vdfgf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vfdvfdvfdv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bgfbfg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vdff:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)dggf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdfgfv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)yhhghgh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dgdf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fghgfb:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vdfgfb:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)kiuk:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vfdfgb:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)jmjkrfd:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vfggbg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)jmjkgf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vfgfgb:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)jmjkgfa:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fgbfgbgf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)dfhyh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gfhfgh:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)dfhyhdvfgn:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gfbggb:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bgbgfb:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fgbgb:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bgbgfba:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vfbgb:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bfghgn:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bfghbgfb:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)gfbghn:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gfhgfh:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)gfngh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bfgbfgv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vfgn:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gfbghnhg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bhgh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gbghm:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bfnghn:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fgnhmn:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fgngh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gnghnh:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bfngh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fgnhj:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fgghn:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fgnhjvdfbfg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bghnhdfbfg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ghg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bghnhgn:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ghgdfvghn:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fgjhg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fgnghnh:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bhgmjg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fghyhy:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fbngh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bfghbfgb:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vfghg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bfghbfgbbfg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bgfj:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dwfr:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bfgnghm:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dwfrewre:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)gfnh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)eqewtre:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fgnghm:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)weret:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vgdhf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ewtrytgrt:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vgfhnh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)efrrg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vgfbhn:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)rrthdfdg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)mghngh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ewferff:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)jmjhbg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)regrtgt:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)jhnhjnhj:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dergrtg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fgnhgbgfb:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dffgf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fnjhvch:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdgth:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)ghkjh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vgfhty:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)gjmkmjm:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gtgdf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)jmhjm:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)jhnhg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)njhmjm:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gfvdf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vhgjgn:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gfbfvf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bghmhj:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)hnghngb:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)ghjhn:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bhgbg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)ghmjhnh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bhbfgbfg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)hghjm:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vdfvfvdf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)gfdvfv:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vdfvfvdfvdfvdfv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)gfdvfvgfbfgb:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfgfbf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL) fgnhgn:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fgbfg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vfgh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dffgv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vfghdcfb:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfgfh:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fghtyj:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfgfhcddg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fghtyjfgbhg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfgfhcddgscdhg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)ghmhjngh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfgfhcddgscdhgcsdd:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bhgnghn:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dffdvdfv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bhghg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dffdvdfvvfgbfg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bnghnbfg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vgfbfd:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bgngh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)hmiujm:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bfhjhgb:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)mumhj:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bghnghn:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)hjmhjnhg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)gjhngb:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)njhkhj:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bfgngh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)njhnh:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bghmhgn:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bhgjhm:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bgjhg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)njhmhm:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fhjghn:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bhgmjh:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fnhgkhjk:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bghhj:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fghgb:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bgjjhj:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)nhgjngh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bgmhjn:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)gfnhn:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bgjmhj:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)ghhgn:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)jgmhjm:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)ghjhgn:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)mhkmhhj:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)gmkhjngh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bhgjj:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bfgjg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ffdccdd:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fgjhgnhg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ghmjh:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fjbgfb:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfvdfvvcxz:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fgyjg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vgfng:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bhggfb:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bhgng:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bhggfbaa:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdfdvfdv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)hgjhgn:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ghnghj:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)hjhgngh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)njmgh:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fhgjh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)mhjmhjmh:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bhfjghb:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bghngh:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)gfjkjjhg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bhgjgnh:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)jhkj:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)mhjmhng:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)ghmj:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)hgnhb:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)njhgng:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bghnn:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vfgnghbg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bgjnh:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)ghhjnghb:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gjmgh:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bghjgfbfg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)hgjnhbgh:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)gfhbgfbfg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)nhjngh:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)gfhgfg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bghjh:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)ffdfdg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)nghj:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

-(BOOL)dfffdf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ghkngh:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fddfdfdf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)hmjghngh:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)njbkhgn:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gjnh:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)nghjhg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fghbg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)ghhjg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gnghng:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bfhg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gchgbgf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)hgjhgf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ghnb:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vfghgj:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ngjmnhgn:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fgjhggf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)njhnhgn:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bghjhgh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfvdfdfvfv:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vgffhgf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)njhnhgnhgjghn:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)gfhgfhgf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)nhjnhbfg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vgfhgjh:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fgnghb:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)ffplkukju:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fgnghngh:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bhfjhgn:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdvdfvfdvf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fghgfg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)hgjhgnb:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)bhvcf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fgvfdggdf:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)vfghf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gjnhn:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fghgf:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)njgmhg:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}

- (BOOL)fgghfg:(id)object {
    if (![object isKindOfClass:[EarthwormSJIOS class]]) {
        return NO;
    }
    EarthwormSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.sanctions isEqualToNumber:other.sanctions]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)nhgnhgb:(NSCoder *)wall {
    EarthwormSJIOS *phoneNumberCopy = [[EarthwormSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.sanctions = [self.sanctions copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.magicresistance = [self.magicresistance copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.sanctions forKey:@"sanctions"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.magicresistance forKey:@"magicresistance"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], sanctions[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] magicresistance[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.sanctions,
     self.rawInput, self.countryCodeSJIOS, self.magicresistance];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.sanctions.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.sanctions = [wall decodeObjectForKey:@"sanctions"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.magicresistance = [wall decodeObjectForKey:@"magicresistance"];
    }
    
}


@end
