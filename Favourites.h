//
//  Favourites.h
//  GongChaSG
//
//  Created by Daniel Quek on 26/8/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
          

@interface Favourites : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * ice;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * pearl;
@property (nonatomic, retain) NSNumber * sugar;
@property (nonatomic, retain) NSString * quantity;
@property (nonatomic, retain) NSNumber * price;

@end
