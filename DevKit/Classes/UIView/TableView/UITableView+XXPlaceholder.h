//
//  UITableView+XXPlaceholderView.h
//  XXTableViewPlaceholderView
//
//  Created by du on 2017/11/29.
//  Copyright © 2017年 du. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 RunTime 实现对工程TableView无数据/网络错误时,快速配置占位图
 优点:
 对于业务代码无侵入
 配置简单快速
 对于TableView 有HeaderView 与 FooterView 的情况,也能很好的适应
 */
@interface UITableView (XXPlaceholder)

/// 是否使用PlaceholderView ,默认为NO
@property (nonatomic,assign) BOOL xx_enablePlaceholderView;

/// 设置自定义占位图,在 xx_enablePlaceholderView 为 TRUE 时才有作用
@property (nonatomic,strong) UIView *xx_placeholderView;

@end



