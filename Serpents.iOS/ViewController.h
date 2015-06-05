//
//  ViewController.h
//  Serpents.iOS
//
//  Created by Guillermo Rivero on 6/5/15.
//  Copyright (c) 2015 Guillermo Rivero. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *serverURLText;
@property (weak, nonatomic) IBOutlet UITextField *gameNameText;
@property (weak, nonatomic) IBOutlet UITextField *serpentNameText;


@property (weak, nonatomic) IBOutlet UILabel *gameStatusLabel;

- (IBAction)joingGameButton:(UIButton *)sender;

@end

