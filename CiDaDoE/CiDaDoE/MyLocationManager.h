//
//  MyLocationManager.h
//  SimpleTweet
//
//  Created by Luiz Fernando 2 on 3/21/14.
//  Copyright (c) 2014 Luiz Fernando 2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface MyLocationManager : NSObject


@property (nonatomic) CLLocationCoordinate2D previousCoordinate;


+ (MyLocationManager *) sharedManager;

-(void) stopUpdatingLocation;
-(void) startUpdatingLocation;
-(void) configureLocationManager;

@end
