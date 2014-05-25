//
//  JPSimulatePushViewController.m
//  JPDemo
//
//  Created by Jordi Pellat Massó on 25/05/14.
//  Copyright (c) 2014 Jordi Pellat Massó. All rights reserved.
//

#import "JPSimulatePushViewController.h"

@interface JPSimulatePushViewController ()

@end

@implementation JPSimulatePushViewController

- (void)loadView
{
    self.view = [[UIView alloc] init];
}

- (void)simulatePushViewController
{
    JPSimulatePushViewController *viewController = [[JPSimulatePushViewController alloc] init];
    
    [self.navigationController pushViewController:viewController animated:YES];
}
@end
