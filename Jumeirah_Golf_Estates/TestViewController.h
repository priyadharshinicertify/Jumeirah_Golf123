//
//  TestViewController.h
//  ActionSheetDemo
//
//  Created by Gabriel Theodoropoulos on 23/4/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TestViewControllerDelegate

-(void)usedatastring:(NSString*)picker;
-(void)usedatastring1;

@end


@interface TestViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>
{
    NSString *age;
}

@property (nonatomic, strong) id<TestViewControllerDelegate> delegate;



@property (weak, nonatomic) IBOutlet UIPickerView *pickerAge;

 @property (nonatomic, strong) NSString *selectedTheme;

- (IBAction)done:(id)sender;

- (IBAction)cancel:(id)sender;

@end
