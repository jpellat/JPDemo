//
//  JPDemo - JPUserTest.m
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
#import "JPUser.h"

    // Collaborators

    // Test support
#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>


@interface JPUserTest : XCTestCase
@end

@implementation JPUserTest
{
    
}

- (void)test_createUserWithUserName_setsUsername
{
    JPUser *sut = [[JPUser alloc] initWithUserName:@"Batman"];
    
    assertThat(sut.username, is(equalTo(@"Batman")));
}

@end
