//
//  SNYGRefreshHeader.m
//  YSHNavigation
//
//  Created by 赵 on 2018/3/5.
//  Copyright © 2018年 袁书辉. All rights reserved.
//




#import "SNYGRefreshHeader.h"

@interface SNYGRefreshHeader()
{
    CGFloat angle;
}

@end

@implementation SNYGRefreshHeader

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



#pragma mark - 覆盖父类的方法
- (void)prepare
{
    [super prepare];
    

    

    
    //    背景图片 750*1334
    UIImageView * imageView = [UIImageView new];
    CGFloat h = SCREEN_WIDTH*1334/750.f;
    imageView.bounds = CGRectMake(0, 0,SCREEN_WIDTH, h);
    imageView.mj_x =0 ;
    imageView.mj_y = -h+PULLHEIGHT;
    imageView.image = [UIImage imageNamed:@"refreshHeadBack"];
    
    [self addSubview:imageView];
    
    
    UIView * bgView = [UIView new];
    bgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, PULLHEIGHT);
    bgView.backgroundColor = [UIColor clearColor];
    [self addSubview:bgView];
    bgView.clipsToBounds = YES;
// 180 47 树
    
    UIImageView * leftImgView = [UIImageView new];
    leftImgView.image = [UIImage imageNamed:@"refreshLeftTree"];
    leftImgView.bounds = CGRectMake(0, 0,180/2, 47/2);
    leftImgView.mj_x =0 ;
    leftImgView.mj_y = PULLHEIGHT-47/2;
    
//    freshRightTree 100 21
    UIImageView * RTreeImgView = [UIImageView new];
    RTreeImgView.image = [UIImage imageNamed:@"freshRightTree"];
    RTreeImgView.bounds = CGRectMake(0, 0,100/2, 21/2);
    RTreeImgView.mj_x =SCREEN_WIDTH-100/2;
    RTreeImgView.mj_y = PULLHEIGHT-21/2;
//    地球 750 × 659
    
   
    self.earthImageView.image = [UIImage imageNamed:@"h_refresh_startCar"];
    self.earthImageView.bounds = CGRectMake(0, 0,750/2, 659/2);
    self.earthImageView.center =CGPointMake(SCREEN_WIDTH/2, self.mj_h/2) ;
    self.earthImageView.mj_y = PULLHEIGHT;
    [bgView addSubview:self.earthImageView];
    
    
    
    [self addSubview:leftImgView];
    [self addSubview:RTreeImgView];
    
    NSString * imgStrP = @"SNSHRefrshHead";
    
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    
    
    
    
    for (NSInteger i=1; i<=10; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%@%02ld",imgStrP, i];
        NSLog(@"===%@",imageName);
        UIImage *image = [UIImage imageNamed:imageName];
        [idleImages addObject:image];
    }
    
   
    
    [self setImages:idleImages duration:0.5 forState:MJRefreshStateRefreshing];
//    [self setImages:@[idleImages[0]] forState:MJRefreshStateIdle];
//    self.gifView.image = [UIImage imageNamed:@"SNSHRefrshHead01"];
    
    
    // 隐藏时间
    self.lastUpdatedTimeLabel.hidden = YES;
    
    // 隐藏状态
    self.stateLabel.hidden = YES;
    
    NSLog(@"----%f",self.pullingPercent);
    
    self.mj_h = PULLHEIGHT;
    
    
    
    self.gifImm.image = [UIImage imageNamed:@"SNSHRefrshHead01"];
    self.gifImm.center = CGPointMake(SCREEN_WIDTH/2, PULLHEIGHT/2);
    self.gifImm.bounds = CGRectMake(0, 0, 100, 100);

    [self addSubview:self.gifImm];
    
    
    
    
    
    
}

-(UIImageView *)earthImageView
{
    if (!_earthImageView) {
        _earthImageView = [UIImageView new];
    }
    
    return _earthImageView;
}

-(UIImageView *)gifImm
{
    if (!_gifImm) {
        _gifImm = [UIImageView new];
    }
    
    return _gifImm;
}

- (void)setPullingPercent:(CGFloat)pullingPercent
{
//    [super setPullingPercent:pullingPercent];
    NSLog(@"pullingPercent===%lf",pullingPercent);
    self.gifImm.mj_h = MIN(125*pullingPercent/2, 125/2);
    self.gifImm.mj_w = MIN(120*pullingPercent/2, 120/2);
   
    self.gifImm.center = CGPointMake(self.mj_w/2, self.mj_h/2);
    self.gifImm.mj_y = self.mj_h-(PULLHEIGHT-125/2)/2-self.gifImm.mj_h;
    
    if (1-pullingPercent>0) {
        self.earthImageView.mj_y =  MAX((1-pullingPercent)*PULLHEIGHT, 0);
        
    }else{
        self.earthImageView.mj_y = 0 ;
        
    }
    
    
    
   
    
}

-(void)setState:(MJRefreshState)state
{
    
    if (state == MJRefreshStateRefreshing) {
        [self.earthImageView rotate360DegreeWithImageView];
    }else{
        [self.earthImageView stopRotate];
    }
    [super setState:state];
    
    
    
}

- (void)placeSubviews
{
    [super placeSubviews];
    
    if (self.gifView.constraints.count) return;
    
    self.gifView.frame = self.bounds;
    if (self.stateLabel.hidden && self.lastUpdatedTimeLabel.hidden) {
        self.gifView.contentMode = UIViewContentModeCenter;
    } else {
        self.gifView.contentMode = UIViewContentModeRight;
        
        CGFloat stateWidth = self.stateLabel.mj_textWith;
        CGFloat timeWidth = 0.0;
        if (!self.lastUpdatedTimeLabel.hidden) {
            timeWidth = self.lastUpdatedTimeLabel.mj_textWith;
        }
        CGFloat textWidth = MAX(stateWidth, timeWidth);
        self.gifView.mj_w = self.mj_w * 0.5 - textWidth * 0.5 - self.labelLeftInset;
    }
}




@end
