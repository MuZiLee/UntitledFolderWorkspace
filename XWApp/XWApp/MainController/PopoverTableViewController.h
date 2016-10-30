//
//  PopoverTableViewController.h
//  OneBox
//
//  Created by 李飞恒 on 16/10/30.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PopoverTableViewController : UITableViewController

@property (nonatomic, copy) void(^didSelectRowAtIndexPath)(NSInteger index, NSString *title);


@end
