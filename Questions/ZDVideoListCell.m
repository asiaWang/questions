//
//  ZDVideoListCell.m
//  wisdomConstruction
//
//  Created by asia wang on 16/9/29.
//  Copyright © 2016年 wangasia. All rights reserved.
//

#import "ZDVideoListCell.h"
#import "Masonry.h"

@interface ZDVideoListCell()
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UILabel *downloadDataLabel;
@property (weak, nonatomic) IBOutlet UILabel *allDataLabel;
@property (weak, nonatomic) IBOutlet UIButton *selectedButton;

@end


@implementation ZDVideoListCell


- (void)setSourceDictionary:(NSDictionary *)sourceDictionary {
    
    if (sourceDictionary) {
        _sourceDictionary = sourceDictionary;

        self.dateLabel.text = _sourceDictionary[@"date"];
        self.stateLabel.text = _sourceDictionary[@"state"];
        self.downloadDataLabel.text = _sourceDictionary[@"downData"];
        self.allDataLabel.text = _sourceDictionary[@"allData"];
    }
}

- (void)setIsEdit:(BOOL)isEdit {
    
    _isEdit = isEdit;
    
    if (_isEdit) {
        self.selectedButton.hidden = NO;
        
        [self.dateLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(30.f);
            make.top.mas_equalTo(self.dateLabel.superview.mas_top);
            make.right.mas_equalTo(self.dateLabel.superview.mas_right);
            make.height.mas_equalTo(21.f);
        }];
        [self.stateLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(30.f);
            make.top.mas_equalTo(self.dateLabel.mas_bottom).offset(8.f);
            make.width.mas_equalTo(50.f);
            make.height.mas_equalTo(21.f);
        }];
        [self.downloadDataLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.stateLabel.mas_right).offset(2.f);
            make.top.mas_equalTo(self.dateLabel.mas_bottom).offset(8.f);
            make.width.mas_equalTo(84.f);
            make.height.mas_equalTo(21.f);
        }];
        [self.allDataLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downloadDataLabel.mas_right).offset(2.f);
            make.top.mas_equalTo(self.dateLabel.mas_bottom).offset(8.f);
            make.width.mas_equalTo(84.f);
            make.height.mas_equalTo(21.f);
        }];

        
    }else {
        self.selectedButton.hidden = YES;
        
        [self.dateLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5.f);
            make.top.mas_equalTo(self.dateLabel.superview.mas_top);
            make.right.mas_equalTo(self.dateLabel.superview.mas_right);
            make.height.mas_equalTo(21.f);
        }];
        [self.stateLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5.f);
            make.top.mas_equalTo(self.dateLabel.mas_bottom).offset(8.f);
            make.width.mas_equalTo(50.f);
            make.height.mas_equalTo(21.f);
        }];
        [self.downloadDataLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.stateLabel.mas_right).offset(2.f);
            make.top.mas_equalTo(self.dateLabel.mas_bottom).offset(8.f);
            make.width.mas_equalTo(84.f);
            make.height.mas_equalTo(21.f);
        }];
        [self.allDataLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downloadDataLabel.mas_right).offset(2.f);
            make.top.mas_equalTo(self.dateLabel.mas_bottom).offset(8.f);
            make.width.mas_equalTo(84.f);
            make.height.mas_equalTo(21.f);
        }];
    }
}

- (void)setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;
    if (_isSelected) {
        [self.selectedButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }else {
        [self.selectedButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }
}

- (IBAction)selectedAction:(id)sender {
    
    if (self.selectedBlock) {
        self.selectedBlock(self.index);
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.dateLabel.adjustsFontSizeToFitWidth = YES;
    self.stateLabel.adjustsFontSizeToFitWidth = YES;
    self.downloadDataLabel.adjustsFontSizeToFitWidth = YES;
    self.allDataLabel.adjustsFontSizeToFitWidth = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
