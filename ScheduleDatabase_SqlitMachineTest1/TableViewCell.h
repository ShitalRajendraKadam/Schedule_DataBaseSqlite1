//
//  TableViewCell.h
//  ScheduleDatabase_SqlitMachineTest1
//
//  Created by Student P_02 on 03/07/18.
//  Copyright © 2018 Shital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "NextViewController.h"
#import "DataBaseLib.h"

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *ON_OFFButtonOutlet;
@property (weak, nonatomic) IBOutlet UILabel *ScheduleNameLablecell;
@property (weak, nonatomic) IBOutlet UILabel *TimeLableCell;
- (IBAction)On_OFFButtonActionCell:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *DaysLableCell;

@end
