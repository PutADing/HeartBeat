//
//  HBChatMessageBoxContactModel.h
//  HBChat
//
//  Created by heartbeat on 14-10-28.
//  Copyright (c) 2014年 heartbeat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBChatMessageBoxContactTimeModel : NSObject
@property(nonatomic,strong)NSString * time;
@property(nonatomic,strong)NSString * message;
-(instancetype)initWithTiem:(NSString *)time Message:(NSString *)message;
+(instancetype)messageBoxContactTimeModelWithTiem:(NSString *)time Message:(NSString *)message;
@end


@interface HBChatMessageBoxContactModel : NSObject
@property(nonatomic,strong)NSString * userId;
@property(nonatomic,strong)NSString * userNickName;
@property(nonatomic,strong)UIImage * image;
@property(nonatomic,strong)HBChatMessageBoxContactTimeModel * timeModel;
@property(nonatomic)NSInteger unReadMessageCount;


-(instancetype)initWithUserId:(NSString *)userId UserNickName:(NSString *)userNickName Image:(UIImage *)image TimeModel:(HBChatMessageBoxContactTimeModel *)timeModel UnReadMessageCount:(NSInteger)unReadMessageCount;
+(instancetype)messageBoxContactModelWithUserId:(NSString *)userId UserNickName:(NSString *)userNickName Image:(UIImage *)image TimeModel:(HBChatMessageBoxContactTimeModel *)timeModel UnReadMessageCount:(NSInteger)unReadMessageCount;

+(NSArray *)testData;

@end
