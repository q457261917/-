//
//  UIBarButtonItem+Extension.h
//  JasonWeibo
//
//  Created by 星星 on 16/2/23.
//  Copyright © 2016年 星星. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (instancetype)barButtonItemWith:(NSString *)normalImageName andhighlight:(NSString *)hlImageName addTarget:(nullable id)target action:(SEL)action;

+ (instancetype)barButtonItemWithTitle:(NSString *)title addTarget:(nullable id)target action:(SEL)action;

+ (instancetype)backItemWithTitle:(NSString *)title addTarget:(nullable id)target action:(SEL)action;

@end
