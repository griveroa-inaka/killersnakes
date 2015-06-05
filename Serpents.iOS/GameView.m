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

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        [self createImageWithSize:self.frame.size];
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

-(void) updateWithEvent:(Event*) event
{
//    event: game_status; data: {"ticktime":250,"state":"created","serpents":[{"status":"alive","name":"RattleSnake","body":[[19,5]]}],"rows":50,"rounds":1000,"max_serpents":null,"initial_food":1,"id":"pawcatuck","flags":[],"countdown":10,"cols":50,"cells":[]}>
    if(!event.data)
        return;
    
    NSData *data = [event.data dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSInteger cols = [[json objectForKey:@"cols"] integerValue];
    NSInteger rows = [[json objectForKey:@"rows"] integerValue];
    
    CGSize size = CGSizeMake(cols, rows);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect rec = CGRectMake(0, 0, size.width, size.height);
    
    CGContextSetFillColorWithColor(context, [[self grassColor] CGColor]);
    CGContextFillRect(context,rec);
    CGContextSetStrokeColorWithColor(context, [[self wallColor] CGColor]);
    CGContextStrokeRect(context, rec);
    
    NSArray* serpents = [json objectForKey:@"serpents"];
    CGContextSetFillColorWithColor(context, [[self snakeColor] CGColor]);

    for(NSDictionary* snake in serpents)
    {
        if([[snake objectForKey:@"status"] isEqualToString:@"dead"])
            continue;
        
        NSArray* body = [snake objectForKey:@"body"];
        
        for(NSArray* pix in body)
        {
            rec = CGRectMake([[pix lastObject] integerValue], [[pix firstObject] integerValue], 1, 1);
            CGContextFillRect(context,rec);
        }
    }
    
    NSArray* cells = [json objectForKey:@"cells"];
    
    for(NSDictionary* cell in cells)
    {
        NSString* content = [cell objectForKey:@"content"];
        NSInteger row = [[cell objectForKey:@"row"] integerValue];
        NSInteger col = [[cell objectForKey:@"col"] integerValue];
        
        if([content isEqualToString:@"fruit"])
        {
            CGContextSetFillColorWithColor(context, [[self fruitColor] CGColor]);
        }
        else if([content isEqualToString:@"wall"])
        {
            CGContextSetFillColorWithColor(context, [[self wallColor] CGColor]);
        }

        rec = CGRectMake(col, row, 1, 1);
        CGContextFillRect(context,rec);
    }
                          
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
