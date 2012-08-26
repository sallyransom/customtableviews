//
//  SRSpecificationsCell.m
//  SRCustomTableViews
//
//  Created by sailon ransom on 8/22/12.
//  Copyright (c) 2012 sailon ransom. All rights reserved.
//

#import "SRSpecificationsCell.h"

typedef enum {
    ENGINE = 0,
    TRANSMISSION,
    DRIVE,
    FUEL_CAPACITY,
    MPG,
    WEIGHT,
    numberOfSpecifications
    
} Specification;

#define LABEL_HEIGHT 15.0
#define NAME_LABEL_WIDTH 100.0
#define INFO_LABEL_WIDTH 130.0
#define LABEL_BUFFER 5.0
#define CELL_MARGIN 10.0

@interface SRSpecificationsCell ()
@property (nonatomic, strong) SRMotorcycle *motorcycle;
@end

@implementation SRSpecificationsCell

- (id)initWithMotorcycle:(SRMotorcycle *)motorcycle reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        self.motorcycle = motorcycle;
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"darkbkg.jpg"]];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addLabels];
        [self setHeightForContentiew];
    }
    return self;
}

+ (CGFloat)heightForCell {
    CGFloat height = CELL_MARGIN * 2 + LABEL_HEIGHT * numberOfSpecifications + LABEL_BUFFER * (numberOfSpecifications - 1);
    
    return height;
}

- (void)setHeightForContentiew {
    CGRect frame = self.contentView.frame;
    frame.size.height = [SRSpecificationsCell heightForCell];
    self.contentView.frame = frame;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)addLabels {
    for (int specification = ENGINE; specification < numberOfSpecifications; specification++) {
        [self addSpecificationNameLabelFor:specification];
        [self addSpecificationInfoLabelFor:specification];
    }
}

- (CGFloat)yPositionForSpecification:(Specification)specification {
    return CELL_MARGIN + specification*(LABEL_BUFFER + LABEL_HEIGHT);
}

- (void)addSpecificationNameLabelFor:(Specification)specification {
    UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:13.0];
    
    CGRect nameLabelFrame = CGRectMake(CELL_MARGIN, [self yPositionForSpecification:specification], NAME_LABEL_WIDTH, LABEL_HEIGHT);
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:nameLabelFrame];
    nameLabel.text = [self nameForSpecification:specification];
    nameLabel.font = font;
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.textAlignment = UITextAlignmentRight;
    nameLabel.backgroundColor = [UIColor clearColor];
    
    [self.contentView addSubview:nameLabel];
}

- (void)addSpecificationInfoLabelFor:(Specification)specification {
    UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:13.0];
    
    CGRect infoLabelFrame = CGRectMake(CELL_MARGIN + LABEL_BUFFER + NAME_LABEL_WIDTH, [self yPositionForSpecification:specification], INFO_LABEL_WIDTH, LABEL_HEIGHT);
    UILabel *infoLabel = [[UILabel alloc] initWithFrame:infoLabelFrame];
    infoLabel.text = [self infoForSpecification:specification];
    infoLabel.font = font;
    infoLabel.textColor = [UIColor whiteColor];
    infoLabel.textAlignment = UITextAlignmentLeft;
    infoLabel.backgroundColor = [UIColor clearColor];
    
    [self.contentView addSubview:infoLabel];
}

- (NSString *)nameForSpecification:(Specification)specification {
    switch (specification) {
        case ENGINE:
            return @"engine:";
            break;
        case TRANSMISSION:
            return @"transmission:";
            break;
        case DRIVE:
            return @"drive:";
            break;
        case FUEL_CAPACITY:
            return @"fuel capacity:";
            break;
        case MPG:
            return @"mpg:";
            break;
        case WEIGHT:
            return @"weight:";
            break;
            
        default:
            break;
    }
    return nil;
}

- (NSString *)infoForSpecification:(Specification)specification {
    switch (specification) {
        case ENGINE:
            return [NSString stringWithFormat:@"%dcc", self.motorcycle.engine];
            break;
        case TRANSMISSION:
            return self.motorcycle.transmission;
            break;
        case DRIVE:
            return self.motorcycle.drive;
            break;
        case FUEL_CAPACITY:
            return [NSString stringWithFormat:@"%.1f gallons", self.motorcycle.fuelCapacity];
            break;
        case MPG:
            return [NSString stringWithFormat:@"%d", self.motorcycle.mpg];
            break;
        case WEIGHT:
            return [NSString stringWithFormat:@"%d lbs", self.motorcycle.weight];
            break;
            
        default:
            break;
    }
    return nil;
}

@end
