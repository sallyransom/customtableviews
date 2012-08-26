//
//  SRMotorcycleCell.h
//  SRCustomTableViews
//
//  Created by sailon ransom on 8/25/12.
//  Copyright (c) 2012 sailon ransom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SRMotorcycle.h"

@interface SRMotorcycleCell : UITableViewCell

- (id)initWithMotorcycle:(SRMotorcycle *)motorcycle
               indexPath:(NSIndexPath *)indexPath
         reuseIdentifier:(NSString *)reuseIdentifier
               tableView:(UITableView *)tableView
                delegate:(id)delegate;

@end
