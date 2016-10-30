//
//  HWPBaseTableViewCell.h
//  OneBox
//
//  Created by 李飞恒 on 16/10/30.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWPBaseTableViewCell : UITableViewCell

@property (nonatomic, copy) void(^touchBlock)(void);

/**
 * 显示接收方是否可扩展的。这个属性的默认值是否定的。
 */
@property (nonatomic, assign) BOOL isExpandable;

/**
 *  显示接收方是否扩大。这个属性的默认值是否定的。
 */
@property (nonatomic, assign) BOOL isExpanded;

/**
 * 将一个指标视图添加到接收机相关细胞时扩大。
 */
- (void)addAccessoryView;

/**
 * 从接收机中删除指标视图相关的细胞时崩溃.
 */
- (void)removeIndicatorView;

/**
 * 返回一个布尔值显示如果接收者视图包含一个指标。
 *
 *  @return 视图的布尔值指标.
 */
- (BOOL)containsIndicatorView;

@end
