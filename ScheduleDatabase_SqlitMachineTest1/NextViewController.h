//
//  NextViewController.h
//  ScheduleDatabase_SqlitMachineTest1
//
//  Created by Student P_02 on 03/07/18.
//  Copyright © 2018 Shital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "TableViewCell.h"
#import "DataBaseLib.h"
@interface NextViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *EnterScheduleNameTextField;

- (IBAction)SelectRoom_ApplianceButtonAction:(UIButton *)sender;


@property (weak, nonatomic) IBOutlet UIButton *SelectRoomButtonoutlet;

@property (weak, nonatomic) IBOutlet UIButton *SelectApplianceButtonoutlet;


@property (weak, nonatomic) IBOutlet UIDatePicker *myDatePickerOutlet;

- (IBAction)myDatePickerAction:(UIDatePicker *)sender;


- (IBAction)DaysButtonAction:(UIButton *)sender;
- (IBAction)SaveButtonAction:(UIButton *)sender;
- (IBAction)UpdateButtonAction:(UIButton *)sender;
- (IBAction)DeleteButtonAction:(UIButton *)sender;

@property NSArray *RoomArray;
@property NSArray *ApplianceArray;
@property NSInteger Selectedtag;

@property NSString *SelectedScheduleName;
@property NSString *SelectedRoom;
@property NSString *SelectedAppliance;
@property NSString *Selectedtime;
@property NSString *SelectedDay;
@property NSMutableString *DayMutableString;
@property NSString *SelectedDay1;

@property  UITableView *myTableView;

@end
