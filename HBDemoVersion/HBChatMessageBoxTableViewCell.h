//
//  HBChatMessageBoxTableViewCell.h
//  HBChat
//
//  Created by HBei on 14-10-28.
//  Copyright (c) 2014年 HBei. All rights reserved.
//

#import "HBChatBaseTableViewCell.h"
#import "HBChatMessageBoxContactModel.h"


@class HBChatMessageBoxTableViewCell;

@protocol HBChatMessageBoxTableViewCellDelegate <NSObject>
@optional
-(void)messageBoxTableViewCellWillPanMoveContentView:(HBChatMessageBoxTableViewCell *)cell;

-(void)messageBoxTableViewCell:(HBChatMessageBoxTableViewCell *)cell DidDeleteButtonAtIndexPath:(NSIndexPath *)indexPath;
-(void)messageBoxTableViewCell:(HBChatMessageBoxTableViewCell *)cell DidJoinBlackButtonAtIndexPath:(NSIndexPath *)indexPath;


@end

@interface HBChatMessageBoxTableViewCell : HBChatBaseTableViewCell
@property(nonatomic,strong)HBChatMessageBoxContactModel * model;
@property(nonatomic,weak)id<HBChatMessageBoxTableViewCellDelegate> delegate;
-(void)showEditView:(BOOL)isShow;
@property(nonatomic,strong)NSIndexPath * indexPath;
@property(nonatomic,readonly)BOOL isEditing;
@end
