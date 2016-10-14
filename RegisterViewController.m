//
//  RegisterViewController.m
//  NotificationTest
//
//  Created by 刘娇娇 on 16/10/11.
//  Copyright © 2016年 WTC. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)saveInfo:(id)sender {
    NSDictionary*dicInfo = [NSDictionary dictionaryWithObject:self.userID.text forKey:@"userID"];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"RegisterComplete" object:nil userInfo:dicInfo];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self.userID resignFirstResponder];
    return YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
