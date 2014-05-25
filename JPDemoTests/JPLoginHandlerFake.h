//
//  JPLoginHandlerFake.h
//  JPDemo
//
//  Created by Jordi Pellat Massó on 25/05/14.
//  Copyright (c) 2014 Jordi Pellat Massó. All rights reserved.
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
static NSString *JPLoginHandlerCorrectUserName = @"Batman";
static NSString *JPLoginHandlerCorrectPassword = @"I'm batman!";
static NSString *JPLoginHandlerUnreachableUserName = @"Acme";

@interface JPLoginHandlerFake : JPLoginHandler
@property (strong, readonly, nonatomic) NSString *loggedUserName;
@property (strong, readonly, nonatomic) NSString *loggedPassword;

- (void)simulatesEndLogin;
@end
