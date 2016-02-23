//
//  UIBarButtonItem+Extension.m
//  JasonWeibo
//
//  Created by 星星 on 16/2/23.
//  Copyright © 2016年 星星. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (instancetype)barButtonItemWith:(NSString *)normalImageName andhighlight:(NSString *)hlImageName addTarget:(nullable id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image = [UIImage imageNamed:normalImageName];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:hlImageName] forState:UIControlStateHighlighted];
    
    btn.bounds = CGRectMake(0, 0, image.size.width, image.size.height);
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}


+ (instancetype)barButtonItemWithTitle:(NSString *)title addTarget:(nullable id)target action:(SEL)action
{
    //由文字大小设置按钮大小
    UIFont *font = [UIFont systemFontOfSize:16];
    NSDictionary *dic = @{NSFontAttributeName:font};
    CGSize titleSize = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.bounds = CGRectMake(0, 0, titleSize.width, titleSize.height);
    //设置按钮的title和颜色
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return  [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (instancetype)backItemWithTitle:(NSString *)title addTarget:(nullable id)target action:(SEL)action
{
    UIFont *font = [UIFont systemFontOfSize:16];
    NSDictionary *dic = @{NSFontAttributeName:font};
    CGSize titleSize = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    
    UIImage *image = [UIImage imageNamed:@"navigationbar_back_withtext"];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"navigationbar_back_withtext_highlighted"] forState:UIControlStateHighlighted];
    
    CGFloat height = image.size.height;
    CGFloat width = image.size.width + titleSize.width;
    btn.bounds = CGRectMake(0, 0, width, height);
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}

@end
