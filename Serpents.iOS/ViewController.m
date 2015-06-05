//
//  ViewController.m
//  Serpents.iOS
//
//  Created by Guillermo Rivero on 6/5/15.
//  Copyright (c) 2015 Guillermo Rivero. All rights reserved.
//

#import <EventSource.h>
#import <AFNetworking.h>

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSURL *url = [NSURL URLWithString:@"http://192.168.1.78:8585/api/games/keller/news"];
//    
//    EventSource *source = [EventSource eventSourceWithURL:url];
//    [source addEventListener:@"hello_event" handler:^(Event *e) {
//        NSLog(@"%@: %@", e.event, e.data);
//    }];
    
//    [source onMessage:^(Event *e) {
//        NSLog(@"%@: %@", e.event, e.data);
//    }];
    
    
    //    TRVSEventSource *eventSource = [[TRVSEventSource alloc] initWithURL:url];
    //    eventSource.delegate = self;
    //
    //    int total = 0;
    //    [eventSource addListenerForEvent:@"game_status" usingEventHandler:^(TRVSServerSentEvent *event, NSError *error) {
    //        NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:event.data options:0 error:NULL];
    ////        Message *message = [Message messageWithJSON:JSON];
    //
    ////        NSLog(@"%@", JSON);
    //        NSLog(@"%d", total);
    //
    //
    //    }];
    //
    //    [eventSource open];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)joingGameButton:(UIButton *)sender {
    //Connect to the server
    
    NSString *serverURL = self.serverURLText.text;
    NSString *gameName = self.gameNameText.text;

    
    
    NSString *url = [NSString stringWithFormat:@"%@/api/games/%@/serpents", serverURL, gameName];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"name": self.serpentNameText.text };

    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    
    
    
    
    
}
@end
