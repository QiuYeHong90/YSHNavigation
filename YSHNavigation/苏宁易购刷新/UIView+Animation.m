//
//  UIView+Animation.m
//  YSHNavigation
//
//  Created by 赵 on 2018/3/5.
//  Copyright © 2018年 袁书辉. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)
-(void)rotate360DegreeWithImageView {
    CABasicAnimation * rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"]; //让其在z轴旋转
    rotationAnimation.toValue = [NSNumber numberWithFloat: -M_PI*2.0 ];//旋转角度
    rotationAnimation.duration = 5; //旋转周期
    rotationAnimation.cumulative = YES;//旋转累加角度
    rotationAnimation.repeatCount = 10000;//旋转次数
    
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
   
    
}

-(void)stopRotate {
    
    [self.layer removeAllAnimations];
    
}
@end
