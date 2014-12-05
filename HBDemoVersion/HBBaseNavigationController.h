//
//  HDBaseNavigationController.h
//  HBDemoVersion
//
//  Created by okwei on 14-11-4.
//  Copyright (c) 2014年 heartbeat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBBaseTabBarController.h"

@interface HBBaseNavigationController : UINavigationController
@property(nonatomic,weak)HBBaseTabBarController * myTabBarController;
@property(nonatomic,readonly)CGFloat topBarLength;

-(void)setSelectViewHide:(BOOL)hide animated:(BOOL)animated;

@end
