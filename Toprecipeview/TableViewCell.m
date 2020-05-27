//
//  TableViewCell.m
//  LunchBox
//
//  Created by Sujit Bhandari on 12/10/19.
//  Copyright © 2019 Sujit Bhandari. All rights reserved.
//

#import "TableViewCell.h"


@implementation TableViewCell
@synthesize lblName;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
   
   
}

@end
