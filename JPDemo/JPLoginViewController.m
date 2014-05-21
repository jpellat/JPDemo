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

#import "JPLoginViewController.h"
#import "JPLoginView.h"

@interface JPLoginViewController ()<JPLoginViewDelegate>
@property (readonly) JPLoginView *loginView;
@end

@implementation JPLoginViewController

- (id)init
{
    self = [self initWithNibName:@"JPLoginView" bundle:nil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *userName = @"Default"; //Retreive it from your bussiness logic
    NSString *password = @""; //Retreive it from your bussiness logic
    
    
    JPLoginViewModel *viewModel = [[JPLoginViewModel alloc] init];
    viewModel.userName = userName;
    viewModel.password = password;
    
    self.loginView.viewModel = viewModel;
    self.loginView.loginViewDelegate = self;
}

- (JPLoginView *)loginView
{
    return (JPLoginView *)self.view;
}

- (void)didTapLoginAtLoginView:(JPLoginView *)loginView
{
    // Do the login
    NSLog(@"Login...");
    [self.loginView showUserFeedback];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.loginView removeUserFeedback];
    });
}
@end