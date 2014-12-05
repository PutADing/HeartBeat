//
//  HBChatMessageBoxContactImageView.m
//  HBChat
//
//  Created by HBei on 14-10-28.
//  Copyright (c) 2014年 HBei. All rights reserved.
//

#import "HBChatMessageBoxContactImageView.h"

@interface HBChatMessageBoxContactImageView()

@end

@implementation HBChatMessageBoxContactImageView



-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        
    }
    return self;
}

-(instancetype)initWithImage:(UIImage *)image{
    self = [super initWithImage:image];
    if (self) {
        
    }
    return self;
}

-(instancetype)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage{
    self = [super initWithImage:image highlightedImage:highlightedImage];
    if (self) {
        [self setupUI];
        
    }
    return self;
}

-(void)setupUI{
    [self.layer setCornerRadius:4.0];
    [self.layer setMasksToBounds:YES];
    
}




@end
