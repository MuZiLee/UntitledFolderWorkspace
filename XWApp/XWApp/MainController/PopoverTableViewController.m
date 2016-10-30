//
//  PopoverTableViewController.m
//  OneBox
//
//  Created by 李飞恒 on 16/10/30.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import "PopoverTableViewController.h"

@interface PopoverTableViewController ()

@property (nonatomic, strong) NSArray *dataSources;

@end

static NSInteger indexRow = 0;

@implementation PopoverTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.dataSources = @[@"我的云盘",@"我的共享",@"共享给我的",@"团队空间"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    
    self.view.backgroundColor = [UIColor orangeColor];
    self.tableView.backgroundColor = [UIColor orangeColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataSources.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = self.dataSources[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    //selected Background View
    UIView *aView = [[UIView alloc] initWithFrame:cell.bounds];
    aView.backgroundColor = [UIColor redColor];
    cell.selectedBackgroundView = aView;

    NSIndexPath *ip = [NSIndexPath indexPathForRow:indexRow inSection:indexPath.section];
    [tableView selectRowAtIndexPath:ip animated:YES scrollPosition:UITableViewScrollPositionBottom];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    indexRow = indexPath.row;
    self.didSelectRowAtIndexPath(indexPath.row, self.dataSources[indexPath.row]);
}




@end
