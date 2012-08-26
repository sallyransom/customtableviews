//
//  SRWhiteDetailButton.m
//  SRCustomTableViews
//
//  Created by sailon ransom on 8/25/12.
//  Copyright (c) 2012 sailon ransom. All rights reserved.
//

#import "SRWhiteDetailButton.h"

@interface SRWhiteDetailButton ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSIndexPath *indexPath;
@end

@implementation SRWhiteDetailButton

- (id)initWithTableView:(UITableView *)tableView delegate:(id)delegate indexPath:(NSIndexPath *)indexPath{
    self.tableView = tableView;
    self.delegate = delegate;
    self.indexPath = indexPath;
    
    UIImage *image = [UIImage imageNamed:@"whitedetailbtn.png"];
    CGRect frame = CGRectMake(0.0, 0.0, image.size.width, image.size.height);
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundImage:image forState:UIControlStateNormal];
        [self addTarget:self action:@selector(detailButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)detailButtonTapped:(id)sender {
    if ([self.delegate respondsToSelector:@selector(tableView:whiteDetailButtonTappedForRowWithIndexPath:)]) {
        [self.delegate tableView:self.tableView whiteDetailButtonTappedForRowWithIndexPath:self.indexPath];
    }
}

@end
