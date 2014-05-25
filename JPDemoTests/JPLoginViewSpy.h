//
//  JPLoginViewSpy.h
//  JPDemo
//
//  Created by Jordi Pellat Massó on 25/05/14.
//  Copyright (c) 2014 Jordi Pellat Massó. All rights reserved.
//

#import "JPLoginView.h"

@interface JPLoginViewSpy : JPLoginView
@property (assign, readonly, nonatomic) BOOL isShowingUserFeedback;
@property (assign, readonly, nonatomic) BOOL didShowPasswordError;
@property (assign, readonly, nonatomic) BOOL didShowWrongUsernameOrPassword;
@property (assign, readonly, nonatomic) BOOL didShowUnreachableService;
@property (assign, readonly, nonatomic) BOOL didShowLoginSucceed;

- (void)simulateUserTapsOkOnLoginSucceed;

@end
