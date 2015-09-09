//
//  HDShareViewController.m
//  HBDemoVersion
//
//  Created by okwei on 14-11-4.
//  Copyright (c) 2014年 heartbeat. All rights reserved.
//

#import "HBShareViewController.h"
#import "HBSendViewController.h"

@interface HBShareViewController ()

@end

@implementation HBShareViewController

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setTitle:@"共  享"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1]];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tabBarController setTitle:@"共  享"];
    [self addSearchButton];
//    [self addSendButton];
    [self addSendButton];
}

-(void)addSearchButton {
    UIButton *backbutton2 = [[UIButton alloc]init] ;
    float height=20;
    backbutton2.frame=CGRectMake(0, (44-height)/2, height, height) ;
    backbutton2.titleLabel.font=[UIFont systemFontOfSize:14];
    [backbutton2 addTarget:self action:@selector(clickedSearchButton:) forControlEvents:UIControlEventTouchUpInside];
    [backbutton2 setImage:[UIImage imageNamed:@"search.png"] forState:UIControlStateNormal];
//    UIBarButtonItem *backItem2 = [[UIBarButtonItem alloc] initWithCustomView:backbutton2] ;
//    self.tabBarItem.rightBarButtonItem =backItem2;
    
}

//添加“你送我收”按钮
-(void)addSendButton {
    UIButton* sendBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 105, self.view.frame.size.width, 55)];
    sendBtn.backgroundColor = [UIColor whiteColor];
    [sendBtn addTarget:self action:@selector(clickedSendButton:) forControlEvents:UIControlEventTouchUpInside];
    UIImageView* sendIV = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 45, 45)];
    sendIV.image = [UIImage imageNamed:@"AKL.jpg"];
    [sendBtn addSubview:sendIV];
    UILabel* sendLab = [[UILabel alloc]initWithFrame:CGRectMake(55, 5, sendBtn.frame.size.width - 55, 45)];
    sendLab.text = @"我送你收";
    sendLab.textColor = [UIColor blackColor];
    sendLab.font = [UIFont systemFontOfSize:16];
    [sendBtn addSubview:sendLab];
    [self.view addSubview:sendBtn];
    
    UIView* line = [[UIView alloc]initWithFrame:CGRectMake(10, sendBtn.frame.origin.y+sendBtn.frame.size.height, sendBtn.frame.size.width - 10*2, 1)];
    line.backgroundColor = [UIColor blackColor];
    [self.view addSubview:line];
}

-(void)clickedSendButton:(UIButton* )sender {
    NSLog(@"点击了我送你收按钮");
    HBSendViewController* sendVC = [[HBSendViewController alloc]init];
    [self.navigationController pushViewController:sendVC animated:NO];
}

-(void)clickedSearchButton:(UIButton* )sender {
    
}

@end
