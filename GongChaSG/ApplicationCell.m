
#import "ApplicationCell.h"

@implementation ApplicationCell

@synthesize icon, nameCh, name, price, teaType, special, hot;

- (void)dealloc
{
    [icon release];
    [nameCh release];
    [name release];
    [price release];
    [teaType release];
    [hot release];
    [special release];
    
    [super dealloc];
}


@end
