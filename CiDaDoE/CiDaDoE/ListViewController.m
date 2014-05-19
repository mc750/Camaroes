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

@interface ListViewController () <UITableViewDataSource>


@property (strong, nonatomic) NSArray *data;
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDataSource

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    Donation *donation = [self.data objectAtIndex:indexPath.row];

    cell.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.3f];
    cell.textLabel.text = donation.itemName;
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld m" , (indexPath.row + 1)* 100];
    
    
#warning CIRI MUST REFACTOR!!!
    CLLocation *location = [[CLLocation alloc] initWithLatitude:-22.8159717 longitude:-47.072263];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ (%.0fm)", donation.requesterName, [location distanceFromLocation:donation.dropLocation]];
    
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


@end
