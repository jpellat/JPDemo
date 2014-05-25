//
//  JPLoginHandlerFake.h
//  JPDemo
//
//  Created by Jordi Pellat Massó on 25/05/14.
//  Copyright (c) 2014 Jordi Pellat Massó. All rights reserved.
//

#import "JPLoginHandler.h"
static NSString *JPLoginHandlerCorrectUserName = @"Batman";
static NSString *JPLoginHandlerCorrectPassword = @"I'm batman!";
static NSString *JPLoginHandlerUnreachableUserName = @"Acme";

@interface JPLoginHandlerFake : JPLoginHandler
@property (strong, readonly, nonatomic) NSString *loggedUserName;
@property (strong, readonly, nonatomic) NSString *loggedPassword;

- (void)simulatesEndLogin;
@end
