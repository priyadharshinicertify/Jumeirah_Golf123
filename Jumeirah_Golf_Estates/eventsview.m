//
//  eventsview.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 01/08/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "eventsview.h"
#import "BackgroundLayer.h"
@interface eventsview ()

@end

@implementation eventsview
@synthesize tit,imgv,date,txtvie;
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
   
    CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.sample.bounds;
    
    [self.sample.layer insertSublayer:btnGradient1 atIndex:0];
    
    
    manage=[singleton share];
    tit.text=manage.eve_title;
    date.text=manage.eve_stdate;
    
    NSString *text1=manage.eve_title;
    
    
    
    UIFont *myFont = [UIFont fontWithName:@"Helvetica" size:19];
    
    NSDictionary *userAttributes = @{NSFontAttributeName:myFont,
                                     NSForegroundColorAttributeName: [UIColor whiteColor]};
      [text1 sizeWithAttributes:userAttributes];
    text1=[text1 stringByAppendingString:@"\n\n"];
    NSString *text2 =manage.eve_stdate;
    NSString *text3=[text1 stringByAppendingString:text2];
    text3=[text3 stringByAppendingString:@"\n\n"];
    
    NSString *text4=manage.eve_desc;
    NSString *text5=[text3 stringByAppendingString:text4];
    txtvie.text=text5;

    
    
   // txtvie.text=manage.eve_desc;
    [AsynchronousFreeloader loadImageFromLink:manage.eve_img  forImageView:imgv withPlaceholder:nil andContentMode: UIViewContentModeScaleAspectFit];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backpage:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
