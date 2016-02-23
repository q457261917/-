//
//  CZDiscoverSearchBar.m
//  JasonWeibo
//
//  Created by 星星 on 16/2/23.
//  Copyright © 2016年 星星. All rights reserved.
//

#import "CZDiscoverSearchBar.h"

@interface CZDiscoverSearchBar ()<UITextFieldDelegate>
/**
 *  文本框
 */
@property (weak, nonatomic) IBOutlet UITextField *textField;
/**
 *  文本框右边约束
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textFieldTrailing;
/**
 *  取消按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;

/**
 *  放大镜图片
 */
@property(nonatomic, strong)UIImageView *leftView;
/**
 *  箭头图片
 */
@property(nonatomic, strong)UIButton *arrowBtn;

@end

@implementation CZDiscoverSearchBar


#pragma mark -- 懒加载
- (UIImageView *)leftView
{
    if (_leftView == nil)
    {
        UIImageView *leftView = [[UIImageView alloc] init];
        UIImage *image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
        leftView.image = image;
        leftView.contentMode = UIViewContentModeCenter;
        leftView.bounds = CGRectMake(0, 0, image.size.width + 10, image.size.height);
        _leftView = leftView;
    }
    return _leftView;
}

- (UIButton *)arrowBtn
{
    if (_arrowBtn == nil)
    {
        UIButton *arrowBtn = [[UIButton alloc]init];
        
        [arrowBtn setImage:[UIImage imageNamed:@"popover_arrow"] forState:UIControlStateNormal];
        arrowBtn.bounds = self.leftView.bounds;
        _arrowBtn = arrowBtn;
    }
    return _arrowBtn;
}


+ (instancetype)discoverSearchBar
{
    return [[NSBundle mainBundle]loadNibNamed:@"CZDiscoverSearchBar" owner:nil options:nil].lastObject;
}

- (void)awakeFromNib
{
    //添加textField左边的view
   
    self.textField.leftView = self.leftView;
    
    self.textField.leftViewMode = UITextFieldViewModeAlways;
    self.textField.delegate = self;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    CGRect frame = self.cancelBtn.frame;
    self.textField.leftView = self.arrowBtn;
    self.arrowBtn.transform = CGAffineTransformMakeRotation(M_PI);
    self.textFieldTrailing.constant = frame.size.width + 10;
    self.cancelBtn.hidden = NO;
    return YES;
}

- (IBAction)cancel
{
    self.textField.leftView = self.leftView;
    self.textFieldTrailing.constant = 0;
    [UIView animateWithDuration:0.25 animations:^{
        //重新布局子控件
        [self layoutIfNeeded];
    }];
    self.cancelBtn.hidden = YES;
    [self endEditing:YES];
}



@end
