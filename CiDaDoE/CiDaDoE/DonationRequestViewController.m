//
//  DonationRequestViewController.m
//  CiDaDoE
//
//  Created by Francesco Perrotti-Garcia on 6/7/14.
//  Copyright (c) 2014 lf. All rights reserved.
//

#import "DonationRequestViewController.h"
#import "DonationManager.h"
#import "MyLocationManager.h"
#import "Donation.h"

@interface DonationRequestViewController ()
@property (weak, nonatomic) IBOutlet UITextField *itemName;
@property (weak, nonatomic) IBOutlet UITextView *itemDescription;
@property (weak, nonatomic) IBOutlet UITextField *requesterName;

@end

@implementation DonationRequestViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveRequest:(id)sender
{
    if ((![self.itemName.text isEqualToString:@""]) && (![self.itemDescription.text isEqualToString:@""]) && (![self.requesterName.text isEqualToString:@""]))
    {
        #warning Ciri must add dynamic location
        //Latitude e Longitude de Campinas
        CLLocation *location = [[CLLocation alloc] initWithLatitude:-22.8159717 longitude:-47.072263];
        
        [[DonationManager sharedManager] addNewDonationWithItemName:self.itemName.text itemCategory:Others andItemDescription:self.itemDescription.text requestedBy:self.requesterName.text withDropLocation:location];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erro" message:@"Por favor preencha todos os campos" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alert show];
    }
}

- (IBAction)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
