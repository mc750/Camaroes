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


@interface MapViewController () <MKMapViewDelegate, UIPopoverControllerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) UIPopoverController *popover;

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didUpdateLocation:) name:@"LocationUpdate" object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
