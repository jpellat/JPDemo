//
//  JPDemo - JPSimulatePushViewCnotrollerTest.m
//  Copyright 2014 Jordi Pellat Massó. All rights reserved.
//
//  Created by: Jordi Pellat Massó
//

    // Class under test
#import "JPSimulatePushViewController.h"

    // Collaborators
#import "JPNavigationControllerFake.h"

    // Test support
#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>


@interface JPSimulatePushViewCnotrollerTest : XCTestCase
@end

@implementation JPSimulatePushViewCnotrollerTest
{
    // test fixture ivars go here
}

- (void)test_simulatePushViewController_pushesViewController
{
    //Given
    JPSimulatePushViewController *sut = [[JPSimulatePushViewController alloc] init];
    JPNavigationControllerFake *navController = [[JPNavigationControllerFake alloc] init];
    [navController pushViewController:sut animated:YES];
    
    //When
    [sut simulatePushViewController];
    
    //Then
    assertThatInteger(navController.viewControllers.count, is(equalToInteger(2)));
    assertThat(navController.topViewController, is(instanceOf([JPSimulatePushViewController class])));
}

@end
