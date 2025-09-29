#import <UIKit/UIKit.h>

#define UIColorFromHEX(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "main.h"
#import "SCLAlertView/SCLAlertView.h"
#import "API/APIClient.h"

#import "IMGUI/imgui.h"
#import "IMGUI/imconfig.h"
#import "IMGUI/imgui_internal.h"
#import "IMGUI/imstb_rectpack.h"
#import "IMGUI/imstb_textedit.h"
#import "IMGUI/imstb_truetype.h"

//#import "imgui_impl_metal.h"

#import "IMGUI/zzz.h"

@implementation NguyenNamFramework

static SCLAlertView *alert;
static NguyenNamFramework *active;

+ (void)load {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        alert = [[SCLAlertView alloc] initWithNewWindow];  

        TKAPIKey *APIClient = [TKAPIKey sharedAPIClient];

        [APIClient setPackageToken:@"6koz9fnxflrcgnpbhj7lwk8wr6qvv3r1kist384oimuyw=fdbu3g94qdaqm8cmh7nj40u0te/eoy95tycidp21v2hxa6j0slzsbp_7e1zag525x"];
        [APIClient setPackageVersion:@"1.0"]; 
        [APIClient setENLanguage:NO]; 

        [APIClient paid:^{
            active = [NguyenNamFramework new];
            [active start];

            // Optional logs
            NSLog(@"APIData - Key: %@", [APIClient getKey]);
            NSLog(@"APIData - UDID: %@", [APIClient getUDID]);
            NSLog(@"APIData - Expiry date: %@", [APIClient getExpiryDate]);
            NSLog(@"APIData - Device model: %@", [APIClient getDeviceModel]);
        }];
    });
}

- (void)start {
    alert.shouldDismissOnTapOutside = YES;
    alert.customViewColor = UIColorFromHEX(0x474747);
    alert.showAnimationType = SCLAlertViewShowAnimationSlideInToCenter;   
    alert.backgroundType = SCLAlertViewBackgroundBlur;
    alert.cornerRadius = 20.0f;
    alert.backgroundViewColor = UIColorFromHEX(0x302d26);

    TKAPIKey *APIClient = [TKAPIKey sharedAPIClient];

    const char *getKey = [[APIClient getKey] UTF8String];
    const char *getExpiryDate = [[APIClient getExpiryDate] UTF8String];
    const char *getUDID = [[APIClient getUDID] UTF8String];
    const char *deviceName = [[APIClient deviceName] UTF8String];
    const char *deviceModel = [[APIClient getDeviceModel] UTF8String];
    const char *iosver = [[APIClient osVersion] UTF8String];
    const char *ip = [[APIClient ipAddress] UTF8String];

    ImGui::Text("Key: %s", getKey);
    ImGui::Text("Hạn Sử Dụng: %s", getExpiryDate);
    ImGui::Text("UDID: %s", getUDID);
    ImGui::Text("DEVICE NAME: %s", deviceName);
    ImGui::Text("DEVICE MODEL: %s", deviceModel);
    ImGui::Text("VERSION: %s", iosver);
    ImGui::Text("IP: %s", ip);

    if (ImGui::Button("Reload")) {
        [APIClient reloadInfo];
    }

    ImGui::SameLine(); 

    if (ImGui::Button("Copy Key")) {
        NSString *key = [APIClient getKey];
        if (key != nil && key.length > 0) {
            [APIClient copyKey:key]; 
        }
    }

    // Example buttons
    [alert addButton:@"Zalo Group " actionBlock:^(void) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://zalo.me/g/pzmvdd558"] options:@{} completionHandler:nil];
    }];

    [alert addButton:@"TELEGRAM Dev ThienNhan " actionBlock:^(void) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://t.me/devthiennhan"] options:@{} completionHandler:nil];
    }];

    [alert addButton:@"Tiktok Dev ThienNhan " actionBlock:^(void) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.tiktok.com/@devthiennhan?_t=ZS-906TdX9vf67&_r=1"] options:@{} completionHandler:nil];
    }];

    [alert addButton:@"Facebook Dev ThienNhan " actionBlock:^(void) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://facebook.com/devthiennhan"] options:@{} completionHandler:nil];
    }];

    [alert addButton:@"Website Dev ThienNhan " actionBlock:^(void) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://devthiennhan.bio.link/"] options:@{} completionHandler:nil];
    }];

    // Logo image
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://sf-static.upanhlaylink.com/img/image_20250928e1675e244f7ec1d59e82d9dd5e74ebe8.jpg"]];
    UIImage *customAlertImage = [UIImage imageWithData:data];  

    [alert showCustom:alert
                image:customAlertImage
                color:[UIColor clearColor]
                title:@"Dev ThienNhan "
             subTitle:@"Cảm ơn bạn đã sử dụng  iOS Crack Dev .\nBấm vào Logo để tắt thông báo."
     closeButtonTitle:nil
             duration:9999999999.0f];
}

@end