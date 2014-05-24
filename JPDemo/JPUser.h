//
//  JPUser.h
//  JPDemo
//
//  Created by Jordi Pellat Massó on 24/05/14.
//  Copyright (c) 2014 Jordi Pellat Massó. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JPUser : NSObject
- (id)initWithUserName:(NSString *)userName;

@property (strong, nonatomic, readonly) NSString *username;

@end
