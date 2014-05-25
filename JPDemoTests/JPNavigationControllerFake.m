//
//  JPNavigationControllerFake.m
//  JPDemo
//
//  Created by Jordi Pellat Massó on 25/05/14.
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

#import "JPNavigationControllerFake.h"

@interface JPNavigationControllerFake ()
@property (strong, nonatomic) NSMutableArray *controllersStack;
@end

@implementation JPNavigationControllerFake
+ (instancetype)navigationController
{
	UIViewController *viewController = [[UIViewController alloc] init];
	return [[self alloc] initWithRootViewController:viewController];
}

- (instancetype)init
{
    if (self = [super init])
	{
        _controllersStack = [[NSMutableArray alloc] init];
    }
	
    return self;
}

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
	if (self = [self init])
	{
		[_controllersStack addObject:rootViewController];
	}
	
	return self;
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
	[super popViewControllerAnimated:animated];
	UIViewController *lastViewController = self.controllersStack.lastObject;
	
	[self.controllersStack removeObject:lastViewController];
	
	return lastViewController;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
	[super pushViewController:viewController animated:animated];
	[self.controllersStack addObject:viewController];
}

- (UIViewController *)topViewController
{
	return self.controllersStack.lastObject;
}

- (NSArray *)viewControllers
{
	return [self.controllersStack copy];
}
@end