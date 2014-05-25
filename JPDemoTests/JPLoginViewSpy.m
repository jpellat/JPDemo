//
//  JPLoginViewSpy.m
//  JPDemo
//
//  Created by Jordi Pellat Massó on 25/05/14.
//  Copyright (c) 2014 Jordi Pellat Massó. All rights reserved.
//

#import "JPLoginViewSpy.h"
@interface JPLoginViewSpy()
@property (copy, nonatomic) void(^loginSucceedUserCompletion)();
@end

@implementation JPLoginViewSpy
{
    JPLoginViewModel *_viewModel;
}

- (void)setViewModel:(JPLoginViewModel *)viewModel
{
    _viewModel = viewModel;
}

- (JPLoginViewModel *)viewModel
{
    return _viewModel;
}

- (void)showUserFeedback
{
    _isShowingUserFeedback = YES;
}

- (void)removeUserFeedback
{
    _isShowingUserFeedback = NO;
}

- (void)showPasswordError
{
    _didShowPasswordError = YES;
}

- (void)showWrongUserNameOrPassword
{
    _didShowWrongUsernameOrPassword = YES;
}

- (void)showUnreachableService
{
    _didShowUnreachableService = YES;
}

- (void)showLoginSucceedOnUsercompletion:(void (^)())userCompletion
{
    self.loginSucceedUserCompletion = userCompletion;
    _didShowLoginSucceed = YES;
}

- (void)simulateUserTapsOkOnLoginSucceed
{
    self.loginSucceedUserCompletion();
}

@end
