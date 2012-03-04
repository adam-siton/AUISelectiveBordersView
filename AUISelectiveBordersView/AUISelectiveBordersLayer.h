//
//  AUISelectiveBordersLayer.h
//  AUISelectiveBordersView
//
//  Created by Adam Siton on 1/26/12.
//  Copyright (c) 2012 Any.do. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

enum {
    AUISelectiveBordersFlagLeft = 1 <<  0,
    AUISelectiveBordersFlagRight = 1 <<  1, 
    AUISelectiveBordersFlagTop = 1 <<  2, 
    AUISelectiveBordersFlagBottom = 1 <<  3
};
typedef NSUInteger AUISelectiveBordersFlag;


@interface AUISelectiveBordersLayer : CALayer {
    CAShapeLayer *borderLayer;
}

@property (nonatomic, strong) UIColor *selectiveBordersColor;
@property (nonatomic) float selectiveBordersWidth;
@property (nonatomic) AUISelectiveBordersFlag selectiveBorderFlag;

@end
