//
//  HDShareViewController.m
//  HBDemoVersion
//
//  Created by okwei on 14-11-4.
//  Copyright (c) 2014年 heartbeat. All rights reserved.
//

#import "HBShareViewController.h"

@interface HBShareViewController ()

@end

@implementation HBShareViewController

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setTitle:@"共享"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tabBarController setTitle:@"共享"];
}

@end
