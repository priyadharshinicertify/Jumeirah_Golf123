//
//  memberViewController.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 05/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol memberViewControllerDelegate1

-(void)memberpro:(NSString*)picker;
-(void)memberpro1;
@end
@interface memberViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>
{
    NSString *age;
}

@property (nonatomic, strong) id<memberViewControllerDelegate1> delegate;



@property (weak, nonatomic) IBOutlet UIPickerView *pickerAge;

@property (nonatomic, strong) NSString *selectedTheme;

- (IBAction)done:(id)sender;

- (IBAction)cancel:(id)sender;


@end
