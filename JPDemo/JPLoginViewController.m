//
//  JPLoginViewController.m
//  LighterViewController
//
//  Created by Jordi Pellat Massó on 18/05/14.
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

#import "JPLoginViewController.h"
#import "JPLoginView.h"
#import "JPLastLoginStorage.h"
#import "JPLoginHandler.h"

@interface JPLoginViewController ()<JPLoginViewDelegate>
@property (readonly) JPLoginView *loginView;

@property (strong, readonly, nonatomic) JPLastLoginStorage *lastLoginStorage;
@property (strong, readonly, nonatomic) JPLoginHandler *loginHandler;
@end

@implementation JPLoginViewController

- (id)initWithLoginHandler:(JPLoginHandler *)loginHandler
          lastLoginStorage:(JPLastLoginStorage *)lastLoginStorage
{
    self = [self initWithNibName:@"JPLoginView" bundle:nil];
    if (self) {
        _loginHandler = loginHandler;
        _lastLoginStorage = lastLoginStorage;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *userName = [self.lastLoginStorage getLastLogedUsername];
    NSString *password = @"";
    
    
    JPLoginViewModel *viewModel = [[JPLoginViewModel alloc] init];
    viewModel.userName = userName;
    viewModel.password = password;
    
    // Set up the view with the view model and set up view controller as delegate
    self.loginView.viewModel = viewModel;
    self.loginView.loginViewDelegate = self;
}

- (JPLoginView *)loginView
{
    return (JPLoginView *)self.view;
}

- (void)didTapLoginAtLoginView:(JPLoginView *)loginView
{
    if (self.loginView.viewModel.password.length > 0) {
        [self.loginView showUserFeedback];
        [self doLogin];
    }
    else
    {
        [self.loginView showPasswordError];
    }
}

- (void)doLogin
{
    JPLoginViewModel *viewModel = self.loginView.viewModel;

    __weak typeof(self) wSelf = self;
    [self.loginHandler logWithUserName:viewModel.userName
                          withPassword:viewModel.password
                     succeedCompletion:^(JPUser *logedUser) {
                         typeof(self) sSelf = wSelf;
                         [sSelf didSucceedLoginWithUser:logedUser];
                     }
                        failCompletion:^(JPLoginError error) {
                            typeof(self) sSelf = wSelf;
                            [sSelf didFailLoginWithError:error];
                        }];
}

- (void)didSucceedLoginWithUser:(JPUser *)user
{
    [self.loginView removeUserFeedback];
    [self.loginView showLoginSucceedOnUsercompletion:^{
        
    }];
}

- (void)didFailLoginWithError:(JPLoginError) error
{
    [self.loginView removeUserFeedback];
    
    switch (error) {
        case JPLoginErrorServerUnreachable:
            [self.loginView showUnreachableService];
            break;

        case JPLoginErrorIncorrectUserOrPassword:
            [self.loginView showWrongUserNameOrPassword];
            break;

        default:
            break;
    }
    
}

@end
