//
//  PayOrderTableViewCell.h
//  Test897
//
//  Created by Toby on 2017/11/18.
//  Copyright © 2017年 Verge. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PayOrderTableViewCellDelegate;

@interface PayOrderTableViewCell : UITableViewCell

@property (nonatomic,assign) id<PayOrderTableViewCellDelegate> delegate;

@property (nonatomic,strong) NSIndexPath *indexPath;
@property (weak, nonatomic) IBOutlet UIImageView *payImage;

@property (weak, nonatomic) IBOutlet UILabel *payTypeLab;
@property (weak, nonatomic) IBOutlet UIImageView *sselectImage;

@end

@protocol PayOrderTableViewCellDelegate <NSObject>

- (void)payOrderCellAtIndex:(NSIndexPath *)indexpath;

@end



