//
//  NSString+Utils.m
//  anb
//
//  Created by du on 2018/12/18.
//  Copyright © 2018 alpha. All rights reserved.
//

#import "NSString+XXUtils.h"
#import <UIKit/UIKit.h>


@implementation NSString (XXUtils)

- (NSData *)xx_toData{
    NSData *data =[self dataUsingEncoding:NSUTF8StringEncoding];
    return data;
}

-(NSData*)xx_toHexData{
    if (!self || [self length] == 0) {
        return nil;
    }
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:8];
    NSRange range;
    if ([self length] % 2 == 0) {
        range = NSMakeRange(0, 2);
    } else {
        range = NSMakeRange(0, 1);
    }
    for (NSInteger i = range.location; i < [self length]; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [self substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        range.location += range.length;
        range.length = 2;
    }
    return hexData;
}


/**
 复制文本到剪贴板
 */
- (void)xx_copyToPasteboard{
    if (self.length == 0) {
        return;
    }
    UIPasteboard *psd = [UIPasteboard generalPasteboard];
    psd.string = self;
}

/**
 转字典
 */
- (NSDictionary *)xx_toDictionary{
    NSData *data = [self xx_toData];
    NSError *error = nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers |NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments error:&error];
    if (error == nil) {
        return dic;
    }
    return nil;
}


/**
 移除0x
 */
- (NSString *)xx_remove0x{
    if ([self hasPrefix:@"0x"]) {
        NSMutableString *mString = [[NSMutableString alloc]initWithString:self];
        [mString deleteCharactersInRange:[mString rangeOfString:@"0x"]];
        return mString;
    }
    else{
        return self;
    }
}



@end
