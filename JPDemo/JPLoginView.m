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

//  More information at http://jpellat.com/

#import "JPLoginView.h"
#import "JPLoginTableViewDatasource.h"

static NSString * const NavigationBarTitle = @"Login";

@interface JPLoginView()<UINavigationBarDelegate>

/*
 * IBOutlets setted from the .xib
 */
@property (strong, nonatomic) UINavigationBar *navigationBar;
@property (strong, nonatomic) IBOutlet UITableView *fieldsTableView;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;

@property (strong, nonatomic) IBOutlet UIView *userFeedbackView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;

/*
 * Datasource used to provide the cells to the table view and also isolate
 *  the table view details
 * This is only an option, this datasource could be implemented by the view that's
 *  only an example to ilustrate the technique
 */
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
    titleItem.title = NavigationBarTitle;
    self.navigationBar.items = @[titleItem];

    [self addSubview:self.navigationBar];
}

- (void)setUpFieldsTableView
{
    self.fieldsDataSource = [[JPLoginTableViewDatasource alloc] init];
    [self.fieldsDataSource setUpTableView:self.fieldsTableView];
    
    self.fieldsTableView.backgroundColor = [UIColor clearColor];
    self.fieldsTableView.delegate = self.fieldsDataSource;
    self.fieldsTableView.dataSource = self.fieldsDataSource;
}

- (IBAction)loginButtonTapped:(UIButton *)button
{
    // Commit the view data to the view model
    [self.fieldsDataSource updateViewModelWithTableView:self.fieldsTableView];
    
    [self.fieldsDataSource resignFirstResponderForAllCellsWithTableView:self.fieldsTableView];
    
    //Communicate the view controller (delegate) the event
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

- (void)showPasswordError
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Password Error" message:@"Password is too short!" delegate:nil cancelButtonTitle:@"OKS" otherButtonTitles: nil];
    [alertView show];
}

@end

@implementation JPLoginViewModel



@end