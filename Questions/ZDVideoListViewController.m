//
//  ZDVideoListViewController.m
//  wisdomConstruction
//
//  Created by asia wang on 16/9/29.
//  Copyright © 2016年 wangasia. All rights reserved.
//

#import "ZDVideoListViewController.h"
#import "ZDVideoListCell.h"


@interface ZDVideoListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@property (strong,nonatomic) NSMutableArray *dataArray;
@property (strong,nonatomic) NSMutableArray *selectedAarray;

@end

@implementation ZDVideoListViewController


- (void)setIsEdit:(BOOL)isEdit {

    _isEdit = isEdit;
    if (_isEdit) {
        self.bottomView.hidden = NO;
    }else {
        self.bottomView.hidden = YES;
    }
    [self.tableView reloadData];
}


- (void)testData {
    [self.dataArray removeAllObjects];
    for (int i = 0; i < 10; i++) {
        NSDictionary *dict = @{@"state":[NSString stringWithFormat:@"%@",i % 2 == 0?@"已下载":@"下载中"],@"date":@"2016-08-08至2016-09-30",@"downData":@"8M",@"allData":@"8M"};
        [self.dataArray addObject:dict];
    }
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _dataArray = [NSMutableArray array];
    self.bottomView.hidden = YES;
    _selectedAarray = [NSMutableArray array];
    
    if (self.sourceArray) {
        [self.dataArray addObjectsFromArray:self.sourceArray];
    }
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ZDVideoListCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"videoListCellIndentify"];
    [self testData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.zdParentController.title = self.title;
    self.isEdit = NO;
    [self testData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {

    if (_zdVideoType == ZDVideoListViewControllerType_Local) {
        
    }else {
        
    }
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (NSArray<UITableViewRowAction *>*)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *tableAction1 = [[UITableViewRowAction alloc] init];
    tableAction1.title = @"继续";
    tableAction1.backgroundColor = [UIColor orangeColor];
    
    UITableViewRowAction *tableAction2 = [[UITableViewRowAction alloc] init];
    tableAction2.title = @"删除";
    tableAction2.backgroundColor = [UIColor orangeColor];

    return @[tableAction1,tableAction2];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZDVideoListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"videoListCellIndentify"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ZDVideoListCell" owner:nil options:nil]lastObject];
    }
    
    NSDictionary *dict = self.dataArray[indexPath.row];
    cell.sourceDictionary = dict;
    
    cell.index = indexPath.row;
    cell.isEdit = self.isEdit;
    
    if (self.isEdit) {
        if (self.selectedAarray.count > 0) {
            BOOL isExist = NO;
            for (int i = 0; i < self.selectedAarray.count; i++) {
                NSIndexPath *sIndexpath = self.selectedAarray[i];
                if ([sIndexpath isEqual: indexPath]) {
                    isExist = YES;
                    break;
                }
            }
            if (isExist) {
                cell.isSelected = YES;
            }else {
                cell.isSelected = NO;
            }
        }else {
            cell.isSelected = NO;
        }
    }else {
        cell.isSelected = NO;
    }
    
    __weak __typeof(self)weakSelf = self;
    cell.selectedBlock = ^ (NSInteger index) {
        BOOL isExist = NO;
        if (weakSelf.selectedAarray.count > 0) {
            for (int i = 0; i < weakSelf.selectedAarray.count; i++) {
                NSIndexPath *sIndexpath = weakSelf.selectedAarray[i];
                if (sIndexpath.row == index) {
                    isExist = YES;
                    break;
                }
            }
            if (isExist) {
                [weakSelf.selectedAarray removeObject:indexPath];
            }else {
                [weakSelf.selectedAarray addObject:indexPath];
            }
        }else {
            [weakSelf.selectedAarray addObject:indexPath];
        }
        [weakSelf.tableView reloadData];
    };
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 60.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
- (IBAction)selectedAllAction:(id)sender {
    if (self.isEdit) {
        for (int i = 0; i < self.dataArray.count; i++) {
            NSIndexPath *path = [NSIndexPath indexPathForRow:i inSection:0];
            [self.selectedAarray addObject:path];
        }
        [self.tableView reloadData];
    }
    
}
- (IBAction)deleteAction:(id)sender {
    
    if (self.isEdit) {
        if (self.selectedAarray.count > 0) {
            for (int i = 0; i < self.selectedAarray.count; i++) {
                NSIndexPath *path = self.selectedAarray[i];
                [self.dataArray removeObjectAtIndex:path.row];
            }
        }
        [self.tableView reloadData];
    }
}
- (IBAction)stopAction:(id)sender {

    if (self.isEdit) {
        
    }
}
- (IBAction)startAction:(id)sender {

    if (self.isEdit) {
        
    }
}

- (void)viewDidDisappear:(BOOL)animated {

    [super viewDidDisappear:animated];
    self.bottomView.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
