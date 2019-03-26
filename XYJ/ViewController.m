//
//  ViewController.m
//  XYJ
//
//  Created by user on 2019/3/25.
//  Copyright © 2019 user. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputUsername;
@property (weak, nonatomic) IBOutlet UITextField *inputPassword;
@end

@implementation ViewController
//重写UIResponder中的touchesBegan:withEvent方法   如果点击到UITextField以外的View则收回键盘
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    if (![touch.view isKindOfClass:[UITextField class]]) {
        [self.view endEditing:YES];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)loginBtn:(id)sender {
    NSString *userName=self.inputUsername.text;
    NSString *userPassword=self.inputPassword.text;


}



@end
