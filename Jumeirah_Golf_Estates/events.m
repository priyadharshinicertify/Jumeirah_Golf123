//
//  events.m
//  Jumeirah
//
//  Created by Veeramani on 17/06/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import "events.h"
#import "eventcell.h"
#import "eventsview.h"
#import "BackgroundLayer.h"
@interface events ()
{
    UIActivityIndicatorView *spinner;
}
@property(strong,nonatomic)IBOutlet  UIActivityIndicatorView *spinner;

@end

@implementation events
@synthesize spinner;
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
      [self.tblvie addSubview:spinner];
    
       CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.sample.bounds;
    // btnGradient.cornerRadius=5;
    //btnGradient.borderWidth=1.0;
    // btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sample.layer insertSublayer:btnGradient1 atIndex:0];
    manage=[singleton share];
    [self.itemshowdetailsAr removeAllObjects];
    self.itemshowdetailsAr=[[NSMutableArray alloc] init];
    [self getcontactdetails];
    [super viewDidLoad];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getcontactdetails
{
    
            [spinner startAnimating];
    
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/events.php"]] ];
    
    [request setHTTPMethod:@"GET"];
    
    NSURLConnection *con = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (con) {
        NSLog(@"data sent ");
    } else
    {
        NSLog(@"Not sent");
    }
    [con start];

 
 }

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    if (receivedData == NULL) {
        receivedData = [[NSMutableData alloc] init];
    }
    [receivedData setLength:0];}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [receivedData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [error userInfo][NSURLErrorFailingURLStringErrorKey]);
    UIAlertView *customAlert = [[UIAlertView alloc]initWithTitle:@"No NetWork" message:@"Interet Connection is Lost" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [customAlert show];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    
    if (receivedData) {
        
        NSError *e = nil;
        NSDictionary *jsonArray1 = [NSJSONSerialization JSONObjectWithData:receivedData options: NSJSONReadingMutableContainers error: &e];
        
        NSLog(@"%@",jsonArray1);
        
        
        NSArray *jsonArray=jsonArray1[@"events"];
        
        //  NSDictionary *tmp=(NSDictionary*)[jsonArray object]
        for (NSDictionary *tmp in jsonArray)
        {
            NSMutableDictionary   *itemshowdetails=[[NSMutableDictionary alloc]init];
            
            
            [itemshowdetails setValue:tmp[@"date"] forKey:@"date"];
            [itemshowdetails setValue:tmp[@"events_description"] forKey:@"events_description"];
            //  [itemshowdetails setValue:[tmp objectForKey:@"id"] forKey:@"id"];
            [itemshowdetails setValue:tmp[@"events_image"] forKey:@"events_image"];
            // [itemshowdetails setValue:[tmp objectForKey:@"content"] forKey:@"content"];
            [itemshowdetails setValue:tmp[@"events_title"] forKey:@"events_title"];
            [itemshowdetails setValue:tmp[@"events_start_time"] forKey:@"events_start_time"];
            [itemshowdetails setValue:tmp[@"events_place"] forKey:@"events_place"];
            
            [itemshowdetails setValue:tmp[@"end_date"] forKey:@"end_date"];
            [itemshowdetails setValue:tmp[@"events_end_time"] forKey:@"events_end_time"];
            [itemshowdetails setValue:tmp[@"user_type"] forKey:@"user_type"];
            
            
            [self.itemshowdetailsAr addObject:itemshowdetails];
            NSLog(@"%@",itemshowdetails);
        }
        [self.tblvie reloadData];
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"no network"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
      [spinner stopAnimating];
    [spinner hidesWhenStopped];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.itemshowdetailsAr count];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        

    return 95;
    }
    else
    {
        return 126;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return  [UIView new];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor whiteColor];
    
    cell.textLabel.textColor=[UIColor blackColor];
    cell.backgroundView.backgroundColor = [UIColor clearColor];
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self.tblvie reloadRowsAtIndexPaths:[self.tblvie indexPathsForVisibleRows]
                       withRowAnimation:UITableViewRowAnimationNone];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"Events Screen";
    [self.tblvie reloadRowsAtIndexPaths:[self.tblvie indexPathsForVisibleRows]
                       withRowAnimation:UITableViewRowAnimationNone];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *str=@"cell";
    
    eventcell *cell=[self.tblvie dequeueReusableCellWithIdentifier:str];
    if (cell==nil)
    {
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {

        
        NSArray *arr1=[[NSBundle mainBundle]loadNibNamed:@"eventcell" owner:nil options:nil ];
        for(UIView *vie in arr1)
        {
            if([vie isKindOfClass:[UITableViewCell class]])
            {
                cell=(eventcell*)vie;
            }
      
        }
        }
        else
        {
        
            NSArray *arr1=[[NSBundle mainBundle]loadNibNamed:@"eventcell_ipad" owner:nil options:nil ];
            for(UIView *vie in arr1)
            {
                if([vie isKindOfClass:[UITableViewCell class]])
                {
                    cell=(eventcell*)vie;
                }
                
            }

                
        }
    }
        
        
    CALayer *separator = [CALayer layer];
    separator.backgroundColor = [UIColor blackColor].CGColor;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        //separator.frame = CGRectMake(0,66, self.view.frame.size.width, 1);
    }
    else
    {
        separator.frame = CGRectMake(0,126, self.view.frame.size.width, 3);
    }
    [cell.layer addSublayer:separator];
        
    
    
    [cell setBackgroundColor:[UIColor whiteColor]];
    cell.tit.textColor=[UIColor blackColor];
    
    cell.des.textColor=[UIColor blackColor];
    
    cell.date.textColor=[UIColor blackColor];
   
    cell.tit.text = (self.itemshowdetailsAr)[indexPath.row][@"events_title"];
    
    cell.des.text = (self.itemshowdetailsAr)[indexPath.row][@"events_description"];
   
    
    
    
    
    [AsynchronousFreeloader loadImageFromLink:[[self.itemshowdetailsAr objectAtIndex:indexPath.row]objectForKey:@"events_image"] forImageView:cell.img withPlaceholder:nil andContentMode:UIViewContentModeScaleAspectFill];

    
     cell.date.text = (self.itemshowdetailsAr)[indexPath.row][@"date"];
    [cell.btn addTarget:self action:@selector(yourButtonClicked:) forControlEvents:UIControlEventTouchUpInside];

    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        eventsview *login = [[eventsview alloc]initWithNibName:@"eventsview_iphone" bundle:nil];
        [self.navigationController pushViewController:login animated:YES];
    }
    else
    {
        eventsview *login = [[eventsview alloc]initWithNibName:@"eventsview_ipad" bundle:nil];
        [self.navigationController pushViewController:login animated:YES];
    }
    

    
    
       manage.eve_title=(self.itemshowdetailsAr)[indexPath.row][@"events_title"];
    manage.eve_location=(self.itemshowdetailsAr)[indexPath.row][@"events_place"];
    manage.eve_stdate=(self.itemshowdetailsAr)[indexPath.row][@"date"];
    
    
    NSLog(@"%@", manage.eve_stdate);
    manage.eve_endate=(self.itemshowdetailsAr)[indexPath.row][@"end_date"];
    manage.eve_desc=(self.itemshowdetailsAr)[indexPath.row][@"events_description"];
    manage.eve_img=(self.itemshowdetailsAr)[indexPath.row][@"events_image"];
    
  //  [btn addTarget:self action:@selector(yourButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
   
    
}
-(void)yourButtonClicked:(UIButton*)sender
{
    EKEventStore *store = [[EKEventStore alloc] init];
    
    if([store respondsToSelector:@selector(requestAccessToEntityType:completion:)])
    {
        // iOS 6
        [store requestAccessToEntityType:EKEntityTypeEvent
                              completion:^(BOOL granted, NSError *error) {
                                  if (granted)
                                  {
                                      dispatch_async(dispatch_get_main_queue(), ^{
                                          [self createEventAndPresentViewController:store];
                                      });
                                  }
                              }];
    } else
    {
        [store requestAccessToEntityType:EKEntityTypeEvent
                              completion:^(BOOL granted, NSError *error) {
                                  if (granted)
                                  {
                                      dispatch_async(dispatch_get_main_queue(), ^{

        
        [self createEventAndPresentViewController:store];
                                      });
                                  }
                              }];

    }
 
}
- (void)eventEditViewController:(EKEventEditViewController *)controller didCompleteWithAction:(EKEventEditViewAction)action
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)createEventAndPresentViewController:(EKEventStore *)store
{
    EKEvent *event = [self findOrCreateEvent:store];
    
    EKEventEditViewController *controller = [[EKEventEditViewController alloc] init];
    controller.event = event;
    controller.eventStore = store;
    controller.editViewDelegate = self;
    
    [self presentViewController:controller animated:YES completion:nil];
}
- (EKEvent *)findOrCreateEvent:(EKEventStore *)store
{
    NSString *title = manage.eve_title;
    
    // try to find an event
    
    EKEvent *event = [self findEventWithTitle:title inEventStore:store];
    
    // if found, use it
    
    if (event)
        return event;
    
    // if not, let's create new event
    
    event = [EKEvent eventWithEventStore:store];
    
    event.title = title;
    // event.notes = @"My event notes";
    event.location = manage.eve_location;
    event.calendar = [store defaultCalendarForNewEvents];
    
    // NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.hour = 4;
    
    NSString *dateString =manage.eve_stdate;
    NSString *dateString1 = manage.eve_endate;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // this is imporant - we set our input date format to match our input string
    // if format doesn't match you'll get nil from your string, so be careful
    [dateFormatter setDateFormat:@"yyy-MM-dd"];
    NSDate *dateFromString = [[NSDate alloc] init];
    // voila!
    dateFromString = [dateFormatter dateFromString:dateString];
    NSDate *dateFromString1 = [[NSDate alloc] init];
    // voila!
    dateFromString1 = [dateFormatter dateFromString:dateString1];
    NSLog(@"%@",dateFromString);
    event.startDate =dateFromString;
    components.hour = 1;
    
    
    event.notes = manage.eve_desc;
    
    
    NSLog(@"%@",event.notes);
    event.allDay=YES;
    event.endDate = dateFromString1;
    
    return event;
}

- (EKEvent *)findEventWithTitle:(NSString *)title inEventStore:(EKEventStore *)store
{
    // Get the appropriate calendar
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // Create the start range date components
    NSDateComponents *oneDayAgoComponents = [[NSDateComponents alloc] init];
    oneDayAgoComponents.day = -1;
    NSDate *oneDayAgo = [calendar dateByAddingComponents:oneDayAgoComponents
                                                  toDate:[NSDate date]
                                                 options:0];
    
    // Create the end range date components
    NSDateComponents *oneWeekFromNowComponents = [[NSDateComponents alloc] init];
    oneWeekFromNowComponents.day = 7;
    NSDate *oneWeekFromNow = [calendar dateByAddingComponents:oneWeekFromNowComponents
                                                       toDate:[NSDate date]
                                                      options:0];
    
    // Create the predicate from the event store's instance method
    NSPredicate *predicate = [store predicateForEventsWithStartDate:oneDayAgo
                                                            endDate:oneWeekFromNow
                                                          calendars:nil];
    
    // Fetch all events that match the predicate
    NSArray *events = [store eventsMatchingPredicate:predicate];
    
    for (EKEvent *event in events)
    {
        if ([title isEqualToString:event.title])
        {
            return event;
        }
    }
    
    return nil;
}


-(IBAction)home:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
