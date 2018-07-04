//
//  ViewController.h
//  ScheduleDatabase_SqlitMachineTest1
//
//  Created by Student P_02 on 03/07/18.
//  Copyright © 2018 Shital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NextViewController.h"
#import "TableViewCell.h"
#import "DataBaseLib.h"
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *AddScheduleButtonOutlet;

- (IBAction)AddScheduleButtonAction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;


@property NSArray *myScheduleNameArray;
@property NSArray *mySelectRoomArray;
@property NSArray *mySelectApplianceArray;
@property NSArray *mySelectTimeArray;
@property NSArray *mySelectDaysArray;

@end

