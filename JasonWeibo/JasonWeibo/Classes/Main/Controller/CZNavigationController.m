//
//  CZNavigationController.m
//  JasonWeibo
//
//  Created by 星星 on 16/2/23.
//  Copyright © 2016年 星星. All rights reserved.
//

#import "CZNavigationController.h"

@interface CZNavigationController ()

@end

@implementation CZNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background_os7"] forBarMetrics:UIBarMetricsDefault];
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeMake(1, 1);
    [bar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],
                                  NSShadowAttributeName:shadow}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSInteger VCCount = self.viewControllers.count;
    
//    NSLog(@"%zd,%@",VCCount,NSStringFromClass([viewController class]));
    if (VCCount > 0)
    {
        UIBarButtonItem *item = [UIBarButtonItem barButtonItemWith:@"navigationbar_more" andhighlight:@"navigationbar_more_highlighted" addTarget:self action:@selector(backToRoot)];
        viewController.navigationItem.rightBarButtonItem = item;
        viewController.hidesBottomBarWhenPushed = YES;
    }
    if (VCCount == 1)
    {
        UIViewController *preVC = self.viewControllers[0];
        UIBarButtonItem *backItem = [UIBarButtonItem backItemWithTitle:preVC.title addTarget:self action:@selector(back)];
        viewController.navigationItem.leftBarButtonItem = backItem;
    }else if (VCCount > 1)
    {
        UIBarButtonItem *backItem = [UIBarButtonItem backItemWithTitle:@"返回" addTarget:self action:@selector(back)];
        viewController.navigationItem.leftBarButtonItem = backItem;
    }
    [super pushViewController:viewController animated:YES];
    
    
    
    
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

- (void)backToRoot
{
    [self popToRootViewControllerAnimated:YES];
}

@end
