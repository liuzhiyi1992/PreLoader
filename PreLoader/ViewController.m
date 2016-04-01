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
    // Do any additional setup after loading the view, typically from a nib.
    
    PreLoader *preLoader = [[PreLoader alloc] initWithFrame:CGRectMake(80, 300, 200, 200) color:[UIColor purpleColor]];
    [self.view addSubview:preLoader];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
