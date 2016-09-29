//
//  ZDVideoListViewController.h
//  wisdomConstruction
//
//  Created by asia wang on 16/9/29.
//  Copyright © 2016年 wangasia. All rights reserved.
//

#import "ZDViewController.h"

typedef NS_ENUM(NSInteger,ZDVideoListViewControllerType) {

    ZDVideoListViewControllerType_Local,
    ZDVideoListViewControllerType_Server,
};

@interface ZDVideoListViewController : ZDViewController

@property (nonatomic,strong) UIViewController *zdParentController;
@property (nonatomic,assign) ZDVideoListViewControllerType zdVideoType;
@property (nonatomic,strong) NSArray *sourceArray;
@property (nonatomic,assign) BOOL isEdit;
@end
