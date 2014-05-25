//
//  JPLoginViewSpy.m
//  JPDemo
//
//  Created by Jordi Pellat Massó on 25/05/14.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

//  More information at http://jpellat.com/

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
