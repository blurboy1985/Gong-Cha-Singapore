//
//  MapViewController.m
//  GongChaSG
//
//  Created by danielquek on 11/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"
#import "ListViewController.h"

@interface MapViewController()
@end


@implementation AddressAnnotation

@synthesize coordinate;

- (NSString *)subtitle
{
    return subTitle;
}

-(void)setSubTitle:(NSString *)subtitleIn
{
    subTitle = subtitleIn;
}

- (NSString *)title
{
	return title;
}

- (void)setTitle:(NSString *)titleIn
{
	title = titleIn;
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) c
{
	coordinate=c;
	NSLog(@"%f,%f",c.latitude,c.longitude);
	return self;
}

@end

@implementation MapViewController

@synthesize  map,locationManager;

-(void)dismissViewController:(ListViewController *)listViewController
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidLoad 
{
    [super viewDidLoad];
	[self showAddress];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.7 green:0 blue:0 alpha:1];
	
    self.locationManager = [[[CLLocationManager alloc] init] autorelease];
    self.locationManager.delegate = self; // Tells the location manager to send updates to this object

    [self.locationManager startUpdatingLocation];
    
	UIButton* infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    CGRect frame = infoButton.frame;
    frame.size.width = 40.0f;
    infoButton.frame = frame;
	[infoButton addTarget:self action:@selector(flipAction:) forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem* flipButton = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
    self.navigationItem.rightBarButtonItem = flipButton;
    
    [flipButton release];

    self.title = @"Locations";
}

-(void)flipAction:(id)sender
{
    ListViewController *listViewController = [[ListViewController alloc]initWithNibName:@"ListViewController" bundle:nil];
    listViewController.delegate = self;
    
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:listViewController];
    
    listViewController.modalPresentationStyle = UIModalPresentationPageSheet;
    listViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:navigationController animated:YES];
    
    [listViewController release];
    [navigationController release];
}

- (void) showAddress 
{
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	span.latitudeDelta=0.2;
	span.longitudeDelta=0.2;
	
	CLLocationCoordinate2D location = mapView.userLocation.coordinate;
	
	location.latitude = 1.3112000 ;
	location.longitude = 103.8564680;

	
	if(addAnnotation != nil) {
		[mapView removeAnnotation:addAnnotation];
		[addAnnotation release];
		addAnnotation = nil;
	}
	
	addAnnotation = [[AddressAnnotation alloc] initWithCoordinate:location];
	[addAnnotation setTitle:@"City Square Mall"];
	[addAnnotation setSubTitle:@"#B2-K3/K4 Tel: 6509 3803"];
	[mapView addAnnotation:addAnnotation];
	
	CLLocationCoordinate2D location2 = mapView.userLocation.coordinate;
	
	location2.latitude = 1.3207640;
	location2.longitude = 103.8443180;
	
	if(addAnnotation2 != nil) 
	{
		[mapView removeAnnotation:addAnnotation2];
		[addAnnotation2 release];
		addAnnotation2 = nil;
	}
	
	addAnnotation2 = [[AddressAnnotation alloc] initWithCoordinate:location2];
	[addAnnotation2 setTitle:@"Novena Square Two"];
	[addAnnotation2 setSubTitle:@"#01-172 Tel: 6397 6816"];
	[mapView addAnnotation:addAnnotation2];
	
    CLLocationCoordinate2D location3 = mapView.userLocation.coordinate;
	
	location3.latitude = 1.2652178;
	location3.longitude = 103.8220592;
	
	if(addAnnotation3 != nil) 
	{
		[mapView removeAnnotation:addAnnotation3];
		[addAnnotation3 release];
		addAnnotation3 = nil;
	}
	
	addAnnotation3 = [[AddressAnnotation alloc] initWithCoordinate:location3];
	[addAnnotation3 setTitle:@"Vivocity"];
	[addAnnotation3 setSubTitle:@"#01-111 Tel: 6376 9363"];
	[mapView addAnnotation:addAnnotation3];
    
    CLLocationCoordinate2D location4 = mapView.userLocation.coordinate;
	
	location4.latitude = 1.2995557;
	location4.longitude = 103.8445051;
	
	if(addAnnotation4 != nil) 
	{
		[mapView removeAnnotation:addAnnotation4];
		[addAnnotation4 release];
		addAnnotation4 = nil;
	}
	
	addAnnotation4 = [[AddressAnnotation alloc] initWithCoordinate:location4];
	[addAnnotation4 setTitle:@"Plaza Singapura"];
	[addAnnotation4 setSubTitle:@"#01-K1 Tel: 6336 4603"];
	[mapView addAnnotation:addAnnotation4];

    CLLocationCoordinate2D location5 = mapView.userLocation.coordinate;
	
	location5.latitude = 1.2935400;
	location5.longitude = 103.8529000;
	
	if(addAnnotation5 != nil) 
	{
		[mapView removeAnnotation:addAnnotation5];
		[addAnnotation5 release];
		addAnnotation5 = nil;
	}
	
	addAnnotation5 = [[AddressAnnotation alloc] initWithCoordinate:location5];
	[addAnnotation5 setTitle:@"Raffles City Shopping Centre"];
	[addAnnotation5 setSubTitle:@"#B1-71 Tel: 6336 9282"];
	[mapView addAnnotation:addAnnotation5];
    
    CLLocationCoordinate2D location6 = mapView.userLocation.coordinate;
	
	location6.latitude = 1.3008290;
	location6.longitude = 103.8398120;
	
	if(addAnnotation6 != nil) 
	{
		[mapView removeAnnotation:addAnnotation6];
		[addAnnotation6 release];
		addAnnotation6 = nil;
	}
	
	addAnnotation6 = [[AddressAnnotation alloc] initWithCoordinate:location6];
	[addAnnotation6 setTitle:@"Orchard Central"];
	[addAnnotation6 setSubTitle:@"#B1-02 Tel: 6238 7368"];
	[mapView addAnnotation:addAnnotation6];
    
    CLLocationCoordinate2D location7 = mapView.userLocation.coordinate;
	
	location7.latitude = 1.3248300;
	location7.longitude = 103.9324800;
	
	if(addAnnotation7 != nil) 
	{
		[mapView removeAnnotation:addAnnotation7];
		[addAnnotation7 release];
		addAnnotation7 = nil;
	}
	
	addAnnotation7 = [[AddressAnnotation alloc] initWithCoordinate:location7];
	[addAnnotation7 setTitle:@"Bedok Point"];
	[addAnnotation7 setSubTitle:@"#02-30 Tel: 6441 0019"];
	[mapView addAnnotation:addAnnotation7];
    
    CLLocationCoordinate2D location8 = mapView.userLocation.coordinate;
	
	location8.latitude = 1.2886930;
	location8.longitude = 103.8467320;
	
	if(addAnnotation8 != nil) 
	{
		[mapView removeAnnotation:addAnnotation8];
		[addAnnotation8 release];
		addAnnotation8 = nil;
	}
	
	addAnnotation8 = [[AddressAnnotation alloc] initWithCoordinate:location8];
	[addAnnotation8 setTitle:@"The Central"];
	[addAnnotation8 setSubTitle:@"#B1-15/16 Tel: 6222 2627"];
	[mapView addAnnotation:addAnnotation8];
    
    CLLocationCoordinate2D location9 = mapView.userLocation.coordinate;
	
	location9.latitude = 1.3628126;
	location9.longitude = 103.8528469;
	
	if(addAnnotation9 != nil) 
	{
		[mapView removeAnnotation:addAnnotation9];
		[addAnnotation9 release];
		addAnnotation9 = nil;
	}
	
	addAnnotation9 = [[AddressAnnotation alloc] initWithCoordinate:location9];
	[addAnnotation9 setTitle:@"Julibee Entertainment Complex"];
	[addAnnotation9 setSubTitle:@"#01-14 Tel: 6456 6476"];
	[mapView addAnnotation:addAnnotation9];
    
    CLLocationCoordinate2D location10 = mapView.userLocation.coordinate;
	
	location10.latitude = 1.3505800;
	location10.longitude = 103.8488400;
    region.span=span;
	region.center=location10;
	
	if(addAnnotation10 != nil) 
	{
		[mapView removeAnnotation:addAnnotation10];
		[addAnnotation10 release];
		addAnnotation10 = nil;
        
	}
	
	addAnnotation10 = [[AddressAnnotation alloc] initWithCoordinate:location10];
	[addAnnotation10 setTitle:@"Junction 8 Shopping Centre"];
	[addAnnotation10 setSubTitle:@"#02-18A Tel: 6259 9938"];
	[mapView addAnnotation:addAnnotation10];
    
    CLLocationCoordinate2D location11 = mapView.userLocation.coordinate;
	
	location11.latitude = 1.3530920;
	location11.longitude = 103.9452290;
	
	if(addAnnotation11 != nil) 
	{
		[mapView removeAnnotation:addAnnotation11];
		[addAnnotation11 release];
		addAnnotation11 = nil;
	}
	
	addAnnotation11 = [[AddressAnnotation alloc] initWithCoordinate:location11];
	[addAnnotation11 setTitle:@"Tampines MRT Station"];
	[addAnnotation11 setSubTitle:@"#01-24 Tel: 6786 1773"];
	[mapView addAnnotation:addAnnotation11];
    
    CLLocationCoordinate2D location12 = mapView.userLocation.coordinate;
	
	location12.latitude = 1.3016346;
	location12.longitude = 103.8354546;
	
	if(addAnnotation12 != nil) 
	{
		[mapView removeAnnotation:addAnnotation12];
		[addAnnotation12 release];
		addAnnotation12 = nil;
	}
	
	addAnnotation12 = [[AddressAnnotation alloc] initWithCoordinate:location12];
	[addAnnotation12 setTitle:@"*SCAPE"];
	[addAnnotation12 setSubTitle:@"#02-39 Tel: 6509 0907"];
	[mapView addAnnotation:addAnnotation12];
    
    CLLocationCoordinate2D location13 = mapView.userLocation.coordinate;
	
	location13.latitude = 1.3181000;
	location13.longitude = 103.8436900;
	
	if(addAnnotation13 != nil) 
	{
		[mapView removeAnnotation:addAnnotation13];
		[addAnnotation13 release];
		addAnnotation13 = nil;
	}
	
	addAnnotation13 = [[AddressAnnotation alloc] initWithCoordinate:location13];
	[addAnnotation13 setTitle:@"161 GoldHill Centre"];
	[addAnnotation13 setSubTitle:@"#161 Tel: 6259 6138"];
	[mapView addAnnotation:addAnnotation13];
    
    CLLocationCoordinate2D location14 = mapView.userLocation.coordinate;
	
	location14.latitude = 1.4423600;
	location14.longitude = 103.8252700;
	
	if(addAnnotation14 != nil) 
	{
		[mapView removeAnnotation:addAnnotation14];
		[addAnnotation14 release];
		addAnnotation14 = nil;
	}
	
	addAnnotation14 = [[AddressAnnotation alloc] initWithCoordinate:location14];
	[addAnnotation14 setTitle:@"Sembawang Shopping Centre"];
	[addAnnotation14 setSubTitle:@"#B1-17 Tel: 6853 0971"];
	[mapView addAnnotation:addAnnotation14];
    
    CLLocationCoordinate2D location15 = mapView.userLocation.coordinate;
	
	location15.latitude = 1.4481160;
	location15.longitude = 103.8203480;
	
	if(addAnnotation15 != nil) 
	{
		[mapView removeAnnotation:addAnnotation15];
		[addAnnotation15 release];
		addAnnotation15 = nil;
	}
	
	addAnnotation15 = [[AddressAnnotation alloc] initWithCoordinate:location15];
	[addAnnotation15 setTitle:@"Sun Plaza"];
	[addAnnotation15 setSubTitle:@"#B1-16 Tel: 6481 8813"];
	[mapView addAnnotation:addAnnotation15];
    
    CLLocationCoordinate2D location16 = mapView.userLocation.coordinate;
	
	location16.latitude = 1.2758480;
	location16.longitude = 103.8459710;
	
	if(addAnnotation16 != nil) 
	{
		[mapView removeAnnotation:addAnnotation16];
		[addAnnotation16 release];
		addAnnotation16 = nil;
	}
	
	addAnnotation16 = [[AddressAnnotation alloc] initWithCoordinate:location16];
	[addAnnotation16 setTitle:@"International Plaza"];
	[addAnnotation16 setSubTitle:@"#01-36 Tel: 6221 4338"];
	[mapView addAnnotation:addAnnotation16];
    
    CLLocationCoordinate2D location17 = mapView.userLocation.coordinate;
	
	location17.latitude = 1.3846800;
	location17.longitude = 103.7446800;
	
	if(addAnnotation17 != nil) 
	{
		[mapView removeAnnotation:addAnnotation17];
		[addAnnotation17 release];
		addAnnotation17 = nil;
	}
	
	addAnnotation17 = [[AddressAnnotation alloc] initWithCoordinate:location17];
	[addAnnotation17 setTitle:@"Lot One Shoppers' Mall"];
	[addAnnotation17 setSubTitle:@"#B1-K30 Tel: 6464 8896"];
	[mapView addAnnotation:addAnnotation17];
    
    CLLocationCoordinate2D location18 = mapView.userLocation.coordinate;
	
	location18.latitude = 1.3013300;
	location18.longitude = 103.8412100;
	
	if(addAnnotation18 != nil) 
	{
		[mapView removeAnnotation:addAnnotation18];
		[addAnnotation18 release];
		addAnnotation18 = nil;
	}
	
	addAnnotation18 = [[AddressAnnotation alloc] initWithCoordinate:location18];
	[addAnnotation18 setTitle:@"Orchard Plaza"];
	[addAnnotation18 setSubTitle:@"#01-50 Tel: 6733 8069"];
	[mapView addAnnotation:addAnnotation18];
    
    CLLocationCoordinate2D location19 = mapView.userLocation.coordinate;
	
	location19.latitude = 1.2994832;
	location19.longitude = 103.8475102;
	
	if(addAnnotation19 != nil) 
	{
		[mapView removeAnnotation:addAnnotation19];
		[addAnnotation19 release];
		addAnnotation19 = nil;
	}
	
	addAnnotation19 = [[AddressAnnotation alloc] initWithCoordinate:location19];
	[addAnnotation19 setTitle:@"The Cathay"];
	[addAnnotation19 setSubTitle:@"#04-12 Tel: 6235 0029"];
	[mapView addAnnotation:addAnnotation19];

    CLLocationCoordinate2D location20 = mapView.userLocation.coordinate;
	
	location20.latitude = 1.2829936;
	location20.longitude = 103.8163231;
	
	if(addAnnotation20 != nil) 
	{
		[mapView removeAnnotation:addAnnotation20];
		[addAnnotation20 release];
		addAnnotation20 = nil;
	}
	
	addAnnotation20 = [[AddressAnnotation alloc] initWithCoordinate:location20];
	[addAnnotation20 setTitle:@"Blk 165 Bukit Merah Central"];
	[addAnnotation20 setSubTitle:@"#01-3661 Tel: 6278 8913"];
	[mapView addAnnotation:addAnnotation20];
    
    CLLocationCoordinate2D location21 = mapView.userLocation.coordinate;
	
	location21.latitude = 1.3022020;
	location21.longitude = 103.8524660;
	
	if(addAnnotation21 != nil) 
	{
		[mapView removeAnnotation:addAnnotation21];
		[addAnnotation21 release];
		addAnnotation21 = nil;
	}
	
	addAnnotation21 = [[AddressAnnotation alloc] initWithCoordinate:location21];
	[addAnnotation21 setTitle:@"Burlington Square"];
	[addAnnotation21 setSubTitle:@"#01-53 Tel: 6884 8933"];
	[mapView addAnnotation:addAnnotation21];
    
    CLLocationCoordinate2D location22 = mapView.userLocation.coordinate;
	
	location22.latitude = 1.2820425578819163;
	location22.longitude = 103.8580995798111;
	
	if(addAnnotation22 != nil) 
	{
		[mapView removeAnnotation:addAnnotation22];
		[addAnnotation22 release];
		addAnnotation22 = nil;
	}
	
	addAnnotation22 = [[AddressAnnotation alloc] initWithCoordinate:location22];
	[addAnnotation22 setTitle:@"The Shoppes at Marina Bay Sands"];
	[addAnnotation22 setSubTitle:@"#01-72 Tel: 6688 7431"];
	[mapView addAnnotation:addAnnotation22];
    
    CLLocationCoordinate2D location23 = mapView.userLocation.coordinate;
	
	location23.latitude = 1.30101;
	location23.longitude = 103.83825;
	
	if(addAnnotation23 != nil) 
	{
		[mapView removeAnnotation:addAnnotation23];
		[addAnnotation23 release];
		addAnnotation23 = nil;
	}
	
	addAnnotation23 = [[AddressAnnotation alloc] initWithCoordinate:location23];
	[addAnnotation23 setTitle:@"313@Somerset"];
	[addAnnotation23 setSubTitle:@"#01-37 Tel: 6636 7756"];
	[mapView addAnnotation:addAnnotation23];
    
    CLLocationCoordinate2D location24 = mapView.userLocation.coordinate;
	
	location24.latitude = 1.2835190;
	location24.longitude = 103.8468880;
	
	if(addAnnotation24 != nil) 
	{
		[mapView removeAnnotation:addAnnotation24];
		[addAnnotation24 release];
		addAnnotation24 = nil;
	}
	
	addAnnotation24 = [[AddressAnnotation alloc] initWithCoordinate:location24];
	[addAnnotation24 setTitle:@"China Square Central"];
	[addAnnotation24 setSubTitle:@"#01-56 Tel: 64387121"];
	[mapView addAnnotation:addAnnotation24];
    
    CLLocationCoordinate2D location25 = mapView.userLocation.coordinate;
	
	location25.latitude = 1.2731030;
	location25.longitude = 103.8016020;
	
	if(addAnnotation25 != nil) 
	{
		[mapView removeAnnotation:addAnnotation25];
		[addAnnotation25 release];
		addAnnotation25 = nil;
	}
	
	addAnnotation25 = [[AddressAnnotation alloc] initWithCoordinate:location25];
	[addAnnotation25 setTitle:@"Alexandra Retail Centre"];
	[addAnnotation25 setSubTitle:@"#01-10 Tel: 6272 0211"];
	[mapView addAnnotation:addAnnotation25];
    
    CLLocationCoordinate2D location26 = mapView.userLocation.coordinate;
	
	location26.latitude = 1.3428300;
	location26.longitude = 103.9530200;
	
	if(addAnnotation26 != nil) 
	{
		[mapView removeAnnotation:addAnnotation26];
		[addAnnotation26 release];
		addAnnotation26 = nil;
	}
	
	addAnnotation26 = [[AddressAnnotation alloc] initWithCoordinate:location26];
	[addAnnotation26 setTitle:@"Eastpoint Mall"];
	[addAnnotation26 setSubTitle:@"#01-34 Tel: 6789 3089"];
	[mapView addAnnotation:addAnnotation26];
    
    CLLocationCoordinate2D location27 = mapView.userLocation.coordinate;
	
	location27.latitude = 1.3190153284910768;
	location27.longitude = 103.89425575733185;
	
	if(addAnnotation27 != nil) 
	{
		[mapView removeAnnotation:addAnnotation27];
		[addAnnotation27 release];
		addAnnotation27 = nil;
	}
	
	addAnnotation27 = [[AddressAnnotation alloc] initWithCoordinate:location27];
	[addAnnotation27 setTitle:@"Singapore Post Centre"];
	[addAnnotation27 setSubTitle:@"#02-06A Tel: 6742 5236"];
	[mapView addAnnotation:addAnnotation27];
    
    CLLocationCoordinate2D location28 = mapView.userLocation.coordinate;
	
	location28.latitude = 1.3052300;
	location28.longitude = 103.9051300;
	
	if(addAnnotation28 != nil) 
	{
		[mapView removeAnnotation:addAnnotation28];
		[addAnnotation28 release];
		addAnnotation28 = nil;
	}
	
	addAnnotation28 = [[AddressAnnotation alloc] initWithCoordinate:location28];
	[addAnnotation28 setTitle:@"I12 Katong"];
	[addAnnotation28 setSubTitle:@"#B1-19 6636 3948"];
	[mapView addAnnotation:addAnnotation28];
    
    CLLocationCoordinate2D location29 = mapView.userLocation.coordinate;
	
	location29.latitude = 1.34885486126827;
	location29.longitude = 103.74934136867523;
	
	if(addAnnotation29 != nil) 
	{
		[mapView removeAnnotation:addAnnotation29];
		[addAnnotation29 release];
		addAnnotation29 = nil;
	}
	
	addAnnotation29 = [[AddressAnnotation alloc] initWithCoordinate:location29];
	[addAnnotation29 setTitle:@"Bukit Batok MRT Station"];
	[addAnnotation29 setSubTitle:@"#01-07 Tel: 6561 5766"];
	[mapView addAnnotation:addAnnotation29];
    
    CLLocationCoordinate2D location30 = mapView.userLocation.coordinate;
	
	location30.latitude = 1.3502277713587438;
	location30.longitude = 103.87274980545044;
	
	if(addAnnotation30 != nil) 
	{
		[mapView removeAnnotation:addAnnotation30];
		[addAnnotation30 release];
		addAnnotation30 = nil;
	}
	
	addAnnotation30 = [[AddressAnnotation alloc] initWithCoordinate:location30];
	[addAnnotation30 setTitle:@"Gong Cha@MOF NEX Shopping Mall"];
	[addAnnotation30 setSubTitle:@"#02-04 Tel: 6636 8198"];
	[mapView addAnnotation:addAnnotation30];
    
    CLLocationCoordinate2D location31 = mapView.userLocation.coordinate;
	
	location31.latitude = 1.38790204959719;
	location31.longitude = 103.8692307472229;
	
	if(addAnnotation31 != nil) 
	{
		[mapView removeAnnotation:addAnnotation31];
		[addAnnotation31 release];
		addAnnotation31 = nil;
	}
	
	addAnnotation31 = [[AddressAnnotation alloc] initWithCoordinate:location31];
	[addAnnotation31 setTitle:@"Greenwich V"];
	[addAnnotation31 setSubTitle:@"#01-20 Opening Soon!"];
	[mapView addAnnotation:addAnnotation31];
    
    CLLocationCoordinate2D location32 = mapView.userLocation.coordinate;
	
	location32.latitude = 1.3802197627528798;
	location32.longitude = 103.76413375139236;
	
	if(addAnnotation32 != nil) 
	{
		[mapView removeAnnotation:addAnnotation32];
		[addAnnotation32 release];
		addAnnotation32 = nil;
	}
	
	addAnnotation32 = [[AddressAnnotation alloc] initWithCoordinate:location32];
	[addAnnotation32 setTitle:@"Bukit Panjang Plaza"];
	[addAnnotation32 setSubTitle:@"#01-21 Tel: 6763 1470"];
	[mapView addAnnotation:addAnnotation32];
    
    CLLocationCoordinate2D location33 = mapView.userLocation.coordinate;
	
	location33.latitude = 1.35879;
	location33.longitude = 103.75186;
	
	if(addAnnotation33 != nil) 
	{
		[mapView removeAnnotation:addAnnotation33];
		[addAnnotation33 release];
		addAnnotation33 = nil;
	}
	
	addAnnotation33 = [[AddressAnnotation alloc] initWithCoordinate:location33];
	[addAnnotation33 setTitle:@"Bukit Gombak MRT"];
	[addAnnotation33 setSubTitle:@"#01-01 Tel: 6560 9139"];
	[mapView addAnnotation:addAnnotation33];
    
    CLLocationCoordinate2D location34 = mapView.userLocation.coordinate;
	
	location34.latitude = 1.29575;
	location34.longitude = 103.85888;
	
	if(addAnnotation34 != nil) 
	{
		[mapView removeAnnotation:addAnnotation34];
		[addAnnotation34 release];
		addAnnotation34 = nil;
	}
	
	addAnnotation34 = [[AddressAnnotation alloc] initWithCoordinate:location34];
	[addAnnotation34 setTitle:@"Suntec City Mall"];
	[addAnnotation34 setSubTitle:@"#B1-24 Tel: 6336 6009"];
	[mapView addAnnotation:addAnnotation34];
    
    CLLocationCoordinate2D location35 = mapView.userLocation.coordinate;
	
	location35.latitude = 1.35465;
	location35.longitude = 103.83094;
	
	if(addAnnotation35 != nil) 
	{
		[mapView removeAnnotation:addAnnotation35];
		[addAnnotation35 release];
		addAnnotation35 = nil;
	}
	
	addAnnotation35 = [[AddressAnnotation alloc] initWithCoordinate:location35];
	[addAnnotation35 setTitle:@"Thomson Plaza"];
	[addAnnotation35 setSubTitle:@"#01-104 Tel: 6457 7009"];
	[mapView addAnnotation:addAnnotation35];
    
    CLLocationCoordinate2D location36 = mapView.userLocation.coordinate;
	
	location36.latitude = 1.34911;
	location36.longitude = 103.74990;
	
	if(addAnnotation36 != nil) 
	{
		[mapView removeAnnotation:addAnnotation36];
		[addAnnotation36 release];
		addAnnotation36 = nil;
	}
	
	addAnnotation36 = [[AddressAnnotation alloc] initWithCoordinate:location36];
	[addAnnotation36 setTitle:@"West Mall"];
	[addAnnotation36 setSubTitle:@"#B1-04/04A Tel: 6862 5895"];
	[mapView addAnnotation:addAnnotation36];
    
    CLLocationCoordinate2D location37 = mapView.userLocation.coordinate;
	
	location37.latitude = 1.39819;
	location37.longitude = 103.74762;
	
	if(addAnnotation37 != nil) 
	{
		[mapView removeAnnotation:addAnnotation37];
		[addAnnotation37 release];
		addAnnotation37 = nil;
	}
	
	addAnnotation37 = [[AddressAnnotation alloc] initWithCoordinate:location37];
	[addAnnotation37 setTitle:@"Yew Tee Point"];
	[addAnnotation37 setSubTitle:@"#01-49/50 Tel: 6763 0064"];
	[mapView addAnnotation:addAnnotation37];
    
    CLLocationCoordinate2D location38 = mapView.userLocation.coordinate;
	
	location38.latitude = 1.38035;
	location38.longitude = 103.76013;
	
	if(addAnnotation38 != nil) 
	{
		[mapView removeAnnotation:addAnnotation38];
		[addAnnotation38 release];
		addAnnotation38 = nil;
	}
	
	addAnnotation38 = [[AddressAnnotation alloc] initWithCoordinate:location38];
	[addAnnotation38 setTitle:@"Junction 10"];
	[addAnnotation38 setSubTitle:@"#01-26 Opening Soon!"];
	[mapView addAnnotation:addAnnotation38];
    
    CLLocationCoordinate2D location39 = mapView.userLocation.coordinate;
	
	location39.latitude = 1.30382;
	location39.longitude = 103.76627;
	
	if(addAnnotation39 != nil) 
	{
		[mapView removeAnnotation:addAnnotation39];
		[addAnnotation39 release];
		addAnnotation39 = nil;
	}
	
	addAnnotation39 = [[AddressAnnotation alloc] initWithCoordinate:location39];
	[addAnnotation39 setTitle:@"West Coast Plaza"];
	[addAnnotation39 setSubTitle:@"#B1-57 Opening Soon!"];
	[mapView addAnnotation:addAnnotation39];
    
    CLLocationCoordinate2D location40 = mapView.userLocation.coordinate;
	
	location40.latitude = 1.30347;
	location40.longitude = 103.83566;
	
	if(addAnnotation40 != nil) 
	{
		[mapView removeAnnotation:addAnnotation40];
		[addAnnotation40 release];
		addAnnotation40 = nil;
	}
	
	addAnnotation40 = [[AddressAnnotation alloc] initWithCoordinate:location40];
	[addAnnotation40 setTitle:@"Paragon"];
	[addAnnotation40 setSubTitle:@"#B1-39/40 Opening Soon!"];
	[mapView addAnnotation:addAnnotation40];
    
	[mapView setRegion:region animated:TRUE];
	[mapView regionThatFits:region];
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation
{
    if (annotation == [map userLocation])
    {
        
    }
    else
    {
        MKPinAnnotationView *annView=[[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"currentloc"]autorelease];
        annView.pinColor = MKPinAnnotationColorRed;
        annView.animatesDrop=TRUE;
        annView.canShowCallout = YES;
        annView.calloutOffset = CGPointMake(-5, 5);    
        return annView;
    }
    
    return nil;
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    
    self.map = nil;
    
    self.locationManager.delegate = nil;
    self.locationManager = nil;

}

- (void)dealloc 
{
    [mapView release];
    
    self.locationManager.delegate = nil;
    [locationManager release];
	
    [super dealloc];
}


@end
