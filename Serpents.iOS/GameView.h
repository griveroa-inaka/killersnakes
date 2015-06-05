//
//  GameView.h
//  Serpents.iOS
//
//  Created by Sebastian Cancinos on 6/5/15.
//  Copyright (c) 2015 Guillermo Rivero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventSource.h>

@interface GameView : UIImageView

-(void) updateWithEvent:(Event*) event;
@end
