//
//  DetailViewController.m
//  GongChaSG
//
//  Created by Daniel Quek on 17/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "Favourites.h"
#import "GongChaSGAppDelegate.h"
#import "SHK.h"

@implementation DetailViewController
@synthesize line;
@synthesize hotDrinkView;

@synthesize teaName, iceSlider, sugarSlider, fetchedResultsController, managedObjectContext, pearlText, pearlArray, myPickerView, hotLabel, qtyText, qtyArray, qtyPickerView;

@synthesize price;


-(IBAction)Share:(id)sender
{
	SHKItem *item = [SHKItem 
                     text:[NSString stringWithFormat:@"I love Gong Cha's %@! Viewing their menu via their iPhone app - GongChaSG. Get it here @ http://tiny.cc/1h29h",teaName.text] 
                     mailText:[NSString stringWithFormat:@"Hey! I am bookmarking Gong Cha's %@ using their iPhone app - GongChaSG. </br></br>You can view their full menu and find the nearest store to you!</br></br>Click to download http://tiny.cc/1h29h", teaName.text]
                     title:@"I'm addicted to this drink from Gong Cha!"];
    
	SHKActionSheet *actionSheet = [SHKActionSheet actionSheetForItem:item];
	
	[actionSheet showFromToolbar:self.navigationController.toolbar];
}

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
    
    [self.view addSubview:doneButton];
    
    [img release];
}

-(IBAction)PickerView:(id)sender
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

    [self.view addSubview:doneButton];
    
    [img release];
}

    
-(IBAction)aMethod:(id)sender
    {
        [myPickerView removeFromSuperview];
        [doneButton removeFromSuperview];
        [qtyPickerView removeFromSuperview];
    }


- (void)viewWillAppear:(BOOL)animated
    {   
        self.pearlText.text = @"None";
        self.qtyText.text = @"1";
    }

-(void)viewDidAppear:(BOOL)animated
{

}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
        NSLog(@"Proceed with action");
        if ([actionSheet.title isEqualToString:@"Saved to My Favourites"])
        {
            if (managedObjectContext == nil) 
            { 
                managedObjectContext = [(GongChaSGAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext]; 
            }
            
            NSLog(@"saveData");
            Favourites *fav = (Favourites *)[NSEntityDescription insertNewObjectForEntityForName:@"Favourites" inManagedObjectContext:managedObjectContext];
            fav.name = teaName.text;
            fav.sugar = [NSNumber numberWithFloat:sugarSlider.value];
            fav.ice = [NSNumber numberWithFloat:iceSlider.value];
            fav.pearl = pearlText.text;
            fav.quantity = qtyText.text;
            fav.price = [NSNumber numberWithFloat:price];
        }
            
            NSError *error;
            
            // here's where the actual save happens, and if it doesn't we print something out to the console
            if (![managedObjectContext save:&error])
            {
                NSLog(@"Problem saving: %@", [error localizedDescription]);
            }
            
            // **** log objects currently in database ****
            // create fetch object, this object fetch's the objects out of the database
            NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
            NSEntityDescription *entity = [NSEntityDescription entityForName:@"Favourites" inManagedObjectContext:managedObjectContext];
            [fetchRequest setEntity:entity];
            NSArray *fetchedObjects = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
            
            for (NSManagedObject *info in fetchedObjects)
            {
                NSLog(@"%@", [info valueForKey:@"name"]);
                NSLog(@"%@", [info valueForKey:@"ice"]);
                NSLog(@"%@", [info valueForKey:@"sugar"]);
                NSLog(@"%@", [info valueForKey:@"pearl"]);
                NSLog(@"%@", [info valueForKey:@"quantity"]);
                NSLog(@"%@", [info valueForKey:@"price"]);
            }
            
            [fetchRequest release];   
    
    [self.navigationController popViewControllerAnimated:YES];
} 
    
- (IBAction)saveData
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Saved to My Favourites" message:@"To view your order, please tab on 'My Favourites' tab." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
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

    pearlArray = [[NSArray alloc]initWithObjects:
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
                  nil];
    
    qtyArray = [[NSArray alloc]initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", nil];

}

- (void)viewDidUnload
{
    [self setHotDrinkView:nil];
    [self setLine:nil];
    [super viewDidUnload];
    
    self.myPickerView = nil;
    self.pearlArray = nil;
    self.iceSlider = nil;
    self.pearlArray = nil;
    self.hotLabel = nil;
    self.qtyText = nil;
    self.qtyArray = nil;
    self.qtyPickerView = nil;
    
    self.teaName = nil;
    
    self.sugarSlider = nil;
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

- (void)dealloc 
{
    [myPickerView release];
    [pearlArray release];;
    [iceSlider release];
    [pearlText release];
    [hotLabel release];
    [qtyPickerView release];
    [qtyArray release];
    [qtyText release];

    [teaName release];

    [sugarSlider release];
    
    [hotDrinkView release];
    [line release];
    [super dealloc];
}

@end
