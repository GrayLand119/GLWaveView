//
//  GLWaveViewConfig.h
//  GLWaveView
//
//  Created by GrayLand on 17/3/7.
//  Copyright © 2017年 GrayLand. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GLWave : CAShapeLayer

@property (nonatomic, assign) CGFloat offsetX;///< x 位置的偏移量, default is 3
@property (nonatomic, assign) CGFloat offsetY;///< y 位置的偏移量, default is 0

@property (nonatomic, assign) CGFloat height;///< 波浪高度 单位:pixel, default is 50
@property (nonatomic, assign) CGFloat width;///< 波浪宽度 单位:pixel, default is 470

@property (nonatomic, assign) CGFloat speedX;///<系统默认帧率60fps, 每帧会进行一次 offsetX+=speedX操作
@property (nonatomic, assign) CGFloat speedY;///<系统默认帧率60fps, 每帧会进行一次 offsetY+=speedY操作

+ (instancetype)defaultWave;

@end
