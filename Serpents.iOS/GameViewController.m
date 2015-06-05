//
//  GameViewController.m
//  Serpents.iOS
//
//  Created by Sebastian Cancinos on 6/5/15.
//  Copyright (c) 2015 Guillermo Rivero. All rights reserved.
//

#import "GameViewController.h"
#import "GameView.h"


@interface GameViewController ()

@property (nonatomic, strong) GameView* gameView;
@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.gameView = [[GameView alloc] initWithFrame:CGRectMake(10, 20, 50, 50)];
    [self.view addSubview:self.gameView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
