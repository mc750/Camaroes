//
//  DonationManager.h
//  CiDaDoE
//
//  Created by Luiz Fernando on 5/15/14.
//  Copyright (c) 2014 lf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Donation.h"

@interface DonationManager : NSObject

+(DonationManager *) sharedManager;

-(void) addNewDonationWithItemName: (NSString *) itemName itemCategory: (DonationCategory ) category andItemDescription: (NSString *)description
                       requestedBy: (NSString *) requester withDropLocation : (CLLocation *) location;

-(NSMutableArray *) getAllDonations;

@end
