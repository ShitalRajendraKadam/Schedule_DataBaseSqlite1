//
//  ViewController.m
//  ScheduleDatabase_SqlitMachineTest1
//
//  Created by Student P_02 on 03/07/18.
//  Copyright © 2018 Shital. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *query=@"select * from Schedule1";
    [[DataBaseLib getSharedObject]getAllTasks:query];
    self.myScheduleNameArray=[[DataBaseLib getSharedObject]taskScheduleNameArray];
    self.mySelectRoomArray=[[DataBaseLib getSharedObject]taskRoomNameArray];
    self.mySelectApplianceArray=[[DataBaseLib getSharedObject]taskApplianceNameArray];
    self.mySelectTimeArray=[[DataBaseLib getSharedObject]taskTimeArray];
    
    self.mySelectDaysArray=[[DataBaseLib getSharedObject]taskDayArray];
    
   
    
    [self.myTableView reloadData];
    
     self.AddScheduleButtonOutlet.layer.cornerRadius=20;
    

    // Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.myScheduleNameArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.ScheduleNameLablecell.text=[self.myScheduleNameArray objectAtIndex:indexPath.row];
    
    cell.TimeLableCell.text=[self.mySelectTimeArray objectAtIndex:indexPath.row];
    
    cell.DaysLableCell.text=[self.mySelectDaysArray objectAtIndex:indexPath.row];
    
    
    
    
    
    return cell;
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    
    NextViewController *next=[self.storyboard instantiateViewControllerWithIdentifier:@"NextViewController"];
    
    
    next.SelectedScheduleName=cell.ScheduleNameLablecell.text;
    next.Selectedtime=cell.TimeLableCell.text;
    
    next.SelectedDay1=cell.DaysLableCell.text;
    
    
    
    [self.navigationController pushViewController:next animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)AddScheduleButtonAction:(UIButton *)sender
{
    NextViewController *nvc=[self.storyboard instantiateViewControllerWithIdentifier:@"NextViewController"];
    
    [self.navigationController pushViewController:nvc animated:YES];
}
@end
