//
//  JPNavigationControllerFake.m
//  JPDemo
//
//  Created by Jordi Pellat Massó on 25/05/14.
//  Copyright (c) 2014 Jordi Pellat Massó. All rights reserved.
//

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