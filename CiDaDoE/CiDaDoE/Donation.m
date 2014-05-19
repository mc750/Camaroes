//
//  Donation.m
//  CiDaDoE
//
//  Created by Luiz Fernando on 5/15/14.
//  Copyright (c) 2014 lf. All rights reserved.
//

#import "Donation.h"

@implementation Donation

-(NSString *)getDistanceStringFromCurrentLocationToDropLocation {
    CLLocation *location = [[CLLocation alloc] initWithLatitude:-22.8159717 longitude:-47.072263];
    CGFloat distance = [location distanceFromLocation:self.dropLocation];
    return [NSString stringWithFormat:@"%.1f km" ,distance/1000 ];
}

-(CGFloat )getDistanceValueFromCurrentLocationToDropLocation {
    CLLocation *location = [[CLLocation alloc] initWithLatitude:-22.8159717 longitude:-47.072263];
    CGFloat distance = [location distanceFromLocation:self.dropLocation];
    return distance;
}
@end
