//
//  SnakeEngine.m
//  Serpents.iOS
//
//  Created by Guillermo Rivero on 6/5/15.
//  Copyright (c) 2015 Guillermo Rivero. All rights reserved.
//

#import <AFNetworking.h>
#import "SnakeEngine.h"

@implementation SnakeEngine

-(void)join:(NSString *)server
       game:(NSString *)game
      snake:(NSString *)snake
    success:(void (^)(NSDictionary *))success
    failure:(void (^)(NSError *))failure
{
    NSString *url = [NSString stringWithFormat:@"%@/api/games/%@/serpents", server, game];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"name": snake };
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

-(void)move:(NSString *)server
       game:(NSString *)game
      token:(NSString *)token
  direction:(NSString *)direction
    success:(void (^)(NSDictionary *))success
    failure:(void (^)(NSError *))failure{
    
    
    NSString *url = [NSString stringWithFormat:@"%@/api/games/%@/serpents/%@", server,game, token];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"direction": direction };
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager PUT:url parameters:parameters
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             success(responseObject);
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             failure(error);
         }];
}

@end
