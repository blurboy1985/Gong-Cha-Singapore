//
//  FavouritesTableView.h
//  GongChaSG
//
//  Created by Daniel Quek on 23/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavouritesDetailView.h"
#import "BeautifulTableViewController.h"
#import "FavouritesCell.h"

@interface FavouritesTableView : BeautifulTableViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSFetchedResultsController *fetchedResultsController;
    NSManagedObjectContext *managedObjectContext;
    NSMutableArray *destinationsArray;
}

@property(nonatomic,retain) IBOutlet UITableView *tableView;
@property(retain,nonatomic) FavouritesCell *favCell;

@property(retain,nonatomic) UINib *favNib;
@property(retain,nonatomic) NSFetchedResultsController *fetchedResultsController;
@property(retain,nonatomic) NSManagedObjectContext *managedObjectContext;
@property(retain,nonatomic) NSMutableArray *destinationsArray;

@property(retain,nonatomic) FavouritesDetailView *favouritesDetailView;
@property (retain, nonatomic) IBOutlet UILabel *messageLabel;
@property (retain, nonatomic) IBOutlet UIView *messageView;

@end
