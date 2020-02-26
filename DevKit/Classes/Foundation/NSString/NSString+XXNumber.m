//
//  NSString+XXNumber.m
//  MTEx
//
//  Created by du on 2019/8/5.
//  Copyright © 2019 alpha. All rights reserved.
//

#import "NSString+XXNumber.h"

@implementation NSString (XXNumber)

#pragma mark - 加减乘除 -
- (NSString *)add:(NSString *)aNumberString{
    NSDecimalNumber *numberA = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *numberB = [NSDecimalNumber decimalNumberWithString:aNumberString];
    if ([NSString safeCheck:numberA anotherNumber:numberB] == NO) {
        return nil;
    }
    NSDecimalNumber *result = [numberA decimalNumberByAdding:numberB];
    return result.stringValue;
}

- (NSString *)subtract:(NSString *)aNumberString{
    NSDecimalNumber *numberA = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *numberB = [NSDecimalNumber decimalNumberWithString:aNumberString];
    if ([NSString safeCheck:numberA anotherNumber:numberB] == NO) {
        return nil;
    }
    NSDecimalNumber *result = [numberA decimalNumberBySubtracting:numberB];
    return result.stringValue;
}

- (NSString *)multiply:(NSString *)aNumberString{
    NSDecimalNumber *numberA = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *numberB = [NSDecimalNumber decimalNumberWithString:aNumberString];
    if ([NSString safeCheck:numberA anotherNumber:numberB] == NO) {
        return nil;
    }
    NSDecimalNumber *result = [numberA decimalNumberByMultiplyingBy:numberB];
    return result.stringValue;
}

- (NSString *)divid:(NSString *)aNumberString{
    NSDecimalNumber *numberA = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *numberB = [NSDecimalNumber decimalNumberWithString:aNumberString];
    if ([NSString safeCheck:numberA anotherNumber:numberB] == NO) {
        return nil;
    }
    if (numberB.floatValue == 0) {
        return nil;
    }
    NSDecimalNumber *result = [numberA decimalNumberByDividingBy:numberB];
    return result.stringValue;
}

#pragma mark - 比较 -
- (BOOL)isBiggerThanOrEqualTo:(NSString *)aNumberString{
    NSDecimalNumber *numberA = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *numberB = [NSDecimalNumber decimalNumberWithString:aNumberString];
    if ([NSString safeCheck:numberA anotherNumber:numberB] == NO) {
        return NO;
    }
    NSComparisonResult result = [numberA compare:numberB];
    /*
     NSOrderedAscending的意思是：左边的操作对象小于右边的对象。
     NSOrderedDescending的意思是：左边的操作对象大于右边的对象。
     */
    if (result == NSOrderedSame || result == NSOrderedDescending) {
        return YES;
    }
    else{
        return NO;
    }
}

- (BOOL)isBiggerThan:(NSString *)aNumberString{
    NSDecimalNumber *numberA = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *numberB = [NSDecimalNumber decimalNumberWithString:aNumberString];
    if ([NSString safeCheck:numberA anotherNumber:numberB] == NO) {
        return NO;
    }
    NSComparisonResult result = [numberA compare:numberB];
    if (result == NSOrderedDescending) {
        return YES;
    }
    else{
        return NO;
    }
}

- (BOOL)isEqualToNumber:(NSString *)aNumberString{
    NSDecimalNumber *numberA = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *numberB = [NSDecimalNumber decimalNumberWithString:aNumberString];
    if ([NSString safeCheck:numberA anotherNumber:numberB] == NO) {
        return NO;
    }
    NSComparisonResult result = [numberA compare:numberB];
    if (result == NSOrderedSame) {
        return YES;
    }
    else{
        return NO;
    }
}

#pragma mark - 格式化 -
- (NSString *)removeRedundantZerosWithMaxFractionDigits:(NSUInteger)digit{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.groupingSeparator = @"";
    formatter.roundingMode = NSNumberFormatterRoundFloor;
    formatter.maximumFractionDigits = digit;
    NSDecimalNumber *decimal = [NSDecimalNumber decimalNumberWithString:self];
    NSString *str = [formatter stringFromNumber:decimal];
    return str;
}

///去除末尾多余的0,并保留x位小数.四舍五入
- (NSString *)removeRedundantZerosRoundUpWithMaxFractionDigits:(NSUInteger)digit{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.groupingSeparator = @"";
    formatter.roundingMode = kCFNumberFormatterRoundHalfUp;
    formatter.maximumFractionDigits = digit;
    NSDecimalNumber *decimal = [NSDecimalNumber decimalNumberWithString:self];
    NSString *str = [formatter stringFromNumber:decimal];
    return str;
}

- (NSString *)formatterNumberToDigit:(NSInteger)digit{
    //小数点最后一位截取
    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:digit raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *ouncesDecimal = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *roundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    // 生成需要精确的小数点格式
    NSMutableString *formatterString = [NSMutableString stringWithString:@"0."];
    for (NSInteger i = 0; i < digit; ++i) {
        [formatterString appendString:@"0"];
    }
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setPositiveFormat:formatterString];
    return [formatter stringFromNumber:roundedOunces];
}

#pragma mark - private -
+ (BOOL)safeCheck:(NSDecimalNumber *)numberA anotherNumber:(NSDecimalNumber *)numberB{
    if ([numberA.stringValue isEqualToString:@"NaN"] || [numberB.stringValue isEqualToString:@"NaN"]) {
        return NO;
    }
    return YES;
}

@end
