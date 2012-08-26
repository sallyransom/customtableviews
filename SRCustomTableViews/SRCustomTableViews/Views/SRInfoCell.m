//
//  SRInfoCell.m
//  SRCustomTableViews
//
//  Created by sailon ransom on 8/22/12.
//  Copyright (c) 2012 sailon ransom. All rights reserved.
//

#import "SRInfoCell.h"

@interface SRInfoCell ()
@property (nonatomic, strong) SRMotorcycle *motorcycle;
@property (nonatomic, strong) UILabel *infoLabel;
@end

@implementation SRInfoCell

- (id)initWithMotorcycle:(SRMotorcycle *)motorcycle reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        self.motorcycle = motorcycle;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.infoLabel];
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"darkbkg.jpg"]];
        
    }
    return self;
}

+ (CGFloat)heightForCellWithMotorcycle:(SRMotorcycle *)motorcycle {
    SRInfoCell *cell = [[SRInfoCell alloc] initWithMotorcycle:motorcycle reuseIdentifier:nil];
    
    return cell.infoLabel.frame.size.height + 5.0 * 2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UILabel *)infoLabel {
    UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:13.0];
    CGSize labelSize = [self.motorcycle.info sizeWithFont:font
                                        constrainedToSize:CGSizeMake(285.0, 9999)
                                            lineBreakMode:UILineBreakModeWordWrap];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5.0, 5.0, labelSize.width, labelSize.height)];
    label.text = self.motorcycle.info;
    label.font = font;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    label.lineBreakMode = UILineBreakModeWordWrap;
    label.numberOfLines = 0;
    
    return label;
}

@end
