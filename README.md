# PreLoader
#####一个能高度吸引用户注意力的加载等待器，再长的等待也不怕了
#####A Loading Indicator to draw attention effectively.
######Design by [Volodymyr Kurbatov](https://dribbble.com/shots/2053042-Preloader-free-aep)   

![](https://img.shields.io/badge/pod-v0.3.1-blue.svg)
![](https://img.shields.io/badge/language-objc-5787e5.svg)
![](https://img.shields.io/badge/license-MIT-brightgreen.svg)
<br>
<br>

![](https://raw.githubusercontent.com/liuzhiyi1992/MyStore/master/PreLoader/PreLoaderDisplay.gif)   

<br>
##Usage:
```objc
PreLoader *preLoader = [[PreLoader alloc] initWithFrame:CGRectMake(60, 300, 250, 250)
                                                      color:spotColor
                                            backgroundColor:[UIColor clearColor]];
                                            
[self.view addSubview:preLoader];
```  

<br>
##CocoaPods:  
```
pod 'PreLoader', '~> 0.3.1'
```

<br>
##Relation:  
[@liuzhiyi1992](https://github.com/liuzhiyi1992) on Github  
[@Blog](http://zyden.vicp.cc/)  Welcome

<br>
##License:  
PreLoader is released under the MIT license. See LICENSE for details.

