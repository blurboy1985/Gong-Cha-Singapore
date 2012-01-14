//
//  FavouritesCell.m
//  GongChaSG
//
//  Created by Daniel Quek on 2/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FavouritesCell.h"

@implementation FavouritesCell

@synthesize pearl, name, ice, sugar, quantity, price;

- (void)dealloc
{
    [sugar release];
    [ice release];
    [name release];
    [pearl release];
    [quantity release];
    
    [super dealloc];
}

@end
