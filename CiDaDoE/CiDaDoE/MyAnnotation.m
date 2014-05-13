//
//  Tweet.m
//  SimpleTweet
//
//  Created by Luiz Fernando 2 on 3/19/14.
//  Copyright (c) 2014 Luiz Fernando 2. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation

@synthesize title, subtitle, coordinate;

- (id)initWithTitle:(NSString *)ttl andCoordinate:(CLLocationCoordinate2D)c2d {
	self = [super init];
    
    if(self) {
        title = ttl;
        coordinate = c2d;
    }
	return self;
}

- (MKAnnotationView *) annotationView {
    MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:self reuseIdentifier:@"CustomAnnotation"];
    
    
    annotationView.enabled = YES;
    annotationView.canShowCallout = YES;
    
    return annotationView;
}


@end
