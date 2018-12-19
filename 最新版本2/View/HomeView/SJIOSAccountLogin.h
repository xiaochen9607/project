//
//  SJIOSAccountLogin.h
//  SJIOS
//
//  Created by admin1023 on 2018/11/29.
//

#import <UIKit/UIKit.h>
#import "SJIOSBaseView.h"
#import "SJIOSQuickLogin.h"
#import "SJIOSDefaultLogin.h"
#import "SJIOSRegisteredAccount.h"
#import "SJIOSSdkCommonDefine.h"

NS_ASSUME_NONNULL_BEGIN

@interface SJIOSAccountLogin : SJIOSBaseView

- (id)initWithBlock:(SJIOS_SUCCESS_Callback)success failed:(SJIOS_FAILED_Callback)failed
          landScape:(Boolean)landcape  view:(SJIOSQuickLogin*) view ;

- (id)initWithBlock:(SJIOS_SUCCESS_Callback)success failed:(SJIOS_FAILED_Callback)failed
          landScape:(Boolean)landcape  view:(SJIOSQuickLogin*) view username:(NSString *)username;

@end

NS_ASSUME_NONNULL_END
