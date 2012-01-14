//
//  NewsViewController.m
//  GongChaSG
//
//  Created by Daniel on 29/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GongChaSGAppDelegate.h"
#import "NewsViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation NewsViewController

@synthesize scrollAdvertisement;
@synthesize pageControlAdvertisement;
@synthesize pageControl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor clearColor];
    
    CGRect buttonFrame = scrollAdvertisement.frame;
    buttonFrame.origin.y = 81;
    scrollAdvertisement.frame = buttonFrame;
    
    arrayImageViewAdvertisement = nil;
    
    bannerList = [[NSMutableArray alloc]initWithObjects:
                  [UIImage imageNamed:@"ALL_CalpisSWMAL_iPhone"],
                  [UIImage imageNamed:@"NewsBody1"],
                  nil];
    
    [self setupAdvertisement];
    
    [self setPageControl];
}

-(void)setupAdvertisement
{
    if (arrayImageViewAdvertisement!=nil) 
    {
        UIImageView *imageView;
        for (int i=0; i < [arrayImageViewAdvertisement count]; i++)
        {
            imageView = [arrayImageViewAdvertisement objectAtIndex:i];
            [imageView removeFromSuperview];
        }
        [arrayImageViewAdvertisement release];
    }
    arrayImageViewAdvertisement = nil;
	
	arrayImageViewAdvertisement = [NSMutableArray new];
    
    scrollAdvertisement.contentSize = CGSizeMake([bannerList count]* 320, 287);
    int xOffset = 0;
	for(int i = 0; i < [bannerList count]; i++)
	{
		UIImageView *tempImageView = [[UIImageView alloc] initWithFrame:CGRectMake(xOffset, 0, 320, 287)];
		[tempImageView setImage:[bannerList objectAtIndex:i]];
		tempImageView.layer.cornerRadius = 0;
        tempImageView.contentMode = UIViewContentModeScaleToFill;
		[tempImageView.layer setMasksToBounds:NO];
		[scrollAdvertisement addSubview:tempImageView];
		tempImageView.userInteractionEnabled = YES;
        
		[arrayImageViewAdvertisement addObject:tempImageView];
		[tempImageView release];
        
        xOffset += 320;
	}
	scrollAdvertisement.pagingEnabled = YES;
	scrollAdvertisement.showsHorizontalScrollIndicator =  NO;
    scrollAdvertisement.showsVerticalScrollIndicator = NO;
	scrollAdvertisement.delegate = self;
	scrollAdvertisement.userInteractionEnabled = YES;
	
	[self scrollViewDidScroll:scrollAdvertisement]; 
}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    CGFloat pageWidth = scrollAdvertisement.frame.size.width;
    int page = floor((scrollAdvertisement.contentOffset.x - pageWidth) / pageWidth) + 1;
    self.pageControl.currentPage = page;    
}


- (void) setPageControl {
    
    self.pageControl = [[[PageControl alloc]initWithFrame:CGRectMake(122, 381, 77, 36)]autorelease];
    
    NSUInteger nBanners = (int)[bannerList count];
    
    [self.view addSubview:self.pageControl];
    [self.pageControl setNumberOfPages:nBanners];
    if (nBanners == 1) {
        self.pageControl.hidden = YES;
    }
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.pageControlAdvertisement = nil;
    self.pageControl = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [pageControl release];
    [scrollAdvertisement release];
    [pageControlAdvertisement release];
    [super dealloc];
}

@end
