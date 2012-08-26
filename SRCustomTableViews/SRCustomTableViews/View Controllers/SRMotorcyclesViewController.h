//
//  SRMotorcyclesViewController
//  SRCustomTableViews
//
//  Created by sailon ransom on 8/19/12.
//  Copyright (c) 2012 sailon ransom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SRWhiteDetailButton.h"

@interface SRMotorcyclesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, SRWhiteDetailButtonDelegate>

@property (weak, nonatomic) IBOutlet UITableView *motorcyclesTableView;

@end
