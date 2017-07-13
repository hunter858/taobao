1. 简单介绍一个工程目录
![](http://ooynqqqkg.bkt.clouddn.com/step1.png)

2. 工程入口
![](http://ooynqqqkg.bkt.clouddn.com/step2.png)


>首页的核心，其实就是抽象 `tableview` 的`Control` 层，将`cell`的处理 ，数据的赋值，以及点击`cell` 的交互，放到了 `viewModel` 层；

>我们知道，实现`tableview`,一般在控制器需要实现`tableiv `的 `delegate`方法 和`dataSource`方法

>`TableViewDataModel` 囊括了tableView  所有需要展示的cell， 响应>tableivew 的cell 高度，以及cell 的点击事件，具体可以看看 >`TableViewDataModel ` 的实现过程，其实就是抽象化；

3. 我们来看一下，viewModel 具体如何实现的
  homeViewModel 有一个  setData:(void (^)())callback{} 方法
  ![](http://ooynqqqkg.bkt.clouddn.com/step3.png)
  
  
在这个方法内，我们 发送网络请求拿到首页的数据；
这里楼主不再一一赘述，我是通过charles 抓的taobao 的数据，写成 json 文件放在了本地，所以，你可以看到 ；LoadData 方法 就是一个加载本地 数据的方法，
![](http://ooynqqqkg.bkt.clouddn.com/step4.png)


4. 这个数据我们，可以怎么看，在工程内部，如果你有charles ，可以直接打开session ，看到数据结构长什么样子，然后把数据拷贝出来，放到 chrome 的json handel 里，这样数据结构清晰可见；如图
![](http://ooynqqqkg.bkt.clouddn.com/step6.png)
![](http://ooynqqqkg.bkt.clouddn.com/step7.1.png)
![](http://ooynqqqkg.bkt.clouddn.com/step7.3.png)
  
5. 仔细研究数据结构，你就会明白，淘宝的整个数据结构是 什么样的，它是通过给首页数据的
 ![](http://ooynqqqkg.bkt.clouddn.com/step10.png)


6. 数据结构看的怎么样了，把url 放到浏览器中，参考着 taobao的 H5 页面，就知道哪个图片是taobao哪个模块的了,taobao链接:[https://m.taobao.com/#index](https://m.taobao.com/#index)

7. 我们来看看，我们是如何实现第一个cell 的显示的；
是不是理解起来不是很复杂，简单点讲，就是
1.创建一个cell
2.创建一个cellModel
3.给cellModel 一个cell （当cellModel 响应tableview 的  方法）；
4.给cellModel 一个cell高度 （当cellModel 响应tableview 的  方法）；
5.给cellModel 一个点击Block （当cellModel 响应tableview 的  方法）；
6.把cellModel 放到 TableViewDataModel 的section 里面；
😄，就是这个道理，等你想明白了，就理解了，
 ![](http://ooynqqqkg.bkt.clouddn.com/step8.png)


8. 来看看我们的 - (id)initWithFrame:(CGRect)frame 方法；
这其实就是加载xib 的方法，只是写的更 安全一些，为什么要用xib 呢，因为xib 做布局 比用代码更快；
![](http://ooynqqqkg.bkt.clouddn.com/step9.png)
 
9. 这里以首个cell 的滚动轮播器为例，把SDCycleScrollView 放到contentView 上，
![](http://ooynqqqkg.bkt.clouddn.com/step11.png)

10. 声明一个传数据的方法，把数据传进来，滚动轮播器就出来啦，是不是很简单；
![](http://ooynqqqkg.bkt.clouddn.com/step13.png)


11. 在cell 的外部，我们声明一个block 属性，用于判断点击了 第几张图， 实现SDCycleScrollView 的代理方法， 把跳转的URL 传递到 homeviewModel 里，这样我们是不是能根据URL 进行跳转了，对，就是这么简单，具体实现，你去工程里慢慢看；
![](http://ooynqqqkg.bkt.clouddn.com/step14.png)


12. 看明白了吗，没看明白我再讲一个cell ，
以淘宝的大菜单为例，拿到10 条数据的我， 创建一个个小的 smallIconView ，从上往下，依次排列 成2 行，每行 5个的 cell，如图所示，是不是样子出来了，
 ![](http://ooynqqqkg.bkt.clouddn.com/step15.png)


smallIconView 其实不是普通的UIview  ，创建的时候是个UIview ，但是UIView 本身没有点击事件，所以，我把UIView 换成了 UIcontrol 
![](http://ooynqqqkg.bkt.clouddn.com/step10.png)


13. 最后在赋值数据的 时候，给每个 小的 Control 添加一个方法 ，利用ReactiveCocoa 给它添加一个点击事件，把跳转URL 传到homeViewModel中 ，是不是很简单
![](http://ooynqqqkg.bkt.clouddn.com/step16.png)

14. 后面的很多cell 也是同样的道理 都写在了 -(void)setData:(void (^)())callback 方法里;
15. 因为 后面的跳转，我都是通过一个UIwebview 来显示的，所以不做过多赘述，如果你的项目比较复杂，可以把URL 传到工具里，利用工厂生成不同到UIViewControl 跳转到指定的控制器；
