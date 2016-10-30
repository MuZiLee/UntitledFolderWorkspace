//
//  MainNavigationController.m
//  OneBox
//
//  Created by 李飞恒 on 16/10/30.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import "MainNavigationController.h"
#import "PopoverTableViewController.h"
#import "NSString+Category.h"

@interface MainNavigationController ()<UINavigationControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UISearchBar *searchBar;

@property (nonatomic, strong) UIPopoverController *popover;

@property (nonatomic, strong) PopoverTableViewController *tabController;
@property (nonatomic, strong) UIButton *titleView;
#define kWidth ([UIScreen mainScreen].bounds.size.width)
#define kHeight ([UIScreen mainScreen].bounds.size.height)


@end

CGFloat const kNavBarHeight = 64;

@implementation MainNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        self.delegate = self;
        
        
        
        self.titleView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kWidth/2, 44)];
        [self.titleView setTitle:rootViewController.navigationItem.title forState:(UIControlStateNormal)];
        [self.titleView setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [self.titleView setImage:[UIImage imageNamed:@"titleTouchLab"] forState:(UIControlStateNormal)];
        [self.titleView addTarget:self action:@selector(titleViewAction:) forControlEvents:(UIControlEventTouchUpInside)];
        
        UIFont *font = [UIFont boldSystemFontOfSize:17];
        CGSize size = [rootViewController.navigationItem.title sizeWithFont:font maxSize:CGSizeMake(MAXFLOAT, 44)];
        
        if ([rootViewController.navigationItem.title isEqualToString:@"共享给我的"]) {
            [self.titleView setTitleEdgeInsets:UIEdgeInsetsMake(0, -(25), 0, 0)];
            [self.titleView setImageEdgeInsets:UIEdgeInsetsMake(0, size.width+120, 0, 0)];
        } else {
            [self.titleView setTitleEdgeInsets:UIEdgeInsetsMake(0, -(20), 0, 0)];
            [self.titleView setImageEdgeInsets:UIEdgeInsetsMake(0, size.width+110, 0, 0)];

        }
        
        rootViewController.navigationItem.titleView = self.titleView;
    }
    return self;
}

- (void)titleViewAction:(UIButton *)event {

    self.tabController = [[PopoverTableViewController alloc] initWithStyle:(UITableViewStylePlain)];
    
    __weak typeof(self) weakSelf = self;
    [self.tabController setDidSelectRowAtIndexPath:^(NSInteger index, NSString *title) {

        [weakSelf.popover dismissPopoverAnimated:YES];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"DiDSelectPopverRow" object:weakSelf userInfo:@{@"index":@(index),@"title":title}];
        
//        return index;
    }];
    
    //2.新建一个popoverController，并设置其内容控制器
    self.popover = [[UIPopoverController alloc] initWithContentViewController:self.tabController];
    self.popover.backgroundColor = [UIColor orangeColor];

    self.popover.popoverContentSize = CGSizeMake(300, 200);

    //4.显示
    CGRect frame = event.bounds;
    frame.origin.y = frame.origin.y + 15;
    [self.popover presentPopoverFromRect:frame inView:event permittedArrowDirections:(UIPopoverArrowDirectionAny) animated:YES];
    
}



- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        
        UIViewController *toViewController = (UIViewController *)toVC;
        
        UIButton *blockBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        blockBtn.frame = CGRectMake(0, 0, 44, 44);
        [blockBtn setImage:[UIImage imageNamed:@"image"] forState:(UIControlStateNormal)];
        toViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:blockBtn];
        [blockBtn addTarget:self action:@selector(popFromVC) forControlEvents:(UIControlEventTouchUpInside)];
        
    } else if (operation == UINavigationControllerOperationPop) {
        
        
        
        
    }
    
    
    
    return nil;
}

- (void)popFromVC
{
    [self popViewControllerAnimated:YES];
}





@end
