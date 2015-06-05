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
#import "GameViewController.h"
#import "SnakeEngine.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)joingGameButton:(UIButton *)sender {
    //Connect to the server
    
    NSString *serverURL = self.serverURLText.text;
    NSString *gameName = self.gameNameText.text;

    SnakeEngine* engine = [SnakeEngine sharedEngine];
    engine.serverURL = serverURL;
    
    [engine joinGame:gameName snake:self.serpentNameText.text success:^(NSDictionary *result) {

        [self performSegueWithIdentifier:@"GameSegue" sender:self];
        
        NSLog(@"JSON: %@", result);
    } failure:^(NSError *error) {
        NSLog(@"Error: %@", error);

    }];
    
}
@end
