//
//  JPAppDelegate.m
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

#import "JPAppDelegate.h"
#import "JPLoginViewController.h"
#import "JPLoginHandler.h"
#import "JPLastLoginStorage.h"

@implementation JPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [self loginViewController];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (JPLoginViewController *)loginViewController
{
    JPLoginHandler *loginaHandler = [[JPLoginHandler alloc] init];
    JPLastLoginStorage *lastLoginStorage = [[JPLastLoginStorage alloc] init];
    
    JPLoginViewController *loginViewController = [[JPLoginViewController alloc] initWithLoginHandler:loginaHandler
                                                                                    lastLoginStorage:lastLoginStorage];
    
    return loginViewController;

}

@end
