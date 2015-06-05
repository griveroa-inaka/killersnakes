//
//  GameViewController.m
//  Serpents.iOS
//
//  Created by Sebastian Cancinos on 6/5/15.
//  Copyright (c) 2015 Guillermo Rivero. All rights reserved.
//

#import "GameViewController.h"
#import "GameView.h"
#import "SnakeEngine.h"


@interface GameViewController () <SnakeEventDelegate>

@property (nonatomic, strong) IBOutlet GameView* gameView;
@property (nonatomic, strong) IBOutlet UILabel* snakeNameLbl;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    SnakeEngine *engine = [SnakeEngine sharedEngine];
    [engine setDelegate:self];

    [self.snakeNameLbl setText:engine.snakeName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didReceiveEvent:(Event *)event
{
    [self.gameView updateWithEvent:event];
}

- (IBAction) moveUp:(id)sender
{
    [[SnakeEngine sharedEngine] moveDirection:@"up" success:NULL failure:NULL];
}
- (IBAction) moveDown:(id)sender
{
    [[SnakeEngine sharedEngine] moveDirection:@"down" success:NULL failure:NULL];
}
- (IBAction) moveLeft:(id)sender
{
    [[SnakeEngine sharedEngine] moveDirection:@"left" success:NULL failure:NULL];
}
- (IBAction) moveRight:(id)sender
{
    [[SnakeEngine sharedEngine] moveDirection:@"right" success:NULL failure:NULL];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
