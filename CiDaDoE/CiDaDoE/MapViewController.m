//
//  MapViewController.m
//  SimpleTweet
//
//  Created by Luiz Fernando 2 on 3/19/14.
//  Copyright (c) 2014 Luiz Fernando 2. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "MyAnnotation.h"
#import "DonationManager.h"
#import "MyLocationManager.h"
#import "DonationDetailViewController.h"

@interface MapViewController () <MKMapViewDelegate, UIPopoverControllerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) UIPopoverController *popover;

@property (strong, nonatomic) Donation *selectedDonation;
@end

@implementation MapViewController

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
    [self restoreAllAnotations];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didUpdateLocation:) name:@"LocationUpdate" object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) restoreAllAnotations {
    NSMutableArray *donations = [[DonationManager sharedManager] getAllDonations];

    for (Donation *donation in donations) {
        MyAnnotation *annotation = [[MyAnnotation alloc] initWithTitle:donation.itemName andCoordinate:donation.dropLocation.coordinate];
        annotation.donation = donation;
        [self.mapView addAnnotation:annotation];
    }
    Donation *donation = [donations lastObject];
    MKCoordinateRegion region = MKCoordinateRegionMake(donation.dropLocation.coordinate, MKCoordinateSpanMake(0.5, 0.5));
    [self.mapView setRegion:region animated:YES];
}

- (IBAction)touch:(UILongPressGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        CGPoint touchPoint = [sender locationInView:self.mapView];
        
        CLLocationCoordinate2D coords = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
        NSLog(@"%.1f %.1f",coords.latitude, coords.longitude);
        MyAnnotation  *annotation = [[MyAnnotation alloc] initWithTitle:@"HUE" andCoordinate:coords];
        [self.mapView addAnnotation:annotation];
    }
}

-(void) didUpdateLocation:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    CLLocation *lastLocation = [userInfo objectForKey:@"NewLocation"];
    
    [self.mapView setCenterCoordinate:lastLocation.coordinate animated:YES];
}

#pragma mark - MKMapViewDelegate
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    
    if ([annotation isKindOfClass:[MyAnnotation class]]) {
        MyAnnotation *favoriteAnnotation = (MyAnnotation *)annotation;
        
        MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomAnnotation"];
        
        if (annotationView == nil) {
            annotationView = [favoriteAnnotation annotationView];
        } else {
            annotationView.annotation = annotation;
        }
        
        return annotationView;
    } else {
        return nil;
    }
}



- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view
calloutAccessoryControlTapped:(UIControl *)control
{
    NSLog(@"accessory button tapped for annotation %@", view.annotation);
    if ([view.annotation isKindOfClass:[MyAnnotation class]]) {
        MyAnnotation *annotation = view.annotation;
        [self performSegueWithIdentifier:@"SegueFromMapToDetail" sender:annotation.donation];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *vc = [segue destinationViewController];
    
    if ([vc isKindOfClass:[DonationDetailViewController class]]) {
        DonationDetailViewController *destination = (DonationDetailViewController *)vc;

        destination.donation = (Donation *)sender;
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
