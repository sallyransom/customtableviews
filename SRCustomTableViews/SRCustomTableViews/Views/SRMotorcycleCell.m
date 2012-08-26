//
//  SRMotorcycleCell.m
//  SRCustomTableViews
//
//  Created by sally ransom on 8/25/12.
//  Copyright (c) 2012 sally ransom. All rights reserved.
//

#import "SRMotorcycleCell.h"
#import "SRWhiteDetailButton.h"

@implementation SRMotorcycleCell

// NOTE: To use the SRWhiteDetailButton's detailButtonTapped method, the delegate must adopt the SRWhiteDetailButtonDelegate protocol

- (id)initWithMotorcycle:(SRMotorcycle *)motorcycle
               indexPath:(NSIndexPath *)indexPath
         reuseIdentifier:(NSString *)reuseIdentifier
               tableView:(UITableView *)tableView
                delegate:(id)delegate {
    
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.text = motorcycle.name;
        self.textLabel.textColor = [UIColor whiteColor];
        self.detailTextLabel.text = [NSString stringWithFormat:@"%dcc", motorcycle.engine];
        self.detailTextLabel.textColor = [UIColor whiteColor];
        self.imageView.image = motorcycle.thumbnail;
        self.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        SRWhiteDetailButton *whiteDetailButton = [[SRWhiteDetailButton alloc] initWithTableView:tableView delegate:delegate indexPath:indexPath];
        self.accessoryView = whiteDetailButton;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
