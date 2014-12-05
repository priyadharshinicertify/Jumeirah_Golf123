//
//  calender.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 15/10/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol calenderpickerview

-(void)calenderpro:(NSString*)picker;
-(void)calenderpro1;
@end
@interface calender : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>
{
    NSString *age;
}

@property (nonatomic, strong) id<calenderpickerview> delegate;



@property (weak, nonatomic) IBOutlet UIDatePicker *pickerAge;

@property (nonatomic, strong) NSString *selectedTheme;

- (IBAction)done:(id)sender;

- (IBAction)cancel:(id)sender;



@end
