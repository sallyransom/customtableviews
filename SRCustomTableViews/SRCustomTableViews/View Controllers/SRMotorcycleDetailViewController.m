//
//  SRMotorcycleDetailViewController.m
//  SRCustomTableViews
//
//  Created by sailon ransom on 8/20/12.
//  Copyright (c) 2012 sailon ransom. All rights reserved.
//

#import "SRMotorcycleDetailViewController.h"
#import "SRInfoCell.h"
#import "SRSpecificationsCell.h"
#import "SRMotorcycleImageView.h"
#import "SRWhiteDetailButton.h"

@interface SRMotorcycleDetailViewController ()

@end

typedef enum {
    INFO_ROW = 0,
    VIEW_MORE_ROW,
    SPECIFICATIONS_ROW,
    numberOfRows
    
} DetailTableRows;

@implementation SRMotorcycleDetailViewController

@synthesize detailTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.motorcycle.name;
}

- (void)viewDidUnload
{
    [self setDetailTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return numberOfRows;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case INFO_ROW:
            return @"Info";
            break;
        case SPECIFICATIONS_ROW:
            return @"Specifications";
            break;
            
        default:
            break;
    }
    
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    SRWhiteDetailButton *whiteDetailButton = [[SRWhiteDetailButton alloc] initWithTableView:self.detailTableView delegate:self indexPath:indexPath];
    
    if (!cell) {
        switch (indexPath.section) {
            case INFO_ROW:
                cell = [[SRInfoCell alloc] initWithMotorcycle:self.motorcycle reuseIdentifier:CellIdentifier];
                break;
            case VIEW_MORE_ROW:
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                cell.textLabel.text = @"View More Online";
                cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"darkbkg.jpg"]];
                cell.textLabel.textColor = [UIColor whiteColor];
                cell.accessoryView = whiteDetailButton;
                break;
            case SPECIFICATIONS_ROW:
                cell = [[SRSpecificationsCell alloc] initWithMotorcycle:self.motorcycle reuseIdentifier:CellIdentifier];
                break;
                
            default:
                break;
        }
    }
    
    return cell;
}

#pragma mark - Table View Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case INFO_ROW:
            return [SRInfoCell heightForCellWithMotorcycle:self.motorcycle];
            break;
        case SPECIFICATIONS_ROW:
            return [SRSpecificationsCell heightForCell];
            break;
            
        default:
            break;
    }
    
    return 44.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == INFO_ROW) {
        return [[SRMotorcycleImageView alloc] initWithMotorcycle:self.motorcycle];
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    switch (section) {
        case INFO_ROW:
            return [SRMotorcycleImageView height];
            break;
        case SPECIFICATIONS_ROW:
            return 25.0;
            break;
            
        default:
            break;
    }
    
    return 0.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == VIEW_MORE_ROW) {
        NSURL *url = [NSURL URLWithString:self.motorcycle.link];
        [[UIApplication sharedApplication] openURL:url];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
