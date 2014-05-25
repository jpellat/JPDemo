//
//  JPLastLoginStorage.h
//  JPDemo
//
//  Created by Jordi Pellat Massó on 25/05/14.
//  Copyright (c) 2014 Jordi Pellat Massó. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JPLastLoginStorage : NSObject
- (NSString *)getLastLogedUsername;
- (void)setLastLoggedUsername:(NSString *)username;

@end
