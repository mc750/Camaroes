//
//  DonationDetailViewController.m
//  CiDaDoE
//
//  Created by Luiz Fernando on 5/13/14.
//  Copyright (c) 2014 lf. All rights reserved.
//

#import "DonationDetailViewController.h"
#import "Donation.h"
#import <QuartzCore/QuartzCore.h>

@interface DonationDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *distanceTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *deliveryMethodTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contactTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation DonationDetailViewController

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
    
#warning CIRI MUST REFACTOR!!!
    CLLocation *location = [[CLLocation alloc] initWithLatitude:-22.8159717 longitude:-47.072263];
    
    self.distanceTitleLabel.text = [NSString stringWithFormat:@"Distância: %.1fkm", [location distanceFromLocation:self.donation.dropLocation]/1000];
    self.itemTitleLabel.text = [NSString stringWithFormat:@"Item: %@", self.donation.itemName];
    
#warning CIRI MUST ADD \/
    //self.deliveryMethodTitleLabel.text = [NSString stringWithFormat:@"Método de Entrega: %@", self.donation.deliveryMethod];
    
    self.contactTitleLabel.text = [NSString stringWithFormat:@"Contato: %@", self.donation.requesterName];
    
#warning SET IMAGE
    self.imageView.image = [UIImage imageNamed:@"sofa"];
    self.imageView.layer.cornerRadius = self.imageView.frame.size.width/2;
    self.imageView.layer.masksToBounds = YES;
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

@end
