//
//  HWPTeamSpaceViewController.m
//  OneBox
//
//  Created by 李飞恒 on 16/10/30.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import "HWPTeamSpaceViewController.h"

@interface HWPTeamSpaceViewController ()

@end

@implementation HWPTeamSpaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.frame = CGRectMake(100, 100, 50, 50);
    [button setTitle:@"push" forState:(UIControlStateNormal)];
    [button setBackgroundColor:[UIColor orangeColor]];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    
}

- (void)buttonAction:(id)event {
    
//    [self.navigationController popViewControllerAnimated:YES];
    UIViewController *pushVC = [[UIViewController alloc] init];
    pushVC.navigationItem.title = @"XXXX项目管理";
    [self.navigationController pushViewController:pushVC animated:YES];
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
