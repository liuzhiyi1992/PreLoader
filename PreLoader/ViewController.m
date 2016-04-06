//
//  ViewController.m
//  PreLoader
//
//  Created by lzy on 16/3/31.
//  Copyright © 2016年 lzy. All rights reserved.
//

#import "ViewController.h"
#import "PreLoader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIColor *spotColor = [UIColor colorWithRed:235/255.0 green:77/255.0 blue:138/255.0 alpha:1.0];
    UIColor *backgroundColor = [UIColor colorWithRed:47/255.0 green:46/255.0 blue:51/255.0 alpha:1.0];
    PreLoader *preLoader = [[PreLoader alloc] initWithFrame:CGRectMake(60, 300, 250, 250)
                                                      color:spotColor
                                            backgroundColor:[UIColor clearColor]];
    [self.view setBackgroundColor:backgroundColor];
    [self.view addSubview:preLoader];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
