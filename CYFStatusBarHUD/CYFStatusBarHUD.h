//
//  CYFStatusBarHUD.h
//  UIWindowLearn
//
//  Created by fu.colin on 16/5/11.
//  Copyright © 2016年 fu.colin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CYFStatusBarHUD : NSObject

+(void)showMessage:(NSString *)msg image:(UIImage *)image;
+(void)showSuccess:(NSString *)msg;
+(void)showError:(NSString *)msg;
+(void)showLoading:(NSString *)msg;
+(void)hide;


@end
