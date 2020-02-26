//
//  NSDictionary+Utils.m
//  MT4
//
//  Created by du on 2019/9/20.
//  Copyright © 2019 alpha. All rights reserved.
//

#import "NSDictionary+XXUtils.h"

@implementation NSDictionary (XXUtils)


- (NSString *)xx_toJsonString{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end
