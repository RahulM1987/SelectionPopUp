//
//  ViewController.m
//  CustomControl
//
//  Created by Rahul Morade on 29/03/16.
//  Copyright © 2016 Rahul Morade. All rights reserved.
//

#import "ViewController.h"
#import "CustomCtrl.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    CGFloat height = [[UIScreen mainScreen] bounds].size.height;
    CustomCtrl * cust = [[CustomCtrl alloc]initWithFrame:CGRectMake(50, 200, 100, 60)];
    cust.center = CGPointMake(width/2, height/2);
    [self.view addSubview:cust];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
