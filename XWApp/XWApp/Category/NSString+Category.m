//
//  NSString+Category.m
//  OneBox
//
//  Created by 李飞恒 on 16/10/30.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

@end
