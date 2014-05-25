//
//  JPLoginHandlerFake.m
//  JPDemo
//
//  Created by Jordi Pellat Massó on 25/05/14.
//  Copyright (c) 2014 Jordi Pellat Massó. All rights reserved.
//

#import "JPLoginHandlerFake.h"
#import "JPUser.h"

@interface JPLoginHandlerFake()
@property (copy, nonatomic) void(^loginFinished)();


@end

@implementation JPLoginHandlerFake
- (void)logWithUserName:(NSString *)username
           withPassword:(NSString *)password
      succeedCompletion:(JPLoginSucceedCompletion)succeedCompletion
         failCompletion:(JPLoginFailCompletion)failCompletion
{
    _loggedUserName = username;
    _loggedPassword = password;
    
    self.loginFinished = ^(){
        if ([username isEqualToString:JPLoginHandlerCorrectUserName] && [password isEqualToString:JPLoginHandlerCorrectPassword])
        {
            JPUser *user = [[JPUser alloc] initWithUserName:username];
            succeedCompletion(user);
        }
        else if ([username isEqualToString:JPLoginHandlerUnreachableUserName])
        {
            failCompletion(JPLoginErrorServerUnreachable);
        }
        else
        {
            failCompletion(JPLoginErrorIncorrectUserOrPassword);
        }
    };
}

- (void)simulatesEndLogin
{
    self.loginFinished();
}
@end
