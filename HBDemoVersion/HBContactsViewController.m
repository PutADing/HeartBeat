//
//  HBContactsViewController.m
//  HBDemoVersion
//
//  Created by 蒋宽 on 15/1/29.
//  Copyright (c) 2015年 heartbeat. All rights reserved.
//

#import "HBContactsViewController.h"
#import "HBContactsTableViewCell.h"

@interface HBContactsViewController ()<UITableViewDataSource,UITableViewDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong)UITableView* contactsTableView;
@end

@implementation HBContactsViewController

#define ContactsTableViewCell @"ContactsTVC"

-(UITableView *)contactsTableView{
    if (!_contactsTableView) {
        _contactsTableView = [[UITableView alloc]init];
        [_contactsTableView setDelegate:self];
        [_contactsTableView setDataSource:self];
        [_contactsTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_contactsTableView setTableFooterView:[[UIView alloc] init]];
        [_contactsTableView registerClass:[HBContactsTableViewCell class] forCellReuseIdentifier:ContactsTableViewCell];
    }
    return _contactsTableView;
}

-(instancetype)init {
    self = [super init];
    if (self) {
        [self setTitle:@"通讯录"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.contactsTableView];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tabBarController setTitle:@"通讯录"];
    
}

#pragma  -mark  UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma  -mark  UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
