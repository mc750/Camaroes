//
//  ListViewController.m
//  CiDaDoE
//
//  Created by Luiz Fernando on 5/13/14.
//  Copyright (c) 2014 lf. All rights reserved.
//

#import "ListViewController.h"
#import "DonationDetailViewController.h"
#import "DonationManager.h"

@interface ListViewController () <UITableViewDataSource, UISearchDisplayDelegate>


@property (strong, nonatomic) NSArray *data;
@property (nonatomic, strong) NSMutableArray *searchResults;

@end

@implementation ListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.data = [[DonationManager sharedManager] getAllDonations];
    self.searchResults = [NSMutableArray arrayWithCapacity:[self.data count]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        return [self.searchResults count];
    }
    else
    {
        return [self.data count];
    } 
}
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    //It took me almost an hour to find out but if you use tableView instead of self.tableView the app WILL CRASH when searching
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    
    cell.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.3f];

    NSArray *array = (tableView == self.searchDisplayController.searchResultsTableView) ? self.searchResults : self.data;
    
    Donation *donation = [array objectAtIndex:indexPath.row];
    
    cell.textLabel.text = donation.itemName;
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ (%@) ", donation.requesterName, [donation getDistanceStringFromCurrentLocationToDropLocation] ];
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *vc = [segue destinationViewController];
    
    if ([vc isKindOfClass:[DonationDetailViewController class]]) {
        DonationDetailViewController *destination = (DonationDetailViewController *)vc;
        Donation *selectedDonation = [self.data objectAtIndex:self.tableView.indexPathForSelectedRow.row];
        destination.donation = selectedDonation;
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

#pragma mark - UISearchDislpayDelegate

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    [self.searchResults removeAllObjects];
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"itemName contains[c] %@", searchText];
    
    self.searchResults = [NSMutableArray arrayWithArray: [self.data filteredArrayUsingPredicate:resultPredicate]];

}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    return YES;
}




@end
