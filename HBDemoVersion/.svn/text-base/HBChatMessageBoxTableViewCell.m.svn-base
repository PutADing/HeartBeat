//
//  HBChatMessageBoxTableViewCell.m
//  HBChat
//
//  Created by HBei on 14-10-28.
//  Copyright (c) 2014年 HBei. All rights reserved.
//

#import "HBChatMessageBoxTableViewCell.h"
#import "HBChatMessageBoxUserIconView.h"

@interface HBChatMessageBoxTableViewCell()<UIGestureRecognizerDelegate>
@property(nonatomic,strong)HBChatMessageBoxUserIconView * userIconView;
@property(nonatomic,strong)UILabel * nickNameLabel;
@property(nonatomic,strong)UILabel * messageLabel;
@property(nonatomic,strong)UILabel * timeLabel;
@property(nonatomic,strong)UIView * moveContentView;
@property(nonatomic,strong)UIView * editView;
@property(nonatomic,readwrite)BOOL isEditing;


@end

#define EDIT_VIEW_WIDTH 140
#define EDIT_BUTTON_TITLE_HEIGHT 14.0
#define BOUNCE_VALUE 30.0
#define SHOW_EDIT_VIEW_FRAME CGRectMake(- EDIT_VIEW_WIDTH , 0 , self.bounds.size.width , self.bounds.size.height - .5)
#define HIDE_EDIT_VIEW_FRAME CGRectMake(0 , 0 , self.bounds.size.width , self.bounds.size.height - .5)


@implementation HBChatMessageBoxTableViewCell
{
    CALayer * lineLayer;
    
    UIButton * joinBlackButton;
    UILabel * joinBlackButtonTitleLabel1;
    UILabel * joinBlackButtonTitleLabel2;
    
    UIButton * deleteButton;
    
    CGFloat startPanX;
    
    
    
    
}

-(HBChatMessageBoxUserIconView *)userIconView{
    if (!_userIconView) {
        _userIconView = [[HBChatMessageBoxUserIconView alloc]init];
    }
    return _userIconView;
}

-(UIView *)moveContentView{
    if (!_moveContentView) {
        _moveContentView = [[UIView alloc]init];
        [_moveContentView setBackgroundColor:[UIColor whiteColor]];
        [_moveContentView addSubview:self.userIconView];
        [_moveContentView addSubview:self.nickNameLabel];
        [_moveContentView addSubview:self.messageLabel];
        [_moveContentView addSubview:self.timeLabel];
        
        UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveContentViewPan:)];
        pan.delegate = self;
        [_moveContentView addGestureRecognizer:pan];
    }
    return _moveContentView;
}

-(UIView *)editView{
    if (!_editView) {
        _editView = [[UIView alloc]init];
        
        joinBlackButton = [UIButton buttonWithType:UIButtonTypeCustom];
        joinBlackButtonTitleLabel1 = [[UILabel alloc]init];
        [joinBlackButtonTitleLabel1 setText:@"加入"];
        [joinBlackButtonTitleLabel1 setFont:[UIFont boldSystemFontOfSize:13.0]];
        [joinBlackButtonTitleLabel1 setTextAlignment:NSTextAlignmentCenter];
        [joinBlackButtonTitleLabel1 setTextColor:[UIColor colorWithWhite:.4 alpha:1.0]];
        [joinBlackButton addSubview:joinBlackButtonTitleLabel1];
        joinBlackButtonTitleLabel2 = [[UILabel alloc]init];
        [joinBlackButtonTitleLabel2 setText:@"黑名单"];
        [joinBlackButtonTitleLabel2 setFont:[UIFont boldSystemFontOfSize:13.0]];
        [joinBlackButtonTitleLabel2 setTextAlignment:NSTextAlignmentCenter];
        [joinBlackButtonTitleLabel2 setTextColor:[UIColor colorWithWhite:.4 alpha:1.0]];
        [joinBlackButton addSubview:joinBlackButtonTitleLabel2];
        
        [joinBlackButton setBackgroundColor:[UIColor colorWithWhite:.9 alpha:1.0]];
        [joinBlackButton addTarget:self action:@selector(joinBlackButtonTouchUpInSide:) forControlEvents:UIControlEventTouchUpInside];
        [_editView addSubview:joinBlackButton];
        
        
        deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [deleteButton setTitle:@"删除" forState:UIControlStateNormal];
        [deleteButton.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0]];
        [deleteButton setBackgroundColor:[UIColor redColor]];
        [deleteButton addTarget:self action:@selector(deleteButtonTouchUpInSide:) forControlEvents:UIControlEventTouchUpInside];
        [_editView addSubview:deleteButton];
        
        
    }
    return _editView;
}




-(UILabel *)nickNameLabel{
    if (!_nickNameLabel) {
        _nickNameLabel = [[UILabel alloc]init];
        [_nickNameLabel setTextColor:[UIColor colorWithWhite:.2 alpha:1.0]];
        [_nickNameLabel setFont:[UIFont systemFontOfSize:14.0]];
    }
    return _nickNameLabel;
}

-(UILabel *)messageLabel{
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc]init];
        [_messageLabel setTextColor:[UIColor colorWithWhite:.4 alpha:1.0]];
        [_messageLabel setFont:[UIFont systemFontOfSize:13.0]];
    }
    return _messageLabel;
}

-(UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        [_timeLabel setTextColor:[UIColor colorWithWhite:.4 alpha:1.0]];
        [_timeLabel setFont:[UIFont systemFontOfSize:13.0]];
    }
    return _timeLabel;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        
        lineLayer = [CALayer layer];
        [lineLayer setBorderWidth:.5];
        [lineLayer setBorderColor:[UIColor colorWithWhite:.93 alpha:1.0].CGColor];
        [self.layer addSublayer:lineLayer];
        
        [self.contentView insertSubview:self.editView atIndex:0];
        [self addSubview:self.moveContentView];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        
    }
    return self;
}

-(void)setModel:(HBChatMessageBoxContactModel *)model{
    _model = model;
    [self.userIconView setImage:model.image];
    [self.userIconView setUnReadMessageCount:model.unReadMessageCount];
    [self.nickNameLabel setText:model.userNickName];
    [self.messageLabel setText:model.timeModel.message];
    [self.timeLabel setText:model.timeModel.time];
}


-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat height = self.bounds.size.height;
    CGFloat width = self.bounds.size.width;
    
    [lineLayer setFrame:CGRectMake(0, height - .5, width, .5)];
    
    [self.moveContentView setFrame:CGRectMake(0 , 0, width,height - .5)];
    
    CGRect frameUserImageView = CGRectMake(10, 10, height - 20, height - 20);
    [self.userIconView setFrame:frameUserImageView];
    
    CGRect frameNickNameLabel = CGRectMake(DistanceFromLeftGuiden(self.userIconView) + 10, self.userIconView.frame.origin.y , width - DistanceFromLeftGuiden(self.userIconView) - 70 , 20);
    [self.nickNameLabel setFrame:frameNickNameLabel];
    
    CGRect frameMessageLabel = CGRectMake(frameNickNameLabel.origin.x, DistanceFromTopGuiden(self.nickNameLabel), width - frameNickNameLabel.origin.x - 30, 20);
    [self.messageLabel setFrame:frameMessageLabel];
    
    CGRect frameTimeLabel = CGRectMake(width - 50, frameNickNameLabel.origin.y, 40, 20);
    [self.timeLabel setFrame:frameTimeLabel];
    
    [self.editView setFrame:CGRectMake(width - EDIT_VIEW_WIDTH, 0, EDIT_VIEW_WIDTH, height - .5)];
    [joinBlackButton setFrame:CGRectMake(0, 0, EDIT_VIEW_WIDTH / 2.0, height - .5)];
    
    [joinBlackButtonTitleLabel1 setFrame:CGRectMake(0, CGRectGetMidY(joinBlackButton.bounds) - EDIT_BUTTON_TITLE_HEIGHT , EDIT_VIEW_WIDTH / 2.0, EDIT_BUTTON_TITLE_HEIGHT)];
    [joinBlackButtonTitleLabel2 setFrame:CGRectMake(0, CGRectGetMidY(joinBlackButton.bounds) , EDIT_VIEW_WIDTH / 2.0, EDIT_BUTTON_TITLE_HEIGHT)];
    
    [deleteButton setFrame:CGRectMake(DistanceFromLeftGuiden(joinBlackButton), 0, joinBlackButton.bounds.size.width, joinBlackButton.bounds.size.height)];
    
    
}

-(void)moveContentViewPan:(UIPanGestureRecognizer *)pan{
    if (pan.state == UIGestureRecognizerStateBegan) {//手势开始
        startPanX = [pan locationInView:self.moveContentView].x;
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(messageBoxTableViewCellWillPanMoveContentView:)]) {
            [self.delegate messageBoxTableViewCellWillPanMoveContentView:self];
        }
        
        
    }else if (pan.state == UIGestureRecognizerStateChanged){
        
        CGRect startFrame = self.moveContentView.frame;
        startFrame.origin.x = startFrame.origin.x + ([pan locationInView:self.moveContentView].x - startPanX) < - EDIT_VIEW_WIDTH ? - EDIT_VIEW_WIDTH : (startFrame.origin.x + ([pan locationInView:self.moveContentView].x - startPanX) > 0 ? 0 : startFrame.origin.x + ([pan locationInView:self.moveContentView].x - startPanX));
        [self.moveContentView setFrame:startFrame];
        
        CGFloat editAlpha =  self.moveContentView.frame.origin.x / (- EDIT_VIEW_WIDTH);
        [self.editView setAlpha:editAlpha];
        
        
    }else if (pan.state == UIGestureRecognizerStateEnded || pan.state == UIGestureRecognizerStateCancelled){
        CGFloat endFrameX = self.moveContentView.frame.origin.x;
        if (endFrameX > - EDIT_VIEW_WIDTH / 2.0) {
            [self showEditView:NO];
        }else{
            [self showEditView:YES];
        }
    }
}

-(void)showEditView:(BOOL)isShow{
    
    [UIView animateWithDuration:.3 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationCurveEaseInOut animations:^{
        [self.moveContentView setFrame:isShow ? SHOW_EDIT_VIEW_FRAME : HIDE_EDIT_VIEW_FRAME];
        [self.editView setAlpha:isShow ? 1.0 : 0.0];
    } completion:^(BOOL finished) {
        self.isEditing = isShow;
        [self editEnabled:isShow];
    }];
    
}


-(void)joinBlackButtonTouchUpInSide:(UIButton *)button{
    if(self.delegate && [self.delegate respondsToSelector:@selector(messageBoxTableViewCell:DidJoinBlackButtonAtIndexPath:)]){
        [self.delegate messageBoxTableViewCell:self DidJoinBlackButtonAtIndexPath:self.indexPath];
    }
}

-(void)deleteButtonTouchUpInSide:(UIButton *)button{
    if(self.delegate && [self.delegate respondsToSelector:@selector(messageBoxTableViewCell:DidDeleteButtonAtIndexPath:)]){
        [self.delegate messageBoxTableViewCell:self DidDeleteButtonAtIndexPath:self.indexPath];
    }
}


-(void)editEnabled:(BOOL)enabled{
    [joinBlackButton setEnabled:enabled];
    [deleteButton setEnabled:enabled];
}






@end
















