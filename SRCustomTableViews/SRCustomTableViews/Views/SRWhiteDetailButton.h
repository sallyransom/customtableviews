//
//  SRWhiteDetailButton.h
//  SRCustomTableViews
//
//  Created by sailon ransom on 8/25/12.
//  Copyright (c) 2012 sailon ransom. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SRWhiteDetailButton;
@protocol SRWhiteDetailButtonDelegate <NSObject>
@optional
- (void)tableView:(UITableView *)tableView whiteDetailButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath;
@end

@interface SRWhiteDetailButton : UIButton

@property (nonatomic, strong) id <SRWhiteDetailButtonDelegate> delegate;

- (id)initWithTableView:(UITableView *)tableView delegate:(id)delegate indexPath:(NSIndexPath *)indexPath;

@end
