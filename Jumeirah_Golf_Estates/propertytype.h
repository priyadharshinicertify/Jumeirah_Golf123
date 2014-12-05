//
//  propertytype.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 06/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol propertytypeDelegate1

-(void)propertytypepro:(NSString*)picker;
-(void)propertytypepro1;
@end
@interface propertytype : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>
{
    NSString *age;
}

@property (nonatomic, strong) id<propertytypeDelegate1> delegate;



@property (weak, nonatomic) IBOutlet UIPickerView *pickerAge;

@property (nonatomic, strong) NSString *selectedTheme;

- (IBAction)done:(id)sender;

- (IBAction)cancel:(id)sender;


@end
