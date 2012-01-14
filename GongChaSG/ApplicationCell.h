

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ApplicationCell : UITableViewCell
{
    UIImage *icon;
    NSString *teaType;
    NSString *nameCh;
    NSString *name;
    NSString *price;
    UIImage *special;
    UIImage *hot;
}


@property(retain) UIImage *icon;

@property(retain) UIImage *hot;

@property(retain) NSString *price;

@property(retain) NSString *nameCh;

@property(retain) NSString *teaType;

@property(retain) NSString *name;

@property(retain) UIImage *special;

@end
