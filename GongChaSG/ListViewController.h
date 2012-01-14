//
//  ListViewController.h
//  GongChaSG
//
//  Created by Daniel Quek on 23/11/11.
//  Copyright (c) 2011 Cellcity. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ListViewController;

@protocol ListViewControllerDelegate <NSObject>

- (void)dismissViewController:(ListViewController *)listViewController;

@end

@interface ListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
 
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (assign, nonatomic) id <ListViewControllerDelegate> delegate;
@property (retain, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property (nonatomic, retain) NSMutableArray *data;
@property (nonatomic, retain) NSMutableDictionary *sections;

@end
