//
//  YBExampleCell.m
//  TopAligned Example
//
//  Created by Yoeri Boven on 14-04-14.
//  Copyright (c) 2014 Yoeri.me. All rights reserved.
//

#import "YBExampleCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation YBExampleCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 92, 92)];
        self.avatarView.image = [UIImage imageNamed:@"Robin van Persie-ava"];
        self.avatarView.layer.cornerRadius = 45.0f;
        self.avatarView.layer.masksToBounds = YES;
        self.avatarView.layer.borderColor = [UIColor blackColor].CGColor;
        self.avatarView.layer.borderWidth = 1.0f;
        [self.contentView addSubview:self.avatarView];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.avatarView.frame) + 4, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) - CGRectGetMaxY(self.avatarView.frame))];
        self.nameLabel.font = [UIFont fontWithName:@"Avenir-Roman" size:16.0];
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
        self.nameLabel.lineBreakMode = NSLineBreakByCharWrapping;
        [self.contentView addSubview:self.nameLabel];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat textHeight = [self.nameLabel.text boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.nameLabel.frame), MAXFLOAT)
                                                           options:NSStringDrawingUsesLineFragmentOrigin
                                                        attributes:@{NSFontAttributeName : self.nameLabel.font}
                                                           context:nil].size.height;
    
    self.nameLabel.frame = CGRectMake(0, CGRectGetMaxY(self.avatarView.frame) + 4, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) - CGRectGetMaxY(self.avatarView.frame));
    self.nameLabel.numberOfLines = (int)ceilf(textHeight) / 22;
}

@end
