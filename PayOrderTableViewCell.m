//
//  PayOrderTableViewCell.m
//  Test897
//
//  Created by Toby on 2017/11/18.
//  Copyright © 2017年 Verge. All rights reserved.
//

#import "PayOrderTableViewCell.h"

@implementation PayOrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.sselectImage.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedImageTap:)];
    [self.sselectImage addGestureRecognizer:tap];
}

- (void)selectedImageTap:(UITapGestureRecognizer *)tap {
    if([self.delegate respondsToSelector:@selector(payOrderCellAtIndex:)]){
        [self.delegate payOrderCellAtIndex:self.indexPath];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
