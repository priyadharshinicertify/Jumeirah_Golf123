//
//  players.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 05/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol playersViewControllerDelegate1

-(void)playerpro:(NSString*)picker;
-(void)playerpro1;
@end

@interface players : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>
{
    NSString *age;
}

@property (nonatomic, strong) id<playersViewControllerDelegate1> delegate;



@property (weak, nonatomic) IBOutlet UIPickerView *pickerAge;

@property (nonatomic, strong) NSString *selectedTheme;

- (IBAction)done:(id)sender;

- (IBAction)cancel:(id)sender;



@end
