//
//  IndividualFavCell.h
//  GongChaSG
//
//  Created by Daniel Quek on 2/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavouritesCell.h"

@interface IndividualFavCell : FavouritesCell
{
    IBOutlet UILabel *nameLabel;
    IBOutlet UILabel *sugarLabel;
    IBOutlet UILabel *iceLabel;
    IBOutlet UILabel *pearlLabel;
    IBOutlet UILabel *qtyLabel;
    IBOutlet UILabel *priceLabel;
}

@end
