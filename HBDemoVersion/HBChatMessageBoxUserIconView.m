//
//  HBChatMessageBoxUserIconView.m
//  HBChat
//
//  Created by HBei on 14-10-28.
//  Copyright (c) 2014年 HBei. All rights reserved.
//

#import "HBChatMessageBoxUserIconView.h"
#import "HBChatMessageBoxContactImageView.h"

@interface HBChatMessageBoxUserIconView()
@property(nonatomic,strong)HBChatMessageBoxContactImageView * userImageView;
@property(nonatomic,strong)UIView * unReadMessageCountView;
@property(nonatomic,strong)UILabel * unReadMessageCountLabel;
@end

@implementation HBChatMessageBoxUserIconView

#define Label_Text_Size 12.0

-(UILabel *)unReadMessageCountLabel{
    if (!_unReadMessageCountLabel) {
        _unReadMessageCountLabel = [[UILabel alloc]init];
        [_unReadMessageCountLabel setText:[NSString stringWithFormat:@"%ld",self.unReadMessageCount]];
        [_unReadMessageCountLabel setTextAlignment:NSTextAlignmentCenter];
        [_unReadMessageCountLabel setFont:[UIFont boldSystemFontOfSize:Label_Text_Size]];
        [_unReadMessageCountLabel setTextColor:[UIColor whiteColor]];
    }
    return _unReadMessageCountLabel;
}

-(HBChatMessageBoxContactImageView *)userImageView{
    if (!_userImageView) {
        _userImageView = [[HBChatMessageBoxContactImageView alloc]init];
    }
    return _userImageView;
}

-(UIView *)unReadMessageCountView{
    if (!_unReadMessageCountView) {
        _unReadMessageCountView = [[UIView alloc]init];
        [_unReadMessageCountView setHidden:YES];
        [_unReadMessageCountView setBackgroundColor:[UIColor redColor]];
        [_unReadMessageCountView.layer setCornerRadius:8.0];
        [_unReadMessageCountView.layer setBorderWidth:1.5];
        [_unReadMessageCountView.layer setBorderColor:[UIColor whiteColor].CGColor];
        [_unReadMessageCountView addSubview:self.unReadMessageCountLabel];
    }
    return _unReadMessageCountView;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.userImageView];
        [self addSubview:self.unReadMessageCountView];
        [self addObserver:self forKeyPath:@"unReadMessageCount" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    }
    return self;
}

-(void)setImage:(UIImage *)image{
    _image = image;
    [self.userImageView setImage:image];
}

-(void)setUnReadMessageCount:(NSInteger)unReadMessageCount{
    _unReadMessageCount = unReadMessageCount;
    [self.unReadMessageCountLabel setText:[NSString stringWithFormat:@"%ld",(long)self.unReadMessageCount]];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self.userImageView setFrame:self.bounds];
    
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:14]};
    CGSize titleLabelSize = [self.unReadMessageCountLabel.text boundingRectWithSize:CGSizeMake(self.bounds.size.width , 16) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    [self.unReadMessageCountLabel setFrame:CGRectMake(0, 0, (titleLabelSize.width + 3) < 16 ? 16 : (titleLabelSize.width + 3), 16)];
    
    [self.unReadMessageCountView setFrame:CGRectMake(self.bounds.size.width - self.unReadMessageCountLabel.bounds.size.width / 2.0, - 8, self.unReadMessageCountLabel.bounds.size.width, 16)];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:@"unReadMessageCount"]) {
        if (self.unReadMessageCount == 0) {
            [self.unReadMessageCountView setHidden:YES];
        }else{
            [self.unReadMessageCountView setHidden:NO];
        }
    }
}

-(void)dealloc{
    [self removeObserver:self forKeyPath:@"unReadMessageCount" context:nil];
}


@end












