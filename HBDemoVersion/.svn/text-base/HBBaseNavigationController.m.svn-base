//
//  HDBaseNavigationController.m
//  HBDemoVersion
//
//  Created by okwei on 14-11-4.
//  Copyright (c) 2014年 heartbeat. All rights reserved.
//

#import "HBBaseNavigationController.h"

@interface HBBaseNavigationController ()
@property(nonatomic,strong)HBBaseView * selectView; //选择VC试图
@property(nonatomic,strong)NSMutableArray * selectItemArray;
@end

@implementation HBBaseNavigationController

{
    CALayer * lineLayer;        //线
    CALayer * currentLayer;     //当前选择VC的标记线
    NSInteger currentVCIndex;   //当前选择的VC的索引
}

-(CGFloat)getTopBarLength{
    
    CGFloat topLayoutGuidenLength = 0.0;
    if ([HBTool isIOS7_Later]) {
        topLayoutGuidenLength = 20;
    }
    
    return self.navigationBar.bounds.size.height + topLayoutGuidenLength;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([HBTool isIOS7_Later]) {
        [self setAutomaticallyAdjustsScrollViewInsets:NO];
    }
    [self.view insertSubview:self.selectView atIndex:999];
}

-(void)setMyTabBarController:(HBBaseTabBarController *)myTabBarController{
    _myTabBarController = myTabBarController;
    [_myTabBarController addObserver:self forKeyPath:@"viewControllers" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    if (_myTabBarController && _myTabBarController.viewControllers.count != 0) {
        [self reloadSelectView];
    }
}

-(NSMutableArray *)selectItemArray{
    if (!_selectItemArray) {
        _selectItemArray = [NSMutableArray array];
    }
    return _selectItemArray;
}

-(void)reloadSelectView{
    
    [self.selectItemArray removeAllObjects];
    for (UIView * subView in self.selectView.subviews) {
        [subView removeFromSuperview];
    }
    
    NSInteger index = 0;
    for (UIViewController * VC in _myTabBarController.viewControllers) {
        NSString * title = VC.title;
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithWhite:.3 alpha:1.0] forState:UIControlStateNormal];
        [button setTag:index++];
        [button.titleLabel setFont:[UIFont boldSystemFontOfSize:16.0]];
        [button addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.selectItemArray addObject:button];
        [self.selectView addSubview:button];
    }
    if (self.selectItemArray.count != 0)
        [self reStyleWithButton:self.selectItemArray[0]];
    
}

-(HBBaseView *)selectView{
    if (!_selectView) {
        _selectView = [[HBBaseView alloc] init];
        lineLayer = [[CALayer alloc] init];
        [lineLayer setBorderWidth:1];
        [lineLayer setBorderColor:[UIColor colorWithWhite:.9 alpha:1.0].CGColor];
        
        currentLayer = [[CALayer alloc] init];
        [currentLayer setCornerRadius:3.0];
        [currentLayer setBackgroundColor:[UIColor colorWithRed:.0 green:.75 blue:.0 alpha:1.0].CGColor];
        
        [_selectView.layer addSublayer:lineLayer];
        [_selectView.layer addSublayer:currentLayer];
        [_selectView setBackgroundColor:[UIColor whiteColor]];
    }
    return _selectView;
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    
    CGFloat topLayoutGuidenLength = 0.0;
    if ([HBTool isIOS7_Later]) {
        topLayoutGuidenLength = 20;
    }
    
    [self.selectView setFrame:CGRectMake(0,self.navigationBar.bounds.size.height + topLayoutGuidenLength,self.view.bounds.size.width, NavigationSelectView_Hight)];
    
    [lineLayer setFrame:CGRectMake(0, self.selectView.bounds.size.height - 1, self.selectView.bounds.size.width, 1)];
    
    CGFloat selectItemWidth = self.selectView.bounds.size.width / self.selectItemArray.count;
    
    for (int i = 0; i < self.selectItemArray.count; i ++) {
        UIView * view = self.selectItemArray[i];
        [view setFrame:CGRectMake(selectItemWidth * i, self.selectView.bounds.size.height - 41, selectItemWidth , 40)];
    }
    
    [currentLayer setFrame:CGRectMake(currentVCIndex * selectItemWidth, 35, selectItemWidth, 5)];
}

-(void)reStyleWithButton:(UIButton *)button{
    
    for (UIButton * but in self.selectItemArray) {
        [but setTitleColor:[UIColor colorWithWhite:.3 alpha:1.0] forState:UIControlStateNormal];
    }
    
    [button setTitleColor:[UIColor colorWithRed:.0 green:.75 blue:.0 alpha:1.0] forState:UIControlStateNormal];
    CGRect currentLayerFrame = currentLayer.frame;
    currentLayerFrame.origin.x = button.frame.origin.x;
    
    
    
    [UIView animateWithDuration:.2 delay:.0 options:UIViewAnimationOptionBeginFromCurrentState |UIViewAnimationOptionCurveEaseInOut animations:^{
        [currentLayer setFrame:currentLayerFrame];
    } completion:^(BOOL finished) {
        
    }];
    
}

-(void)buttonDidClick:(UIButton *)button{
    [self reStyleWithButton:button];
    [_myTabBarController setSelectedIndex:button.tag];
    currentVCIndex = button.tag;
}



-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
//    NSLog(@"keyPath = %@\nobject = %@",keyPath,object);
}

-(void)dealloc{
    [_myTabBarController removeObserver:self forKeyPath:@"viewControllers" context:nil];
}


-(void)setSelectViewHide:(BOOL)hide animated:(BOOL)animated{
    
    [UIView animateKeyframesWithDuration:animated ? .2 : 0 delay:0. options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
        [self.selectView setAlpha:hide ? 0.0 : 1.0];
    } completion:^(BOOL finished) {
        [self.selectView setHidden:hide];
    }];
    
}

@end
