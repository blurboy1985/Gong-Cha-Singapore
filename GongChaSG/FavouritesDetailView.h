//
//  FavouritesDetailView.h
//  GongChaSG
//
//  Created by Daniel Quek on 25/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Favourites.h"

@interface FavouritesDetailView : UIViewController <UIPickerViewDelegate>
{
    UIButton *doneButton ;
}

@property (nonatomic,retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic,retain) Favourites *favourites;

@property (nonatomic,retain) IBOutlet UISlider *sugarSlider;
@property (nonatomic,retain) IBOutlet UISlider *iceSlider;
@property (nonatomic,retain) UILabel *teaName;
@property (nonatomic,retain) IBOutlet UILabel *pearlText;
@property (nonatomic,retain) IBOutlet UILabel *hotLabel;
@property (nonatomic,retain) IBOutlet UILabel *qtyText;
@property (retain, nonatomic) IBOutlet UILabel *line;

- (IBAction)editData;

- (IBAction)deleteDestination;

-(IBAction)PickerView:(id)sender;
-(IBAction)QtyPickerView:(id)sender;

@property (nonatomic, retain) UIPickerView *myPickerView;
@property (nonatomic, retain) NSArray *pearlArray;

@property (nonatomic, retain) UIPickerView *qtyPickerView;
@property (nonatomic, retain) NSArray *qtyArray;

@end
