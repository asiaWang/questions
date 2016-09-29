//
//  ZDVideoListCell.h
//  wisdomConstruction
//
//  Created by asia wang on 16/9/29.
//  Copyright © 2016年 wangasia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDVideoListCell : UITableViewCell

@property (nonatomic,copy) NSString *dateString;
@property (nonatomic,copy) NSString *stateString;
@property (nonatomic,copy) NSString *downloadString;
@property (nonatomic,copy) NSString *allString;

@property (nonatomic,assign) NSInteger index;
@property (nonatomic,strong) NSDictionary *sourceDictionary;
@property (nonatomic,copy) void (^selectedBlock)(NSInteger index);

@property (nonatomic,assign) BOOL isEdit;
@property (nonatomic,assign) BOOL isSelected;
@end
