//
//  TableViewCell.m
//  ScheduleDatabase_SqlitMachineTest1
//
//  Created by Student P_02 on 03/07/18.
//  Copyright © 2018 Shital. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.ON_OFFButtonOutlet setTitle:@"ON" forState:UIControlStateNormal];

    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)On_OFFButtonActionCell:(UIButton *)sender
{
    if([sender.titleLabel.text isEqual:@"ON"])
    {
        [sender setTitle:@"OFF" forState:UIControlStateNormal];
    }
    
    else
        
    {
        [sender setTitle:@"ON" forState:UIControlStateNormal];
        
    }

}
@end
