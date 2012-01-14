//
//  FavouritesCell.h
//  GongChaSG
//
//  Created by Daniel Quek on 2/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface FavouritesCell : UITableViewCell

@property (retain) NSString *name;
@property (retain) NSString *sugar;
@property (retain) NSString *pearl;
@property (retain) NSString *ice;
@property (retain) NSString *quantity;
@property (assign) float price;

@end
