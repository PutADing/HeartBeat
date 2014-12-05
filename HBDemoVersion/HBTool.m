//
//  HBTool.m
//  HBDemoVersion
//
//  Created by okwei on 14-11-4.
//  Copyright (c) 2014年 heartbeat. All rights reserved.
//

#import "HBTool.h"

@implementation HBTool

static HBTool * tool;

+(instancetype)shareTool{
    if (!tool) {
        tool = [[HBTool alloc] init];
    }
    return tool;
}

+(BOOL)isIOS7_Later{
    return [[UIDevice currentDevice].systemVersion floatValue] >= 7.0;
}


@end
