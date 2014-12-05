//
//  singleton.m
//  Jumeirah
//
//  Created by Veeramani on 18/06/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import "singleton.h"

@implementation singleton
@synthesize commendate,commendes,commenimg,commentit,commenimg1,letter_url,golf_gallery,golfzoom,imgzoom,WPIMG,img_galleryfolder;
@synthesize job__educational_qualification,job_description,job_experience,job_last_date,job_postdate,job_reference_number,job_title,job_who_can_apply,username,str1,str2,str3,str4,str5,str6,services_url,image_gallery,imgv,imgv1;
@synthesize eve_endate,eve_location,eve_stdate,eve_title,eve_desc,eve_img,WPap,WPdl,WPsg,WPmf,WPfs,WPco,WPct,WPtl,WPtr,FS1,FS2,FS3,FS4,FS5,FS6,FS7,FS8,FS9,FS10,FS11,FS12,FS13,FS14,FS15,FT1,FT10,FT11,FT12,FT13,FT14,FT15,FT16,FT17,FT2,global,
FT3,FT4,FT5,FT6,FT7,FT8,FT9,golf_gal,WPaplan,WPcon,WPcont,WPdoral,WPfire,WPmuri,WPsaw,WPtime,WPtra,FSaberdeen,FSarea,FSashburn,FSblackheath,FScape,FScountry,FSgal,FSjersey,FSmelbourne,FSmougins,FSontario,FSsydney,FStroon,FSvir,wpgall,FTarea,FTaugu,FTcarno,FTcontempo,FTcontrast,FTelegance,FTInterior,FTinverness,FToakmont,FTpinehurst,FTtimeless,FTvirtual,FTfttradition,fttuscan,WFarea,deivceToken, deviceUUID, devicevers, devicemodel,deviealert,userlogin,user,cus_iid,cus_property;



+(id)share
{
    static singleton *free=nil;
    if (free==nil) {
        
        free =[[self alloc]init];
    }
    
    return free;
}


@end
