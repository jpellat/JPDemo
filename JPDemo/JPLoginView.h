//
//  JPLoginView.h
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

/*
 *  Description: The view isolated from the view controller
 *  More information at http://jpellat.com/?p=18
 */

#import <UIKit/UIKit.h>
@class JPLoginViewModel;
@protocol JPLoginViewDelegate;

@interface JPLoginView : UIView

@property (strong, nonatomic) JPLoginViewModel *viewModel;
@property (weak, nonatomic) id<JPLoginViewDelegate> loginViewDelegate;

/*
 * Methods used by the view controller to change the view
 */
- (void)showUserFeedback;
- (void)removeUserFeedback;
- (void)showPasswordError;
- (void)showWrongUserNameOrPassword;
- (void)showUnreachableService;
- (void)showLoginSucceedOnUsercompletion:(void(^)())userCompletion;
@end

/*
 * Delegate used to comunicate async events to ViewController
 */
@protocol JPLoginViewDelegate <NSObject>

- (void)didTapLoginAtLoginView:(JPLoginView *)loginView;

@end

/*
 * ViewModel used to comunicate data between view and view controller
 * Can also be used to comunicate changes of data to View controller but in
 *  this case it's not usefull
 */

@interface JPLoginViewModel : NSObject

@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *password;

@end