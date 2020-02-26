//
//  NSString+XXNumber.h
//  MTEx
//
//  Created by du on 2019/8/5.
//  Copyright © 2019 alpha. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/**
高精度计算,内部以 NSDecimalNumber 实现,不会出现数据精度丢失的情况
同时做了安全性校验,避免nil值操作时会崩溃的情况
 */
@interface NSString (XXNumber)

///加
- (NSString *)add:(NSString *)aNumberString;
///减
- (NSString *)subtract:(NSString *)aNumberString;
///乘
- (NSString *)multiply:(NSString *)aNumberString;
///除
- (NSString *)divid:(NSString *)aNumberString;


///大于等于
- (BOOL)isBiggerThanOrEqualTo:(NSString *)aNumberString;
///大于
- (BOOL)isBiggerThan:(NSString *)aNumberString;
///等于
- (BOOL)isEqualToNumber:(NSString *)aNumberString;


///去除末尾多余的0,并保留x位小数.不四舍五入
- (NSString *)removeRedundantZerosWithMaxFractionDigits:(NSUInteger)digit;

///去除末尾多余的0,并保留x位小数.四舍五入
- (NSString *)removeRedundantZerosRoundUpWithMaxFractionDigits:(NSUInteger)digit;

///精确到小数点某一个位,不足的补零,不四舍五入
- (NSString *)formatterNumberToDigit:(NSInteger)digit;

@end

NS_ASSUME_NONNULL_END
