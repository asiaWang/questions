//
//  ZDListView.h
//  wisdomConstruction
//
//  Created by asia wang on 16/9/23.
//  Copyright © 2016年 wangasia. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, ZDListViewSlectedType) {
    ZDListViewSlectedType_None,
    ZDListViewSlectedType_FirstNode,
    ZDListViewSlectedType_SecondNode,
    ZDListViewSlectedType_ThreeNode,
    ZDListViewSlectedType_FourNode,
};
@interface ZDListView : UIView


// listArray 数据类型
/*
 * 每一个元素为一个字典
 * @{@"node":dict,
     @"list":array
    }
 *
 */

- (void)refreshData:(NSArray *)listArray;

@end
