//
//  CZTwoController.m
//  JasonWeibo
//
//  Created by 星星 on 16/2/23.
//  Copyright © 2016年 星星. All rights reserved.
//

#import "CZTwoController.h"
#import "CZThreeController.h"

@interface CZTwoController ()

@end

@implementation CZTwoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"two";
    self.view.backgroundColor = [UIColor whiteColor];
//    NSString *backTitle = @"首页";
//    
//    UIBarButtonItem *backItem = [UIBarButtonItem backItemWithTitle:backTitle addTarget:self action:@selector(back)];
//    self.navigationItem.leftBarButtonItem = backItem;
}


//- (void)back
//{
//    [self.navigationController popViewControllerAnimated:YES];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CZThreeController * threeVC = [[CZThreeController alloc] init];
    [self.navigationController pushViewController:threeVC animated:YES];
}

@end
