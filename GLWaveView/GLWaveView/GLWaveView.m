//
//  GLWaveView.m
//  GLWaveView
//
//  Created by GrayLand on 17/3/7.
//  Copyright © 2017年 GrayLand. All rights reserved.
//

#import "GLWaveView.h"

@interface GLWaveView()

@property (nonatomic, strong) CADisplayLink *displayLink;

@end

@implementation GLWaveView

@synthesize waves = _waves;

#pragma mark - Getter

- (NSMutableArray <CAShapeLayer *> *)waves {
    
    if (!_waves) {
        _waves = [NSMutableArray array];
    }
    
    return _waves;
}

- (CADisplayLink *)displayLink {
    
    if (!_displayLink) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(onDisplayFrameUpadte:)];
    }
    
    return _displayLink;
}

#pragma mark - Public
- (void)startWaveAnimate {
    
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)stopWaveAnimate {
    
    if (_displayLink) {
        [_displayLink invalidate];
        _displayLink = nil;
    }
}


/**
 *  添加波形
 *
 *  @param wave
 */
- (void)addWave:(GLWave *)wave {
    
    [self.waves addObject:wave];
    [self.layer addSublayer:wave];
}

- (void)removeAllWaves {
    
    [self.waves performSelector:@selector(removeFromSuperlayer)];
    [self.waves removeAllObjects];
}

#pragma mark - Private

- (void)drawWave:(GLWave *)wave {
    
    CGFloat width = self.bounds.size.width;
    CGFloat t     = M_PI * 2 / wave.width;
    CGFloat y     = 0;
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    for (CGFloat x = 0; x < width; x++) {
        
        y = wave.height * sin(t * x + wave.offsetX * t) + wave.offsetY;
        
        if (x == 0) {
            CGPathMoveToPoint(path, NULL, x, y);
            continue;
        }
        
        CGPathAddLineToPoint(path, NULL, x, y);
    }
    
    CGPathAddLineToPoint(path, NULL, width, self.bounds.size.height);
    CGPathAddLineToPoint(path, NULL, 0, self.bounds.size.height);
    CGPathCloseSubpath(path);
    
    wave.path = path;
    
    CGPathRelease(path);
}

#pragma mark - onEvent

- (void)onDisplayFrameUpadte:(CADisplayLink *)sender {
    
    if (_willUpdateBlock) {
        _willUpdateBlock(self);
    }
    
    for (GLWave *wave in self.waves) {
        [self drawWave:wave];
        
        wave.offsetX += wave.speedX;
    }
    
    
}

@end
