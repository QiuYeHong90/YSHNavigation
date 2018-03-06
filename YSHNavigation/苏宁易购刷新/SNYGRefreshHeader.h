//
//  SNYGRefreshHeader.h
//  YSHNavigation
//
//  Created by 赵 on 2018/3/5.
//  Copyright © 2018年 袁书辉. All rights reserved.
//

#import "UIView+Animation.h"
#import <MJRefresh/MJRefreshGifHeader.h>
//获取屏幕宽度，高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define PULLHEIGHT 100
@interface SNYGRefreshHeader : MJRefreshGifHeader


@property (nonatomic,strong) UIImageView * gifImm;

@property (nonatomic,strong) UIImageView * earthImageView;
@end
