//
//  ViewController.m
//  GLWaveView
//
//  Created by GrayLand on 17/3/7.
//  Copyright © 2017年 GrayLand. All rights reserved.
//

#import "ViewController.h"
#import "GLWave.h"
#import "GLWaveView.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    GLWaveView *view = [[GLWaveView alloc] initWithFrame:self.view.bounds];
    
    GLWave *waveA = [GLWave defaultWave];
    waveA.offsetX = 100;
    waveA.offsetY = 300;
    waveA.height  = 20;
    waveA.width   = 550;
    waveA.speedX  = 6;
    waveA.fillColor = [UIColor colorWithRed:0.000 green:0.502 blue:1.000 alpha:0.450].CGColor;
    
    GLWave *waveB = [GLWave defaultWave];
    waveB.offsetX = 300;
    waveB.offsetY = 305;
    waveB.height  = 15;
    waveB.width   = 750;
    waveB.speedX  = 9;
    waveB.fillColor = [UIColor colorWithRed:0.000 green:0.502 blue:1.000 alpha:0.250].CGColor;
    
    [view addWave:waveB];
    [view addWave:waveA];

    [self.view addSubview:view];
    
    [view startWaveAnimate];
    
}

@end
