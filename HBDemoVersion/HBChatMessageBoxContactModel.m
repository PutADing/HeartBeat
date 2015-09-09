//
//  HBChatMessageBoxContactModel.m
//  HBChat
//
//  Created by HBei on 14-10-28.
//  Copyright (c) 2014年 HBei. All rights reserved.
//

#import "HBChatMessageBoxContactModel.h"

@implementation HBChatMessageBoxContactTimeModel

-(instancetype)initWithTiem:(NSString *)time Message:(NSString *)message{
    self = [super init];
    if (self) {
        self.time = time;
        self.message = message;
    }
    return self;
}

+(instancetype)messageBoxContactTimeModelWithTiem:(NSString *)time Message:(NSString *)message{
    return [[HBChatMessageBoxContactTimeModel alloc] initWithTiem:time Message:message];
}

@end

@implementation HBChatMessageBoxContactModel

-(instancetype)initWithUserId:(NSString *)userId UserNickName:(NSString *)userNickName Image:(UIImage *)image TimeModel:(HBChatMessageBoxContactTimeModel *)timeModel UnReadMessageCount:(NSInteger)unReadMessageCount{
    self = [super init];
    if (self) {
        self.userId = userId;
        self.userNickName = userNickName;
        self.image = image;
        self.timeModel = timeModel;
        self.unReadMessageCount = unReadMessageCount;
    }
    return self;
}

+(instancetype)messageBoxContactModelWithUserId:(NSString *)userId UserNickName:(NSString *)userNickName Image:(UIImage *)image TimeModel:(HBChatMessageBoxContactTimeModel *)timeModel UnReadMessageCount:(NSInteger)unReadMessageCount{
    return [[HBChatMessageBoxContactModel alloc]initWithUserId:userId UserNickName:userNickName Image:image TimeModel:timeModel UnReadMessageCount:unReadMessageCount];
}

+(NSArray *)testData{
    
    UIImage * image1 = [UIImage imageNamed:@"AKL.jpg"];
    UIImage * image2 = [UIImage imageNamed:@"MZ.jpg"];
    UIImage * image3 = [UIImage imageNamed:@"XZ.jpg"];
    
    HBChatMessageBoxContactTimeModel * timeModel1 = [HBChatMessageBoxContactTimeModel messageBoxContactTimeModelWithTiem:@"14:00" Message:@"菜鸟真多……匹配系统找得到真正的平衡么？"];
    HBChatMessageBoxContactTimeModel * timeModel2 = [HBChatMessageBoxContactTimeModel messageBoxContactTimeModelWithTiem:@"15:32" Message:@"我的大刀早已饥渴难耐了。。。"];
    HBChatMessageBoxContactTimeModel * timeModel3 = [HBChatMessageBoxContactTimeModel messageBoxContactTimeModelWithTiem:@"10:09" Message:@"如果暴力不是为了杀戮，那就毫无意义了"];
    
    HBChatMessageBoxContactModel * model1 = [HBChatMessageBoxContactModel messageBoxContactModelWithUserId:@"" UserNickName:@"阿卡利" Image:image1 TimeModel:timeModel1 UnReadMessageCount:2];
    HBChatMessageBoxContactModel * model2 = [HBChatMessageBoxContactModel messageBoxContactModelWithUserId:@"" UserNickName:@"泰达米尔" Image:image2 TimeModel:timeModel2 UnReadMessageCount:0];
    HBChatMessageBoxContactModel * model3 = [HBChatMessageBoxContactModel messageBoxContactModelWithUserId:@"" UserNickName:@"李青" Image:image3 TimeModel:timeModel3 UnReadMessageCount:123];
    
    return @[model1,model2,model3];
    
}

@end
