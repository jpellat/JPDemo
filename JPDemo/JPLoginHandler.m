//
//  JPLoginHandler.m
//  JPDemo
//
//  Created by Jordi Pellat Massó on 24/05/14.
//  Copyright (c) 2014 Jordi Pellat Massó. All rights reserved.
//

#import "JPLoginHandler.h"
#include <stdlib.h>

#import "JPUser.h"

@implementation JPLoginHandler
- (void)logWithUserName:(NSString *)user
           withPassword:(NSString *)password
      succeedCompletion:(JPLoginSucceedCompletion)succeedCompletion
         failCompletion:(JPLoginFailCompletion)failCompletion
{
    NSInteger randomNumber = arc4random() % 3;
    
    switch (randomNumber) {
        case 0:
            [self loginSucceedWithCompletion:succeedCompletion userName:user];
            break;
        case 1:
            [self loginFailWithUnreachableErrorWithCompletion:failCompletion];
            break;
        case 2:
            [self loginFailWithWrongUsernameOrPasswordWithCompletion:failCompletion];
            break;
            
        default:
            break;
    }
}

- (void)loginSucceedWithCompletion:(JPLoginSucceedCompletion)succeedCompletion userName:(NSString *)userName
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        JPUser *user = [[JPUser alloc] initWithUserName:userName];
        
        succeedCompletion(user);
    });
}

- (void)loginFailWithUnreachableErrorWithCompletion:(JPLoginFailCompletion)failCompletion
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        failCompletion(JPLoginErrorServerUnreachable);
    });
}

- (void)loginFailWithWrongUsernameOrPasswordWithCompletion:(JPLoginFailCompletion)failCompletion
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        failCompletion(JPLoginErrorIncorrectUserOrPassword);
    });
}
@end
