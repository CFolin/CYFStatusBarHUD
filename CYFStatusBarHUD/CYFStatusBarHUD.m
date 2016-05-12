//
//  CYFStatusBarHUD.m
//  UIWindowLearn
//
//  Created by fu.colin on 16/5/11.
//  Copyright © 2016年 fu.colin. All rights reserved.
//  版本号 1.0.23 分别是大版本号 功能版本号 bug修复版本号
// 增加新功能bug版本号清零 功能版本号加1,大版本号用于内部架构变化 适应系统变化等
// 图片要打包进bundle避免跟人家的图片冲突，多文件时要有主头文件

#import "CYFStatusBarHUD.h"
#define CYFMessageFont [UIFont systemFontOfSize:12]
// 消息显示时间
static CGFloat const CYFMessageDuration=2.0;
// 动画显示时间
static CGFloat const CYFAnimationDuration=0.25;
@implementation CYFStatusBarHUD

static UIWindow *window_;

static NSTimer *timer_;

// 初始化并显示窗口
+(void)showWindow{
    
    // frame数据
    
    CGFloat windowH = 20;
    
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, 20);
   // 显示窗口
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.frame = frame;
    window_.hidden = NO;
    window_.backgroundColor = [UIColor orangeColor];
    window_.windowLevel = UIWindowLevelAlert;
    // 执行动画
    frame.origin.y = 0;
    
    [UIView animateWithDuration:0.25 animations:^{
        window_.frame= frame;
    }];
    
    

}

+(void)showMessage:(NSString *)msg image:(UIImage *)image{
    
    // 定时消除
    [timer_ invalidate];
    
    timer_ = nil;
    
    [self showWindow];
    
    // 创建个按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
   
    
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = CYFMessageFont;
    if (image) {// 如果有图片才设置
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
    }
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    // 创建定时器
    
    timer_ =[NSTimer scheduledTimerWithTimeInterval:CYFMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
    

}

+(void)showSuccess:(NSString *)msg{
    
    [self showMessage:msg image:[UIImage imageNamed:@"CYFStatusBarHUD.bundle/success"]];
   
}
+(void)showError:(NSString *)msg{
    
    [self showMessage:msg image:[UIImage imageNamed:@"CYFStatusBarHUD.bundle/error"]];

}

+(void)showLoading:(NSString *)msg{
    // 停止残留的定时器
    
    [timer_ invalidate];
    
    timer_  = nil;
    
    [self showWindow];
    
    // 添加文字
    
    UILabel *label = [[UILabel alloc] init];
    
    label.font = CYFMessageFont;
    
    label.textAlignment = NSTextAlignmentCenter;
    
    label.frame = window_.bounds;
    
    label.text = msg;
    
    [window_ addSubview: label];
    
    // 添加菊花
    
    UIActivityIndicatorView *loadView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    // 文字宽度
    CGFloat msgWidth = [msg sizeWithAttributes:@{NSFontAttributeName:CYFMessageFont}].width;
    
    loadView.center = CGPointMake([UIScreen mainScreen].bounds.size.width*0.5 - msgWidth*0.5 - 20, 10);
    
    [loadView startAnimating];
    
    [window_ addSubview:loadView];
}

+(void)hide{
    
     [UIView animateWithDuration:CYFAnimationDuration animations:^{
         CGRect frame = window_.frame;
         frame.origin.y = -window_.frame.size.height;
         window_.frame = frame;
        
     } completion:^(BOOL finished) {
         window_ = nil;
         
         timer_ = nil;
     }];

  
}
@end
