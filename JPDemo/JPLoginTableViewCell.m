//
//  JPLoginTableViewCell.m
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

#import "JPLoginTableViewCell.h"

@interface JPLoginTableViewCell ()
@property (strong, nonatomic) IBOutlet UITextField *textField;
@end

@implementation JPLoginTableViewCell

- (NSString *)placeholder
{
    return self.textField.placeholder;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    self.textField.placeholder = placeholder;
}

- (void)setText:(NSString *)text
{
    self.textField.text = text;
}

- (NSString *)text
{
    return self.textField.text;
}

- (void)setUpCellForPassword
{
    self.textField.secureTextEntry = YES;
}

- (BOOL)becomeFirstResponder
{
    [self.textField becomeFirstResponder];
    
    return YES;
}

- (BOOL)resignFirstResponder
{
    [self.textField resignFirstResponder];
    
    return YES;
}
@end
