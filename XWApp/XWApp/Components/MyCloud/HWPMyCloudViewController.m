//
//  HWPMyCloudViewController.m
//  OneBox
//
//  Created by 李飞恒 on 16/10/30.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import "HWPMyCloudViewController.h"
#import "XWSearchViewController.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height


@interface HWPMyCloudViewController () <UITableViewDelegate, UITableViewDataSource>;


@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSources;

@end

@implementation HWPMyCloudViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frame = CGRectMake(0, EXT_SEARCH_BAR_HEIGHT, kWidth, self.view.frame.size.height-EXT_SEARCH_BAR_HEIGHT);
    self.tableView = [[UITableView alloc] initWithFrame:frame style:(UITableViewStylePlain)];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
//    self.tableView.userInteractionEnabled = NO;
//    self.tableView.tableHeaderView.userInteractionEnabled = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.sectionHeaderHeight = EXT_SEARCH_BAR_HEIGHT;
    [self.contentView addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Identifier"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Identifier" forIndexPath:indexPath];
    
    
    
    return cell;
}


@end
