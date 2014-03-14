//
//  HSPinPadViewController.m
//  PinPad
//
//  Created by Hermoso Cariaga on 3/14/14.
//  Copyright (c) 2014 Hercsoft. All rights reserved.
//

#import "HSPinPadViewController.h"
#import "FXBlurView.h"

@interface HSPinPadViewController ()
@property (nonatomic, strong) FXBlurView *blurView;
@end

@implementation HSPinPadViewController
@synthesize blurView;

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIImageView *imgBackground = (UIImageView*)[self.view viewWithTag:100];
    blurView = [[FXBlurView alloc] initWithFrame:imgBackground.frame];
    blurView.blurRadius = 20.0f;
    [imgBackground addSubview:blurView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
