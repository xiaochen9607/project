#import <Foundation/Foundation.h>

@interface OrzOSDKViewController : NSObject

+ (void)init:(NSDictionary *)dict;
+ (void)login:(NSDictionary *)dict;
+ (void)logout:(NSDictionary *)dict;
+ (void)setUserInfo:(NSDictionary *)dict;
+ (void)zhi:(NSDictionary *)dict;
+ (NSString * )getUserID:(NSDictionary *)dict;
+ (NSString * )getToken:(NSDictionary *)dict;
+ (void)clearTokenAndUserId;
+ (void)switchAccount:(NSDictionary *)dict;


@end
