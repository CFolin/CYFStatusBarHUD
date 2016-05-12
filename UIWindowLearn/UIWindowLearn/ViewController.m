//
//  ViewController.m
//  UIWindowLearn
//
//  Created by fu.colin on 16/5/11.
//  Copyright © 2016年 fu.colin. All rights reserved.
//

#import "ViewController.h"
#import "CYFStatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    
}
- (IBAction)success:(id)sender {
    
    [CYFStatusBarHUD showSuccess:@"chenggong"];
}
- (IBAction)fail:(id)sender {
    
    [CYFStatusBarHUD showError:@"weichenggong"];
}
- (IBAction)load:(id)sender {
    
    [CYFStatusBarHUD showLoading:@"loading"];
}
- (IBAction)hide:(id)sender {
    
    [CYFStatusBarHUD hide];
}
- (IBAction)normal:(id)sender {
    
    [CYFStatusBarHUD showMessage:@"haha" image:[UIImage imageNamed:@"error"]];
}
@end
