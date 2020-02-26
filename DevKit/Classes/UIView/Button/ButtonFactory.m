//
//  ButtonFactory.m
//  MTEx
//
//  Created by du on 2019/8/7.
//  Copyright © 2019 alpha. All rights reserved.
//

#import "ButtonFactory.h"


@interface BlockButton()

@property (nonatomic,copy) ActionBlock clickBlock;
@property (nonatomic,assign) ButtonType type;
@property (nonatomic,assign) CGFloat spacing;

@end

@implementation BlockButton

- (void)setClickBlock:(ActionBlock)clickBlock{
    _clickBlock = [clickBlock copy];
    [self addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClick{
    if (self.clickBlock) {
        self.clickBlock();
    }
}

- (void)refreshLayout{
    [self adjustButtonPositionWithType:self.type spacing:self.spacing];
}

- (void)adjustButtonPositionWithType:(ButtonType)type spacing:(CGFloat)spacing{
    self.type = type;
    self.spacing = spacing;
    CGFloat imageWidth = self.currentImage.size.width;
    CGFloat imageHeight = self.currentImage.size.height;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    // Single line, no wrapping. Truncation based on the NSLineBreakMode.
    CGSize size = [self.currentTitle sizeWithFont:self.titleLabel.font];
    CGFloat labelWidth = size.width;
    CGFloat labelHeight = size.height;
#pragma clang diagnostic pop
    
    CGFloat imageOffsetX = (imageWidth + labelWidth) / 2 - imageWidth / 2;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2 + spacing / 2;//image中心移动的y距离
    CGFloat labelOffsetX = (imageWidth + labelWidth / 2) - (imageWidth + labelWidth) / 2;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2 + spacing / 2;//label中心移动的y距离
    
    CGFloat tempWidth = MAX(labelWidth, imageWidth);
    CGFloat changedWidth = labelWidth + imageWidth - tempWidth;
    CGFloat tempHeight = MAX(labelHeight, imageHeight);
    CGFloat changedHeight = labelHeight + imageHeight + spacing - tempHeight;
    
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets titleEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets contentEdgeInsets = UIEdgeInsetsZero;
    
    switch (type) {
        case ButtonTypeNormal:
            imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
            titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
            contentEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, spacing/2);
            break;
            
        case ButtonTypeImageRight:
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing/2, 0, -(labelWidth + spacing/2));
            titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWidth + spacing/2), 0, imageWidth + spacing/2);
            contentEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, spacing/2);
            break;
            
        case ButtonTypeImageTop:
            imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            contentEdgeInsets = UIEdgeInsetsMake(imageOffsetY, -changedWidth/2, changedHeight-imageOffsetY, -changedWidth/2);
            break;
            
        case ButtonTypeImageBottom:
            imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            contentEdgeInsets = UIEdgeInsetsMake(changedHeight-imageOffsetY, -changedWidth/2, imageOffsetY, -changedWidth/2);
            break;
        default:
            break;
    }
    
    self.imageEdgeInsets = imageEdgeInsets;
    self.titleEdgeInsets = titleEdgeInsets;
    self.contentEdgeInsets = contentEdgeInsets;
}

@end


@interface ButtonFactory ()

@end

@implementation ButtonFactory

+ (UIButton *)textButton:(NSString *)text
                   block:(ActionBlock)block{
    BlockButton *button = [self buttonWithTitle:text imageName:nil touchUpInsideBlock:block];
    return button;
}

+ (UIButton *)imageButton:(NSString *)imageName
                    block:(ActionBlock)block{
    BlockButton *button = [self buttonWithTitle:nil imageName:imageName touchUpInsideBlock:block];
    return button;
}

//这种方式的弊端:①对于文字延迟加载的,不能正常设置. ②不能设置imageView的大小
+ (BlockButton *)buttonWithTitle:(NSString *)title
                        image:(NSString *)imageName
                         type:(ButtonType)type
                          gap:(CGFloat)gap
                        block:(ActionBlock)block{
    BlockButton *button = [self buttonWithTitle:title imageName:imageName touchUpInsideBlock:block];
    [button adjustButtonPositionWithType:type spacing:gap];
    return button;
}

#pragma mark - private -


+ (BlockButton *)buttonWithTitle:(NSString *)title
                           imageName:(NSString *)imageName
              touchUpInsideBlock:(ActionBlock)block{
    BlockButton *button = [BlockButton buttonWithType:UIButtonTypeCustom];
    button.clickBlock = block;
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    if (imageName.length != 0) {
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    return button;
}

@end
