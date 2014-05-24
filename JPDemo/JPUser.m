//
//  JPUser.m
//  JPDemo
//
//  Created by Jordi Pellat Massó on 24/05/14.
//  Copyright (c) 2014 Jordi Pellat Massó. All rights reserved.
//

#import "JPUser.h"

@implementation JPUser
- (instancetype)initWithUserName:(NSString *)userName
{
    if (self = [super init])
    {
        _username = userName;
    }
    
    return self;
}
@end
