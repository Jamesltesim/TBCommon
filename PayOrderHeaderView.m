//
//  PayOrderHeaderView.m
//  Test897
//
//  Created by Toby on 2017/11/18.
//  Copyright © 2017年 Verge. All rights reserved.
//

#import "PayOrderHeaderView.h"


@implementation PayOrderHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(15, self.frame.size.height/2-20, 40, 40)];
        _imgView.backgroundColor = [UIColor yellowColor];
        [self addSubview:_imgView];
        
        _priceLab = [[UILabel alloc]initWithFrame:CGRectMake(_imgView.frame.origin.x+_imgView.frame.size.width+10, _imgView.frame.origin.y, 200, 22)];
        [self addSubview:_priceLab];
        _priceLab.font = [UIFont systemFontOfSize:15];
        _storeNameAndNumberLab = [[UILabel alloc]initWithFrame:CGRectMake(_priceLab.frame.origin.x, _priceLab.frame.origin.y+_priceLab.frame.size.height, _priceLab.frame.size.width, _priceLab.frame.size.height)];
        _storeNameAndNumberLab.font = [UIFont systemFontOfSize:12];
        [self addSubview:_storeNameAndNumberLab];
    }
    return self;
}

@end
