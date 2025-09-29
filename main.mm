#import <UIKit/UIKit.h>

#define UIColorFromHEX(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "main.h"
#import "SCLAlertView/SCLAlertView.h"
#import "APIKey.h"

#import "imgui.h"
#import "imconfig.h"
#import "imgui_internal.h"
#import "imstb_rectpack.h"
#import "imstb_textedit.h"
#import "imstb_truetype.h"

//#import "imgui_impl_metal.h"

#import "zzz.h"

SCLAlertView *alert;


@implementation NguyenNamFramework


PPAPIKey *APIKey = [[PPAPIKey alloc] init];



static NguyenNamFramework *active;


+ (void)load
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

alert = [[SCLAlertView alloc] initWithNewWindow];  

        PPAPIKey *APIKey = [[PPAPIKey alloc] init];

        [APIKey setPackageToken:NSSENCRYPT("KFcvy8VDro9dIbr4Guv8KK2HREylEmLwhvIh8BuEvYJ29PfurMGF1M87e5RVS3XDnF14tbGNUSgKDz8xdz3X9K5euH5XJp8ROAeT")];
        [APIKey setAppVersion:NSSENCRYPT("1.0.0")];
        [APIKey setENLanguage:YES];

        [APIKey loading:^{
        active =  [NguyenNamFramework new];
        [active start];

}];
});
}

-(void)start{

alert.shouldDismissOnTapOutside = YES;//Replace with NO if you want the user to force a button in the alert

alert.customViewColor = UIColorFromHEX(0x474747);
  

alert.showAnimationType = SCLAlertViewShowAnimationSlideInToCenter;   

alert.backgroundType = SCLAlertViewBackgroundBlur;

alert.cornerRadius = 20.0f;

alert.backgroundViewColor = UIColorFromHEX(0x302d26);


ImGui::Text("Key: %s", [[APIK getKey] UTF8String]);
ImGui::Text("Thời Hạn: %s", [[APIK getKeyExpire] UTF8String]);
ImGui::Text("UUID: %s", [[APIK getUDID] UTF8String]);
ImGui::Text("Tên Thiết Bị: %s", [[APIK getDeviceName] UTF8String]);
ImGui::Text("Phiên Bản iOS: %s", [[APIK getiOSVersion] UTF8String]);
ImGui::Text("Trạng Thái Jailbreak: %s", [[APIK getJailbreakStatus] UTF8String]);


//Button

//Demo Button
/*
[alert addButton:@"Name Button" actionBlock:^(void) {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"URL YOU WANT TO OPEN WHEN CLICK"] options:@{} completionHandler:nil];
}];
*/


//Example button
[alert addButton:@"Zalo Group " actionBlock:^(void) {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://zalo.me/g/pzmvdd558"] options:@{} completionHandler:nil];
}];

[alert addButton:@"TELEGRAM Dev ThienNhan " actionBlock:^(void) {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://t.me/devthiennhan"] options:@{} completionHandler:nil];
}];

[alert addButton:@"Tiktok Dev ThienNhan " actionBlock:^(void) {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://www.tiktok.com/@devthiennhan?_t=ZS-906TdX9vf67&_r=1"] options:@{} completionHandler:nil];
    }];

[alert addButton:@"Facebook Dev ThienNhan " actionBlock:^(void) {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://facebook.com/devthiennhan"] options:@{} completionHandler:nil];
    }];

[alert addButton:@"Website Dev ThienNhan " actionBlock:^(void) {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://devthiennhan.bio.link/"] options:@{} completionHandler:nil];
        }];
//End example button




//You can replace any logo link with a direct image link
NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://sf-static.upanhlaylink.com/img/image_20250928e1675e244f7ec1d59e82d9dd5e74ebe8.jpg"]];

UIImage* customAlertImage = [UIImage imageWithData:data];  
 
[alert showCustom:alert image:customAlertImage color:[UIColor clearColor] title:@"Dev ThienNhan " subTitle:@"Cảm ơn bạn đã sử dụng  iOS Crack Dev .\nBấm vào Logo để tắt thông báo." closeButtonTitle:nil duration:9999999999.0f];



}



@end
make package