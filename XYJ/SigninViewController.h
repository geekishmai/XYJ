//
//  SigninViewController.h
//  XYJ
//
//  Created by user on 2019/3/25.
//  Copyright © 2019 user. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SigninViewController : UIViewController
-(BOOL) checkUsername:(NSString *)nickname;
- (BOOL) checkPassword:(NSString *)passWord;
-(BOOL)checkTelPhone:(NSString *)telPhone;
@end


