

#import "MenuViewController.h"
#import "DetailViewController.h"
#import "DrinkObject.h"


@implementation MenuViewController

@synthesize tmpCell, data, cellNib, sections;
@synthesize tableView=_tableView;

#pragma mark - 
#pragma mark Lifecycle methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.7 green:0 blue:0 alpha:1];
    self.tableView.rowHeight = 74;
    self.title = @"Menu";
    
	// Load the data.
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
    data = [[NSArray arrayWithContentsOfFile:dataPath]retain];
	
	self.cellNib = [UINib nibWithNibName:@"IndividualSubviewsBasedApplicationCell" bundle:nil];
    
    self.sections = [[[NSMutableDictionary alloc]init]autorelease];
    
    BOOL found;
    
    for (NSDictionary *teaSection in self.data)
    {        
        NSString *c = [[teaSection objectForKey:@"TeaType"] substringFromIndex:0];
        found = NO;
        
        for (NSString *str in [self.sections allKeys])
        {
            if ([str isEqualToString:c])
                found = YES;
        }
        
        if (!found)
            [self.sections setValue:[[[NSMutableArray alloc] init]autorelease] forKey:c];
    }
    
    // Loop again and insert the teas into their respective keys
    for (NSDictionary *teaSection in self.data)
    {
        NSString *key = [teaSection objectForKey:@"TeaType"];
        NSMutableArray *array = [self.sections objectForKey:key];
        [array addObject:teaSection];
    }    

    
    // Sort each section array
    for (NSString *key in [self.sections allKeys])
    {
        [[self.sections objectForKey:key] sortUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"TeaType" ascending:YES]]];
    } 
    

}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

// Customize the number of sections in the table view.

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return [[self.sections allKeys] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{    
    return [[[self.sections allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    return [[self.sections valueForKey:[[[self.sections allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section]] count];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [[self.sections allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
}


// Customize the appearance of table view cells.

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    ApplicationCell *cell = (ApplicationCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
    if (cell == nil)
    {
        [self.cellNib instantiateWithOwner:self options:nil];
		cell = tmpCell;

    }
	// Configure the data for the cell.

    NSDictionary *dataItem = [[self.sections valueForKey:[[[self.sections allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    
    cell.icon = [UIImage imageNamed:[dataItem objectForKey:@"Icon"]];
    cell.nameCh = [dataItem objectForKey:@"NameCh"];
    cell.name = [dataItem objectForKey:@"Name"];
    cell.price = [dataItem objectForKey:@"Price"];
    cell.teaType = [dataItem objectForKey:@"TeaType"];
    cell.special = [UIImage imageNamed:[dataItem objectForKey:@"Special"]];
    cell.hot = [UIImage imageNamed:[dataItem objectForKey:@"Hot"]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(void)displayAlert:(DetailViewController *)detail
{
    DrinkObject *drinkObject = [[DrinkObject alloc]init];
    
        if ([drinkObject.hotDrinksAvailable containsObject:detail.title]) {
            detail.hotLabel.hidden = NO;
            detail.hotDrinkView.hidden = NO;
            detail.line.hidden = NO;
            detail.hotDrinkView.frame = CGRectMake(280, 0, detail.hotDrinkView.frame.size.width, detail.hotDrinkView.frame
                                                   .size.width);
            [UIView animateWithDuration:8.0 delay:0.0 options:UIViewAnimationCurveLinear
                             animations:^{
                                 detail.hotDrinkView.frame = CGRectMake(0.0 - detail.hotDrinkView.frame.size.width, 0, detail.hotDrinkView.frame.size.width, detail.hotDrinkView.frame.size.height);
                             }
                             completion:nil];
        } 
    
   else if ([drinkObject.hotDrinksOnly containsObject:detail.title]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Only Hot Drink available" 
                                                            message:@"Please note that Ginger Tea is a hot drink only. Thank you!" 
                                                           delegate:self 
                                                  cancelButtonTitle:@"Ok" 
                                                  otherButtonTitles:nil];
            [alert show];
            [alert release];
            detail.iceSlider.value = 1.0;
            detail.hotLabel.hidden = NO;
        }
    
    [drinkObject release];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dataItem = [[self.sections valueForKey:[[[self.sections allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    
    DetailViewController *detail = [[DetailViewController alloc]initWithNibName:@"DetailViewController" bundle:[NSBundle mainBundle]];
    
    [self.navigationController pushViewController:detail animated:YES];
    detail.title = [dataItem objectForKey:@"Name"];
    detail.teaName.text = [dataItem objectForKey:@"Name"];
    detail.hotLabel.hidden = YES;
    detail.hotDrinkView.hidden = YES;
    detail.line.hidden = YES;
    
    NSString *newStringValue = [[dataItem objectForKey:@"Price"]stringByReplacingOccurrencesOfString:@"$" withString:@""];
    NSNumberFormatter *myNumFormatter = [[NSNumberFormatter alloc]init];
    [myNumFormatter setLocale:[NSLocale currentLocale]];
    [myNumFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [myNumFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *tempNum = [myNumFormatter numberFromString:newStringValue];
    
    detail.price = [tempNum floatValue];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self displayAlert:detail];
    [myNumFormatter release];
    [detail release];

}


#pragma mark -
#pragma mark Memory Management



- (void)viewDidUnload
{
    [super viewDidUnload];
    self.tableView = nil;
    self.data = nil;
	self.cellNib = nil;
    self.sections = nil;
}

- (void)dealloc
{
    [data release];
	[tmpCell release];
	[cellNib release];
    [sections release];
    [_tableView release];

    [super dealloc];
}

@end
