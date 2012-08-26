//
//  SRInfoCell.h
//  SRCustomTableViews
//
//  Created by sailon ransom on 8/22/12.
//  Copyright (c) 2012 sailon ransom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SRMotorcycle.h"

@interface SRInfoCell : UITableViewCell

- (id)initWithMotorcycle:(SRMotorcycle *)motorcycle reuseIdentifier:(NSString *)reuseIdentifier;

+ (CGFloat)heightForCellWithMotorcycle:(SRMotorcycle *)motorcycle;

@end
