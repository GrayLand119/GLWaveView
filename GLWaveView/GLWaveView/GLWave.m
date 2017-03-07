//
//  GLWaveViewConfig.m
//  GLWaveView
//
//  Created by GrayLand on 17/3/7.
//  Copyright © 2017年 GrayLand. All rights reserved.
//

#import "GLWave.h"

@implementation GLWave


+ (instancetype)defaultWave {
    
    GLWave *wave = [GLWave layer];
    
    wave.offsetX = 0.0f;
    wave.offsetY = 0.0f;
    
    wave.height = 25.0f;
    wave.width  = 470.0f;
    
    wave.speedX = 3;
    wave.speedY = 0;
    
    wave.fillColor = [UIColor colorWithRed:0.000 green:0.502 blue:1.000 alpha:1.000].CGColor;
    
    return wave;
    
}

@end
