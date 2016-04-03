//
//  PreLoader.h
//  PreLoader
//
//  Created by lzy on 16/3/31.
//  Copyright © 2016年 lzy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PreLoader : UIView

- (instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color;

@end




#pragma mark - Spot
@interface Spot : UIView

@property (copy, nonatomic) NSString *effectToken;
@property (assign, nonatomic) BOOL allowChangeEffectToken;
@property (assign, nonatomic) BOOL isFirstTimeToBlend;
@property (assign, nonatomic) BOOL isFirstTimeToSpringBack;

- (instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color;

@end