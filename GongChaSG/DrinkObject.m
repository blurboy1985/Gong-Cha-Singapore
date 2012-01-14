//
//  DrinkObject.m
//  GongChaSG
//
//  Created by Daniel Quek on 27/11/11.
//  Copyright (c) 2011 Cellcity. All rights reserved.
//

#import "DrinkObject.h"

@implementation DrinkObject
@synthesize hotDrinksAvailable;
@synthesize hotDrinksOnly;

- (id)init {
    self = [super init];
    if (self) {
        hotDrinksAvailable = [NSArray arrayWithObjects:
                     @"Alisan Tea", 
                     @"Taiwan Green Tea",
                     @"Oolong Tea",    
                     @"Taiwan Black Tea",
                     @"Taro Milk",    
                     @"Chocolate Milk",
                     @"Golden Ovailine",
                     @"Korean Citron Juice",
                     @"Milk Tea",
                     @"Milk Green Tea",
                     @"Milk Oolong Tea",
                     @"Milk Tea w Pearl",
                     @"House Special Coffee",
                     @"Earl Grey Milk Tea",
                     @"Caramel Milk Tea",
                     @"Caramel Coffee",
                     @"Gong Cha Milk Coffee",
                     @"Longan Red Date Tea",
                     @"Honey Lemon",
                     @"Lemon Kumquat Juice",
                     @"Kumquat Juice",
                     @"Fresh Milk Black Tea",
                     @"Fresh Milk Green Tea",
                     nil];
        
        hotDrinksOnly = [NSArray arrayWithObjects:
                         @"Ginger Tea",
                         nil];
    }
    return self;
}

@end
