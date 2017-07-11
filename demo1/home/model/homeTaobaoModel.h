//
//  homeTaobaoModel.h
//  demo1
//
//  Created by pengchao on 2017/7/9.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import <JSONModel/JSONModel.h>


@protocol imageUrl;
@protocol passOnTrack;
@protocol trackParam;
@protocol itemsModel;
@protocol sectionModel;
@protocol titleModel ;



//第五步：最后一步记得核对工具里的模型和自己写的jsonModle 模型是不是一样

//第四层 item 里面还有一部分是对象模型，需要再深一层解析；[捂脸]

@interface imageUrl : JSONModel
@property (nonatomic,strong)NSString *imgUrl;
@end

@interface passOnTrack : JSONModel
@property (nonatomic,strong)NSString *trackInfo;
@end

@interface trackParam : JSONModel
@property (nonatomic,strong)NSString *args;
@property (nonatomic,strong)NSString *spm;
@property (nonatomic,strong)NSString *Page;
@property (nonatomic,strong)NSString *event_id;
@property (nonatomic,strong)NSString *arg1;
@end


@interface  titleModel: JSONModel
@property (nonatomic,strong)NSString *keyDesc;
@property (nonatomic,strong)NSString *valueDesc;
@end


//第三层 再往里走的第三层数据 item 数据
@interface itemsModel : JSONModel
@property (nonatomic,strong)NSString *bizType;
@property (nonatomic,strong)NSString *exposure;
@property (nonatomic,strong)NSString *t_id;
@property (nonatomic,strong)NSMutableArray <titleModel> *title;
@property (nonatomic,strong)NSMutableArray <imageUrl> *imageUrl;
@property (nonatomic,strong)passOnTrack *passOnTrack;
@property (nonatomic,strong)NSString *targetUrl;
@property (nonatomic,strong)trackParam *trackParam;
@property (nonatomic,strong)NSString *valid;
@end



//第二层级的数据，包括轮播数据，推荐数据 等……
@interface sectionModel : JSONModel
@property (nonatomic,strong)NSString *group;
@property (nonatomic,strong)NSString *t_id;
@property (nonatomic,strong)NSMutableArray <itemsModel> *items;
@property (nonatomic,strong)NSString *t_template;
@property (nonatomic,strong)NSString *templateUrl;
@property (nonatomic,strong)NSString *type;
@property (nonatomic,strong)NSString *version;

@end


//最外层的数据 （data 里面的数据）；
@interface homeTaobaoModel : JSONModel

@property (nonatomic,strong)NSString *interval;
@property (nonatomic,strong)NSMutableArray <sectionModel> *section;
@property (nonatomic,strong)NSString *timeStamp;
@property (nonatomic,strong)NSString *traceId;




@end
