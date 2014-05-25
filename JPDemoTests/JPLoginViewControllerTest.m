//
//  JPDemo - JPLoginViewControllerTest.m
//  Copyright 2014 Jordi Pellat Massó. All rights reserved.
//
//  Created by: Jordi Pellat Massó
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

    // Class under test
#import "JPLoginViewController.h"

    // Collaborators
#import "JPLoginViewSpy.h"
#import "JPLastLoginStorage.h"
#import "JPLoginHandlerFake.h"

    // Test support
#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>


@interface JPLoginViewControllerTest : XCTestCase
@end

@implementation JPLoginViewControllerTest
{
    JPLoginViewController *sut;
    
    JPLastLoginStorage *lastLoginStorageMock;
    JPLoginHandlerFake *loginHandlerFake;
}

- (void)setUp
{
    [self setUpColaborators];
    
    sut = [[JPLoginViewController alloc] initWithLoginHandler:loginHandlerFake
                                             lastLoginStorage:lastLoginStorageMock];
}

- (void)test_getView_returnsJPLoginView
{
    //When
    UIView *view = sut.view;
    
    //Then
    assertThat(view, is(instanceOf([JPLoginView class])));
}

- (void)test_viewDidLoad_setsViewModel
{
    //When
    JPLoginViewSpy *viewSpy = [self injectAndCallViewDidLoadToSut];
    
    //Then
    assertThat(viewSpy.viewModel, is(notNilValue()));
}

- (void)testLastUserName_viewDidLoad_setsViewModelUserName
{
    //Given
    [given([lastLoginStorageMock getLastLogedUsername]) willReturn:@"Batman"];
    
    //When
    JPLoginViewSpy *viewSpy = [self injectAndCallViewDidLoadToSut];
    
    //Then
    assertThat(viewSpy.viewModel.userName, is(equalTo(@"Batman")));
}

- (void)testShortPassword_userTapOnLogin_showsShortPasswordError
{
    //Given
    JPLoginViewSpy *viewSpy = [self injectAndCallViewDidLoadToSut];
    [self setViewUserName:@"Batman" password:@"" toView:viewSpy];
    
    //When
    [viewSpy.loginViewDelegate didTapLoginAtLoginView:viewSpy];
    
    //Then
    assertThatBool(viewSpy.didShowPasswordError, is(equalToBool(YES)));
}

- (void)testLongPassword_userTapOnLogin_showsUserFeedback
{
    //Given
    JPLoginViewSpy *viewSpy = [self injectAndCallViewDidLoadToSut];
    [self setViewUserName:@"Batman" password:@"LongPassword" toView:viewSpy];
    
    //When
    [viewSpy.loginViewDelegate didTapLoginAtLoginView:viewSpy];
    
    //Then
    assertThatBool(viewSpy.isShowingUserFeedback, is(equalToBool(YES)));
}

- (void)testLongPassword_userTapOnLogin_callsLoginHandler
{
    //Given
    JPLoginViewSpy *viewSpy = [self injectAndCallViewDidLoadToSut];
    [self setViewUserName:@"Batman" password:@"ImBatman" toView:viewSpy];
    
    //When
    [viewSpy.loginViewDelegate didTapLoginAtLoginView:viewSpy];
    
    //Then
    assertThat(loginHandlerFake.loggedUserName, is(equalTo(@"Batman")));
    assertThat(loginHandlerFake.loggedPassword, is(equalTo(@"ImBatman")));
}

- (void)testCorrectLogin_loginEnds_removeUserFeedback
{
    //Given
    JPLoginViewSpy *viewSpy = [self injectAndCallViewDidLoadToSut];
    [self setViewUserName:JPLoginHandlerCorrectUserName password:JPLoginHandlerCorrectPassword toView:viewSpy];
    [viewSpy.loginViewDelegate didTapLoginAtLoginView:viewSpy];

    //When
    [loginHandlerFake simulatesEndLogin];
    
    //Then
    assertThatBool(viewSpy.isShowingUserFeedback, is(equalToBool(NO)));
}

- (void)testWrongPassword_loginEnds_removeUserFeedback
{
    //Given
    JPLoginViewSpy *viewSpy = [self injectAndCallViewDidLoadToSut];
    [self setViewUserName:JPLoginHandlerCorrectUserName password:@"WrongPassword" toView:viewSpy];
    [viewSpy.loginViewDelegate didTapLoginAtLoginView:viewSpy];
    
    //When
    [loginHandlerFake simulatesEndLogin];
    
    //Then
    assertThatBool(viewSpy.isShowingUserFeedback, is(equalToBool(NO)));
}

- (void)testCorrectLogin_loginEnds_showLoginSucceed
{
    //Given
    JPLoginViewSpy *viewSpy = [self injectAndCallViewDidLoadToSut];
    [self setViewUserName:JPLoginHandlerCorrectUserName password:JPLoginHandlerCorrectPassword toView:viewSpy];
    [viewSpy.loginViewDelegate didTapLoginAtLoginView:viewSpy];
    
    //When
    [loginHandlerFake simulatesEndLogin];
    
    //Then
    assertThatBool(viewSpy.didShowLoginSucceed, is(equalToBool(YES)));
}

- (void)testUnreachableLogin_loginEnds_showUnreachableLogin
{
    //Given
    JPLoginViewSpy *viewSpy = [self injectAndCallViewDidLoadToSut];
    [self setViewUserName:JPLoginHandlerUnreachableUserName password:JPLoginHandlerCorrectPassword toView:viewSpy];
    [viewSpy.loginViewDelegate didTapLoginAtLoginView:viewSpy];
    
    //When
    [loginHandlerFake simulatesEndLogin];
    
    //Then
    assertThatBool(viewSpy.didShowUnreachableService, is(equalToBool(YES)));
}

- (void)testWrongUserName_loginEnds_showWrongUserNameOrPassword
{
    //Given
    JPLoginViewSpy *viewSpy = [self injectAndCallViewDidLoadToSut];
    [self setViewUserName:@"Robin" password:@"CircusLove" toView:viewSpy];
    [viewSpy.loginViewDelegate didTapLoginAtLoginView:viewSpy];
    
    //When
    [loginHandlerFake simulatesEndLogin];
    
    //Then
    assertThatBool(viewSpy.didShowWrongUsernameOrPassword, is(equalToBool(YES)));
}

- (void)setUpColaborators
{
    lastLoginStorageMock = mock([JPLastLoginStorage class]);
    loginHandlerFake = [[JPLoginHandlerFake alloc] init];
}

- (JPLoginViewSpy *)injectAndCallViewDidLoadToSut
{
    JPLoginViewSpy *viewSpy = [[JPLoginViewSpy alloc] init];
    sut.view = viewSpy;
    [sut viewDidLoad];
    
    return viewSpy;
}

- (void)setViewUserName:(NSString *)userName
               password:(NSString *)password
                 toView:(JPLoginViewSpy *)viewSpy
{
    JPLoginViewModel *viewModel = [[JPLoginViewModel alloc] init];
    viewSpy.viewModel = viewModel;
    viewModel.userName = userName;
    viewModel.password = password;
   
}
@end
