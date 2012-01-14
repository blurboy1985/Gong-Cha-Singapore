//
//  ListViewController.m
//  GongChaSG
//
//  Created by Daniel Quek on 23/11/11.
//  Copyright (c) 2011 Cellcity. All rights reserved.
//

#import "ListViewController.h"
#import "StoreViewController.h"

#define ALL 0
#define CENTRAL 1
#define EAST 2
#define NORTH 3
#define WEST 4

@implementation ListViewController
{
    NSInteger segment;
}

@synthesize tableView = _tableView;
@synthesize delegate;
@synthesize segmentedControl;
@synthesize sections;
@synthesize data;

-(void)done:(id)sender
{
    [self.delegate dismissViewController:self];
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

-(void)initSections
{
    [self.sections removeObjectsForKeys:[self.sections allKeys]];
    
    for (NSDictionary *locationSection in self.data) {
        NSString *c = [locationSection objectForKey:@"Location"];
        
        BOOL found = NO;
        
        for (NSString *str in [self.sections allKeys]) {
            if ([str isEqualToString:c]) {
                found = YES;
            }
        }
        if (!found)
            [self.sections setValue:[[[NSMutableArray alloc]init]autorelease] forKey:c];
        }
    
    for (NSDictionary *locationSection in self.data) {
        [[self.sections objectForKey:[locationSection objectForKey:@"Location"]] addObject:locationSection];
    }
    
    for (NSString *key in [self.sections allKeys]) {
        [[self.sections objectForKey:key] sortUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"Outlet" ascending:YES]]];
    }

}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.7 green:0 blue:0 alpha:1];
    self.navigationItem.rightBarButtonItem = doneButton;
    
    [doneButton release];
    self.title = @"Locations";
    
    [self.segmentedControl addTarget:self action:@selector(segmentClicked) forControlEvents:UIControlEventValueChanged];
    
    NSString *dataPath = [[NSBundle mainBundle]pathForResource:@"StoreListing-1" ofType:@"plist"];
    self.data = [NSArray arrayWithContentsOfFile:dataPath];
    self.sections = [[[NSMutableDictionary alloc]init]autorelease];
    
    [self initSections];
    
}

-(void)segmentClicked
{

    segment = self.segmentedControl.selectedSegmentIndex;
    [self initSections];
    
    if (segment == CENTRAL) {
        [sections removeObjectsForKeys:[NSArray arrayWithObjects:@"WEST",@"EAST",@"NORTH", nil]];
    }
    else if (segment == NORTH) {
        [sections removeObjectsForKeys:[NSArray arrayWithObjects:@"WEST",@"EAST",@"CENTRAL", nil]];
    }
    else if (segment == EAST) {
        [sections removeObjectsForKeys:[NSArray arrayWithObjects:@"WEST",@"CENTRAL",@"NORTH", nil]];
    }
    else if (segment == WEST) {
        [sections removeObjectsForKeys:[NSArray arrayWithObjects:@"CENTRAL",@"EAST",@"NORTH", nil]];
    }
    [self.tableView reloadData];
}


- (void)viewDidUnload
{
    [self setTableView:nil];
    [self setSegmentedControl:nil];
    self.data = nil;
    self.sections = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [super dealloc];
}

#pragma mark TableView DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[sections allKeys]count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[[sections allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)]objectAtIndex:section];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[sections valueForKey:[[[sections allKeys]sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)]objectAtIndex:section]]count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    NSDictionary *dataItem = [[sections valueForKey:[[[sections allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)]objectAtIndex:indexPath.section]]objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [dataItem objectForKey:@"Outlet"];
    cell.detailTextLabel.text = [dataItem objectForKey:@"Address"];
    
    UIView *viewSelected = [[[UIView alloc] init] autorelease];
    viewSelected.backgroundColor = [UIColor redColor];
    cell.selectedBackgroundView = viewSelected;

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dataItem = [[sections valueForKey:[[[sections allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)]objectAtIndex:indexPath.section]]objectAtIndex:indexPath.row];
    
    StoreViewController *storeViewController = [[StoreViewController alloc]initWithNibName:@"StoreViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:storeViewController animated:YES];
    
    storeViewController.outletLabel.text = [dataItem objectForKey:@"Outlet"];
    storeViewController.addressLabel.text = [dataItem objectForKey:@"Address"];
    storeViewController.unitLabel.text = [dataItem objectForKey:@"Unit"];
    storeViewController.timeLabel.text = [dataItem objectForKey:@"Operational Hours"];
    storeViewController.telephoneLabel.text = [dataItem objectForKey:@"Tel No"];
    storeViewController.title = [dataItem objectForKey:@"Outlet"];

    

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [storeViewController release];
}


@end
