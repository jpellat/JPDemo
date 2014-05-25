//
//  JPLastLoginStorage.m
//  JPDemo
//
//  Created by Jordi Pellat Massó on 25/05/14.
//  Copyright (c) 2014 Jordi Pellat Massó. All rights reserved.
//

#import "JPLastLoginStorage.h"

static NSString * const LastLogedUsernameKey = @"lastLoggedUsername";

@implementation JPLastLoginStorage
- (NSString *)getLastLogedUsername
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    return [defaults objectForKey:LastLogedUsernameKey];
}

- (void)setLastLoggedUsername:(NSString *)username
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:username forKey:LastLogedUsernameKey];
    
    [defaults synchronize];
}
@end
