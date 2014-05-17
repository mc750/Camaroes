//
//  MyLocationManager.m
//  SimpleTweet
//
//  Created by Luiz Fernando 2 on 3/21/14.
//  Copyright (c) 2014 Luiz Fernando 2. All rights reserved.
//

#import "MyLocationManager.h"

@interface MyLocationManager() <CLLocationManagerDelegate>

@property (strong,nonatomic) CLLocationManager *locationManager;
@end

static MyLocationManager *sharedManagerConfig = nil;

@implementation MyLocationManager

+ (MyLocationManager *) sharedManager
{
    
    if (!sharedManagerConfig)
    {
        sharedManagerConfig = [[super allocWithZone:nil] init];
        [sharedManagerConfig configureLocationManager];
    }
    
    return sharedManagerConfig;
}

-(void) configureLocationManager {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    self.locationManager.delegate = self;
}

-(void) startUpdatingLocation {
    [self.locationManager startUpdatingLocation];
}
-(void) stopUpdatingLocation {
    [self.locationManager stopUpdatingLocation];
}
#pragma mark - CLLocationManagerDelegate

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLCircularRegion *previousRegion = [[CLCircularRegion alloc] initWithCenter:self.previousCoordinate radius:100 identifier:@"PreviousRegion"];
    CLLocation *currentLocation = [locations lastObject];
    
    if(![previousRegion containsCoordinate:currentLocation.coordinate]) {
        self.previousCoordinate = currentLocation.coordinate;
        
        NSDictionary *dictionary = [NSDictionary dictionaryWithObject:currentLocation forKey:@"NewLocation"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"LocationUpdate" object:nil userInfo:dictionary];
    }
}

@end
