//
//  ZDListView.m
//  wisdomConstruction
//
//  Created by asia wang on 16/9/23.
//  Copyright © 2016年 wangasia. All rights reserved.
//

#import "ZDListView.h"
#import "ZDProjectManageHead.h"
#import "NSDictionary+SafeDictionary.h"

@interface ZDListView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,assign) ZDListViewSlectedType state;
@property (nonatomic,strong) NSMutableArray *sourceArray;

@property (assign) NSInteger firstNode;
@property (assign) NSInteger secondNode;
@property (assign) NSInteger threeNode;
@property (assign) NSInteger fourNode;

@property (assign) NSInteger nodeMax; // 数据层数
@end

@implementation ZDListView

- (instancetype)init {
    
    self = [super init];
    if (self) {
        [self initConstObject];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initConstObject];
    }
    return self;
}

- (void)initConstObject {
    _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self addSubview:_tableView];
    
    [_tableView registerNib:[UINib nibWithNibName:@"ZDProjectManageCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"projectManageIndentify"];
    [_tableView registerNib:[UINib nibWithNibName:@"ZDProjectManageHead" bundle:[NSBundle mainBundle]] forHeaderFooterViewReuseIdentifier:@"projectManageHeadIndentify"];
    
    self.state = ZDListViewSlectedType_None;
    _sourceArray = [NSMutableArray array];
}

- (void)refreshConstData {
    self.firstNode = -1;
    self.secondNode = -1;
    self.threeNode = -1;
    self.fourNode = -1;
    self.nodeMax = 1;
    
    self.nodeMax = 3;
}

- (void)refreshMaxNode:(NSArray *)listArray {
    for (int i = 0; i < listArray.count; i++) {
        id object = listArray[i];
        if ([object isKindOfClass:[NSArray class]]) {
            
        }
    }
    
}

- (void)refreshData:(NSArray *)listArray {
    
    [self refreshConstData];
    if (listArray && listArray.count > 0) {
        [self refreshMaxNode:listArray];
        [self.sourceArray addObjectsFromArray:listArray];
        [self.tableView reloadData];
    }
}


#pragma mark -  tableView delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.sourceArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    id object = self.sourceArray[section];
    if (self.state == ZDListViewSlectedType_None) {
        if ([object isKindOfClass:[NSDictionary class]]) {
            NSDictionary *firstDictionary = (NSDictionary *)object;
            NSInteger rowMax;
            if (self.nodeMax == 3) {
                if (firstDictionary[@"list"]) {
                    NSArray *secondeArray = (NSArray *)firstDictionary[@"list"];
                    rowMax = secondeArray.count;
                    for (int i = 0; i < secondeArray.count; i++) {
                        NSDictionary *dict = secondeArray[i];
                        if (dict[@"list"]) {
                            NSArray *threeArray = dict[@"list"];
                            rowMax += threeArray.count;
                        }
                    }
                }
            }
            return rowMax;
        }else {
            return 0;
        }
    }else if (self.state == ZDListViewSlectedType_FirstNode){
        return 0;
    }else if (self.state == ZDListViewSlectedType_SecondNode){
        if (self.firstNode == section) {
            if ([object isKindOfClass:[NSDictionary class]]) {
                NSDictionary *firstDictionary = (NSDictionary *)object;
                if (firstDictionary[@"list"]) {
                    NSArray *secondeArray = (NSArray *)firstDictionary[@"list"];
                    return secondeArray.count;
                }
            }else {
                return 0;
            }
        }else {
            return 0;
        }
    }else if (self.state == ZDListViewSlectedType_ThreeNode){
        if (self.firstNode == section) {
            if ([object isKindOfClass:[NSDictionary class]]) {
                NSDictionary *firstDictionary = (NSDictionary *)object;
                NSInteger rowMax;
                if (firstDictionary[@"list"]) {
                    NSArray *secondeArray = (NSArray *)firstDictionary[@"list"];
                    rowMax = secondeArray.count;
                    for (int i = 0; i < secondeArray.count; i++) {
                        NSDictionary *dict = secondeArray[i];
                        if (dict[@"list"]) {
                            NSArray *threeArray = dict[@"list"];
                            if (self.secondNode == i) {
                                rowMax += threeArray.count;
                            }
                        }
                    }
                }
                return rowMax;
            }else {
                return 0;
            }
        }
    }else if (self.state == ZDListViewSlectedType_FourNode){
        
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIndentify"];
    
    NSDictionary *firstDictionary = self.sourceArray[indexPath.section];
    if (self.state == ZDListViewSlectedType_None) {
        NSArray *secondArray = firstDictionary[@"list"];
        if (indexPath.row == 0) {
            // 第一个二级节点
            NSDictionary *secDict = secondArray[indexPath.row];
            NSDictionary *sdict = secDict[@"node"];
            NSLog(@"second node");
        }else {
            // 三级节点
            for (int i = 0; i < secondArray.count; i++) {
                
            }
        }
        
    }else if (self.state == ZDListViewSlectedType_SecondNode) {
        
    }else if (self.state == ZDListViewSlectedType_ThreeNode) {
        
    }else if (self.state == ZDListViewSlectedType_FourNode) {
        
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dcit = self.sourceArray[indexPath.section];
    NSArray *array = dcit[@"list"];
    NSInteger maxRow = -1;
    
    if (self.state == ZDListViewSlectedType_None || self.state == ZDListViewSlectedType_ThreeNode) {
        for (int i = 0; i < array.count; i++) {
            NSDictionary *secondDictionary = array[i];
            maxRow +=1;
            if (indexPath.row == maxRow) {
                
                self.secondNode = indexPath.row;
                self.state = ZDListViewSlectedType_SecondNode;
                self.firstNode = indexPath.section;
                [self.tableView reloadData];
            }else {
                NSArray *threeArray = secondDictionary[@"list"];
                for (int j = 0; j < threeArray.count; j++) {
                    maxRow++;
                    if (maxRow == indexPath.row) {
                        NSDictionary *resultDictionary = array[j];
                        NSLog(@"找到当前点击的cell了");
                        self.threeNode = indexPath.row;
                        self.state = ZDListViewSlectedType_ThreeNode;
                    }
                }
            }
        }
    }else if (self.state == ZDListViewSlectedType_FirstNode) {
        
    }else if (self.state == ZDListViewSlectedType_SecondNode) {
        for (int i = 0; i < array.count; i++) {
            maxRow +=1;
            if (indexPath.row == maxRow) {
                
                self.secondNode = indexPath.row;
                self.state = ZDListViewSlectedType_ThreeNode;
                self.firstNode = indexPath.section;
                [self.tableView reloadData];
            }
        }
    }else if (self.state == ZDListViewSlectedType_FourNode) {
        
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ZDProjectManageHead *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"projectManageHeadIndentify"];
    if (!headView) {
        headView = [[[NSBundle mainBundle]loadNibNamed:@"ZDProjectManageHead" owner:nil options:nil]lastObject];
    }
    headView.section = section;
    headView.backgroundView.backgroundColor = [UIColor whiteColor];
    
    NSDictionary *dict = self.sourceArray[section];
    NSDictionary *dataDict = dict[@"node"];
    headView.title  = [dataDict safeStringValueForKey:@"teamName"];
    
    __weak __typeof(self)weakSelf = self;
    headView.didSelcted = ^(NSInteger oldSection) {
        
        if (oldSection == weakSelf.firstNode) {
            [weakSelf refreshConstData];
        }else {
            weakSelf.firstNode = oldSection;
            weakSelf.secondNode = -1;
            weakSelf.threeNode = -1;
        }
        weakSelf.state = ZDListViewSlectedType_FirstNode;
        
        [weakSelf.tableView reloadData];
    };
    return headView;
    
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
