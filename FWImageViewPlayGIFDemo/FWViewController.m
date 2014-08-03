//
//  FWViewController.m
//  FWImageViewPlayGIFDemo
//
//  Created by CyonLeu on 14-8-3.
//  Copyright (c) 2014年 CyonLeuInc. All rights reserved.
//

#import "FWViewController.h"
#import "FWGIFImageView.h"

@interface FWViewController ()<UIAlertViewDelegate>

@property (nonatomic, weak) IBOutlet FWGIFImageView *repeatOneImageView;
@property (nonatomic, weak) IBOutlet FWGIFImageView *alwaysRunImageView;

@end

@implementation FWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *gifPath = [[NSBundle mainBundle] pathForResource:@"repeatoneGIF" ofType:@"gif"];
    [self.repeatOneImageView setGIFPath:gifPath];
    self.repeatOneImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    //If you just want to paly gif repeat one, you hope do else something when it has finished .
    self.repeatOneImageView.animationRepeatCount = 1;//2,3,4,5...
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(repeatOneFinished:) name:kReapeatCountAnimationFinishedNotification object:nil];
    
    gifPath = [[NSBundle mainBundle] pathForResource:@"runGIF" ofType:@"gif"];
    [self.alwaysRunImageView setGIFPath:gifPath];
    self.alwaysRunImageView.hidden = YES;
    self.alwaysRunImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
//    [self.repeatOneImageView startAnimating];
    self.alwaysRunImageView.hidden = NO;
    [self.alwaysRunImageView startAnimating];
}

- (IBAction)showRepeatOneGIF
{
    
    [self.alwaysRunImageView stopAnimating];
    self.alwaysRunImageView.hidden = YES;
    
    self.repeatOneImageView.hidden = NO;
    [self.repeatOneImageView startAnimating];
    
}

- (IBAction)showAlwaysRunGIF
{
    [self.repeatOneImageView stopAnimating];
    self.repeatOneImageView.hidden = YES;
    
    self.alwaysRunImageView.hidden = NO;
    [self.alwaysRunImageView startAnimating];
}

- (void)repeatOneFinished:(NSNotification *)notification
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Tip" message:@"Repeat one finished , do you want to continue play GIF ?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Continue", nil];
    
    [alertView show];
    
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        //continue play GIF
        [self.repeatOneImageView startAnimating];
    }
}

@end
