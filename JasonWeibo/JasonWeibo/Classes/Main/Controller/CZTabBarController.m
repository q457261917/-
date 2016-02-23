//
//  CZTabBarController.m
//  JasonWeibo
//
//  Created by 星星 on 16/2/23.
//  Copyright © 2016年 星星. All rights reserved.
//

#import "CZTabBarController.h"
#import "CZDiscoverController.h"
#import "CZHomeController.h"
#import "CZMeController.h"
#import "CZMessageController.h"
#import "CZNavigationController.h"


@interface CZTabBarController ()

@end

@implementation CZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //首页控制器
    CZHomeController *homeController = [[CZHomeController alloc] init];
    [self addChildWith:homeController with:@"首页" normalImageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    
    //信息控制器
    CZMessageController *messageController = [[CZMessageController alloc] init];
    [self addChildWith:messageController with:@"信息" normalImageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    
    //发现控制器
    CZDiscoverController *discoverController = [[CZDiscoverController alloc] init];
    [self addChildWith:discoverController with:@"发现" normalImageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
    //我控制器
    CZMeController *meController = [[CZMeController alloc] init];
    [self addChildWith:meController with:@"我" normalImageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
}

- (void)addChildWith:(UIViewController *)viewController with:(NSString *)title normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName
{
    //设置导航控制器的根控制器
    CZNavigationController *nav = [[CZNavigationController alloc]initWithRootViewController:viewController];
    //设置tabBarItem的title
    nav.tabBarItem.title = title;
    //设置图片
    nav.tabBarItem.image = [UIImage imageNamed:normalImageName];
    UIImage *image = [UIImage imageNamed:selectedImageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = image;
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
