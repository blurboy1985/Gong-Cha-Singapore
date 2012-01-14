//
//  StoreViewController.h
//  GongChaSG
//
//  Created by Daniel Quek on 25/11/11.
//  Copyright (c) 2011 Cellcity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoreViewController : UIViewController

@property (retain, nonatomic) IBOutlet UILabel *outletLabel;

@property (retain, nonatomic) IBOutlet UILabel *addressLabel;
@property (retain, nonatomic) IBOutlet UILabel *unitLabel;
@property (retain, nonatomic) IBOutlet UILabel *timeLabel;
@property (retain, nonatomic) IBOutlet UITextView *telephoneLabel;

@end
