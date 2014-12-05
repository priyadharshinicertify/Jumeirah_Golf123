//
//  Notifications.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 13/08/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "Notifications.h"
#import "BackgroundLayer.h"
@interface Notifications ()
{
   // NSArray *mutablearrays;

 NSMutableArray *mutablearrays;
    NSMutableArray *temparray;
    
}


@end

@implementation Notifications
@synthesize tblvie;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    manage=[singleton share];
    mutablearrays = [[NSUserDefaults standardUserDefaults] objectForKey:@"msg"] ;
    
    if ([mutablearrays count]==0) {
        mutablearrays =[[NSMutableArray alloc]init];
    }
    
    
    self.done.hidden=YES;
    
    
    
    
    
  // mutablearrays=[[NSUserDefaults standardUserDefaults] objectForKey:@"priyaq1"];
  //  NSLog(@"def...arry %@",mutablearrays);
    
    CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.sample.bounds;
    // btnGradient.cornerRadius=5;
    //btnGradient.borderWidth=1.0;
    // btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sample.layer insertSublayer:btnGradient1 atIndex:0];
    
  //  self.mainLabel=[NSMutableArray new];
    
   // self.sidelabel=[NSMutableArray new];
    
   // NSString *count=[[NSUserDefaults standardUserDefaults]objectForKey:@"noyificationcount"];
    
    
    NSString *simple=manage.welcome;
    if ([manage.welcome length]!=0) {
         [mutablearrays addObject:simple];
    }
   
    if ([manage.deviealert count]!=0) {
        temparray=[[NSMutableArray alloc]init];
        temparray=[[mutablearrays arrayByAddingObjectsFromArray:manage.deviealert] mutableCopy];
         [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"msg"];
        mutablearrays=[temparray mutableCopy];
        [temparray removeAllObjects];
        
    }
    
    [[ NSUserDefaults standardUserDefaults]setObject:mutablearrays forKey:@"msg" ];
    
    [[NSUserDefaults standardUserDefaults]synchronize];

     [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"noyificationcount"];
    [manage.deviealert removeAllObjects];
     [UIApplication sharedApplication].applicationIconBadgeNumber = [manage.deviealert count];
    [tblvie reloadData];
    
   // NSLog(@"arrrrr......%@",mainLabel);
     }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)back:(id)sender
{
       manage.welcome=@"";
    [self.navigationController popViewControllerAnimated:YES];
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
    
}

-(void)viewWillAppear:(BOOL)animated
{
   
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger num;
   if (mutablearrays>0) {
       num=mutablearrays.count;
   }
       int num1=(NSInteger)num;
    return num1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *celleee=@"cell";
    
    UITableViewCell *cell=[self.tblvie dequeueReusableCellWithIdentifier:celleee];
    
    if (cell ==nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celleee];
        
    }
    if (mutablearrays>0) {
        cell.textLabel.text=[mutablearrays objectAtIndex:indexPath.row];
        
        cell.textLabel.textColor=[UIColor blackColor];
        cell.selectionStyle=UITableViewCellAccessoryNone;
        
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    
    }
    else
    {
        cell.textLabel.text=@"No notifications found!";
    }
    
        return  cell;
    
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [mutablearrays removeObjectAtIndex:indexPath.row];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [tblvie deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];        [self.tblvie reloadData];
   
    NSMutableArray *copying=[mutablearrays mutableCopy];
    
     [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"msg"];
    mutablearrays=[copying mutableCopy];
    [[ NSUserDefaults standardUserDefaults]setObject:mutablearrays forKey:@"msg" ];
    
    [[NSUserDefaults standardUserDefaults]synchronize];

    
    NSLog(@"newwww...%@",mutablearrays);
    
    
    
    
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}



- (BOOL)tableView:(UITableView *)tableview shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (IBAction)doneaction:(id)sender
{
    [tblvie setEditing:!tblvie.editing animated:YES];
    self.done.hidden=YES;
   self. edit.hidden=NO;
}
- (BOOL)tableView:(UITableView *)tableview canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
    
    if (sourceIndexPath != destinationIndexPath) {
        
        id object = [mutablearrays objectAtIndex:sourceIndexPath.row];
        [mutablearrays removeObjectAtIndex:sourceIndexPath.row];
        if (destinationIndexPath.row > [mutablearrays count]) {
            [mutablearrays addObject:object];
        }
        else {
            [mutablearrays insertObject:object atIndex:destinationIndexPath.row];
        }
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   // (self.itemshowdetailsAr)[indexPath.row][@"events_title"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:[mutablearrays objectAtIndex:indexPath.row]  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];

    
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    return @"Delete";
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

- (IBAction)editaction:(id)sender {
    
    [tblvie setEditing:!tblvie.editing animated:YES];
    self.edit.hidden=YES;
    self.done.hidden=NO;
    
}
- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath{
    
    return sourceIndexPath;
}
@end
