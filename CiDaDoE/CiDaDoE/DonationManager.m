//
//  DonationManager.m
//  CiDaDoE
//
//  Created by Luiz Fernando on 5/15/14.
//  Copyright (c) 2014 lf. All rights reserved.
//

#import "DonationManager.h"
#import "MyLocationManager.h"
@interface DonationManager ()

@property (strong, nonatomic) NSMutableArray *donationArray;

@end

static DonationManager *sharedManagerConfig = nil;

@implementation DonationManager

+(DonationManager *) sharedManager {
    if (!sharedManagerConfig) {
        sharedManagerConfig = [[super allocWithZone:nil] init];
        [sharedManagerConfig setUpManager];
    }
    return sharedManagerConfig;
}

-(void) setUpManager {
    self.donationArray = [[NSMutableArray alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(createFakeData:) name:@"LocationUpdate" object:nil];
    
//hardcoded unicamp
    [self createFakeData:nil];
}

-(void) addNewDonationWithItemName: (NSString *) itemName itemCategory: (DonationCategory ) category andItemDescription: (NSString *)description requestedBy: (NSString *) requester withDropLocation : (CLLocation *) location
{
    Donation *newDonation = [[Donation alloc] init];
    newDonation.itemName = itemName;
    newDonation.itemCategory = category;
    newDonation.description = description;
    newDonation.requesterName = requester;
    newDonation.dropLocation = location;
    newDonation.wasCompleted = NO;
    
    [self.donationArray addObject:newDonation];
}

-(NSArray *) getAllDonations {
    return [self.donationArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        Donation *donation1 = (Donation *)obj1;
        Donation *donation2 = (Donation *)obj2;
        
        return [donation1 getDistanceValueFromCurrentLocationToDropLocation] - [donation2 getDistanceValueFromCurrentLocationToDropLocation];
    }];
}

-(void)removeDonation:(Donation *)donation
{
    [self.donationArray removeObject:donation];
}

#pragma mark - Hardcoded Donations
-(void) createFakeData: (NSNotification *) notification {
    //NSDictionary *userInfo = notification.userInfo;
    //CLLocation *location = [userInfo objectForKey:@"NewLocation"];
    
    //Latitude e Longitude de Campinas
    CLLocation *location = [[CLLocation alloc] initWithLatitude:-22.8159717 longitude:-47.072263];
    
    NSArray *itemNames = @[@"Sofa" , @"Geladeira", @"Agasalho", @"Alimentos", @"Colchao"];
    NSArray *requesterNames = @[@"Luiz Ciri" ,@"Joao Jonas", @"John Doe", @"Maria da Silva", @"Steve"];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    for (int i = 0 ; i < 10; i ++ ) {
        NSString *itemName = itemNames[arc4random()%itemNames.count];
        NSString *requesterName = requesterNames[arc4random()%requesterNames.count];
        
        CGFloat lat = location.coordinate.latitude + (arc4random()%100)/1000.0f;
        CGFloat lon = location.coordinate.longitude + (arc4random()%100)/1000.0f;
        
        NSLog(@"%f %f", lat,lon);
        
        CLLocation *newLocation = [[CLLocation alloc] initWithLatitude:lat longitude:lon];
        
        [self addNewDonationWithItemName:itemName itemCategory:HouseItems andItemDescription:@"Descrição do pedido pedido pedido pedido." requestedBy:requesterName withDropLocation:newLocation];
    }
}
@end
