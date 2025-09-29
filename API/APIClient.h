

// Update 01/09/25
// Author: Trần Như Tuấn Khang
// Server Key: https://tuankhang.xyz
// Contact Admin: 
// + Zalo: 0906527270
// + Telegram: @tuankhangapikeys

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TKAPIKey : NSObject

//Khởi tạo và xử lý
- (void)startLoading; // Khởi tạo chạy hàm
- (void)paid:(void (^)(void))execute; // Hàm bọc menu
- (void)setPackageToken:(NSString *)token; // Set Token của Package
- (void)setPackageVersion:(NSString *)version; // Set Package Version
- (void)setENLanguage:(BOOL)value; // Đổi ngôn ngữ: YES = Tiếng Anh, NO = Tiếng Việt
- (void)copyKey:(NSString *)key; // Copy Key Bằng giá key đã nhập
- (void)reloadInfo; // Load Lại Info Key
- (void)exitApp; // Thoát Ứng Dụng Sau 3s

+ (instancetype)sharedAPIClient;

// Thông Tin và Ứng Dụng
- (NSString *)getKey;
- (NSString *)getUDID;
- (NSString *)deviceName;
- (NSString *)getDeviceModel;
- (NSString *)getExpiryDate;
- (NSString *)osVersion;
- (NSString *)ipAddress;

@end

NS_ASSUME_NONNULL_END