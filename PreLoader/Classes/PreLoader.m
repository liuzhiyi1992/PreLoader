//
//  PreLoader.m
//  PreLoader
//
//  Created by lzy on 16/3/31.
//  Copyright © 2016年 lzy. All rights reserved.
//

#import "PreLoader.h"

int const MAX_MULTIPLE = 5;
CGFloat const UNIT_RADIUS = 5;
CGFloat const PROCESS_DURING = 3.5f;
CGFloat const SPOT_DELAY_RATIO = 0.08f;    //污点弹出延迟系数


@interface PreLoader()

//@property (assign ,nonatomic) CGFloat unitRadius;
@property (strong, nonatomic) Spot *movingSpot;
@property (strong, nonatomic) CADisplayLink *mainDisplayLink;

@end




@implementation PreLoader

- (instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color {
    self = [super init];
    if (self) {
        [self setFrame:frame];
        [self configureLoaderWithColor:color];
    }
    return self;
}


- (void)configureLoaderWithColor:(UIColor *)spotColor {
    CGFloat margin = self.bounds.size.width / 6;
    CGFloat originX = margin;
    CGFloat finalX = self.bounds.size.width - margin;
    
    
    //Fixed Spot
    Spot *leftFixedSpot = [[Spot alloc] initWithFrame:CGRectMake(originX - UNIT_RADIUS, self.bounds.size.height / 2 - UNIT_RADIUS, 2 * UNIT_RADIUS, 2 * UNIT_RADIUS) color:spotColor];
    Spot *rightFixedSpot = [[Spot alloc] initWithFrame:CGRectMake(self.bounds.size.width - margin - UNIT_RADIUS, self.bounds.size.height / 2 - UNIT_RADIUS, 2 * UNIT_RADIUS, 2 * UNIT_RADIUS) color:spotColor];
    
    NSValue *firstVal = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0f, 1.0f, 0)];
    NSValue *secondVal = [NSValue valueWithCATransform3D:CATransform3DMakeScale(2.0f, 2.0f, 0)];
    NSValue *thirdVal = [NSValue valueWithCATransform3D:CATransform3DMakeScale(3.0f, 3.0f, 0)];
    NSValue *fourthVal = [NSValue valueWithCATransform3D:CATransform3DMakeScale(4.0f, 4.0f, 0)];
    leftFixedSpot.layer.transform = CATransform3DMakeScale(4.0f, 4.0f, 0);

    
    //left
    CAKeyframeAnimation *leftFixedSpotAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    leftFixedSpotAnim.values = @[fourthVal, thirdVal, thirdVal, secondVal, secondVal, firstVal, firstVal, secondVal, secondVal, thirdVal, thirdVal];
    leftFixedSpotAnim.keyTimes = @[@(0.25), @(0.25),     @(0.33), @(0.33),     @(0.41), @(0.41),//sleep
                               @(0.84), @(0.84),     @(0.92), @(0.92),     @(1.00)];//SPOT_DELAY_RATIO = 0.08
    leftFixedSpotAnim.duration = PROCESS_DURING;
    leftFixedSpotAnim.repeatCount = HUGE_VALF;
    [leftFixedSpot.layer addAnimation:leftFixedSpotAnim forKey:@"fixedSpotScaleAnim"];
    
    
    //right
    CAKeyframeAnimation *rightFixedSpotAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    rightFixedSpotAnim.values = @[firstVal, secondVal,     secondVal, thirdVal,     thirdVal, fourthVal,
                                  fourthVal, thirdVal,     thirdVal, secondVal,     secondVal,  firstVal];
    rightFixedSpotAnim.keyTimes = @[@(0.25), @(0.25),     @(0.33), @(0.33),     @(0.41), @(0.41),//sleep
                                   @(0.75), @(0.75),     @(0.83), @(0.83),     @(0.91), @(0.91)];//SPOT_DELAY_RATIO = 0.08
    rightFixedSpotAnim.duration = PROCESS_DURING;
    rightFixedSpotAnim.repeatCount = HUGE_VALF;
        //0.1 ratio needed that the spot from left to right
    rightFixedSpotAnim.beginTime = CACurrentMediaTime() + PROCESS_DURING * 0.1;
    [rightFixedSpot.layer addAnimation:rightFixedSpotAnim forKey:@"fixedSpotScaleAnim"];
    
    [self addSubview:leftFixedSpot];
    [self addSubview:rightFixedSpot];

    
    //moving Spot
    for (int i = 0; i < 3; i++) {
        Spot *movingSpot = [[Spot alloc] initWithFrame:CGRectMake(originX - UNIT_RADIUS, self.bounds.size.height / 2 - UNIT_RADIUS , 2 * UNIT_RADIUS, 2 * UNIT_RADIUS) color:spotColor];
        
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
        anim.values = @[@(originX), @(finalX), @(finalX), @(originX)];
        anim.keyTimes = @[@(0.25), @(0.35), @(0.75), @(0.85)];
        anim.duration = PROCESS_DURING;
        anim.repeatCount = HUGE_VALF;
        anim.beginTime = CACurrentMediaTime() + i * SPOT_DELAY_RATIO * PROCESS_DURING;
        [movingSpot.layer addAnimation:anim forKey:@"movingAnim"];
        
        [self addSubview:movingSpot];
    }
    
//    [self configureDisplayLink];
}


- (void)configureDisplayLink {
    if (_mainDisplayLink == nil) {
        _mainDisplayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkAction:)];
        [_mainDisplayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
}
                            
                            
- (void)displayLinkAction:(CADisplayLink *)displayLink {
    
}


@end










#pragma CLASS - Spot
@implementation Spot

- (instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color {
    self = [super init];
    if (self) {
        [self setFrame:frame];
        [self drawLittleSpotWithColor:color];
    }
    return self;
}

- (void)drawLittleSpotWithColor:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 3 * [UIScreen mainScreen].scale);
    CGContextSetShouldAntialias(UIGraphicsGetCurrentContext(), YES);
    CGFloat rectInset = 0.5f;
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(self.bounds, rectInset, rectInset)];
    [color setFill];
    [path fill];
    self.layer.contents = (__bridge id _Nullable)(UIGraphicsGetImageFromCurrentImageContext().CGImage);
    UIGraphicsEndImageContext();
}

@end


//PreLoader is released under the MIT license.
//Please visit https://github.com/liuzhiyi1992/PreLoader for details.



