//
//  SnakeEngine.h
//  Serpents.iOS
//
//  Created by Guillermo Rivero on 6/5/15.
//  Copyright (c) 2015 Guillermo Rivero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <EventSource.h>

@protocol SnakeEventDelegate <NSObject>

-(void)didReceiveEvent:(Event *)event;

@end

@interface SnakeEngine : NSObject

+ (id) sharedEngine;

-(void)startGame:(NSString *)game;
-(void)start;

-(void)joinGame:(NSString *)game
      snake:(NSString *)snake
    success:(void (^)(NSDictionary *result))success
    failure:(void (^)(NSError *error))failure;

-(void)moveDirection:(NSString *)direction
    success:(void (^)(NSDictionary *result))success
    failure:(void (^)(NSError *error))failure;

@property id<SnakeEventDelegate> delegate;
@property (nonatomic, strong) NSString* direction;
@property (nonatomic, readonly, strong) id lastResult;
@property (nonatomic, strong) NSString* serverURL;
@property (nonatomic, strong) NSString* snakeName;

@end
