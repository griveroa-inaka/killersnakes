//
//  GameView.m
//  Serpents.iOS
//
//  Created by Sebastian Cancinos on 6/5/15.
//  Copyright (c) 2015 Guillermo Rivero. All rights reserved.
//

#import "GameView.h"

@implementation GameView

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self createImageWithSize:frame.size];
    }
    
    return self;
}

- (void) createImageWithSize:(CGSize) size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGRect rec = CGRectMake(0, 0, size.width, size.height);

    CGContextSetFillColorWithColor(context, [[self grassColor] CGColor]);
    CGContextFillRect(context,rec);
    CGContextSetStrokeColorWithColor(context, [[self wallColor] CGColor]);
    CGContextStrokeRect(context, rec);
    
    UIImage* fullColorImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // free the context
    UIGraphicsEndImageContext();

    [self setImage:fullColorImage];
}

- (UIColor*) grassColor
{
    return [UIColor colorWithRed:212./255 green:250./255 blue:224./255 alpha:1];
}

- (UIColor*) wallColor
{
    return [UIColor colorWithRed:102./255 green:29./255 blue:47./255 alpha:1];
}

- (UIColor*) fruitColor
{
    return [UIColor colorWithRed:247./255 green:74./255 blue:117./255 alpha:1];

}

- (UIColor*) snakeColor
{
    return [UIColor colorWithRed:247./255 green:227./255 blue:74./255 alpha:1];
}

@end
