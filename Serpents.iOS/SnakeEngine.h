//
//  SnakeEngine.h
//  Serpents.iOS
//
//  Created by Guillermo Rivero on 6/5/15.
//  Copyright (c) 2015 Guillermo Rivero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SnakeEngine : NSObject

-(void)join:(NSString *)game;
-(void)move:(NSString *)token direction:(NSString *)direction;

@end
