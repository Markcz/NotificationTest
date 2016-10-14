//
//  ViewController.m
//  NotificationTest
//
//  Created by 刘娇娇 on 16/10/11.
//  Copyright © 2016年 WTC. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userID;
@property (nonatomic,retain) User* user1;
@property (weak, nonatomic) IBOutlet UITextField *userAge;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //测试通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(registerComplete:) name:@"RegisterComplete" object:nil];
    
    //测试KVO 目的：观察User类的userAge属性
    //并将当前对象作为观察者(必须实现 NSKeyValueObserving协议
    _user1 = [User new];
    [self addObserver:self forKeyPath:@"user1.userAge" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld   context:nil];
    
    self.user1.userAge = @"32";
    _userAge.text = self.user1.userAge;
    
}
- (IBAction)changeAge:(id)sender {
    self.user1.userAge = @"50";
    
}

//实现 NSKeyValueObserving协议
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"user1.userAge"]) {
        //改变文本框中的值
        _userAge.text = (NSString*)change[NSKeyValueChangeNewKey];
    }
}

-(void)registerComplete:(NSNotification*) info{
   NSString* userID = [info.userInfo objectForKey:@"userID"];
    self.userID.text  = userID;
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"RegisterComplete" object:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
        [self.userID resignFirstResponder];
        return YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
