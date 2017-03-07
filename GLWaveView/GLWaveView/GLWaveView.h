//
//  GLWaveView.h
//  GLWaveView
//
//  Created by GrayLand on 17/3/7.
//  Copyright © 2017年 GrayLand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GLWave.h"

@class GLWaveView;
typedef void(^GLWaveViewWillUpdateBlock)(GLWaveView *view);

@interface GLWaveView : UIView

@property (nonatomic, strong, readonly) NSMutableArray <CAShapeLayer *> *waves;///<波形

@property (nonatomic, copy) GLWaveViewWillUpdateBlock willUpdateBlock;///<每帧刷新前调用, 用于自定义额外的波浪动画

/**
 *  添加波形
 *
 *  @param wave
 */
- (void)addWave:(GLWave *)wave;

/**
 *  移除所有波形
 */
- (void)removeAllWaves;

/**
 *  开始动画
 */
- (void)startWaveAnimate;

/**
 *  停止动画
 */
- (void)stopWaveAnimate;

@end
