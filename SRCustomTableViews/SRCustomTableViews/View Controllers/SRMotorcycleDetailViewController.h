//
//  SRMotorcycleDetailViewController.h
//  SRCustomTableViews
//
//  Created by sailon ransom on 8/20/12.
//  Copyright (c) 2012 sailon ransom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SRMotorcycle.h"

@interface SRMotorcycleDetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) SRMotorcycle *motorcycle;

@property (weak, nonatomic) IBOutlet UITableView *detailTableView;

@end
