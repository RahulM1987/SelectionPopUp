//
//  CustomCtrl.m
//  CustomControl
//
//  Created by Rahul Morade on 29/03/16.
//  Copyright © 2016 Rahul Morade. All rights reserved.
//

#import "CustomCtrl.h"

@implementation CustomCtrl

UITableView * tableView;
CGPoint location;
UIView * background;

- (id)initWithFrame:(CGRect)aRect
{
    self = [super initWithFrame:aRect];
    if (nil != self)
    {
        [self ViewSetupandLayout:aRect];
    }
    return self;
}


- (void)ViewSetupandLayout: (CGRect )GetRect
{
    self.frame = GetRect;
    NSLog(@"%@",NSStringFromCGRect(GetRect));
    UILabel * title = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, GetRect.size.width-20, GetRect.size.height-20)];
    title.text = @"Click me";
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor grayColor];
    [self addSubview:title];
    tableView = [[UITableView alloc]initWithFrame:CGRectMake(10, 20, 300, 450)];
    tableView.userInteractionEnabled = YES;
    tableView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    self.layer.cornerRadius = 10;
    self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.layer.borderWidth = 2;
    background = [[UIView alloc]initWithFrame:CGRectMake(location.x, location.y, [[UIScreen mainScreen] bounds].size.width+10, [[UIScreen mainScreen] bounds].size.height+10)];
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    [self addGestureRecognizer:singleFingerTap];
}

//The event handling method
- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    location = [recognizer locationInView:[recognizer.view superview]];
    NSLog(@"Tap received");
    [self AddingTableView];
    tableView.center = CGPointMake([[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height/2);

    [UIView animateWithDuration:0.0
                          delay:.0
         usingSpringWithDamping:0.7
          initialSpringVelocity:1.8
                        options:(UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         tableView.transform = CGAffineTransformMakeScale(0, 0);
                         background.transform = CGAffineTransformMakeScale(0, 0);
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.5
                                               delay:0.0
                              usingSpringWithDamping:0.9
                               initialSpringVelocity:1.8
                                             options:0
                                          animations:^{
                                              tableView.transform = CGAffineTransformIdentity;
                                              background.transform = CGAffineTransformIdentity;
                                              tableView.alpha = 1;
                                          }completion:nil];
                     }];
    
}

- (void)AddingTableView
{
    tableView.delegate=self;
    tableView.dataSource= self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [background addSubview:tableView];
    [background setBackgroundColor:[[UIColor clearColor] colorWithAlphaComponent:0.5]];
    background.center = CGPointMake([[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height/2);
    [[[UIApplication sharedApplication] keyWindow] addSubview:background];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = @"text";
    cell.textLabel.textColor = [UIColor whiteColor];
    
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor colorWithRed:190.0/255.0 green:190.0/255.0 blue:204.0/255.0   alpha:0.9];
    [cell setSelectedBackgroundView:bgColorView];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor colorWithRed:0.0/255.0 green:45.0/255.0 blue:65.0/255.0   alpha:0.9];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"did select");
    
    [tableView setTransform:CGAffineTransformMakeScale(1.0, 1.0)];
    [UIView animateWithDuration:0.3
                          delay:0.0
         usingSpringWithDamping:0.8
          initialSpringVelocity:1.5
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         tableView.center = location;
                         background.center = location;
                         tableView.transform = CGAffineTransformMakeScale(0.01, 0.01);
                         background.transform = CGAffineTransformMakeScale(0.01, 0.01);
                     }completion:^(BOOL finished) {
                         if(finished)
                         {
                             [background removeFromSuperview];
                         }
                     }];
    
}



@end
