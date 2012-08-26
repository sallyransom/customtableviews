//
//  SRMotorcycleImageView.m
//  SRCustomTableViews
//
//  Created by sailon ransom on 8/23/12.
//  Copyright (c) 2012 sailon ransom. All rights reserved.
//

#import "SRMotorcycleImageView.h"

#define WIDTH 320.0
#define HEIGHT 210.0
#define VIEW_MARGIN 10.0

@implementation SRMotorcycleImageView

- (id)initWithMotorcycle:(SRMotorcycle *)motorcycle {
    CGRect frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    self = [super initWithFrame:frame];
    if (self) {
        CGRect imageViewFrame = CGRectMake(VIEW_MARGIN, VIEW_MARGIN, WIDTH-VIEW_MARGIN*2, HEIGHT);
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageViewFrame];
        imageView.image = motorcycle.image;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imageView];
    }
    return self;
}

+ (CGFloat)height {
    return HEIGHT + VIEW_MARGIN*2;
}

@end
