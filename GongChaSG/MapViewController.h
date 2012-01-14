//
//  MapViewController.h
//  GongChaSG
//
//  Created by danielquek on 11/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ListViewController.h"

@interface AddressAnnotation : NSObject <MKAnnotation> 
{
    CLLocationCoordinate2D coordinate;
    
    NSString *title;
    NSString *subTitle;
}

@end

@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate, ListViewControllerDelegate>
{
    IBOutlet MKMapView *mapView;    
    
    AddressAnnotation *addAnnotation;
    AddressAnnotation *addAnnotation2;
    AddressAnnotation *addAnnotation3;
    AddressAnnotation *addAnnotation4;
    AddressAnnotation *addAnnotation5;
    AddressAnnotation *addAnnotation6;
    AddressAnnotation *addAnnotation7;
    AddressAnnotation *addAnnotation8;
    AddressAnnotation *addAnnotation9;
    AddressAnnotation *addAnnotation10;
    AddressAnnotation *addAnnotation11;
    AddressAnnotation *addAnnotation12;
    AddressAnnotation *addAnnotation13;
    AddressAnnotation *addAnnotation14;
    AddressAnnotation *addAnnotation15;
    AddressAnnotation *addAnnotation16;
    AddressAnnotation *addAnnotation17;
    AddressAnnotation *addAnnotation18;
    AddressAnnotation *addAnnotation19;
    AddressAnnotation *addAnnotation20;
    AddressAnnotation *addAnnotation21;
    AddressAnnotation *addAnnotation22;
    AddressAnnotation *addAnnotation23;
    AddressAnnotation *addAnnotation24;
    AddressAnnotation *addAnnotation25;
    AddressAnnotation *addAnnotation26;
    AddressAnnotation *addAnnotation27;
    AddressAnnotation *addAnnotation28;
    AddressAnnotation *addAnnotation29;
    AddressAnnotation *addAnnotation30;
    AddressAnnotation *addAnnotation31;
    AddressAnnotation *addAnnotation32;
    AddressAnnotation *addAnnotation33;
    AddressAnnotation *addAnnotation34;
    AddressAnnotation *addAnnotation35;
    AddressAnnotation *addAnnotation36;
    AddressAnnotation *addAnnotation37;
    AddressAnnotation *addAnnotation38;
    AddressAnnotation *addAnnotation39;
    AddressAnnotation *addAnnotation40;

    
@private
    CLLocationManager *locationManager;
}

@property (nonatomic, retain) IBOutlet MKMapView *map;

@property (nonatomic, retain) CLLocationManager *locationManager;

- (void)showAddress;
@end