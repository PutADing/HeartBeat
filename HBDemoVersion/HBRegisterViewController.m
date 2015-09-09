//
//  HBRegisterViewController.m
//  HBDemoVersion
//
//  Created by 蒋宽 on 15/1/20.
//  Copyright (c) 2015年 heartbeat. All rights reserved.
//

#import "HBRegisterViewController.h"
#import "GDataXMLNode.h"
#import "JSON.h"

#import "ALBBOSSServiceProtocol.h"
#import "ALBBOSSServiceProvider.h"
#import "OSSTool.h"


@interface HBRegisterViewController ()
@property (nonatomic, strong) UITextField* phoneNumberTF;
@property (nonatomic, strong) UITextField* passWordTF;
@property (nonatomic, strong) NSMutableData* datas;

@property (nonatomic, strong)OSSData* ossData;
@property (nonatomic, strong)UIImage* image;

@end

@implementation HBRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addTopBar];
    [self addPhoneNumberTextField];
    [self addPassWordTextField];
    [self addLoginButton];
    [self addRegisterButton];
    
    [self registALiOSS];
}

-(void)addTopBar {
    UIView* topBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    topBar.backgroundColor = [UIColor blackColor];
    [self.view addSubview:topBar];
    UILabel* nameLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 15, 70, 24)];
    nameLab.text = @"心跳吧";
    nameLab.textColor = [UIColor whiteColor];
    nameLab.font = [UIFont systemFontOfSize:14];
    [topBar addSubview:nameLab];
}

-(void)addPhoneNumberTextField {
    UILabel* shouJiHaoLab = [[UILabel alloc]initWithFrame:CGRectMake(60, 100, 70, 20)];
    shouJiHaoLab.text = @"手机号：";
    shouJiHaoLab.textColor = [UIColor blackColor];
    shouJiHaoLab.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:shouJiHaoLab];
    
    self.phoneNumberTF = [[UITextField alloc]initWithFrame:CGRectMake(shouJiHaoLab.frame.origin.x+shouJiHaoLab.frame.size.width, shouJiHaoLab.frame.origin.y, self.view.frame.size.width - 60*2 - 70, 20)];
    self.phoneNumberTF.borderStyle = UITextBorderStyleNone;
    self.phoneNumberTF.clearsOnBeginEditing = YES;
    [self.view addSubview:self.phoneNumberTF];
    
    UIView* lineView = [[UIView alloc]initWithFrame:CGRectMake(self.phoneNumberTF.frame.origin.x, self.phoneNumberTF.frame.origin.y + self.phoneNumberTF.frame.size.height + 1, self.phoneNumberTF.frame.size.width, 1)];
    lineView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:lineView];
}

-(void)addPassWordTextField {
    self.passWordTF = [[UITextField alloc]initWithFrame:CGRectMake(self.phoneNumberTF.frame.origin.x - 70, self.phoneNumberTF.frame.origin.y + self.phoneNumberTF.frame.size.height + 20, self.view.frame.size.width - 60*2, 20)];
    self.passWordTF.placeholder = @"请输入密码";
//    self.passWordTF.secureTextEntry = YES;
    self.passWordTF.borderStyle = UITextBorderStyleNone;
    self.passWordTF.clearsOnBeginEditing = YES;
    [self.view addSubview:self.passWordTF];
    
    UIView* lineView = [[UIView alloc]initWithFrame:CGRectMake(self.passWordTF.frame.origin.x, self.passWordTF.frame.origin.y + self.passWordTF.frame.size.height + 1, self.passWordTF.frame.size.width, 1)];
    lineView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:lineView];
}

-(void)addLoginButton {
    UIButton* loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(60, 180, self.view.frame.size.width - 60*2, 40)];
    [self.view addSubview:loginBtn];
    loginBtn.backgroundColor = [UIColor colorWithRed:0 green:0.9 blue:0 alpha:1.0];
    [loginBtn setTitle:@"登    陆" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(clickedLoginButton) forControlEvents:UIControlEventTouchUpInside];
}

-(void)registALiOSS {
    id<ALBBOSSServiceProtocol> ossService = [ALBBOSSServiceProvider getService];
    NSString *accessKey = @"Z8O2jTCCf3obWgfZ"; // 实际使用中，AK/SK不应明文保存在代码中
    NSString *secretKey = @"tTRdEbr4622LakuHYJA4kmkK6vYAib";
    
    [ossService setGenerateToken:^(NSString *method, NSString *md5, NSString *type, NSString *date, NSString *xoss, NSString *resource) {
        NSString *signature = nil;
        NSString *content = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@%@", method, md5, type, date, xoss, resource];
        signature = [OSSTool calBase64Sha1WithData:content withKey:secretKey];
        signature = [NSString stringWithFormat:@"OSS %@:%@", accessKey, signature];
        
        NSLog(@"signature:%@", signature);
        return signature;
    }];
    
    OSSBucket *ossBucket = [ossService getBucket:@"heartbeat-goods"];
    [ossBucket setOssHostId:@"oss-cn-hangzhou.aliyuncs.com"]; // 指明该Bucket所在数据中心的域名或已经绑定Bucket的Cname域名
//    [ossBucket setGenerateToken:self.generateToken]; // 指明该Bucket访问时应该采用的加签方法，若不指明则从OSSClient的全局默认设置继承；如果Bucket访问权限为Public，那么可以为null
    
//    下载
    self.ossData = [ossService getOSSDataWithBucket:ossBucket key:@"HeartBeat_20150412113149_1_7.jpg"];//HeartBeat_20150330093816_0_3.jpg
    
//    上传
//    self.ossData = [ossService getOSSDataWithBucket:ossBucket key:@"HeartBeat_20150412113149_1_7.jpg"];
//    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"MZ" ofType:@"jpg"];
//    NSData* upData = [NSData dataWithContentsOfFile:imagePath];
//    [self.ossData setData:upData withType:@"IMG"];
}

//点击“登陆”按钮
-(void)clickedLoginButton {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self.ossData getWithDataCallback:^(NSData *data, NSError *error){
            NSLog(@"成功下载数据的大小:%lu", (unsigned long)data.length);
            self.image = [UIImage imageWithData:data];
            
        } withProgressCallback:^(float progressFloat){
            NSLog(@"当前进度： %f", progressFloat);
            dispatch_async(dispatch_get_main_queue(), ^{
                if (progressFloat == 1) {
                    [NSThread sleepForTimeInterval:1];
                    UIImageView* iv = [[UIImageView alloc]initWithFrame:CGRectMake(70, 150, 150, 150)];
                    iv.image = self.image;
                    [self.view addSubview:iv];
                }
            });
        }];
    });
    
//    异步上传
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [self.ossData uploadWithUploadCallback:^(BOOL isSuccess, NSError *error) {
//            if (isSuccess) {
//                NSLog(@"succeed");
//            } else {
//                NSLog(@"errorInfo_testDataUploadWithProgress:%@", [error userInfo]);
//            }
//        } withProgressCallback:^(float progress) {
//            NSLog(@"current get %f", progress);
//        }];
//    });
}

-(void)addRegisterButton {
    UIButton* registerBtn = [[UIButton alloc]initWithFrame:CGRectMake(60, 240, self.view.frame.size.width - 60*2, 40)];
    [self.view addSubview:registerBtn];
    registerBtn.backgroundColor = [UIColor colorWithRed:0.9 green:0 blue:0 alpha:1.0];
    [registerBtn setTitle:@"注    册" forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(clickedRegisterButton) forControlEvents:UIControlEventTouchUpInside];
}

//点击“注册”按钮
-(void)clickedRegisterButton {
//    if (self.phoneNumberTF.text.length == 11) { //判断填写的是不是手机号
//        if (self.passWordTF.text.length > 0) {  //判断密码是否填写
            NSString* argumentStr = [NSString stringWithFormat:@"phone=%@&password=%@&nickName=%@&simpleWord=%@",@"13802720093",@"123456",@"Chiang",@"ABCD"];
            NSString* hbStr = HBURL;
            NSMutableString* mutableStr = [NSMutableString stringWithString:hbStr];
            NSString* urlMethod = @"/rest/user/register.do";
            [mutableStr appendString:urlMethod];
            postRequestYiBu(argumentStr, mutableStr)
//        }
//    }
    
    
}

postRequestAgency(self.datas)

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    NSLog(@"self.datas:%@", self.datas);
    
    
    NSString* result_String = [[NSString alloc]initWithData:self.datas encoding:NSUTF8StringEncoding];
    NSLog(@"result_String:%@", result_String);
    
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:self.datas options:0 error:nil];
    NSLog(@"jsonDic=%@", jsonDic);
    
    self.passWordTF.text = [NSString stringWithFormat:@"%@",[jsonDic objectForKey:@"msg"]];
    self.phoneNumberTF.text = [NSString stringWithFormat:@"%@",[jsonDic objectForKey:@"status"]];
    
    /*
    NSError*error=nil;
    GDataXMLDocument *document=[[GDataXMLDocument alloc] initWithData:self.datas options:0 error:&error];
    GDataXMLElement *e=[document rootElement];
    NSString*result=[e stringValue];
    NSData* xmlData = [result dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary*dic;
    if (result.length>10) {
        dic=[[[NSString alloc]initWithData:xmlData encoding:NSUTF8StringEncoding]JSONValue];
    }
    NSLog(@"dic=%@", dic);
    */
}

//阿里云OSS
//accessKey = "Z8O2jTCCf3obWgfZ";
//screctKey = "tTRdEbr4622LakuHYJA4kmkK6vYAib";
//全局默认数据中心域名:oss-cn-hangzhou.aliyuncs.com
//现在有两个BUCKET:
//上传头像的bucket:  heartbeat-avatar
//上传物品的bucket:  heartbeat-goods
//上传文件命名规范:
//fileName = "HeartBeat_"+timeStamp+"_"+imageCount+"_"+userId+"."+type;


@end
