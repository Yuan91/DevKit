# 介绍
将开发中封装的工作类代码开源，可以通过`CocoaPods`安装。包含以下内容
* `GCD`实现定时器、倒计时
* `NSDecimalNumber`高精度计算
* 一行代码实现`UITableView`占位图
* `UILabel/UIButton`的工厂类方法
* `NSString`,`NSData`,`NSDictionary`等Category
* App权限检测，以及常用宏定义等


# 使用说明
部分代码使用说明

## UITableView 占位图

### 使用

```
tableView.xx_enablePlaceholderView = YES;
tableView.xx_placeholderView = yourCustomPlaceHolderView;
```

### 原理

使用`runtime` `hook`了系统的`reloadData`和`layoutSubviews`方法，每次调用`reloadData`时会检测数据源中是否有数据，如果没有则展示自定义的展位图

相比其他类似的方案，多做一些处理是的`UITableView`在有`tableHeaderView`和`tableFooterView`时都能正确的布局

## GCDTimer

### 使用

#### 创建倒计时

```
[[GCDTimerManager sharedManager]    
    scheduledCountDownTimerWithIdentitier:@"countdownTimer" 
    totalSeconds:10 
    action:^(int remaindSeconds) {        
}];
```

#### 创建定时器

```
[[GCDTimerManager sharedManager]   
    scheduledDispatchTimerWithIdentitier:@"timerName" 
    timeInterval:1 
    repeat:YES 
    action:^{
}];
```

#### 资源回收
在界面销毁的时候调用如下方法销毁定时器
```
[[GCDTimerManager sharedManager] cancelDispatchTimerWithIdentitier:@"yourTimerName"];
```

## 高精度计算

### 示例
```
[[[@"1.111111" add:@"2.222222"] subtract:@"3.333333"] divid:@"4.444444"]
```

### 原理
内部采用`NSDecimalNumber`封装，避免了`float`和`double`数据在计算和转换过程中丢失就读的问题

同时对于`nil`字符串做了处理，避免在参数为`nil`时做成崩溃的问题

## Button 的工具类

### 使用
使用类方法封装，提供一个block的点击事件回调。可以快速的构建UIButton实例
```
//创建一个纯文本的按钮
UIButton *textButton = [ButtonFactory textButton:@"纯文本的按钮" block:^{
        
}];

//创建一个图片按钮    
UIButton *imageButton = [ButtonFactory imageButton:@"图片按钮" block:^{
        
}];

//创建一个图文混排的按钮，可以通过type 调整图片和文字的相对位置    
UIButton *adjustButton = [ButtonFactory buttonWithTitle:@"标题" 
                                                image:@"图片" 
                                                type:ButtonTypeImageTop 
                                                gap:5 
                                                block:^{
        
}];
```



## 安装

```ruby
pod 'DevKit'
```




