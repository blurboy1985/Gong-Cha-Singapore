
#import "IndividualSubviewsBasedApplicationCell.h"


@implementation IndividualSubviewsBasedApplicationCell


- (void)setIcon:(UIImage *)newIcon
{
    [super setIcon:newIcon];
    iconView.image = newIcon;
}

- (void)setHot:(UIImage *)newHot
{
    [super setHot:newHot];
    hotView.image = newHot;
}

- (void)setNameCh:(NSString *)newNameCh
{
    [super setNameCh:newNameCh];
    nameChLabel.text = newNameCh;
}

- (void)setTeaType:(NSString *)newteaType
{
    [super setTeaType:newteaType];
    teaTypeLabel.text = newteaType;
}


- (void)setName:(NSString *)newName
{
    [super setName:newName];
    nameLabel.text = newName;
}

- (void)setPrice:(NSString *)newPrice
{
    [super setPrice:newPrice];
    priceLabel.text = newPrice;
}

- (void)setSpecial:(UIImage *)newSpecial
{
    [super setSpecial:newSpecial];
    specialView.image = newSpecial;
}

- (void)dealloc
{
    [specialView release];
    [iconView release];
    [nameChLabel release];
    [nameLabel release];
    [priceLabel release];
    [teaTypeLabel release];
    [hotView release];

    [super dealloc];
}

@end
