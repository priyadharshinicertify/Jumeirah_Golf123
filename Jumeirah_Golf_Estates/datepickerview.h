//
//  datepickerview.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 05/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol datepickerview

-(void)datepro:(NSString*)picker;
-(void)datepro1;
@end

@interface datepickerview : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>
{
    NSString *age;
}

@property (nonatomic, strong) id<datepickerview> delegate;



@property (weak, nonatomic) IBOutlet UIDatePicker *pickerAge;

@property (nonatomic, strong) NSString *selectedTheme;

- (IBAction)done:(id)sender;

- (IBAction)cancel:(id)sender;



@end
