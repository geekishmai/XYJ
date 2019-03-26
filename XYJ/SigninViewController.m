//
//  SigninViewController.m
//  XYJ
//
//  Created by user on 2019/3/25.
//  Copyright © 2019 user. All rights reserved.
//

#import "SigninViewController.h"
#import <AFNetworking.h>
@interface SigninViewController ()
@property (weak, nonatomic) IBOutlet UIButton *againBtn;

@end

@implementation SigninViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}
- (IBAction)sendCode:(id)sender {
    [self messageTime];
}



//倒计时方法
- (void)messageTime {
    
    __block int timeout=60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
    //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示
                [self.againBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
                [_againBtn setTitleColor:[UIColor blackColor] forState:0];
                self.againBtn.userInteractionEnabled = YES;
            });
        }else{
            int seconds = timeout % 61;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                [self.againBtn setTitle:[NSString stringWithFormat:@"(%@s)",strTime] forState:UIControlStateNormal];
                [_againBtn setTitleColor:[UIColor blueColor] forState:0];
                //To do
                [UIView commitAnimations];
                self.againBtn.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}
-(void)getVertifyCode{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //请求头
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    NSString *url = @"http://uapi.5aixi.com/v1/user/get_vcode";
    NSMutableDictionary *parametersDic = [[NSMutableDictionary alloc] init];
    [parametersDic setObject:@"mobile" forKey:@"15626142123"];
   
    [manager POST:url parameters:parametersDic progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    }
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NSLog(@"请求成功：%@",responseObject);
              
              
          } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              NSLog(@"请求失败：%@",error);
          }];
}
@end
