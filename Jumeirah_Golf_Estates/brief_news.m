//
//  brief_news.m
//  Jumeirah
//
//  Created by Veeramani on 18/06/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import "brief_news.h"
#import "BackgroundLayer.h"
#define FONT_SIZE 14.0f
#define CELL_CONTENT_WIDTH 320.0f
#define CELL_CONTENT_MARGIN 10.0f
@interface brief_news ()
@property(strong,nonatomic)IBOutlet UITableView *tblvie;
@end

@implementation brief_news
@synthesize imgview,title,txtview,date,tit,tit1;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"Brief News Screen";
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self getingdetails];
    
    // Do any additional setup after loading the view from its nib.
}
-(void)getingdetails
{
    
    CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.sample.bounds;
    // btnGradient.cornerRadius=5;
    //btnGradient.borderWidth=1.0;
    // btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sample.layer insertSublayer:btnGradient1 atIndex:0];
    
    
    manage=[singleton share];
   /* NSString *ImageURL=manage.commenimg1;
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:ImageURL]];
    
     [imgview sd_setImageWithURL:[NSURL URLWithString:ImageURL]
     placeholderImage:[UIImage imageNamed:@"placeholder"]];
     
    imgview.image = [UIImage imageWithData:imageData];*/
    // txtview.text=manage.commendes;
    tit.text=manage.commentit;
    date.text=manage.commendate;
    NSString *text1=manage.commentit;
    
    
    
    [AsynchronousFreeloader loadImageFromLink:manage.commenimg1 forImageView:imgview withPlaceholder:nil andContentMode:UIViewContentModeScaleAspectFit];

    
    
    
    UIFont *myFont = [UIFont fontWithName:@"Helvetica" size:19];
    
    NSDictionary *userAttributes = @{NSFontAttributeName:myFont,
                                     NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    // const CGSize textSize = [text1 sizeWithAttributes: userAttributes];
    
    
    [text1 sizeWithAttributes:userAttributes];
    text1=[text1 stringByAppendingString:@"\n\n"];
    NSString *text2 =manage.commendate;
    NSString *text3=[text1 stringByAppendingString:text2];
    text3=[text3 stringByAppendingString:@"\n\n"];
    
    NSString *text4=manage.commendes;
    NSString *text5=[text3 stringByAppendingString:text4];
    txtview.text=text5;
    
  
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)back:(id)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
}




/*-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *text1=manage.commentit;
    text1=[text1 stringByAppendingString:@"\n"];
    NSString *text2 =manage.commendate;
    NSString *text3=[text1 stringByAppendingString:text2];
    text3=[text3 stringByAppendingString:@"\n"];
    
    NSString *text4=manage.commendes;
    NSString *text5=[text3 stringByAppendingString:text4];
    CGSize constraint = CGSizeMake(320, 20000.0f);
    
    NSAttributedString *attributedText =
    [[NSAttributedString alloc]
     initWithString:text5
     attributes:@
     {
     NSFontAttributeName:[UIFont systemFontOfSize:FONT_SIZE]
     }];
    CGRect rect = [attributedText boundingRectWithSize:constraint
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                               context:nil];
    CGSize size = rect.size;
    
    
    CGFloat height =size.height;
    
    return height ;
    
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.backgroundView.backgroundColor = [UIColor clearColor];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *str=@"cell";
    UILabel *label = nil;
    
    
    UITableViewCell *cell=[self.tblvie dequeueReusableCellWithIdentifier:str];
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    cell.backgroundColor=[UIColor clearColor];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        label = [[UILabel alloc] initWithFrame:CGRectZero];
        [label setLineBreakMode:NSLineBreakByWordWrapping];
        [label setMinimumScaleFactor:FONT_SIZE];
        [label setNumberOfLines:0];
        [label setFont:[UIFont systemFontOfSize:12]];
        [label setTextColor:[UIColor whiteColor]];
        [label setTag:1];
        
        //[[label layer] setBorderWidth:2.0f];
        
        [[cell contentView] addSubview:label];
        
    }
    
    [cell setBackgroundColor:[UIColor clearColor]];
    NSString *text1=manage.commentit;
    
  //  NSString *yourString=@"Hi Hikarus, How are you?";
    
    NSMutableAttributedString *attString=[[NSMutableAttributedString alloc] initWithString:text1];
    NSInteger _stringLength=[text1 length];
    
   // UIColor *_black=[UIColor blackColor];
    UIFont *font=[UIFont fontWithName:@"Helvetica-Bold" size:20];
    
    [attString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, _stringLength)];
    
    
    
    
    
    
    text1=[text1 stringByAppendingString:@"\n"];
    NSString *text2 =manage.commendate;
    NSString *text3=[text1 stringByAppendingString:text2];
     text3=[text3 stringByAppendingString:@"\n"];
    
     NSString *text4=manage.commendes;
       NSString *text5=[text3 stringByAppendingString:text4];
    //cell.lblAddress.textColor=[UIColor whiteColor];
    //    NSString *text1 = [items objectAtIndex:[indexPath row]];
    //    NSString *text2 = [items objectAtIndex:[indexPath row]];
    CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
    
    NSAttributedString *attributedText = [[NSAttributedString alloc]initWithString:text5 attributes:@{
                                                                                                      NSFontAttributeName:[UIFont systemFontOfSize:FONT_SIZE]
                                                                                                      }];
    CGRect rect = [attributedText boundingRectWithSize:constraint
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                               context:nil];
    CGSize size = rect.size;
    
    if (!label)
        label = (UILabel*)[cell viewWithTag:1];
    
    [label setText:text5];
    
  [label setFrame:CGRectMake(10,0, 320, MAX(size.height, 44.0f))];
    return cell;
    
    
    
}
*/

@end
