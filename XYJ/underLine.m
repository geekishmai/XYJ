//
//  underLine.m
//  XYJ
//
//  Created by user on 2019/3/26.
//  Copyright © 2019 user. All rights reserved.
//

#import "underLine.h"

@implementation underLine
-(void)drawRect:(CGRect)rect{
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
