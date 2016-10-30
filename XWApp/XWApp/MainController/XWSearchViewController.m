//
//  XWSearchViewController.m
//  XWApp
//
//  Created by 李飞恒 on 16/10/30.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import "XWSearchViewController.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

#define kSearchBarFrame (CGRectMake(0, 0, kWidth, EXT_SEARCH_BAR_HEIGHT))

CGFloat const EXT_SEARCH_BAR_HEIGHT = 44;

@interface XWSearchViewController () <UISearchControllerDelegate,UISearchResultsUpdating>

@property (nonatomic, strong) UISearchController *search;


@end

@implementation XWSearchViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self adjust64];
    [self initSearchController];
    

}


- (void)initSearchController {
    self.contentView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.contentView.backgroundColor = [UIColor orangeColor];
    self.view = self.contentView;
    
    self.searchController = [[XWSearchController alloc] init];
    
    self.search = [[UISearchController alloc] initWithSearchResultsController:self.searchController];
    self.search.searchResultsUpdater = self;
    self.search.delegate = self;
    self.search.searchBar.frame = kSearchBarFrame;
//    self.searchController.searchBar.barTintColor = [UIColor yellowColor];
    [self.contentView addSubview:self.search.searchBar];
    
    self.searchController.searchController = self.search;
}

- (void)adjust64
{
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeBottom;
    }
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.search.searchBar.frame = kSearchBarFrame;
}

- (void)willPresentSearchController:(UISearchController *)searchController
{
    
}
- (void)didPresentSearchController:(UISearchController *)searchController
{
    
}
- (void)willDismissSearchController:(UISearchController *)searchController
{
    
}
- (void)didDismissSearchController:(UISearchController *)searchControlle
{
    
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    
}





@end


@implementation XWSearchController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.2];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.searchController.active = NO;
    [self.searchController.searchBar endEditing:YES];
}

@end
