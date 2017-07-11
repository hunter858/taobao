//
//  homeTaobaoModel.m
//  demo1
//
//  Created by pengchao on 2017/7/9.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import "homeTaobaoModel.h"


@implementation titleModel

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}

@end

//---------------------分割线----------------------------
@implementation imageUrl

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}

@end

//---------------------分割线----------------------------
@implementation passOnTrack

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}

@end

//---------------------分割线----------------------------
@implementation trackParam

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}

@end
//---------------------分割线----------------------------
@implementation itemsModel

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}

+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"t_id"}];
}
//解决模型name 和关键字冲突问题；


@end
//---------------------分割线----------------------------
@implementation sectionModel

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}

+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"t_id",@"template":@"t_template"}];
}


@end
//---------------------分割线----------------------------

@implementation homeTaobaoModel
+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}




@end
