//
//  StoreLocation.h
//  GongChaSG
//
//  Created by Daniel Quek on 23/11/11.
//  Copyright (c) 2011 Cellcity. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoreLocation : NSObject 

@property (nonatomic, assign) int uniqueId;
@property (nonatomic, copy) NSString *storeName;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *location;

-(id)initWithUniqueId:(int)uniqueId storeName:(NSString *)storeName address:(NSString *)address location:(NSString *)location;


@end
