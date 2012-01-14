
#import "ApplicationCell.h"
#import <Foundation/Foundation.h>

@interface IndividualSubviewsBasedApplicationCell : ApplicationCell
{
    IBOutlet UIImageView *iconView;
    IBOutlet UILabel *nameChLabel;
    IBOutlet UILabel *nameLabel;
    IBOutlet UILabel *priceLabel;
    IBOutlet UILabel *teaTypeLabel;
    IBOutlet UIImageView *specialView;
    IBOutlet UIImageView *hotView;
}

@end
