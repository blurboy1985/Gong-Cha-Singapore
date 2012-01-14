//
//  FavouritesTableView.m
//  GongChaSG
//
//  Created by Daniel Quek on 23/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FavouritesTableView.h"
#import "FavouritesDetailView.h"
#import "DrinkObject.h"
#import "Favourites.h"
#import <QuartzCore/QuartzCore.h>
#import "GongChaSGAppDelegate.h"

@implementation FavouritesTableView
@synthesize messageView;
@synthesize messageLabel;
@synthesize favNib, favCell, managedObjectContext, fetchedResultsController, destinationsArray, favouritesDetailView, tableView=_tableView;


-(void)greetMessage
{
    NSMutableArray *greetArray = [[[NSMutableArray alloc]initWithObjects:
                                   @"You can show your list to our cashiers to place your orders!",
                                   @"The freshness our tea is optimized within an hour from your purchase!",
                                   @"White pearls have ZERO calories!",
                                   @"Gong Cha's very first outlet was at City Square Mall!",
                                   @"Calpis has a flavor similar to plain or vanilla flavored yogurt!",
                                   @"Anti-oxidants in tea keep your body young and delays the aging process!",
                                   @"Drinking tea regularly can help reduce the risk of heart attacks.",                       
                                   @"Fluoride is a natural component of earl grey which is known to protect teeth from cavities",                          
                                   @"Camellia tea is quoted as the weight loss wand by numerous researches!",                            
                                   @"In Singapore, Ai-yu jelly is also known as Iced Jelly!",
                                   nil]autorelease];
    
    NSNumber *randomNum = [NSNumber numberWithInt:(arc4random() %10)];
    NSInteger randomInt = [randomNum integerValue];
    NSString *randomMessage = [[NSString stringWithFormat:@"%@", [greetArray objectAtIndex:randomInt]]retain];
    
    messageLabel.text = randomMessage;
    [randomMessage release];
    
    CATransition *transition = [CATransition animation];
    transition.duration = 2.0f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionReveal;
    messageView.hidden = NO;
    [messageView.layer addAnimation:transition forKey:nil];;
}

- (void)dealloc 
{
    [favNib release];
    [favCell release];
    [destinationsArray release];
    [_tableView release];
    
    [messageLabel release];
    [messageView release];
    [super dealloc];
}

- (void) viewWillAppear:(BOOL)animated
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Favourites" inManagedObjectContext:managedObjectContext];
    [request setEntity:entity];
    NSError *error = nil;
    NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResults == nil)
    {
        // Handle the error.
        NSLog(@"mutableFetchResults == nil");
    }
    [self setDestinationsArray:mutableFetchResults];
    [request release];
    [mutableFetchResults release];
    messageView.hidden = YES;
    
    [self.tableView reloadData];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [self greetMessage];


}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [destinationsArray count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    FavouritesCell *cell = (FavouritesCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        [self.favNib instantiateWithOwner:self options:nil];
        cell = favCell;
        favCell = nil;
    }
    
    Favourites *favourites = (Favourites *)[destinationsArray objectAtIndex:indexPath.row];
    cell.name = favourites.name;
    cell.pearl = favourites.pearl;
    cell.quantity = favourites.quantity;
    cell.price = [favourites.price floatValue];
    
    float sugarValue = [favourites.sugar floatValue];
    
    if (sugarValue>0.95) {
        cell.sugar = @"100%";
    } else
        if (sugarValue>0.70) {
            cell.sugar = @"80%";
        } else
            if (sugarValue>0.40) {
                cell.sugar = @"50%";
            } else
                if (sugarValue>0.05) {
                    cell.sugar = @"30%";
                } else
                        cell.sugar = @"0%";

    float iceValue = [favourites.ice floatValue];
    
    DrinkObject *drinkObject = [[DrinkObject alloc]init];
    
    if ([drinkObject.hotDrinksAvailable containsObject:cell.name])
    {
        if (iceValue>0.95) {
            cell.ice = @"More Ice";
        } else
            if (iceValue>0.55) {
                cell.ice = @"Normal";
            } else
                if (iceValue>0.30) {
                    cell.ice = @"Less Ice";
            } else
                if (iceValue>0.10) {
                    cell.ice = @"No Ice";
                }else
                    cell.ice = @"Hot Drink";
    }
    else
    {
        if (iceValue>0.95) {
            cell.ice = @"More Ice";
        } else
            if (iceValue>0.55) {
                cell.ice = @"Normal";
            } else
                if (iceValue>0.30) {
                    cell.ice = @"Less Ice";
                }else
                    cell.ice = @"No Ice";
    }
    [drinkObject release];
    [super beautifyCell:cell atIndexPath:indexPath];
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (favouritesDetailView ==nil) {
        FavouritesDetailView *temp = [[FavouritesDetailView alloc]initWithNibName:@"FavouritesDetailView" bundle:[NSBundle mainBundle]];
        
        self.favouritesDetailView = temp;
        [temp release];
    }
    
    self.favouritesDetailView.managedObjectContext = self.managedObjectContext;
    Favourites *favourites = (Favourites *)[destinationsArray objectAtIndex:indexPath.row];
    self.favouritesDetailView.favourites = favourites;
    
    [self.navigationController pushViewController:self.favouritesDetailView animated:YES];
    favouritesDetailView.title = favourites.name;
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
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.7 green:0 blue:0 alpha:1];
    self.title = @"My Favourites";

    self.favNib = [UINib nibWithNibName:@"FavouritesCell" bundle:nil];
    self.tableView.rowHeight = 100;  
    
    
}

- (void)viewDidUnload
{
    [self setMessageLabel:nil];
    [self setMessageView:nil];
    [super viewDidUnload];
    destinationsArray = nil;
    _tableView = nil;
    favCell = nil;
    favNib = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:YES];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
        return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tv commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        NSManagedObject *entityToDelete = [self.destinationsArray objectAtIndex:indexPath.row];
        [managedObjectContext deleteObject:entityToDelete];
        [managedObjectContext save:nil];
		
        [self.destinationsArray removeObjectAtIndex:indexPath.row];
    
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
