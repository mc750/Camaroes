//
//  MapViewController.h
//  CiDaDoE
//
//  Created by Luiz Fernando on 5/13/14.
//  Copyright (c) 2014 lf. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MKAnnotationView;

@interface MapViewController : UIViewController

-(void)calloutBubbleTapped:(MKAnnotationView *)view;

@end
