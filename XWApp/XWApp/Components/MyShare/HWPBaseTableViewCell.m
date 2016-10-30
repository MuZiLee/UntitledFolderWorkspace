//
//  HWPBaseTableViewCell.m
//  OneBox
//
//  Created by 李飞恒 on 16/10/30.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import "HWPBaseTableViewCell.h"
#import "HWPBaseCellAccessoryView.h"

#define kIndicatorViewTag -1

@interface HWPBaseTableViewCell ()

@property (nonatomic, strong) UIButton *touchBut;

@end

@implementation HWPBaseTableViewCell

- (UIButton *)touchBut
{
    if (!_touchBut) {
        _touchBut = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width-50, 0, 50, self.frame.size.height)];
        [_touchBut setBackgroundColor:[UIColor orangeColor]];
        [_touchBut addTarget:self action:@selector(touchButAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.contentView addSubview:_touchBut];
    }
    return _touchBut;
}

- (void)touchButAction:(UIButton *)event
{
    if (self.touchBlock) {
        self.touchBlock();
    }
}



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setIsExpandable:NO];
        [self setIsExpanded:NO];
        [self touchBut];
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    [self touchBut];
    
    if (self.isExpanded) {
        
        if (![self containsIndicatorView])
            [self addAccessoryView];
        else {
            [self removeIndicatorView];
            [self addAccessoryView];
        }
    }
}

static UIImage *_image = nil;
- (UIView *)expandableView
{
    if (!_image) {//
        _image = [UIImage imageNamed:@"expandableImage.png"];
    }
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    CGRect frame = CGRectMake(0.0, 0.0, _image.size.width, _image.size.height);
    button.frame = frame;
    
    [button setBackgroundImage:_image forState:UIControlStateNormal];
    
    return button;
}

- (void)setIsExpandable:(BOOL)isExpandable
{
    if (isExpandable)
        [self setAccessoryView:[self expandableView]];
    
    _isExpandable = isExpandable;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)addAccessoryView
{
    CGPoint point = self.accessoryView.center;
    CGRect bounds = self.accessoryView.bounds;

    
    CGRect frame = CGRectMake((point.x - CGRectGetWidth(bounds) * 1.5), point.y * 1.4, CGRectGetWidth(bounds) * 3.0, CGRectGetHeight(self.bounds) - point.y * 1.4);

    HWPBaseCellAccessoryView *indicatorView = [[HWPBaseCellAccessoryView alloc] initWithFrame:frame];
    indicatorView.tag = kIndicatorViewTag;
    [self.contentView addSubview:indicatorView];
}

- (void)removeIndicatorView
{
    id indicatorView = [self.contentView viewWithTag:kIndicatorViewTag];
    [indicatorView removeFromSuperview];
}

- (BOOL)containsIndicatorView
{
    return [self.contentView viewWithTag:kIndicatorViewTag] ? YES : NO;
}


@end
