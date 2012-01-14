//
//  DetailViewController.h
//  GongChaSG
//
//  Created by Daniel Quek on 17/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UIPickerViewDelegate>
{
    
    UISlider *sugarSlider;
    UISlider *iceSlider;
    UILabel *teaName;
    UIImageView *imageView;
    
    IBOutlet UILabel *pearlText;
    IBOutlet UILabel *qtyText;
    UIPickerView *myPickerView;
    UIPickerView *qtyPickerView;
    
    NSArray *pearlArray;
    NSArray *qtyArray;
    
    NSFetchedResultsController *fetchedResultsController;
    NSManagedObjectContext *managedObjectContext;
    
    UIButton *doneButton;
}

@property (retain, nonatomic) IBOutlet UILabel *line;
@property (nonatomic,retain) IBOutlet UISlider *sugarSlider;
@property (nonatomic,retain) IBOutlet UISlider *iceSlider;
@property (nonatomic,retain) IBOutlet UILabel *pearlText;
@property (nonatomic,retain) IBOutlet UILabel *teaName;

@property (nonatomic,retain) IBOutlet UILabel *hotLabel;
@property (nonatomic,retain) IBOutlet UILabel *qtyText;
@property (nonatomic,assign) float price;

@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, retain) UIPickerView *myPickerView;
@property (nonatomic, retain) NSArray *pearlArray;

@property (nonatomic, retain) UIPickerView *qtyPickerView;
@property (nonatomic, retain) NSArray *qtyArray;
@property (retain, nonatomic) IBOutlet UIView *hotDrinkView;

- (IBAction)saveData;

- (IBAction)PickerView:(id)sender;
- (IBAction)QtyPickerView:(id)sender;

- (IBAction)Share:(id)sender;

@end
