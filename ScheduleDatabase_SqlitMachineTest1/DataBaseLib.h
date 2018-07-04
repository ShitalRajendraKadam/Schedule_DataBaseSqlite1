//
//  DataBaseLib.h
//  ScheduleDatabase_SqlitMachineTest1
//
//  Created by Student P_02 on 03/07/18.
//  Copyright © 2018 Shital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"
#import "NextViewController.h"
#import "TableViewCell.h"
#import <sqlite3.h>
@interface DataBaseLib : NSObject
{
    sqlite3 *taskDatabase;
}
+(instancetype)getSharedObject;
-(void)createDatabase;
-(NSString *)getDatabasePath;
-(int)executeQuery:(NSString *)query;
-(void)getAllTasks:(NSString *)query;

@property  NSMutableArray *taskScheduleNameArray;
@property NSMutableArray *taskRoomNameArray;
@property NSMutableArray *taskApplianceNameArray;
@property NSMutableArray *taskTimeArray;
@property NSMutableArray *taskDayArray;
@end
