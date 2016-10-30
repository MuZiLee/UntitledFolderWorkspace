//
//  MainViewController.m
//  OneBox
//
//  Created by 李飞恒 on 16/10/30.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import "ManagerViewController.h"
#import "MainNavigationController.h"

#import "HWPMyCloudViewController.h"
#import "HWPMyShareViewController.h"
#import "HWPShareToMeViewController.h"
#import "HWPTeamSpaceViewController.h"

@interface ManagerViewController ()

@property (nonatomic, strong) HWPBaseViewController *vc1;
@property (nonatomic, strong) HWPBaseViewController *vc2;
@property (nonatomic, strong) HWPBaseViewController *vc3;
@property (nonatomic, strong) HWPBaseViewController *vc4;

@property (nonatomic, strong) MainNavigationController *nc1;
@property (nonatomic, strong) MainNavigationController *nc2;
@property (nonatomic, strong) MainNavigationController *nc3;
@property (nonatomic, strong) MainNavigationController *nc4;

@end

@implementation ManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tabBar setHidden:YES];
    CGPoint point = self.view.center;
    self.view.center = CGPointMake(point.x, point.y+49);
    
    
    [self setViewControllers:[self aViewControllers] animated:YES];
    

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tableDiDSelectPopverRow:) name:@"DiDSelectPopverRow" object:nil];
    
}

- (NSArray<UIViewController *> *)aViewControllers
{
    _vc1 = [[HWPMyCloudViewController alloc] init];
    _vc1.navigationItem.title = @"我的云盘";
    _vc2 = [[HWPMyShareViewController alloc] init];
    _vc2.navigationItem.title = @"我的共享";
    _vc3 = [[HWPShareToMeViewController alloc] init];
    _vc3.navigationItem.title = @"共享给我的";
    _vc4 = [[HWPTeamSpaceViewController alloc] init];
    _vc4.navigationItem.title = @"团队空间";
    
    _nc1 = [[MainNavigationController alloc] initWithRootViewController:_vc1];
    _nc2 = [[MainNavigationController alloc] initWithRootViewController:_vc2];
    _nc3 = [[MainNavigationController alloc] initWithRootViewController:_vc3];
    _nc4 = [[MainNavigationController alloc] initWithRootViewController:_vc4];
    
    return @[_nc1,_nc2,_nc3,_nc4];
}

- (void)tableDiDSelectPopverRow:(NSNotification *)fication {
    NSDictionary *dic = fication.userInfo;
    NSInteger index = [dic[@"index"] integerValue];
    NSString *title = dic[@"title"];
    self.selectedIndex = index;

}

@end
