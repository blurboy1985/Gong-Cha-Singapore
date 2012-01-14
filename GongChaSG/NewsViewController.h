//
//  NewsViewController.h
//  GongChaSG
//
//  Created by Daniel on 29/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageControl.h"

@interface NewsViewController : UIViewController <UIScrollViewDelegate>
{
    UIScrollView *scrollAdvertisement;
    UIPageControl *pageControlAdvertisement;
    
    NSMutableArray *arrayImageViewAdvertisement;
    NSArray *bannerList;
    
    PageControl *pageControl;
}

@property (nonatomic, retain) IBOutlet UIScrollView *scrollAdvertisement;
@property (nonatomic, retain) IBOutlet UIPageControl *pageControlAdvertisement;

@property (nonatomic, retain) PageControl *pageControl;

-(void)setupAdvertisement;
-(void)setPageControl;

@end