//
//  User.h
//  NotificationTest
//
//  Created by 刘娇娇 on 16/10/13.
//  Copyright © 2016年 WTC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (nonatomic,copy) NSString* userName;
@property (nonatomic,assign) NSString* userAge;
-(void)userAgeChange:(NSString*)newAge;
@end
