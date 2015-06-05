//
//  SnakeEngine.m
//  Serpents.iOS
//
//  Created by Guillermo Rivero on 6/5/15.
//  Copyright (c) 2015 Guillermo Rivero. All rights reserved.
//

#import <EventSource.h>
#import <AFNetworking.h>
#import "SnakeEngine.h"

@interface SnakeEngine(){
    EventSource *eventSource;
    

}

@property (nonatomic, readwrite, strong) id lastResult;
@property (nonatomic, strong) NSString* token;
@property (nonatomic, strong) NSString* gameName;

@end

@implementation SnakeEngine

+ (id)sharedEngine
{
    static SnakeEngine *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(void)startGame:(NSString *)game{
    
    NSString *urlString = [NSString stringWithFormat:@"%@/api/games/%@/news", self.serverURL, game];
    NSURL *url = [NSURL URLWithString:urlString];
    
    if(eventSource) {
        [eventSource close];
    }
    
    eventSource = [EventSource eventSourceWithURL:url];
    [eventSource onMessage:^(Event *event) {
        NSLog(@"Event: %@", event);
        
        if([self.delegate respondsToSelector:@selector(didReceiveEvent:)])
            [self.delegate didReceiveEvent:event];
    }];
}

- (void) start
{
    [self startGame: self.gameName];
}

-(void)joinGame:(NSString *)game
      snake:(NSString *)snake
    success:(void (^)(NSDictionary *))success
    failure:(void (^)(NSError *))failure
{
    NSString *url = [NSString stringWithFormat:@"%@/api/games/%@/serpents", self.serverURL, game];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"name": snake };
    
    self.gameName = game;
    self.snakeName = snake;

    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.token = [responseObject objectForKey:@"token"];
        self.lastResult = responseObject;
        [self start];
        
        if(success)
            success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(failure)
            failure(error);
    }];
}

-(void)moveDirection:(NSString *)direction
    success:(void (^)(NSDictionary *))success
    failure:(void (^)(NSError *))failure{
    
    if([direction isEqualToString:self.direction])
        return;
    
    NSString *url = [NSString stringWithFormat:@"%@/api/games/%@/serpents/%@", self.serverURL,self.gameName, self.token];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"direction": direction };
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager PUT:url parameters:parameters
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             self.lastResult = responseObject;
             self.direction = direction;
             if(success)
                 success(responseObject);
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             if(failure)
                 failure(error);
         }];
}



@end
