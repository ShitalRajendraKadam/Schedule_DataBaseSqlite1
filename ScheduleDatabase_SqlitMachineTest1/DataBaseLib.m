//
//  DataBaseLib.m
//  ScheduleDatabase_SqlitMachineTest1
//
//  Created by Student P_02 on 03/07/18.
//  Copyright © 2018 Shital. All rights reserved.
//

#import "DataBaseLib.h"

@implementation DataBaseLib
+(instancetype)getSharedObject
{
    static DataBaseLib *sharedObject;
    if(sharedObject==nil)
    {
        sharedObject=[[DataBaseLib alloc]init];
    }
    
    return sharedObject;
}
-(NSString *)getDatabasePath
{
    NSArray *docDir=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbpath=[[docDir firstObject]stringByAppendingString:@"sqliteDatabase.db"];
    return dbpath;
}
-(int)executeQuery:(NSString *)query
{
    int success=0;
    const char *cQuery=[query UTF8String];
    const char *cDatabasePath=[[self getDatabasePath]UTF8String];
    sqlite3_stmt *stmt;
    if(sqlite3_open(cDatabasePath,&taskDatabase)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(taskDatabase,cQuery,-1,&stmt,NULL)!=SQLITE_OK)
        {
            NSLog(@"Prepare v2  Error:%s",sqlite3_errmsg(taskDatabase));
        }
        else
        {
            
            if(sqlite3_step(stmt)==SQLITE_DONE)
            {
                success=1;
            }
        }
    }
    return success;
}
-(void)createDatabase
{
    NSString *query=@"create table if not exists Schedule1( taskScheduleName text,taskRoomName text,taskApplianceName text,taskTime text,taskDay text)";
    
    int isSuccess=[self executeQuery:query];
    if(isSuccess)
    {
        NSLog(@"Database created successfully");
    }
    else
    {
        NSLog(@"Database creation failed");
    }
}
-(void)getAllTasks:(NSString *)query
{
    self.taskScheduleNameArray=[[NSMutableArray alloc]init];
    self.taskRoomNameArray=[[NSMutableArray alloc]init];
    self.taskApplianceNameArray=[[NSMutableArray alloc]init];
    self.taskTimeArray=[[NSMutableArray alloc]init];
    self.taskDayArray=[[NSMutableArray alloc]init];
    const char *cQuery=[query UTF8String];
    const char *cDatabasePath=[[self getDatabasePath]UTF8String];
    sqlite3_stmt *stmt;
    if(sqlite3_open(cDatabasePath,&taskDatabase)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(taskDatabase,cQuery,-1,&stmt,NULL)!=SQLITE_OK)
        {
            NSLog(@"Error:%s",sqlite3_errmsg(taskDatabase));
            
        }
        else
        {
            while(sqlite3_step(stmt)==SQLITE_ROW)
            {
                const char *task=(const char *)sqlite3_column_text(stmt,0);
                NSString *myTask=[NSString stringWithFormat:@"%s",task];
                [self.taskScheduleNameArray addObject:myTask];
                
                const char *task1=(const char *)sqlite3_column_text(stmt,1);
                NSString *myTask1=[NSString stringWithFormat:@"%s",task1];
                [self.taskRoomNameArray addObject:myTask1];
                
                const char *task2=(const char *)sqlite3_column_text(stmt,2);
                NSString *myTask2=[NSString stringWithFormat:@"%s",task2];
                [self.taskApplianceNameArray addObject:myTask2];
                
                const char *task3=(const char *)sqlite3_column_text(stmt,3);
                NSString *myTask3=[NSString stringWithFormat:@"%s",task3];
                [self.taskTimeArray addObject:myTask3];
                
                const char *task4=(const char *)
                sqlite3_column_text(stmt, 4);
                NSString *myTask4=[NSString stringWithFormat:@"%s",task4];
                [self.taskDayArray addObject:myTask4];
                
                                
                
            }
        }
        
    }
}

@end
