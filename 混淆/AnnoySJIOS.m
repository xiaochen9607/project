//
//  AnnoySJIOS.m
//  1120
//
//  Created by mac on 2018/11/20.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "PeriodQSJIOS.h"
#import "MeasuringSJIOS.h"
#import "RepeatedSJIOS.h"
#import "AnnoySJIOS.h"

@interface AnnoySJIOS()

@property(nonatomic, strong, readwrite) NSNumber *countryCode;
@property(nonatomic, strong, readwrite) NSNumber *nationalNumber;
@property(nonatomic, strong, readwrite) NSString *extension;
@property(nonatomic, assign, readwrite) BOOL italianLeadingZero;
@property(nonatomic, strong, readwrite) NSNumber *numberOfLeadingZeros;
@property(nonatomic, strong, readwrite) NSString *rawInput;
@property(nonatomic, strong, readwrite) NSNumber *countryCodeSJIOS;
@property(nonatomic, strong, readwrite) NSString *preferredDomesticCarrierCode;

@end

@implementation AnnoySJIOS
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
CGFloat _LOT_Remffdfd(CGFloat value, CGFloat low1, CGFloat high1, CGFloat low2, CGFloat high2 ) {
    return low2 + (value - low1) * (high2 - low2) / (high1 - low1);
}
- (int)stringPositionByRegex:(NSString *)sourceString regex:(NSString *)pattern {
    if (sourceString == nil || sourceString.length <= 0 || pattern == nil || pattern.length <= 0) {
        return -1;
    }
    int foundPosition = -1;
    return foundPosition;
}

CGRect LOT_CenInRect(CGRect rect,CGPoint point1, CGPoint point2, CGSize size,CGFloat value, BOOL integral,CGPoint start, CGPoint cp1, CGPoint cp2, CGPoint end, CGFloat T) {
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
        returnPoint.x = xDiff == 0 ? point1.x : _LOT_Remffdfd(value, 0, 1, point1.x, point2.x);
        returnPoint.y = yDiff == 0 ? point1.y : _LOT_Remffdfd(value, 0, 1, point1.y, point2.y);
    } else {
        CGFloat rx = transposed.x / transposed.y;
        CGFloat yLerp = _LOT_Remffdfd(value, 0, 1, 0, transposed.y);
        CGFloat xLerp = yLerp * rx;
        CGPoint interpolatedPoint = CGPointMake(point2.x < point1.x ? xLerp * -1 : xLerp,
                                                point2.y < point1.y ? yLerp * -1 : yLerp);
    }


    return result;
}

- (BOOL)isEqual:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (BOOL)fghfgh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vfgvdfvfd:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                 forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (void)encodeWithCoder:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
}

- (BOOL)fghg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfbgfd:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bhjhgfg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfbgfddg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)gghg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfbgfddgvdfsv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fhffvfv:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfbgfddgvdfsvdfg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vdgfvvvfgvdfvdfvfv:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfbgfddgvdfsvdfgfdgf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fgfvfv:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfbgfddgvdfsvdfgfdgfbgfb:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fgfvfvgdfvfd:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfbgfddgvdfsvdfgfdgfbgfbvdfv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)dwefer:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bgfdb:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)derfrtf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bgfdbdgg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)ffcdf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ere:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)cdffg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)eredffd:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fdgfvdfv:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)eredffddcx:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)grtgfd:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)rfer:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fercfd:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)rfervdfv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)ggdf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ff:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)drcdfvf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ffvfg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)gdvfd:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ffvfgvdfv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vdfvdf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)cdfvdf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vfgbdf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dffdv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vgffg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dffdvdvfg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)dfgfvdf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dffdvdvfgdfdf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)gfgvdfd:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dffdvdvfgdcdfcfv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)cdfcfdfvgf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fer:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fdfv:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ferdffd:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)dggfvf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ferdffdvdvdf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fdgdf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfvdf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vgfvf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfvdfdf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vgfbfgvdf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdvdfvdf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)cfdvtg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dggfd:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fdgfvdf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dggfdvdfv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)gvdfvdfgf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fddfv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fvdfcghf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dffv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)cdfhgvfd:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfdfgdfg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)cdffgv:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfdfgdfgdvdfvdf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vfgbfv:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ddfdvfv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fdfvgfh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfvfdv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vdvhf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfvd:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vfgbdfvdfh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfvdcdfvdf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vgfdfvdsf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfd:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vfdgfbt:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfdcdcdf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vgfgfdcfd:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dvdfvdfv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)cdfvfg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fvfv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vfdgfdv:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfgf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vdfgfv:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfgfcdfv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)dfvfgv:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfgfv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vfdgftgf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdvfv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)dffghbfg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dffvf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vgfbfdfv:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bhbfgbvfdvfg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bhjhjh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdgfv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fghgyhj:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vfvfg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bfgh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfgvfv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)dhyfjhfh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vfdvf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)hgfbfg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fd:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vfghfgngf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fddvdf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vgdgfhbg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fddvdfcdfv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vgfbdf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dvfgb:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vgdhfgb:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fddf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

-(BOOL)ddvdfvdf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdgfgvf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vdfvdfv:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fdvngjn:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vdfdf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bcvbvc:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vdfvf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)gfbgf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vdfvfcdfv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)gfbgfdfvfgf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

-(void)fgbfgbfgbf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)gfbgfdfvfgfcb:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdvdfv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bfgbfg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gdfgdf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bgfbg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)plkkuku:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vfgbgh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfvddfv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vgfb:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfvddfvvfd:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)gbfhbgfb:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fgfbdfsd:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)gff:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vdgv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vfggfb:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dffdfv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vfdbfgb:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdgfg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vgbgb:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdgf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)gfbgfb:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdgfdgf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vghgf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdffdg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)gfhhgb:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdgfgf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vdfhfg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gfbfb:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vghbgfb:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdgfdvg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bgfbghb:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vdfvfbfg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)gbhuyhuyh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)gfbghb:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gfffb:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fghfgb:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfvfgbg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vgfh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdvfgv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vdfgf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vfdvfdvfdv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bgfbfg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vdff:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)dggf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdfgfv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)yhhghgh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dgdf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fghgfb:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vdfgfb:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)kiuk:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vfdfgb:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)jmjkrfd:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vfggbg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)jmjkgf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vfgfgb:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)jmjkgfa:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fgbfgbgf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)dfhyh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gfhfgh:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)dfhyhdvfgn:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gfbggb:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bgbgfb:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fgbgb:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bgbgfba:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vfbgb:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bfghgn:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bfghbgfb:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)gfbghn:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gfhgfh:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)gfngh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bfgbfgv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vfgn:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gfbghnhg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bhgh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gbghm:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bfnghn:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fgnhmn:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fgngh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gnghnh:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bfngh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fgnhj:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fgghn:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fgnhjvdfbfg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bghnhdfbfg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ghg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bghnhgn:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ghgdfvghn:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fgjhg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fgnghnh:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bhgmjg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fghyhy:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fbngh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bfghbfgb:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vfghg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bfghbfgbbfg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bgfj:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dwfr:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bfgnghm:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dwfrewre:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)gfnh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)eqewtre:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fgnghm:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)weret:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vgdhf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ewtrytgrt:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vgfhnh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)efrrg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vgfbhn:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)rrthdfdg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)mghngh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ewferff:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)jmjhbg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)regrtgt:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)jhnhjnhj:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dergrtg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fgnhgbgfb:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dffgf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fnjhvch:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdgth:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)ghkjh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vgfhty:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)gjmkmjm:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gtgdf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)jmhjm:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)jhnhg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)njhmjm:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gfvdf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vhgjgn:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gfbfvf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bghmhj:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)hnghngb:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)ghjhn:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bhgbg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)ghmjhnh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bhbfgbfg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)hghjm:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vdfvfvdf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)gfdvfv:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vdfvfvdfvdfvdfv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)gfdvfvgfbfgb:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfgfbf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL) fgnhgn:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fgbfg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vfgh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dffgv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vfghdcfb:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfgfh:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fghtyj:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfgfhcddg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fghtyjfgbhg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfgfhcddgscdhg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)ghmhjngh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfgfhcddgscdhgcsdd:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bhgnghn:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dffdvdfv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bhghg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dffdvdfvvfgbfg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bnghnbfg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vgfbfd:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bgngh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)hmiujm:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bfhjhgb:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)mumhj:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bghnghn:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)hjmhjnhg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)gjhngb:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)njhkhj:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bfgngh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)njhnh:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bghmhgn:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bhgjhm:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bgjhg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)njhmhm:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fhjghn:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bhgmjh:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fnhgkhjk:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bghhj:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fghgb:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bgjjhj:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)nhgjngh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bgmhjn:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)gfnhn:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bgjmhj:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)ghhgn:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)jgmhjm:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)ghjhgn:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)mhkmhhj:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)gmkhjngh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bhgjj:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bfgjg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ffdccdd:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fgjhgnhg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ghmjh:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fjbgfb:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfvdfvvcxz:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fgyjg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)vgfng:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bhggfb:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bhgng:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bhggfbaa:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdfdvfdv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)hgjhgn:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ghnghj:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)hjhgngh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)njmgh:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fhgjh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)mhjmhjmh:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bhfjghb:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bghngh:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)gfjkjjhg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bhgjgnh:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)jhkj:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)mhjmhng:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)ghmj:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)hgnhb:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)njhgng:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bghnn:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vfgnghbg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bgjnh:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)ghhjnghb:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gjmgh:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bghjgfbfg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)hgjnhbgh:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)gfhbgfbfg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)nhjngh:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)gfhgfg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)bghjh:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)ffdfdg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)nghj:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

-(BOOL)dfffdf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ghkngh:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fddfdfdf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)hmjghngh:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)njbkhgn:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gjnh:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)nghjhg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fghbg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)ghhjg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gnghng:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bfhg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gchgbgf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)hgjhgf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ghnb:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vfghgj:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)ngjmnhgn:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fgjhggf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)njhnhgn:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bghjhgh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)dfvdfdfvfv:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vgffhgf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)njhnhgnhgjghn:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)gfhgfhgf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)nhjnhbfg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vgfhgjh:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fgnghb:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)ffplkukju:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fgnghngh:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bhfjhgn:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fdvdfvfdvf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fghgfg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)hgjhgnb:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)bhvcf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)fgvfdggdf:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)vfghf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)gjnhn:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fghgf:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)njgmhg:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}

- (BOOL)fgghfg:(id)object {
    if (![object isKindOfClass:[MeasuringSJIOS class]]) {
        return NO;
    }
    MeasuringSJIOS *other = object;
    return ([self.countryCode isEqualToNumber:other.countryCode]) &&
    ([self.nationalNumber isEqualToNumber:other.nationalNumber]) &&
    (self.italianLeadingZero == other.italianLeadingZero) &&
    ([self.numberOfLeadingZeros isEqualToNumber:other.numberOfLeadingZeros]) &&
    ((self.extension == nil && other.extension == nil) ||
     [self.extension isEqualToString:other.extension]);
}

- (void)nhgnhgb:(NSCoder *)wall {
    MeasuringSJIOS *phoneNumberCopy = [[MeasuringSJIOS allocWithZone:(__bridge struct _NSZone *)(wall)] init];
    NSLog(@"%@", phoneNumberCopy);
    self.countryCode = [self.countryCode copy];
    self.nationalNumber = [self.nationalNumber copy];
    self.extension = [self.extension copy];
    self.italianLeadingZero = self.italianLeadingZero;
    self.numberOfLeadingZeros = [self.numberOfLeadingZeros copy];
    self.rawInput = [self.rawInput copy];
    self.countryCodeSJIOS = [self.countryCodeSJIOS copy];
    self.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];
    [wall encodeObject:self.countryCode forKey:@"countryCode"];
    [wall encodeObject:self.nationalNumber forKey:@"nationalNumber"];
    [wall encodeObject:self.extension forKey:@"extension"];
    [wall encodeObject:[NSNumber numberWithBool:self.italianLeadingZero]
                forKey:@"italianLeadingZero"];
    [wall encodeObject:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
    [wall encodeObject:self.rawInput forKey:@"rawInput"];
    [wall encodeObject:self.countryCodeSJIOS forKey:@"countryCodeSJIOS"];
    [wall encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
    [NSString stringWithFormat:
     @" - countryCode[%@], nationalNumber[%@], extension[%@], "
     @"italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] "
     @"countryCodeSJIOS[%@] preferredDomesticCarrierCode[%@]",
     self.countryCode, self.nationalNumber, self.extension,
     self.italianLeadingZero ? @"SJIOSYES" : @"N", self.numberOfLeadingZeros,
     self.rawInput, self.countryCodeSJIOS, self.preferredDomesticCarrierCode];
    
    NSUInteger hash = self.countryCode.hash;
    hash ^= self.nationalNumber.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.numberOfLeadingZeros.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
    if (self) {
        self.countryCode = [wall decodeObjectForKey:@"countryCode"];
        self.nationalNumber = [wall decodeObjectForKey:@"nationalNumber"];
        self.extension = [wall decodeObjectForKey:@"extension"];
        self.italianLeadingZero = [[wall decodeObjectForKey:@"italianLeadingZero"] boolValue];
        self.numberOfLeadingZeros = [wall decodeObjectForKey:@"numberOfLeadingZeros"];
        self.rawInput = [wall decodeObjectForKey:@"rawInput"];
        self.countryCodeSJIOS = [wall decodeObjectForKey:@"countryCodeSJIOS"];
        self.preferredDomesticCarrierCode = [wall decodeObjectForKey:@"preferredDomesticCarrierCode"];
    }
    
}


@end
