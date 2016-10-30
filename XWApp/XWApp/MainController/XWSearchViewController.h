//
//  XWSearchViewController.h
//  XWApp
//
//  Created by 李飞恒 on 16/10/30.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import "HWPBaseViewController.h"
@class XWSearchController;

extern CGFloat const EXT_SEARCH_BAR_HEIGHT;

@interface XWSearchViewController : HWPBaseViewController

@property (nonatomic, strong) UISearchController *search;

@property (nonatomic, strong) XWSearchController *searchController;
@property (nonatomic, strong) UIView *contentView;

@end

@interface XWSearchController : UIViewController

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UISearchController *searchController;

@end