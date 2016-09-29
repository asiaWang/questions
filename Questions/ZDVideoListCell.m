//
//  ZDVideoListCell.m
//  wisdomConstruction
//
//  Created by asia wang on 16/9/29.
//  Copyright © 2016年 wangasia. All rights reserved.
//

#import "ZDVideoListCell.h"

@interface ZDVideoListCell()
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UILabel *downloadDataLabel;
@property (weak, nonatomic) IBOutlet UILabel *allDataLabel;

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
