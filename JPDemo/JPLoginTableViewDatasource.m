//
//  JPLoginTableViewDatasource.m
//  JPDemo
//
//  Created by Jordi Pellat Massó on 21/05/14.
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

#import "JPLoginTableViewDatasource.h"
#import "JPLoginTableViewCell.h"
#import "JPLoginView.h"

static NSString * const CellIdentifier = @"CellIdentifier";

@implementation JPLoginTableViewDatasource
- (void)setUpTableView:(UITableView *)tableView
{
    [tableView registerNib:[UINib nibWithNibName:@"JPLoginTableViewCell" bundle:nil] forCellReuseIdentifier:CellIdentifier];
}

- (void)updateViewModelWithTableView:(UITableView *)tableView
{
    JPLoginTableViewCell *userNameCell = (JPLoginTableViewCell *)[tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    JPLoginTableViewCell *passwordCell = (JPLoginTableViewCell *)[tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    
    self.loginViewModel.userName = userNameCell.text;
    self.loginViewModel.password = passwordCell.text;
}

- (void)resignFirstResponderForAllCellsWithTableView:(UITableView *)tableView
{
    JPLoginTableViewCell *userNameCell = (JPLoginTableViewCell *)[tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    JPLoginTableViewCell *passwordCell = (JPLoginTableViewCell *)[tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    
    [userNameCell resignFirstResponder];
    [passwordCell resignFirstResponder];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JPLoginTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0:
            cell.placeholder = @"Username";
            cell.text = self.loginViewModel.userName;
            break;
            
        case 1:
            cell.placeholder = @"Password";
            [cell setUpCellForPassword];
            break;
            
        default:
            break;
    }
    
    return cell;
}

@end
