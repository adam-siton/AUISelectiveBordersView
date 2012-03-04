//
//  AUIFlexibleBordersView.h
//  AnyDO
//
//  Created by Adam Siton on 1/25/12.
//  Copyright (c) 2012 Any.do. All rights reserved.
//

#import <UIKit/UIKit.h>

// TODO:
// 1. cornerRadius
// 2. the contents of the view should be beneth the borders - doesn't work as it should yet.
// 3. Explain in the blog why I add a sublayer instead of overriding drawInContext? - Espacially the "Subclassing CALayer and implementing one of the drawing methods does not automatically cause drawing to occur. You must explicitly cause the instance to re-cache the content, either by sending it a setNeedsDisplay or setNeedsDisplayInRect: message, or by setting its needsDisplayOnBoundsChange property to YES" part
//  from http://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/CoreAnimation_guide/Articles/ProvidingCALayerContent.html
// 5. Explain in the blog about the problem of -3 to 3 - only on the right?
// 4. Post answers in SO
//     http://stackoverflow.com/questions/7237718/can-you-set-different-calayer-border-width-on-different-side
//     http://stackoverflow.com/questions/7022656/calayer-add-a-border-only-at-one-side

/*
 
 The problem with using a category instead of subclass is that we can't subclass drawRect so we have to add a layer. And if we're adding a layer, than we have to make sure that this layer is always on top, and we can't do this because we can't subclass addSubLayer.
 
 Explain how I even considered NSProxy of Method swizling
 
  Explain in the blog why I can't subclass each type of view (UILabel, UIButton, etc.) instead of adding a category - Because I can't change the type of the class that a UILabel inherits from - it's always 
 
Find SO questions about the trick of subclassing UIView to override the layerClass - i.e. questions about how to override drawRect
 
 */
/*
enum {
    AUISelectiveBordersFlagLeft = 1 <<  0,
    AUISelectiveBordersFlagRight = 1 <<  1, 
    AUISelectiveBordersFlagTop = 1 <<  2, 
    AUISelectiveBordersFlagBottom = 1 <<  3
};
typedef NSUInteger AUISelectiveBordersFlag;

@interface AUISelectiveBordersView : UIView

@property (nonatomic, strong) UIColor *selectiveBordersColor;
@property (nonatomic) float selectiveBordersWidth;
@property (nonatomic) AUISelectiveBordersFlag borderFlag;

@end
*/