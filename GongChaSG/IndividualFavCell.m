//
//  IndividualFavCell.m
//  GongChaSG
//
//  Created by Daniel Quek on 2/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "IndividualFavCell.h"

@implementation IndividualFavCell

- (void)setName:(NSString *)newName
{
    [super setName:newName];
    nameLabel.text = newName;
}

- (void)setSugar:(NSString *)newSugar
{
    [super setSugar:newSugar];
    sugarLabel.text = newSugar;
}

- (void)setPearl:(NSString *)newPearl
{
    [super setPearl:newPearl];
    pearlLabel.text = newPearl;
}

- (void)setQuantity:(NSString *)newQuantity
{
    [super setQuantity:newQuantity];
    qtyLabel.text = newQuantity;
}

-(void)setIce:(NSString *)newIce
{
    [super setIce:newIce];
    iceLabel.text = newIce;
}

-(void)setPrice:(float)newPrice
{
    [super setPrice:newPrice];
    priceLabel.text = [NSString stringWithFormat:@"%.2f",newPrice];
}

- (void)dealloc
{
    [iceLabel release];
    [nameLabel release];
    [pearlLabel release];
    [sugarLabel release];
    [qtyLabel release];
    
    [super dealloc];
}

@end