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
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;


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
    
    self.distanceTitleLabel.text = [self.donation getDistanceStringFromCurrentLocationToDropLocation];
    self.itemTitleLabel.text = self.donation.itemName;
    self.descriptionTextView.text = self.donation.description;
    
#warning CIRI MUST ADD \/
    //self.deliveryMethodTitleLabel.text =  self.donation.deliveryMethod;
    self.deliveryMethodTitleLabel.text = @"Retirada";
    
    
    
    self.contactTitleLabel.text = self.donation.requesterName;
    
    UIImage *image;
    switch (self.donation.itemCategory)
    {
        case Others:
            image = [UIImage imageNamed:@"others"];
            break;
        case Clothing:
            image = [UIImage imageNamed:@"clothing"];
            break;
        case HouseItems:
            image = [UIImage imageNamed:@"houseItems"];
            break;
        case Food:
            image = [UIImage imageNamed:@"food"];
            break;
        default:
            break;
    }
    
    self.imageView.image = image;
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
