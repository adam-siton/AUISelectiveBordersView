//
//  AUIFlexibleBordersView.m
//  AnyDO
//
//  Created by Adam Siton on 1/25/12.
//  Copyright (c) 2012 Any.do. All rights reserved.
//
/*
#import "AUISelectiveBordersView.h"

@implementation AUISelectiveBordersView

@synthesize borderFlag, selectiveBordersColor, selectiveBordersWidth;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // The borders are the top most part of the view and should cover up all the subViews, so we make the view draw only an inset of the rect
    // TODO: This doesn't work as it should yet.
    CGRect insideRect = rect;
    if (borderFlag & AUISelectiveBordersFlagLeft) { // left border
        insideRect.origin.x += self.selectiveBordersWidth;
        insideRect.size.width -= self.selectiveBordersWidth;
    }
    if (borderFlag & AUISelectiveBordersFlagRight) { // right border
        insideRect.size.width -= self.selectiveBordersWidth;
    }
    if (borderFlag & AUISelectiveBordersFlagTop) { // top border
        insideRect.origin.y += self.selectiveBordersWidth;
        insideRect.size.height -= self.selectiveBordersWidth;
    }
    if (borderFlag & AUISelectiveBordersFlagBottom) { // bottom border
        insideRect.size.height -= self.selectiveBordersWidth;
    }
    [super drawRect:insideRect];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    if (!self.selectiveBordersWidth)
        return;
    
    // Draw the borders according to the directions
    if (borderFlag & AUISelectiveBordersFlagLeft) { // left border
        CGPoint startPoint = CGPointMake(0, 0);
        CGPoint endPoint = CGPointMake(0, CGRectGetMaxY(rect)-selectiveBordersWidth);
        drawLine(ctx, startPoint, endPoint, self.selectiveBordersColor.CGColor, self.selectiveBordersWidth);
    }
    if (borderFlag & AUISelectiveBordersFlagRight) { // right border
        CGPoint startPoint = CGPointMake(CGRectGetMaxX(rect)-selectiveBordersWidth, 0);
        CGPoint endPoint = CGPointMake(CGRectGetMaxX(rect)-selectiveBordersWidth, CGRectGetMaxY(rect)-selectiveBordersWidth);
        drawLine(ctx, startPoint, endPoint, self.selectiveBordersColor.CGColor, self.selectiveBordersWidth);
    }
    if (borderFlag & AUISelectiveBordersFlagTop) { // top border
        CGPoint startPoint = CGPointMake(0, 0);
        CGPoint endPoint = CGPointMake(CGRectGetMaxX(rect)-selectiveBordersWidth, 0);
        drawLine(ctx, startPoint, endPoint, self.selectiveBordersColor.CGColor, self.selectiveBordersWidth);
    }
    if (borderFlag & AUISelectiveBordersFlagBottom) { // bottom border
        CGPoint startPoint = CGPointMake(0, CGRectGetMaxY(rect)-selectiveBordersWidth);
        CGPoint endPoint = CGPointMake(CGRectGetMaxX(rect)-selectiveBordersWidth, CGRectGetMaxY(rect)-selectiveBordersWidth);
        drawLine(ctx, startPoint, endPoint, self.selectiveBordersColor.CGColor, self.selectiveBordersWidth);
    }
}


@end
 */
