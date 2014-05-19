//
//  Donation.h
//  CiDaDoE
//
//  Created by Luiz Fernando on 5/15/14.
//  Copyright (c) 2014 lf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef enum : NSUInteger
{
    Others,
    Clothing,
    HouseItems,
    Food,
} DonationCategory;

@interface Donation : NSObject

@property (strong, nonatomic) NSString *itemName;
@property (strong, nonatomic) NSString *description;

@property (strong, nonatomic) NSString *requesterName;
@property (strong, nonatomic) CLLocation *dropLocation;

@property (nonatomic) DonationCategory itemCategory;
@property (nonatomic) BOOL wasCompleted;

-(NSString *) getDistanceStringFromCurrentLocationToDropLocation;
-(CGFloat ) getDistanceValueFromCurrentLocationToDropLocation;

@end
