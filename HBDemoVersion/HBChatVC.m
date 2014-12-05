//
//  HDChatVC.m
//  HBDemoVersion
//
//  Created by okwei on 14-11-4.
//  Copyright (c) 2014年 heartbeat. All rights reserved.
//

#import "HBChatVC.h"
#import "HBChatMessageBoxContactModel.h"
#import "HBChatMessageBoxTableViewCell.h"

@interface HBChatVC ()<UITableViewDataSource,UITableViewDelegate,HBChatMessageBoxTableViewCellDelegate,UINavigationControllerDelegate>
@property(nonatomic,strong)UITableView * myChatTableView;
@property(nonatomic,strong)NSMutableArray * myChatTableViewDemoData;
@property(nonatomic,strong)UINavigationController * myNavigationController;
@end

#define Contacts_TableView_Cell @"CONTACTS_CELL"

@implementation HBChatVC

-(UITableView *)myChatTableView{
    if (!_myChatTableView) {
        _myChatTableView = [[UITableView alloc]init];
        [_myChatTableView setDelegate:self];
        [_myChatTableView setDataSource:self];
        [_myChatTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_myChatTableView setTableFooterView:[[UIView alloc] init]];
        [_myChatTableView registerClass:[HBChatMessageBoxTableViewCell class] forCellReuseIdentifier:Contacts_TableView_Cell];
    }
    return _myChatTableView;
}

-(NSMutableArray *)myChatTableViewDemoData{
    if (!_myChatTableViewDemoData) {
        _myChatTableViewDemoData = [NSMutableArray arrayWithArray:[HBChatMessageBoxContactModel testData]];
    }
    return _myChatTableViewDemoData;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setTitle:@"聊天"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.myChatTableView];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tabBarController setTitle:@"聊天"];
    [self.navigationController setDelegate:self];
    HBBaseNavigationController * navi = (HBBaseNavigationController *)self.navigationController;
    [navi setSelectViewHide:NO animated:YES];
}


-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.navigationController setDelegate:nil];
}

-(void)navigationController:(HBBaseNavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if ([navigationController viewControllers].count == 1)
        return;
        [navigationController setSelectViewHide:YES animated:YES];
    
       NSLog(@"%@",[navigationController viewControllers]);
    
}

#pragma mark UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.myChatTableViewDemoData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HBChatMessageBoxTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:Contacts_TableView_Cell forIndexPath:indexPath];
    cell.delegate = self;
    cell.indexPath = indexPath;
    HBChatMessageBoxContactModel * model = self.myChatTableViewDemoData[indexPath.row];
    [cell setModel:model];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController * vc = [[UIViewController alloc] init];
    [vc.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    HBBaseNavigationController * navi = (HBBaseNavigationController *)self.navigationController;
    [self.myChatTableView setFrame:CGRectMake(0, navi.topBarLength + NavigationSelectView_Hight, self.view.bounds.size.width, self.view.bounds.size.height - self.topLayoutGuide.length - NavigationSelectView_Hight)];
}

@end
