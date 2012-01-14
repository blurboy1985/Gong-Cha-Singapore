

#import <UIKit/UIKit.h>
#import "ApplicationCell.h"

@interface MenuViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> 

@property (nonatomic, retain) IBOutlet ApplicationCell *tmpCell;
@property (nonatomic, retain) NSArray *data;
@property (nonatomic, retain) UINib *cellNib;

@property (nonatomic, retain) NSMutableDictionary *sections;
@property (nonatomic, retain) IBOutlet UITableView *tableView;

@end
