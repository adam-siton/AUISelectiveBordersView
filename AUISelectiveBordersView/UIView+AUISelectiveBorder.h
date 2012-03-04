//
//  UIView+AUISelectiveBorder.h
//  AUISelectiveBordersView
//
//  Created by Adam Siton on 1/26/12.
//  Copyright (c) 2012 Any.do. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AUISelectiveBordersLayer.h"

@interface UIView (AUISelectiveBorder)

@property (nonatomic, strong) UIColor *selectiveBordersColor;
@property (nonatomic) float selectiveBordersWidth;
@property (nonatomic) AUISelectiveBordersFlag selectiveBorderFlag;

@end
