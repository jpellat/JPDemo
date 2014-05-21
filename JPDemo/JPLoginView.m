//
//  JPLoginView.m
//  LighterViewController
//
//  Created by Jordi Pellat Massó on 17/05/14.
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

#import "JPLoginView.h"
#import "JPLoginTableViewDatasource.h"

@interface JPLoginView()<UINavigationBarDelegate>
@property (strong, nonatomic) UINavigationBar *navigationBar;
@property (strong, nonatomic) IBOutlet UITableView *fieldsTableView;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;

@property (strong, nonatomic) IBOutlet UIView *userFeedbackView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;

@property (strong, nonatomic) JPLoginTableViewDatasource *fieldsDataSource;
@end

@implementation JPLoginView

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUp];
}

- (void)setUp
{
    [self setUpNavigationBar];
    [self setUpFieldsTableView];
}

- (void)setUpNavigationBar
{
    self.navigationBar = [[UINavigationBar alloc] init];
    [self.navigationBar setFrame:CGRectMake(0, 20, self.frame.size.width, 44)];
    [self.navigationBar setBarTintColor:[UIColor lightGrayColor]];
    [self.navigationBar setDelegate:self];
    UINavigationItem *titleItem = [[UINavigationItem alloc] init];
    titleItem.title = @"Login";
    self.navigationBar.items = @[titleItem];
    [self addSubview:self.navigationBar];
}

- (void)setUpFieldsTableView
{
    self.fieldsTableView.backgroundColor = [UIColor clearColor];
    self.fieldsDataSource = [[JPLoginTableViewDatasource alloc] init];
    [self.fieldsDataSource setUpTableView:self.fieldsTableView];
    self.fieldsTableView.delegate = self.fieldsDataSource;
    self.fieldsTableView.dataSource = self.fieldsDataSource;
}

- (IBAction)loginButtonTapped:(UIButton *)button
{
    [self.loginViewDelegate didTapLoginAtLoginView:self];
}

- (UIBarPosition)positionForBar:(id<UIBarPositioning>)bar
{
    return UIBarPositionTopAttached;
}

- (void)setViewModel:(JPLoginViewModel *)viewModel
{
    _viewModel = viewModel;
    self.fieldsDataSource.loginViewModel = viewModel;
    [self.fieldsTableView reloadData];
}

- (void)showUserFeedback
{
    self.userFeedbackView.frame = self.bounds;
    [self addSubview:self.userFeedbackView];
    [self.activityIndicatorView startAnimating];
}

- (void)removeUserFeedback
{
    [self.activityIndicatorView stopAnimating];
    [self.userFeedbackView removeFromSuperview];
}
@end

@implementation JPLoginViewModel



@end