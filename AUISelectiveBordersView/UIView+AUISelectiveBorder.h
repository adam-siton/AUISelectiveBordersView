//
//  UIView+AUISelectiveBorder.h
//  AUISelectiveBordersView
//
//  Created by Adam Siton on 1/26/12.
//  Copyright (c) 2012 Any.do. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AUISelectiveBordersLayer.h"

// Importing this category will replace UIView's default CALayer with an AUISelectiveBordersLayer, so that you can use the selective borders directly as properties of the view.
@interface UIView (AUISelectiveBorder)

@property (nonatomic, strong) UIColor *selectiveBordersColor;
@property (nonatomic) float selectiveBordersWidth;
@property (nonatomic) AUISelectiveBordersFlag selectiveBorderFlag;

@end
