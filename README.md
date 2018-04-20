### 高仿淘宝首页
------
使用说明：

1. `git clone https://github.com/hunter858/taobao.git` copy项目
2. `pod update` 引入第三方依赖包
3.  双击打开 `.xcworkspace`的文件  运行即可

![](http://ooynqqqkg.bkt.clouddn.com/taobao-ok.gif)


### 项目用到的开源库
-------
1. AFNetworking 网络请求
2. Masonry 轻量级的布局框架
3. SDWebImage 加载网络图片和缓存图片
4. reactcocoa 函数式编程


####  
-------
### 项目截图
![](http://opevtrwe5.bkt.clouddn.com/Simulator222.png)
![](http://opevtrwe5.bkt.clouddn.com/Simulator333.png)
![](http://opevtrwe5.bkt.clouddn.com/Simulator111.png)




------

####效果图
![taobao-ok.gif](http://upload-images.jianshu.io/upload_images/1716313-1a0be969f9a17d8a.gif?imageMogr2/auto-orient/strip)

>github 传送门: [https://github.com/hunter858/taobao](https://github.com/hunter858/taobao)
如果你喜欢我写的demo 请给我点个✨✨✨✨ 谢谢🙏😊

>工程用的cocoapods 做的依赖管理，新下载的小伙伴 请用`pod  update` 更新库；

####截图
![](http://upload-images.jianshu.io/upload_images/1716313-0beda016a0996f80.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 1.1  简单介绍工程目录
![](http://upload-images.jianshu.io/upload_images/1716313-12ee89884d7f6a82.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 1.2. 工程入口
![](http://upload-images.jianshu.io/upload_images/1716313-1926ca19557867aa.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


>首页的核心，其实就是抽象 `tableview` 的`Control` 层，将`cell`的处理 ，数据的赋值，以及点击`cell` 的交互，放到了 `viewModel` 层；

>我们知道，实现`tableview`,一般在控制器需要实现`tableiv `的 `delegate`方法 和`dataSource`方法

>`TableViewDataModel` 囊括了tableView  所有需要展示的cell， 响应tableivew 的cell 高度，以及cell 的点击事件，具体可以看看 `TableViewDataModel ` 的实现过程，其实就是抽象化对象；


* 1.3 我们来看一下，viewModel 具体如何实现的


 >`homeViewModel ` 初始化，成为`UItableView `的代理，`homeViewModel `实现`tableview `的所有代理方法。 ` -setData:(void (^)())callback{}` 方法加载数据,完成后通过block 回调 刷新tableview；

 ![](http://upload-images.jianshu.io/upload_images/1716313-60721d00ffb00f9e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
  
  
>在这个方法内，我们发送网络请求拿到首页的数据（我是通过[charles](https://www.charlesproxy.com/)抓的taobao 的数据，写成 json 文件放在了本地）；
所以你假装网络请求到了数据；`-(vodi)LoadData `方法 是加载本地 数据的方法;

![](http://upload-images.jianshu.io/upload_images/1716313-3cb8f543b7465301.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

> 在工程内部有个文件夹放着 [.chls]() 和 [.json]()的文件，如果你有charles ，可以直接打开[.chls]() ，拿到数据，然后把数据拷贝出来，放到 chrome 的 [json handel](http://jsonhandle.sinaapp.com/) 里，这样数据结构清晰可见；如图所示

![](http://upload-images.jianshu.io/upload_images/1716313-1aeb02270bbe2a6c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![](http://upload-images.jianshu.io/upload_images/1716313-0be78b50a147e64e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![](http://upload-images.jianshu.io/upload_images/1716313-d24e3c910329693e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
  
 仔细研究数据结构，你就会在里面找到规律，淘宝的整个数据结构是什么样子，它是如何排版整改页面的；

 ![](http://upload-images.jianshu.io/upload_images/1716313-5d1cf11114cb2746.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


如果不太清楚数据的归属模块，可以把`url `放到浏览器中，参考着`taobao `的`H5 ` 页面，就知道哪个图片是`taobao `哪个模块的了,taobao链接:[https://m.taobao.com/#index](https://m.taobao.com/#index)

![](http://upload-images.jianshu.io/upload_images/1716313-6a1be24edf4b7bc3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


* 1.4 我们来看看，我们是如何实现第一个cell 的显示的；
* 创建流程
   1. 创建一个cell
   2. 创建一个cellModel
   3. 给cellModel 一个cell （当cellModel 响应tableview 的  方法）；
   4. 给cellModel 一个cell高度 （当cellModel 响应tableview 的  方法）；
   5. 给cellModel 一个点击Block （当cellModel 响应tableview 的  方法）；
   6. 把cellModel 放到 TableViewDataModel 的section 里面；

等TableViewDataModel 响应了tableivew 的代理方法的时候，页面就出来了；嗯嗯、就是这么回事，等你想明白了，就理解了
 ![](http://upload-images.jianshu.io/upload_images/1716313-6cf37628b39f47e3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



`UItableivewCell `我是通过` - (id)initWithFrame:(CGRect)frame `方法创建的；这其实就是加载xib 的方法，只是这样写更安全一些，为什么要用xib 呢，因为xib 做布局 比用代码更快；
![](http://upload-images.jianshu.io/upload_images/1716313-912a0b218224eda6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
 
 通过cell 响应 ` setSeparatorInset:` `setLayoutMargins :`  这两个方法，可以设置`UItableview `的分割线的长度,让其显示不显示；


这里以首个`cell `的滚动轮播器为例，把`SDCycleScrollView `放到`contentView `上，
![](http://upload-images.jianshu.io/upload_images/1716313-4deb9891a40914aa.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

声明一个赋值方法，把数据传进来，滚动轮播器就出来，是不是很简单；
![](http://upload-images.jianshu.io/upload_images/1716313-500c4fe828b38258.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


在cell 的外部，我们声明一个`block `属性，用于判断点击了 第几张图， 实现`SDCycleScrollView `的代理方法， 把跳转的URL 传递到`homeviewModel ` 里，这样我们是不是能根据`URL `进行跳转了，对，就是这么简单，具体实现，你去工程里慢慢看；
![](http://upload-images.jianshu.io/upload_images/1716313-3bf86e5a4e3a5e65.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


差不多明白了吧，没看明白我再讲一个cell ，
以淘宝的菜单为例，拿到10 条数据的我， 创建一个个小的  `smallIconView `，从上往下，依次排列成2 行，每行 5个的`cell `，如图所示，是不是样子出来了，
 ![](http://upload-images.jianshu.io/upload_images/1716313-541ac7dae21751a0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


项目中的`smallIconView `其实不是普通的`UIview ` ，创建的时候是个`UIview `，但是`UIView `本身没有点击事件，所以，我把`UIView `换成了`UIcontrol ` ;

![](http://upload-images.jianshu.io/upload_images/1716313-5d1cf11114cb2746.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


最后在赋值数据的 时候，给每个 小的`Control ` 添加一个方法 ，利用`ReactiveCocoa `给它添加一个点击事件，把跳转URL 传到`homeViewModel `中 ，是不是很简单
![](http://upload-images.jianshu.io/upload_images/1716313-41e116df0053c7f4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

后面的很多`cell `也是同样的道理 都写在了` -(void)setData:(void (^)())callback `方法里;

因为 后面的跳转，我都是通过一个`UIWebview ` 来显示的，所以不做过多赘述，如果你的项目比较复杂，可以把`URL `传到工具里，利用工厂生成不同的`UIViewControl `跳转到指定的控制器；

如果你喜欢我写的 [demo](https://github.com/hunter858/taobao)
 请给我点个✨✨✨✨ 谢谢🙏