//
//  NextViewController.m
//  ScheduleDatabase_SqlitMachineTest1
//
//  Created by Student P_02 on 03/07/18.
//  Copyright © 2018 Shital. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ApplianceArray=@[@"Light1",@"Light2",@"Light3",@"Fan"];
    self.RoomArray=@[@"Bedroom",@"Living Room",@"Dining Room",@"Kitchen"];
    self.EnterScheduleNameTextField.delegate = self;
    
    self.EnterScheduleNameTextField.text=self.SelectedScheduleName;
    self.DayMutableString=[[NSMutableString alloc]init];

    // Do any additional setup after loading the view.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.Selectedtag==201)
    {
        return self.RoomArray.count;
    }
     else
     {
        return self.ApplianceArray.count;
     }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    if(self.Selectedtag==201)
    {
        cell.textLabel.text=[self.RoomArray objectAtIndex:indexPath.row];
    }
    if(self.Selectedtag==202)
    {
        cell.textLabel.text=[self.ApplianceArray objectAtIndex:indexPath.row];
    }
    return cell;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    if(self.Selectedtag==201)
    {
        [self.SelectRoomButtonoutlet setTitle:cell.textLabel.text forState:UIControlStateNormal];
        self.myTableView.hidden=YES;
    }
    if(self.Selectedtag==202)

        
    {
        [self.SelectApplianceButtonoutlet setTitle:cell.textLabel.text forState:UIControlStateNormal];
        self.myTableView.hidden=YES;
        
        
    }
    
    
    
    
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.EnterScheduleNameTextField resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)myDatePickerAction:(UIDatePicker *)sender
{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    NSDate *time=self.myDatePickerOutlet.date;
    [formatter setDateFormat:@"hh:mm aa"];
    
    self.Selectedtime=[formatter stringFromDate:time];
    
    NSLog(@"Time: %@",self.Selectedtime);

}

- (IBAction)DaysButtonAction:(UIButton *)sender
{
    sender.backgroundColor=[UIColor lightGrayColor];
    self.SelectedDay=sender.titleLabel.text;
    
    [self.DayMutableString appendFormat:@"  %@",self.SelectedDay];
    sender.enabled=NO;
    NSLog(@"Appended days=%@",self.DayMutableString);

}

- (IBAction)SaveButtonAction:(UIButton *)sender
{
    NSString *SheduleText,*RoomNameText,*ApplianceNameText,*TimeText,*DaysText;
    
    SheduleText=self.EnterScheduleNameTextField.text;
    RoomNameText=self.SelectRoomButtonoutlet.titleLabel.text;
    ApplianceNameText=self.SelectApplianceButtonoutlet.titleLabel.text;
    TimeText=self.Selectedtime;
    DaysText=self.DayMutableString;
    
    //DaysText=self.SelectApplianceButtonOutlet.titleLabel.text;
    
    
    NSString *query=[NSString stringWithFormat:@"insert into Schedule1( taskScheduleName,taskRoomName,taskApplianceName ,taskTime,taskDay)values('%@','%@','%@','%@','%@')",SheduleText,RoomNameText,ApplianceNameText,TimeText,DaysText];
    
    int isSuccess=[[DataBaseLib getSharedObject]executeQuery:query];
    if(isSuccess)
    {
        NSLog(@"insertion:success");
        ViewController *v=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        [self.navigationController pushViewController:v animated:YES];
    }
    else
    {
        NSLog(@"insertion:Failed");
        
    }
    
    
    

}

- (IBAction)UpdateButtonAction:(UIButton *)sender
{
    NSString *SheduleText,*RoomNameText,*ApplianceNameText,*TimeText,*DaysText;
    
    SheduleText=self.EnterScheduleNameTextField.text;
    RoomNameText=self.SelectRoomButtonoutlet.titleLabel.text;
    ApplianceNameText=self.SelectApplianceButtonoutlet.titleLabel.text;
    TimeText=self.Selectedtime;
    DaysText=self.DayMutableString;
    
    
    NSString *query=[NSString stringWithFormat:@"Update Schedule1 set taskRoomName='%@',taskApplianceName='%@',taskTime='%@',taskDay='%@' where  taskScheduleName='%@'",SheduleText,RoomNameText,ApplianceNameText,TimeText,DaysText];
    
    int isSuccess=[[DataBaseLib getSharedObject]executeQuery:query];
    if(isSuccess)
    {
        NSLog(@"Update:success");
        ViewController *v=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        [self.navigationController pushViewController:v animated:YES];
    }
    else
    {
        NSLog(@"Update:Failed");
        
    }
    

}

- (IBAction)DeleteButtonAction:(UIButton *)sender
{
    NSString *SheduleText,*RoomNameText,*ApplianceNameText,*TimeText,*DaysText;
    
    SheduleText=self.EnterScheduleNameTextField.text;
    RoomNameText=self.SelectRoomButtonoutlet.titleLabel.text;
    ApplianceNameText=self.SelectApplianceButtonoutlet.titleLabel.text;
    TimeText=self.Selectedtime;
    DaysText=self.DayMutableString;
    
    NSString *query=[NSString stringWithFormat:@"DELETE FROM Schedule1 WHERE Schedule.taskScheduleName = '%@'",SheduleText];
    
    int isSuccess=[[DataBaseLib getSharedObject]executeQuery:query];
    if(isSuccess)
    {
        NSLog(@"Delete:success");
        ViewController *v=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        [self.navigationController pushViewController:v animated:YES];
    }
    else
    {
        NSLog(@"Delete:Failed");
        
    }

}
- (IBAction)SelectRoom_ApplianceButtonAction:(UIButton *)sender
{
    self.Selectedtag=sender.tag;
    if(sender.tag==201)
    {
        
        self.myTableView=[[UITableView alloc]initWithFrame:CGRectMake(80,220, 250, 150)];
    }
    if(sender.tag==202)
    {
        self.myTableView=[[UITableView alloc]initWithFrame:CGRectMake(70, 320, 250, 150)];
        
    }
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
    
    [self.view addSubview:self.myTableView];
    


}
@end
