//
//  SnakeEngine.h
//  Serpents.iOS
//
//  Created by Guillermo Rivero on 6/5/15.
//  Copyright (c) 2015 Guillermo Rivero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SnakeEngine : NSObject

-(void)join:(NSString *)server
       game:(NSString *)game
      snake:(NSString *)snake
    success:(void (^)(NSDictionary *result))success
    failure:(void (^)(NSError *error))failure;

-(void)move:(NSString *)server
       game:(NSString *)game
      token:(NSString *)token
  direction:(NSString *)direction
    success:(void (^)(NSDictionary *result))success
    failure:(void (^)(NSError *error))failure;

@end
