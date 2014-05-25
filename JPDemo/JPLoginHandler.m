//
//  JPLoginHandler.m
//  JPDemo
//
//  Created by Jordi Pellat Massó on 24/05/14.
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

#import "JPLoginHandler.h"
#include <stdlib.h>

#import "JPUser.h"

@implementation JPLoginHandler
- (void)logWithUserName:(NSString *)user
           withPassword:(NSString *)password
      succeedCompletion:(JPLoginSucceedCompletion)succeedCompletion
         failCompletion:(JPLoginFailCompletion)failCompletion
{
    NSInteger randomNumber = arc4random() % 3;
    
    switch (randomNumber) {
        case 0:
            [self loginSucceedWithCompletion:succeedCompletion userName:user];
            break;
        case 1:
            [self loginFailWithUnreachableErrorWithCompletion:failCompletion];
            break;
        case 2:
            [self loginFailWithWrongUsernameOrPasswordWithCompletion:failCompletion];
            break;
            
        default:
            break;
    }
}

- (void)loginSucceedWithCompletion:(JPLoginSucceedCompletion)succeedCompletion userName:(NSString *)userName
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        JPUser *user = [[JPUser alloc] initWithUserName:userName];
        
        succeedCompletion(user);
    });
}

- (void)loginFailWithUnreachableErrorWithCompletion:(JPLoginFailCompletion)failCompletion
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        failCompletion(JPLoginErrorServerUnreachable);
    });
}

- (void)loginFailWithWrongUsernameOrPasswordWithCompletion:(JPLoginFailCompletion)failCompletion
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        failCompletion(JPLoginErrorIncorrectUserOrPassword);
    });
}
@end
