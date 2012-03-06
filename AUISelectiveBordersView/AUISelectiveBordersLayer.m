//
//  AUISelectiveBordersLayer.m
//  AUISelectiveBordersView
//
//  Created by Adam Siton on 1/26/12.
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in
//all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//THE SOFTWARE.


#import "AUISelectiveBordersLayer.h"

#pragma mark -
#pragma mark Private Declarations

@interface AUISelectiveBordersLayer (Private)
-(void) commonInit;
-(void) reloadBorders;
// TODO
-(void) roundCornersIfNeeded;
@end

@implementation AUISelectiveBordersLayer

@synthesize selectiveBordersColor, selectiveBordersWidth, selectiveBorderFlag;

#pragma mark -
#pragma mark Initialization

-(id) init
{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

-(id) initWithLayer:(id)layer
{
    self = [super initWithLayer:layer];
    if (self) {
        [self commonInit];
    }
    return self;
}

-(void) commonInit
{
    // Initialize defaults
    selectiveBordersWidth = 0.0;
    selectiveBordersColor = [UIColor blackColor];
    selectiveBorderFlag = AUISelectiveBordersFlagLeft | AUISelectiveBordersFlagRight | AUISelectiveBordersFlagTop | AUISelectiveBordersFlagBottom;
}

#pragma mark -
#pragma mark Positioning

// We need the borderLayer to always be the top most layer, so each time the subLayers positioning change, we place the borderLayer at the top.
-(void) layoutSublayers {
    [super layoutSublayers];
    [self reloadBorders];
    // Move the borders to the top
    borderLayer.zPosition = self.sublayers.count;
}

#pragma mark -
#pragma mark Properties

-(void) setSelectiveBorderFlag:(AUISelectiveBordersFlag)newSelectiveBorderFlag
{
    // Lazily create the border layer only if setting the selective borders property
    if (!borderLayer) {
        borderLayer = [[CAShapeLayer alloc] init];
        [self addSublayer:borderLayer];
    }
    
    selectiveBorderFlag = newSelectiveBorderFlag;
    
    [self reloadBorders];
}

-(void) setSelectiveBordersColor:(UIColor *)newSelectiveBordersColor
{
    selectiveBordersColor = newSelectiveBordersColor;
    borderLayer.strokeColor = selectiveBordersColor.CGColor;
}

-(void) setSelectiveBordersWidth:(float)newSelectiveBordersWidth
{
    selectiveBordersWidth = newSelectiveBordersWidth;
    borderLayer.lineWidth = selectiveBordersWidth;
}

-(void) setCornerRadius:(CGFloat)cornerRadius
{
    [super setCornerRadius:cornerRadius];
    
    [self roundCornersIfNeeded];
}

#pragma mark -
#pragma mark Drawing

-(void) reloadBorders
{
    if (!borderLayer)
        return;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    if (selectiveBorderFlag & AUISelectiveBordersFlagLeft) { // left border
        CGPoint startPoint = CGPointMake(0-selectiveBordersWidth/2, 0);
        CGPoint endPoint = CGPointMake(0-selectiveBordersWidth/2, CGRectGetMaxY(self.bounds));
        [path moveToPoint:startPoint];
        [path addLineToPoint:endPoint];
    }
    if (selectiveBorderFlag & AUISelectiveBordersFlagRight) { // right border
        CGPoint startPoint = CGPointMake(CGRectGetMaxX(self.bounds)-selectiveBordersWidth/2, 0);
        CGPoint endPoint = CGPointMake(CGRectGetMaxX(self.bounds)-selectiveBordersWidth/2, CGRectGetMaxY(self.bounds));
        [path moveToPoint:startPoint];
        [path addLineToPoint:endPoint];
    }
    if (selectiveBorderFlag & AUISelectiveBordersFlagTop) { // top border
        CGPoint startPoint = CGPointMake(0, 0+selectiveBordersWidth/2);
        CGPoint endPoint = CGPointMake(CGRectGetMaxX(self.bounds), 0+selectiveBordersWidth/2);
        [path moveToPoint:startPoint];
        [path addLineToPoint:endPoint];
    }
    if (selectiveBorderFlag & AUISelectiveBordersFlagBottom) { // bottom border
        CGPoint startPoint = CGPointMake(0, CGRectGetMaxY(self.bounds)-selectiveBordersWidth/2);
        CGPoint endPoint = CGPointMake(CGRectGetMaxX(self.bounds), CGRectGetMaxY(self.bounds)-selectiveBordersWidth/2);
        [path moveToPoint:startPoint];
        [path addLineToPoint:endPoint];
    }
    
    borderLayer.frame = self.bounds;
    borderLayer.path = path.CGPath;
    
    borderLayer.strokeColor = self.selectiveBordersColor.CGColor;
    borderLayer.lineWidth = self.selectiveBordersWidth;
}

-(void) roundCornersIfNeeded
{
    // TODO
}

@end
