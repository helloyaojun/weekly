//
//  AccessoryView.m
//  EmperorComing
//
//  Created by 姚君 on 15/8/25.
//  Copyright (c) 2015年 姚君. All rights reserved.
//

#import "AccessoryView.h"

@implementation AccessoryView

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 40)];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2" alpha:1.0f];
        
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelBtn.frame = CGRectMake(10, 7, 50, 28);
        [_cancelBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [self addSubview:_cancelBtn];
        [_cancelBtn setHidden:NO];

        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _sureBtn.frame = CGRectMake(frame.size.width-60, 7, 50, 28);
        [_sureBtn setTitleColor:[UIColor colorWithHexString:@"#dc4c49" alpha:1.0f] forState:UIControlStateNormal];
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        [self addSubview:_sureBtn];

        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 6, frame.size.width-120, 30)];
        _titleLabel.numberOfLines = 1;
        _titleLabel.font =[UIFont boldSystemFontOfSize:20.f];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor darkGrayColor];
        [self addSubview:_titleLabel];

        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 0.5)];
        line.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:line];

        UIView *buttonLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height-0.5, frame.size.width, 0.5)];
        buttonLine.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:buttonLine];

    }
    
    return self;

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
