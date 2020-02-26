//
//  UILabel+AttributeText.m
//  anb
//
//  Created by du on 2018/4/26.
//  Copyright © 2018年 alpha. All rights reserved.
//

#import "UILabel+XXAddition.h"


@implementation UILabel (XXAddition)

- (void)addAttributes:(NSDictionary<NSString *, id> *)attributes forText:(NSString *)text{
    [self addAttributes:attributes forText:text options:NSLiteralSearch];
}

- (void)addAttributes:(NSDictionary<NSString *, id> *)attributes forText:(NSString *)text options:(NSStringCompareOptions)options{
    if (text.length == 0 || self.text.length == 0) {
        return;
    }
    NSMutableAttributedString *attributeText;
    if (self.attributedText.string.length == 0) {
        attributeText = [[NSMutableAttributedString alloc]initWithString:self.text];
    }
    else{
        attributeText = [[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];
    }
    NSRange range = [attributeText.string rangeOfString:text options:options];
    if(range.location == NSNotFound) return;
    [attributeText addAttributes:attributes range:range];
    self.attributedText = attributeText;
}

-(void)setLineSpace:(CGFloat)space{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];        //设置行间距
    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [paragraphStyle setAlignment:self.textAlignment];
    [self addAttributes:@{NSParagraphStyleAttributeName:paragraphStyle} forText:self.text];
}


- (void)addUnderLineForText:(NSString *)text{
    [self addAttributes:@{NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]} forText:text];
}

- (CGFloat)labelHeightWithWidth:(CGFloat)width
{
    NSDictionary *attribute = @{NSFontAttributeName:self.font};
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                           options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                        attributes:attribute context:nil].size;
    return size.height;
}

- (CGFloat)labelWidthWithHeight:(CGFloat)height
{
    NSDictionary *attribute = @{NSFontAttributeName:self.font };
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT, height)
                                           options: NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                        attributes:attribute
                                           context:nil].size;
    return size.width;
}



@end
