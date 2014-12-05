//
//  propertytype.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 06/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "propertytype.h"

@interface propertytype ()
@property (nonatomic, strong) NSArray *arrAgeRanges;
@end

@implementation propertytype

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
    // Do any additional setup after loading the view from its nib.
    
    self.arrAgeRanges = [[NSArray alloc] initWithObjects:@"Town House",@"Villa",@"Apartment", nil];
    
    //self.txtName.delegate = self;
    
    self.pickerAge.delegate = self;
    self.pickerAge.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBAction method implementation

- (IBAction)done:(id)sender {
    [self.delegate propertytypepro:[self.arrAgeRanges objectAtIndex:[self.pickerAge selectedRowInComponent:0]] ];
}

- (IBAction)cancel:(id)sender
{
    [self.delegate propertytypepro1];
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
