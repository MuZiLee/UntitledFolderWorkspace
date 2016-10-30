//
//  HWPMyCloudViewController.m
//  OneBox
//
//  Created by 李飞恒 on 16/10/30.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import "HWPMyCloudViewController.h"
#import "XWSearchViewController.h"
#import "MJRefresh.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

#define kFrame (CGRectMake(0, EXT_SEARCH_BAR_HEIGHT, kWidth, self.view.frame.size.height-EXT_SEARCH_BAR_HEIGHT))

@interface HWPMyCloudViewController () <UITableViewDelegate, UITableViewDataSource>;


@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSources;

@end

@implementation HWPMyCloudViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:kFrame style:(UITableViewStylePlain)];
//    self.tableView.backgroundColor = [UIColor clearColor];
//    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 100, 0);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.sectionHeaderHeight = EXT_SEARCH_BAR_HEIGHT;
    [self.contentView addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Identifier"];
    
    

    
    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        
    }];
    self.tableView.mj_footer = [MJRefreshFooter footerWithRefreshingBlock:^{
        
    }];
    [self.tableView.mj_footer beginRefreshing];
}

- (void)loadNewData {
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.tableView.frame = kFrame;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Identifier" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    self.search.active = YES;
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}


@end
