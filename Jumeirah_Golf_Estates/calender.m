//
//  calender.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 15/10/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "calender.h"

@interface calender ()
@property (nonatomic, strong) NSArray *arrAgeRanges;
@end

@implementation calender
@synthesize pickerAge;
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
      pickerAge.datePickerMode = UIDatePickerModeDate;
    // [self.pickerAge addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
    // Do any additional setup after loading the view from its nib.
    
    
    
    //self.txtName.delegate = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBAction method implementation

- (IBAction)done:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
     pickerAge.datePickerMode = UIDatePickerModeDate;
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd "];
    [self.delegate calenderpro:[dateFormatter stringFromDate:pickerAge.date]];
    
}


- (IBAction)cancel:(id)sender
{
    [self.delegate calenderpro1];
}
#pragma mark - UITextField Delegate method implementation



#pragma mark - UIPickerView method implementation

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.arrAgeRanges.count;
}


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.arrAgeRanges objectAtIndex:row];
}



@end
