//
//  SRMotorcyclesViewController.m
//  SRCustomTableViews
//
//  Created by sailon ransom on 8/19/12.
//  Copyright (c) 2012 sailon ransom. All rights reserved.
//

#import "SRMotorcyclesViewController.h"
#import "SRMotorcycleDetailViewController.h"
#import "SRMotorcycleLookup.h"
#import "SRMotorcycle.h"
#import "SRMotorcycleCell.h"

@interface SRMotorcyclesViewController ()

@end

@implementation SRMotorcyclesViewController

@synthesize motorcyclesTableView;

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Motorcycle Categories";
}

- (void)viewDidUnload
{
    [self setMotorcyclesTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Data

- (NSArray *)categories {
    SRMotorcycleLookup *lookup = [[SRMotorcycleLookup alloc] init];
    return [lookup categories];
}

- (NSString *)categoryForSection:(NSInteger)section {
    NSString *category = [[self categories] objectAtIndex:section];
    return category;
}

- (NSArray *)motorcyclesInCategory:(NSString *)category {
    SRMotorcycleLookup *lookup = [[SRMotorcycleLookup alloc] init];
    return [lookup motorcyclesForCategory:category];
}

- (SRMotorcycle *)motorcycleForIndexPath:(NSIndexPath *)indexPath {
    NSString *category = [self categoryForSection:indexPath.section];
    SRMotorcycle *motorcycle = [[self motorcyclesInCategory:category] objectAtIndex:indexPath.row];
    
    return motorcycle;
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self categories] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *category = [self categoryForSection:section];
    NSArray *motorcyclesInCategory = [self motorcyclesInCategory:category];
    
    return [motorcyclesInCategory count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self categoryForSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CellIdentifier";
    SRMotorcycle *motorcycle = [self motorcycleForIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = [[SRMotorcycleCell alloc] initWithMotorcycle:motorcycle
                                              indexPath:indexPath
                                        reuseIdentifier:CellIdentifier
                                              tableView:self.motorcyclesTableView
                                               delegate:self];

    return cell;
}

#pragma mark - White Detail Button Delegate

- (void)tableView:(UITableView *)tableView whiteDetailButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    SRMotorcycle *motorcycle = [self motorcycleForIndexPath:indexPath];
    
    SRMotorcycleDetailViewController *motorcycleDetailVC = [[SRMotorcycleDetailViewController alloc] initWithNibName:@"SRMotorcycleDetailViewController" bundle:nil];
    motorcycleDetailVC.motorcycle = motorcycle;
    
    [self.navigationController pushViewController:motorcycleDetailVC animated:YES];
}

@end
