//
//  FavouritesDetailView.m
//  GongChaSG
//
//  Created by Daniel Quek on 25/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FavouritesDetailView.h"
#import "DrinkObject.h"

@implementation FavouritesDetailView
@synthesize line;

@synthesize managedObjectContext, favourites, teaName, sugarSlider, iceSlider, pearlText, pearlArray, myPickerView, hotLabel, qtyPickerView, qtyText, qtyArray;


-(IBAction)QtyPickerView:(id)sender
{
    qtyPickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 155, 320, 280)];
    [self.view addSubview:qtyPickerView];
    qtyPickerView.delegate = self;
    qtyPickerView.showsSelectionIndicator = YES;
    
    doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [doneButton addTarget:self 
                   action:@selector(aMethod:)
         forControlEvents:UIControlEventTouchDown];
    doneButton.frame = CGRectMake(250,180,  52.0, 30.0);
    
    UIImage *img = [[UIImage imageNamed:@"done.png"]retain];
    
    [doneButton setImage:img forState:UIControlStateNormal];
    
    [img release];
    
    [self.view addSubview:doneButton];
}

-(IBAction)PickerView:(id)sender
{
    {
        myPickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 155, 320, 280)];
        [self.view addSubview:myPickerView];
        myPickerView.delegate = self;
        myPickerView.showsSelectionIndicator = YES;
        
        doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [doneButton addTarget:self 
                       action:@selector(aMethod:)
             forControlEvents:UIControlEventTouchDown];
        doneButton.frame = CGRectMake(250,180,  52.0, 30.0);
        UIImage *img = [[UIImage imageNamed:@"done.png"]retain];
        [doneButton setImage:img forState:UIControlStateNormal];
        
        [img release];
        
        [self.view addSubview:doneButton];
    }
}

-(IBAction)aMethod:(id)sender
{
    [myPickerView removeFromSuperview];
    [qtyPickerView removeFromSuperview];
    
    [doneButton removeFromSuperview];
}


- (IBAction)deleteDestination
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirm Delete" message:@"Are you sure you want to delete the selected drink?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Yes Delete", nil];
    [alert show];
    [alert release];
}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // the user clicked one of the OK/Cancel buttons
    if (buttonIndex == 0)
    {
        NSLog(@"Cancelled action");
        self.teaName.text = favourites.name;
        self.pearlText.text = favourites.pearl;
        self.qtyText.text = favourites.quantity;
    }
    else
    {
        NSLog(@"Proceed with action");
        if ([actionSheet.title isEqualToString:@"Confirm Save"])
        {
            [favourites setSugar:[NSNumber numberWithFloat:sugarSlider.value]];
            [favourites setIce:[NSNumber numberWithFloat:iceSlider.value]];
            [favourites setValue:self.pearlText.text forKey:@"pearl"];
            [favourites setValue:self.qtyText.text forKey:@"quantity"];
        }
        else if ([actionSheet.title isEqualToString:@"Confirm Delete"])
        {
            [managedObjectContext deleteObject:favourites];
        }
    }
    NSError *error;
    if (![managedObjectContext save:&error])
    {
        NSLog(@"Problem saving destination: %@", [error localizedDescription]);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.hotLabel.hidden = YES;
    self.teaName.text = favourites.name;
    self.qtyText.text = favourites.quantity;
    
    sugarSlider.value = [favourites.sugar floatValue];
    iceSlider.value = [favourites.ice floatValue];
    self.pearlText.text = favourites.pearl;
    self.line.hidden = YES;
    
    DrinkObject *drinkObject = [[DrinkObject alloc]init];
    for (NSString *drink in drinkObject.hotDrinksAvailable) {
        if ([drink isEqualToString:self.favourites.name]) {
            self.hotLabel.hidden = NO;
            self.line.hidden = NO;
        }
    }

    [drinkObject release];
}

- (IBAction)editData
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirm Save" message:@"Are you sure you want to save your drink?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Yes", nil];
    [alert show];
    [alert release];
    
}


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
    
    self.pearlArray = [[[NSArray alloc]initWithObjects:
                  @"None", 
                  @"Coconut Jelly 椰果 $0.40",
                  @"Pearl Jelly 珍珠 $0.30",
                  @"White Pearl Jelly 寒天 $0.60",
                  @"Ai-Yu Jelly 爱玉冻 $0.60",
                  @"Herbal Jelly 仙草冻 $0.60",
                  @"Konjac Jelly 蒟蒻 $0.50",
                  @"Pudding Jelly 布丁冻 $0.60",
                  @"Brown Crystal Jelly 黑糖冻 $0.60",
                  @"Azuki Bean 红豆 $0.60",
                  @"Gong Cha Milk 贡茶鲜奶 $0.60",
                  @"Aloe Vera 芦荟 $0.60",
                  @"3J 三兄弟 $1.20",
                  nil]autorelease];

    self.qtyArray = [[[NSArray alloc]initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", nil]autorelease];
}

- (void)viewDidUnload
{
    [self setLine:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent :(NSInteger)component 
{
    if (pickerView == myPickerView) 
        return [pearlArray count];
    else
        return [qtyArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView == myPickerView)
        return [pearlArray objectAtIndex:row];
    else
        return [qtyArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView == myPickerView) 
    {
        pearlText.text = [pearlArray objectAtIndex:[myPickerView selectedRowInComponent:0]];
    }
    else if (pickerView == qtyPickerView)
        qtyText.text = [qtyArray objectAtIndex:[qtyPickerView selectedRowInComponent:0]];
}


- (void)dealloc {
    [managedObjectContext release];
    [pearlArray release];
    [hotLabel release];
    [myPickerView release];
    [pearlText release];
    [iceSlider release];
    [sugarSlider release];
    [favourites release];
    [teaName release];
    [qtyText release];
    [qtyPickerView release];
    [qtyArray release];
    
    [line release];
    [super dealloc];
}
@end
