//
//  JPLoginHandler.h
//  JPDemo
//
//  Created by Jordi Pellat Massó on 24/05/14.
//  Copyright (c) 2014 Jordi Pellat Massó. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JPUser;

typedef enum : NSUInteger {
    JPLoginErrorIncorrectUserOrPassword,
    JPLoginErrorServerUnreachable,
} JPLoginError;

typedef void(^JPLoginSucceedCompletion)(JPUser *logedUser);
typedef void(^JPLoginFailCompletion)(JPLoginError error);

@interface JPLoginHandler : NSObject
- (void)logWithUserName:(NSString *)user
           withPassword:(NSString *)password
      succeedCompletion:(JPLoginSucceedCompletion)succeedCompletion
         failCompletion:(JPLoginFailCompletion)failCompletion;
@end
