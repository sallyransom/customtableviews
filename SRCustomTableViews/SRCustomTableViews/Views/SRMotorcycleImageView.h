//
//  SRMotorcycleImageView.h
//  SRCustomTableViews
//
//  Created by sailon ransom on 8/23/12.
//  Copyright (c) 2012 sailon ransom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SRMotorcycle.h"

@interface SRMotorcycleImageView : UIView

- (id)initWithMotorcycle:(SRMotorcycle *)motorcycle;

+ (CGFloat)height;

@end
