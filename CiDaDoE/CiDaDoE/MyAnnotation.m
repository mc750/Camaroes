//
//  Tweet.m
//  SimpleTweet
//
//  Created by Luiz Fernando 2 on 3/19/14.
//  Copyright (c) 2014 Luiz Fernando 2. All rights reserved.
//

#import "MyAnnotation.h"
#import "MapViewController.h"

@implementation MyAnnotation

@synthesize title, subtitle, coordinate;

- (id)initWithTitle:(NSString *)ttl coordinate:(CLLocationCoordinate2D)c2d andMapViewController:(MapViewController *)mapViewController{
	self = [super init];
    
    if(self) {
        title = ttl;
        coordinate = c2d;
        self.mapViewController = mapViewController;
    }
	return self;
}

- (MKAnnotationView *) annotationView {
    MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:self reuseIdentifier:@"CustomAnnotation"];
    
    annotationView.enabled = YES;
    annotationView.canShowCallout = YES;
    
    //set the right button
    UIImageView *disclosure = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"disclosure_indicator"]];
    annotationView.rightCalloutAccessoryView = disclosure;
    
    return annotationView;
}

@end
