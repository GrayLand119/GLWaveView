# GLWaveView

一个自带波形动画的View, 可以添加多层波浪且方便自定义

效果如下:

![demo](https://github.com/GrayLand119/GLWaveView/blob/master/FitLineTest2.gif)

## 使用方法

使用三部曲:

1. 创建并添加 **GLWaveView** 到视图当中
2. 给 **GLWaveView** 对象添加 GLWave
3. 调用 **startWaveAnimate**

完整代码如下:

```objc
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
```

### GLWave

为了方便理解和配置动画参数 GLWave 的所有单位均以屏幕像素为单位. 

GLWave 有如下 public property:

```objc
@property (nonatomic, assign) CGFloat offsetX;///< x 位置的偏移量, default is 3
@property (nonatomic, assign) CGFloat offsetY;///< y 位置的偏移量, default is 0

@property (nonatomic, assign) CGFloat height;///< 波浪高度 单位:pixel, default is 50
@property (nonatomic, assign) CGFloat width;///< 波浪宽度 单位:pixel, default is 470

@property (nonatomic, assign) CGFloat speedX;///<系统默认帧率60fps, 每帧会进行一次 offsetX+=speedX操作
@property (nonatomic, assign) CGFloat speedY;///<系统默认帧率60fps, 每帧会进行一次 offsetY+=speedY操作
```

如下图所示, width 就是波形一个周期的宽度, height 就是波形的振幅, speedX 就是每1/60秒波形x轴方向上唯一的距离

![algorithmImage](https://github.com/GrayLand119/GLWaveView/blob/master/WaveViewDemo1.png)

