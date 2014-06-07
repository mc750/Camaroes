//
//  Tweet.h
//  SimpleTweet
//
//  Created by Luiz Fernando 2 on 3/19/14.
//  Copyright (c) 2014 Luiz Fernando 2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Donation.h"
#import <MapKit/MapKit.h>

@class MapViewController;

@interface MyAnnotation : NSObject <MKAnnotation> {
    CLLocationCoordinate2D coordinate;
    NSString *title;
    NSString *subtitle;
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) MapViewController *mapViewController;

@property (strong, nonatomic) Donation *donation;

-(id)initWithTitle:(NSString *)ttl coordinate:(CLLocationCoordinate2D)c2d andMapViewController: (MapViewController*) mapViewController;

- (MKAnnotationView *) annotationView;

@end
