//
//  SJIOSQuickLogin.h
//  SJIOS
//
//  Created by admin1023 on 2018/11/28.
//  Copyright © 2018年 AA1023. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJIOSBaseView.h"
#import "SJ_ValidateIdentity.h"
#import "SJIOSSdkCommonDefine.h"

//NS_ASSUME_NONNULL_BEGIN
@interface SJIOSQuickLogin : SJIOSBaseView

@property(nonatomic,strong) SJ_ValidateIdentity *sjValidateIdentity;
- (id)initWithBlock:(SJIOS_SUCCESS_Callback)success failed:(SJIOS_FAILED_Callback)failed
          landScape:(Boolean)landcape;

- (id)initWithSize:(CGSize)size
         landScape:(Boolean)landScape;

@end
//
//NS_ASSUME_NONNULL_END
