//
//  UILabel+Category.m
//  EdaixiHousekeeper
//
//  Created by 王佳佳 on 15/6/4.
//  Copyright (c) 2015年 wang_jiajia. All rights reserved.
//

#import "UILabel+Category.h"

@implementation UILabel(Category)

-(id)initWithFrame:(CGRect)frame  textColor:(UIColor *)textColor font:(UIFont *)font
{
    self=[self initWithFrame:frame];
    if(self)
    {
        self.backgroundColor=[UIColor clearColor];
        self.font=font;
        self.textColor=textColor;
        self.textAlignment=NSTextAlignmentLeft;
    }
    return self;

}
@end
