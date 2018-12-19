//
//  SJIOSQuickLogin.m
//  SJIOS
//
//  Created by admin1023 on 2018/11/28.
//  Copyright © 2018年 AA1023. All rights reserved.
//

#import "SJIOSQuickLogin.h"
#import "SJIOSPhoneAccount.h"
#import "SJIOSAccountLogin.h"
#import "SJIOSDefaultLogin.h"
#import "SJIOSSdkCommonDefine.h"
#import "SJIOSDataBase.h"
#import "SJIOSSdkImp.h"

#define IS_SHOW_AGREE false//修改这的值来选择是否显示协议
#define SJIOS_USER_AGREEMENT_URL @"https://www.3975.com/public/web/39XY.html"

@interface SJIOSQuickLogin() <UIAlertViewDelegate>
@property(nonatomic,strong) SJIOSProgressHUD *process;
@property(nonatomic,strong) UIButton *choose;

@property(nonatomic,strong) NSString *token;

@property(nonatomic) Boolean SHOWPROCESS;
@property(nonatomic) Boolean isRegister;
@property(nonatomic) Boolean agree;
@property(nonatomic) Boolean landcape;

@property(nonatomic, strong) SJIOS_SUCCESS_Callback success;
@property(nonatomic, strong) SJIOS_FAILED_Callback failed;

//跳转响应
@property(nonatomic ,strong)SJIOSPhoneAccount *PhoneAccountRegister;
@property(nonatomic ,strong)SJIOSAccountLogin *SJIOSAccountLoginRegister;

@end

@implementation SJIOSQuickLogin

- (id)initWithBlock:(SJIOS_SUCCESS_Callback)success failed:(SJIOS_FAILED_Callback)failed landScape:(Boolean)landcape {
    NSUserDefaults *server = [NSUserDefaults standardUserDefaults];//获取单例
    NSString *serverid = [server objectForKey:@"jhserverid"];
    if([serverid isEqual: @"set0"]){
        NSLog(@"serveridset0 == %@",serverid);
        NSLog(@"我是set0");
        self.isRegister = NO;
        if (self) {
            self.success=success;
            self.failed=failed;
            self.SHOWPROCESS = false;
            self.landcape = landcape;
            self.agree = true;
        }
        self = [super initWithSize:CGSizeMake(0, 0) landScape:landcape ];
        [self performSelectorOnMainThread:@selector(SJIOSAccountLoginClick:) withObject:self waitUntilDone:NO];
    }
    else{
        
        if(landcape){
            //横屏
            self = [super initWithSize:CGSizeMake(450, 250) landScape:landcape ];
            
        }else{
            //竖屏
            self = [super initWithSize:CGSizeMake(260, 260) landScape:landcape ];
        }
        
        self.isRegister = NO;
        if (self) {
            self.success=success;
            self.failed=failed;
            self.SHOWPROCESS = false;
            self.landcape = landcape;
            
            self.agree = true;
            NSUserDefaults *server = [NSUserDefaults standardUserDefaults];//获取单例
            NSString *serverid = [server objectForKey:@"jhserverid"];
            if([serverid isEqual: @"set1"]){
                NSLog(@"我是set1");
                [self performSelectorOnMainThread:@selector(SJIOSAccountLoginClick:) withObject:self waitUntilDone:NO];
            }else{
                NSLog(@"我是setset");
                if(self.landcape){
                    [self setLandScapeView];
                    
                }else{
                    [self setPortraitView];
                }
            }
        }
    }
    
    return self;
}
-(void)setLandScapeView{
    //横屏状态下显示
    UIImageView * logoView = [[UIImageView alloc] initWithFrame:CGRectMake(150, 20, 166, 64)];
    logoView.image=[UIImage imageNamed:@"SJIOS.bundle/SJIOS_logo.png"];
    [self.alertContainer addSubview:logoView];
    
    //快速游戏
    UIButton *QuickLoginBt=[[UIButton alloc]initWithFrame:CGRectMake(48 , 98, 83, 99)];
    [QuickLoginBt setBackgroundImage:[UIImage imageNamed:@"SJIOS.bundle/SJIOS_quick_register.png"] forState:UIControlStateNormal];
    [QuickLoginBt addTarget:self action:@selector(QuickLoginClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.alertContainer addSubview:QuickLoginBt];
    
    //手机登入
    UIButton *PhoneAccountBt=[[UIButton alloc]initWithFrame:CGRectMake(QuickLoginBt.frame.origin.x+135, 98, 83, 99)];
    [PhoneAccountBt setBackgroundImage:[UIImage imageNamed:@"SJIOS.bundle/SJIOS_phone_register.png"] forState:UIControlStateNormal];
    [PhoneAccountBt addTarget:self action:@selector(PhoneAccountClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.alertContainer addSubview:PhoneAccountBt];
    
    //账号登入
    UIButton *SJIOSAccountLoginBt=[[UIButton alloc]initWithFrame:CGRectMake(PhoneAccountBt.frame.origin.x+135, 98, 83, 99)];
    [SJIOSAccountLoginBt setBackgroundImage:[UIImage imageNamed:@"SJIOS.bundle/SJIOS_login.png"] forState:UIControlStateNormal];
    [SJIOSAccountLoginBt addTarget:self action:@selector(SJIOSAccountLoginClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.alertContainer addSubview:SJIOSAccountLoginBt];
    
    //SDK版本
    UILabel *Version = [[UILabel alloc]initWithFrame:CGRectMake(28, 220, 50, 20)];
    [Version setFont:[UIFont systemFontOfSize:10]];
    [Version setText:SJIOS_SDK_VERSION];
    Version.textColor = [UIColor blackColor];
    [self.alertContainer addSubview:Version];
    
    //用户协议相关内容
    if(IS_SHOW_AGREE){
        self.choose = [[UIButton alloc] initWithFrame:CGRectMake(120, QuickLoginBt.frame.origin.y + 115, 20, 20)];
        [self.choose setBackgroundImage:[UIImage imageNamed:@"SJIOS.bundle/SJIOS_read.png"] forState:
         UIControlStateNormal];
        [self.choose addTarget:self action:@selector(chooseClick) forControlEvents:UIControlEventTouchUpInside];
        [self.alertContainer addSubview:self.choose];
        
        UILabel *agree1 = [[UILabel alloc]initWithFrame:CGRectMake(145, QuickLoginBt.frame.origin.y + 118, 85, 18)];
        [agree1 setFont:[UIFont systemFontOfSize:12]];
        [agree1 setText:@"我已阅读并同意"];
        [agree1 sizeToFit];
        [self.alertContainer addSubview:agree1];
        
        UILabel *agree2 = [[UILabel alloc]initWithFrame:CGRectMake(231, QuickLoginBt.frame.origin.y + 118, 50, 18)];
        [agree2 setFont:[UIFont systemFontOfSize:12]];
        [agree2 setText:@"《用户协议》"];
        [agree2 setTextColor:[UIColor blueColor]];
        [agree2 sizeToFit];
        
        UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(agree2)];
        [agree2 addGestureRecognizer:labelTapGestureRecognizer];
        agree2.userInteractionEnabled = YES; // 可以理解为设置label可被点击
        [self.alertContainer addSubview:agree2];
        
    }
}

-(void)setPortraitView{
    //竖屏状态下显示
    UIImageView * logoView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 30, 160, 62)];
    logoView.image=[UIImage imageNamed:@"SJIOS.bundle/SJIOS_logo.png"];
    [self.alertContainer addSubview:logoView];
    
    //快速游戏
    UIButton *QuickLoginBt=[[UIButton alloc]initWithFrame:CGRectMake(10, 120, 70, 80)];
    [QuickLoginBt setBackgroundImage:[UIImage imageNamed:@"SJIOS.bundle/SJIOS_quick_register.png"] forState:UIControlStateNormal];
    [QuickLoginBt addTarget:self action:@selector(QuickLoginClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.alertContainer addSubview:QuickLoginBt];
    
    //手机登入
    UIButton *PhoneAccountBt=[[UIButton alloc]initWithFrame:CGRectMake(QuickLoginBt.frame.origin.x+85, 120, 70, 80)];
    [PhoneAccountBt setBackgroundImage:[UIImage imageNamed:@"SJIOS.bundle/SJIOS_phone_register.png"] forState:UIControlStateNormal];
    [PhoneAccountBt addTarget:self action:@selector(PhoneAccountClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.alertContainer addSubview:PhoneAccountBt];
    
    //账号登入
    
    UIButton *SJIOSAccountLoginBt=[[UIButton alloc]initWithFrame:CGRectMake(PhoneAccountBt.frame.origin.x+85, 120, 70, 80)];
    [SJIOSAccountLoginBt setBackgroundImage:[UIImage imageNamed:@"SJIOS.bundle/SJIOS_login.png"] forState:UIControlStateNormal];
    [SJIOSAccountLoginBt addTarget:self action:@selector(SJIOSAccountLoginClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.alertContainer addSubview:SJIOSAccountLoginBt];
    
    //SDK版本
    UILabel *Version = [[UILabel alloc]initWithFrame:CGRectMake(18, 225, 50, 20)];
    [Version setFont:[UIFont systemFontOfSize:10]];
    [Version setText:SJIOS_SDK_VERSION];
    Version.textColor = [UIColor blackColor];
    [self.alertContainer addSubview:Version];
    
    //用户协议相关内容
    if(IS_SHOW_AGREE){
        self.choose = [[UIButton alloc] initWithFrame:CGRectMake(120, QuickLoginBt.frame.origin.y + 115, 20, 20)];
        [self.choose setBackgroundImage:[UIImage imageNamed:@"SJIOS.bundle/SJIOS_read.png"] forState:
         UIControlStateNormal];
        [self.choose addTarget:self action:@selector(chooseClick) forControlEvents:UIControlEventTouchUpInside];
        [self.alertContainer addSubview:self.choose];
        
        UILabel *agree1 = [[UILabel alloc]initWithFrame:CGRectMake(145, QuickLoginBt.frame.origin.y + 118, 85, 18)];
        [agree1 setFont:[UIFont systemFontOfSize:12]];
        [agree1 setText:@"我已阅读并同意"];
        [agree1 sizeToFit];
        [self.alertContainer addSubview:agree1];
        
        UILabel *agree2 = [[UILabel alloc]initWithFrame:CGRectMake(231, QuickLoginBt.frame.origin.y + 118, 50, 18)];
        [agree2 setFont:[UIFont systemFontOfSize:12]];
        [agree2 setText:@"《用户协议》"];
        [agree2 setTextColor:[UIColor blueColor]];
        [agree2 sizeToFit];
        
        UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(agree2)];
        [agree2 addGestureRecognizer:labelTapGestureRecognizer];
        agree2.userInteractionEnabled = YES; // 可以理解为设置label可被点击
        [self.alertContainer addSubview:agree2];
    }
}

-(void)QuickLoginClick:(NSNotification *)tap
{
    NSLog(@"你点了快速游戏");
    if(self.agree == false){
        [[SJIOSSdkImp sharedInstance] showSJIOSToast:@"请详细阅读并同意用户协议"];
        return;
    }
    NSMutableArray *user=[[[SJIOSDataBase alloc]init] getTestList];
    if (user!=nil&&user.count>0) {
        for (int i=0;i<[user count]; i++) {
            SJIOSUserInfo *userinfo=[user objectAtIndex:i];
            if (userinfo.tourist) {
                
                [self startLogin:userinfo];
                break;
            }
        }
    }else{
        [self fastRegister];
    }
}

-(void)PhoneAccountClick:(NSNotification *)tap
{
    NSLog(@"你点了手机登入");
    if(self.agree == false){
        [[SJIOSSdkImp sharedInstance] showSJIOSToast:@"请详细阅读并同意用户协议"];
        return;
    }
    
//    SJIOSPhoneAccount *vc = [[SJIOSPhoneAccount alloc]init];
//    [self.PhoneAccountTap pushViewController:vc animaed:YES];
//    [self.PhoneAccountTap popViewControllerAnimated:YES];
    
    if (self.PhoneAccountRegister==nil) {
        self.PhoneAccountRegister=[[SJIOSPhoneAccount alloc]initWithBlock:self.success failed:self.failed landScape:self.landscape view:self];
    }
    [self.PhoneAccountRegister show:self];
    
}

-(void)SJIOSAccountLoginClick:(NSNotification *)tap
{
    NSLog(@"你点了账号登入1");
    if(self.agree == false){
        [[SJIOSSdkImp sharedInstance] showSJIOSToast:@"请详细阅读并同意用户协议"];
        return;
    }
    
    if (self.SJIOSAccountLoginRegister==nil) {
        self.SJIOSAccountLoginRegister=[[SJIOSAccountLogin alloc]initWithBlock:self.success failed:self.failed landScape:self.landscape view:self];
    }
    [self.SJIOSAccountLoginRegister show:self];
    
}

-(void) chooseClick{
    if(self.agree == true){
        self.agree = false;
        [self.choose setBackgroundImage:[UIImage imageNamed:@"SJIOS.bundle/SJIOS_noread.png"] forState:
         UIControlStateNormal];
    }else{
        self.agree = true;
        [self.choose setBackgroundImage:[UIImage imageNamed:@"SJIOS.bundle/SJIOS_read.png"] forState:
         UIControlStateNormal];
    }
}

-(void)agree2{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:SJIOS_USER_AGREEMENT_URL]];
}


// 以下是游客账号登入相关内容

- ( UIImage *)createShareImage:( NSString *)str

{
    
    UIImage *image = [ UIImage imageNamed : @"SJIOS.bundle/SJIOS_buttombackground"];
    UIImage *imagelogo = [ UIImage imageNamed : @"SJIOS.bundle/SJIOS_SJIOS_logo"];
    
    CGSize size= CGSizeMake (image. size . width , image. size . height ); // 画布大小
    
    UIGraphicsBeginImageContextWithOptions (size, NO , 0.0 );
    
    [image drawAtPoint : CGPointMake ( 0 , 0 )];
    
    [imagelogo drawAtPoint : CGPointMake ( 60 , 20 )];
    // 获得一个位图图形上下文
    
    CGContextRef context= UIGraphicsGetCurrentContext ();
    
    CGContextDrawPath (context, kCGPathStroke );
    
    // 画 打败了多少用户
    [@"快速登录帐号ID" drawAtPoint:CGPointMake(70,imagelogo.size.height +30) withAttributes:@{NSFontAttributeName:[ UIFont fontWithName:@"Arial-BoldMT" size:25], NSForegroundColorAttributeName:[UIColor blackColor]}];
    
    [str drawAtPoint : CGPointMake (100 , imagelogo.size.height + 80) withAttributes : @{ NSFontAttributeName :[ UIFont fontWithName : @"Arial-BoldMT" size : 12 ], NSForegroundColorAttributeName :[UIColor blackColor]} ];
    
    
    [@"向客服提供图中帐号ID，可以找回帐号！" drawAtPoint : CGPointMake (8 , image.size.height - 30) withAttributes : @{ NSFontAttributeName :[ UIFont fontWithName : @"Arial-BoldMT" size : 13 ], NSForegroundColorAttributeName :[UIColor redColor]} ];
    //画自己想画的内容。。。。。
    
    // 返回绘制的新图形
    
    UIImage *newImage= UIGraphicsGetImageFromCurrentImageContext ();
    
    UIGraphicsEndImageContext ();
    
    return newImage;
    
}

-(void)savePhoto: ( NSString *)userid

{
    
    
    UIImage * image = [self createShareImage:userid];
    
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingResult:contextInfo:), nil);
    
    
}

-(void) image:(UIImage *)image didFinishSavingResult:(NSError *)error contextInfo:(void *)contentInfo
{
    if(error == nil){
        NSLog(@"save1 success");
        //  [[SJIOSSdkImp sharedInstance] showSJIOSToast:@"帐号为快速登录帐号,请尽快绑定手机号,以免帐号丢失!\n帐号信息截图已保存到相册中，请妥善保管！"];
    }else{
        NSLog(@"save1 error");
        
        
        //  [[SJIOSSdkImp sharedInstance] showSJIOSToast:@"该帐号为快速登录帐号,请尽快绑定手机号,以免帐号丢失!"];
    }
}

//点击弹框的取消按钮
-(NSString*)cancelBtnTitle{
    return @"取消";
}

//点击弹框的绑定手机按钮
-(NSString*)otherBtnTitle{
    return @"绑定手机";
}

//以下是网络问题

-(void)fastRegister{
    self.SHOWPROCESS = true;
    [self processSJIOSShow];
    SJIOS_VSD_BLOCK successCallback = ^(NSDictionary *dictionary, NSDictionary *headers) {
        @try
        {
            
            if (dictionary == nil)
            {
                self.SHOWPROCESS = false;
                [[SJIOSSdkImp sharedInstance] showSJIOSToast:@"网络不太好，请重试！！！"];
                return;
            }
            
            NSLog(@"res = %@", dictionary);
            //"is_register" = 0;不是注册   1注册
            
            NSString *value = [dictionary objectForKey:@"error"];
            if ((NSNull *)value == nil)
            {
                NSString * user_id = [dictionary valueForKey:@"user_id"];
                NSString * password=[dictionary valueForKey:@"password"];
                NSString * type= [NSString stringWithFormat:@"%@", [dictionary valueForKey:@"type"]];
                NSString * is_register= [NSString stringWithFormat:@"%@", [dictionary valueForKey:@"is_register"]];
                
                NSString *bind;
                if ([type isEqualToString:@"1"]) {//type=1没绑定手机 type=0已绑定手机
                    
                    bind=@"0";
                    
                    if([is_register isEqualToString:@"1"]){
                        //创建一个消息对象
                        NSNotification * notice = [NSNotification notificationWithName:@"registerOK" object:nil userInfo:[dictionary valueForKey:@"id"]];
                        //发送消息
                        [[NSNotificationCenter defaultCenter]postNotification:notice];
          
                        self.isRegister = YES;
                    }
                    
                    
                    
                    
                    [self savePhoto:[dictionary valueForKey:@"id"]];
                    
                }else{
                    
                    bind=@"1";
                }
                
                SJIOSUserInfo *userinfo=[[SJIOSUserInfo alloc]initWithInfo:user_id password:password bind:bind tourist:@"1" loginTime:[[SJIOSSdkImp sharedInstance]getSJIOSTimeUserNow] phoneNumber:@"0"];
                [self startLogin:userinfo];
            }
            else
            {
                [[SJIOSSdkImp sharedInstance]showSJIOSToast:[[SJIOSSdkImp sharedInstance] translateSJIOS:[dictionary valueForKey:@"error"]]];
                self.SHOWPROCESS = false;
                
            }
            //self.SHOWPROCESS = false;
        }
        @catch(NSException * e)
        {
            
            [[SJIOSSdkImp sharedInstance]showSJIOSToast:@"内部错误"];
            self.SHOWPROCESS = false;
            
        }
        @finally
        {
            //self.SHOWPROCESS = false;
        }
    };
    [[SJIOSWebInterface sharedInstance]fastSJIOSRegisterSJIOS:successCallback
     
                                            failCallbackSJIOS:^(NSError * code) {
                                                self.SHOWPROCESS = false;
                                                self.failed(-100);
                                                [[SJIOSSdkImp sharedInstance]showSJIOSToast:@"请检查网络连接！"];
                                            }];
}


- (void) startLogin:(SJIOSUserInfo *) userinfo
{
    NSString *password;
    if ([userinfo.tourist  isEqual:@"1"]) {
        password=userinfo.password;
    }else{
        password =[SJIOSSdkMd5 md5:userinfo.password];
    }
    
    SJIOS_VSD_BLOCK getUserIdCompletionBlock = ^(NSDictionary *dictionary, NSDictionary *headers){
        
        @try{
            
            if (dictionary == nil)
            {
                self.SHOWPROCESS=false;
                [[SJIOSSdkImp sharedInstance] showSJIOSToast:@"网络不太好，请重试！！！"];
                return;
            }
            
            NSString *value = [dictionary objectForKey:@"error"];
            if ((NSNull *)value == nil)
            {
                
                //判断是否是注册用户，如果是，则跳实名认证界面
                if(self.isRegister == YES && [[SJIOSSdkImp sharedInstance] getSJIOSShiMingRenZhengFlag] == YES){
                    [[SJIOSSdkImp sharedInstance] showSJIOSShiMingRenZhengView:self.token callbackSJIOS:^(NSString *callbackssss){
                        NSString * userid = [dictionary valueForKey:@"id"];
                        
                        NSDictionary *userInfo = [NSMutableDictionary dictionary];
                        [userInfo setValue:self.token forKey:@"accesstoken"];
                        [userInfo setValue:userid forKey:@"userid"];
                        [userInfo setValue:userinfo.username forKey:@"username"];
                        self.success(userInfo);
                        [[SJIOSWebInterface sharedInstance] SJIOSsendHeart:userid];
                        self.SHOWPROCESS=false;
                        
                        [[SJIOSSdkImp sharedInstance] addSJIOSUser:userinfo.username passwordSJIOS:userinfo.password bindSJIOS:userinfo.bind touristSJIOS:userinfo.tourist phoneNumberSJIOS:userinfo.phoneNumber];
                        
                        //                [self checkAccountIdentity:self.token];//检查有没有实名
                        
                        [self dismissWithAnimation:YES];//取消消失的baseview，不然不能显示手机绑定界面
                    }];
                    self.isRegister = NO;
                }else{
                    NSString * userid = [dictionary valueForKey:@"id"];
                    
                    NSDictionary *userInfo = [NSMutableDictionary dictionary];
                    [userInfo setValue:self.token forKey:@"accesstoken"];
                    [userInfo setValue:userid forKey:@"userid"];
                    [userInfo setValue:userinfo.username forKey:@"username"];
                    self.success(userInfo);
                    [[SJIOSWebInterface sharedInstance] SJIOSsendHeart:userid];
                    self.SHOWPROCESS=false;
                    
                    [[SJIOSSdkImp sharedInstance] addSJIOSUser:userinfo.username passwordSJIOS:userinfo.password bindSJIOS:userinfo.bind touristSJIOS:userinfo.tourist phoneNumberSJIOS:userinfo.phoneNumber];
                    
                    //                [self checkAccountIdentity:self.token];//检查有没有实名
                    
                    [self dismissWithAnimation:YES];//取消消失的baseview，不然不能显示手机绑定界面
                }
                
                
                
                
                
                
            }
            else
            {
                [[SJIOSSdkImp sharedInstance]showSJIOSToast:[[SJIOSSdkImp sharedInstance] translateSJIOS:[dictionary valueForKey:@"error"]]];
                self.SHOWPROCESS=false;
                
            }
        }@catch(NSException * e)
        {
            [[SJIOSSdkImp sharedInstance]showSJIOSToast:@"内部错误" ];
            self.SHOWPROCESS=false;
        }
        @finally
        {
            self.SHOWPROCESS=false;
            //     [[SJIOSSdkImp sharedInstance] showSJIOSToast:@"网络不太好，请重试！！！"];
        }
    };
    
    SJIOS_VSD_BLOCK getTokenCompletionBlock = ^(NSDictionary *dictionary, NSDictionary *headers){
        @try{
            
            if (dictionary == nil)
            {
                self.SHOWPROCESS=false;
                [[SJIOSSdkImp sharedInstance] showSJIOSToast:@"网络不太好，请重试！！！"];
                return;
            }
            
            NSString *value = [dictionary objectForKey:@"error"];
            if ((NSNull *)value == nil)
            {
                NSString * access_token = [dictionary valueForKey:@"access_token"];
                self.token = [[NSString alloc] initWithFormat:@"%@", access_token];
                
                NSString *tokenDicPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                NSString *token = [tokenDicPath stringByAppendingPathComponent:@"token.plist"];
                NSDictionary *tokenDic = [NSDictionary dictionaryWithContentsOfFile:token];
                if(tokenDic == nil){
                    tokenDic = [NSMutableDictionary dictionary];
                    [tokenDic setValue:access_token forKey:@"ACCESS_TOKEN"];
                    [tokenDic writeToFile:token atomically:YES];
                    
                }else{
                    [tokenDic setValue:access_token forKey:@"ACCESS_TOKEN"];
                    [tokenDic writeToFile:token atomically:YES];
                    
                }
                
                _process.labelText = @"正在获取信息";
                [[SJIOSWebInterface sharedInstance] getSJIOSUserId:access_token
                                              successCallbackSJIOS:getUserIdCompletionBlock
                                                 failCallbackSJIOS:^(NSError *error){
                                                     self.SHOWPROCESS=false;
                                                     self.failed(-101);
                                                     [[SJIOSSdkImp sharedInstance]showSJIOSToast:@"请检查网络连接！"];
                                                 }];
            }
            else
            {
                self.SHOWPROCESS=false;
                [[SJIOSSdkImp sharedInstance]showSJIOSToast:[[SJIOSSdkImp sharedInstance] translateSJIOS:[dictionary valueForKey:@"error"]]];
                
            }
        }@catch(NSException * e)
        {
            self.SHOWPROCESS=false;
            [[SJIOSSdkImp sharedInstance]showSJIOSToast:@"内部错误" ];
            
        }
        @finally
        {
            //  self.SHOWPROCESS=false;
            //   [[SJIOSSdkImp sharedInstance] showSJIOSToast:@"网络不太好，请重试！！！"];
        }
    };
    
    SJIOS_VSD_BLOCK successCallback = ^(NSDictionary *dictionary, NSDictionary *headers) {
        
        @try
        {
            
            if (dictionary == nil)
            {
                self.SHOWPROCESS=false;
                [[SJIOSSdkImp sharedInstance] showSJIOSToast:@"网络不太好，请重试！！！"];
                return;
            }
            
            NSString *value = [dictionary objectForKey:@"error"];
            if ((NSNull *)value == nil)
            {
                
                
                
                _process.labelText = @"正在验证";
                [[SJIOSWebInterface sharedInstance] getSJIOSAccessTokenSJIOS:[dictionary valueForKey:@"code"]
                                                        successCallbackSJIOS:getTokenCompletionBlock
                                                           failCallbackSJIOS:^(NSError *error){
                                                               self.SHOWPROCESS=false;
                                                               self.failed(-102);
                                                               [[SJIOSSdkImp sharedInstance]showSJIOSToast:@"请检查网络连接！"];
                                                           }];
                
                
                
                
            }
            else
            {
                [[SJIOSSdkImp sharedInstance]showSJIOSToast:[[SJIOSSdkImp sharedInstance] translateSJIOS:[dictionary valueForKey:@"error"]]];
                self.SHOWPROCESS=false;
                
            }
        }
        @catch(NSException * e)
        {
            [[SJIOSSdkImp sharedInstance]showSJIOSToast:@"内部错误" ];
            self.SHOWPROCESS=false;
        }
        @finally
        {
            //     [[SJIOSSdkImp sharedInstance] showSJIOSToast:@"网络不太好，请重试！！！"];
            //  self.SHOWPROCESS=false;
        }
    };
    
    [[SJIOSWebInterface sharedInstance] loginSJIOS:userinfo.username
                                     passwordSJIOS:password
                              successCallbackSJIOS:successCallback
                                 failCallbackSJIOS:^(NSError * error) {
                                     self.SHOWPROCESS=false;
                                     self.failed(-103);
                                     [[SJIOSSdkImp sharedInstance]showSJIOSToast:@"请检查网络连接！"];
                                 }
     ];
    
    
}

-(void) show:(UIView *)view{
    [super show:view];
}


//检查身份验证
-(void)checkAccountIdentity:(NSString *)access_token{
    
    [[SJIOSWebInterface sharedInstance] checkSJIOSIdentify:access_token successCallbackSJIOS:^(NSDictionary *dictionary, NSDictionary *headers) {
        @try
        {
            if (dictionary == nil)
            {
                [self dismissWithAnimation:YES];
                return;
            }
            
            NSString *value = [dictionary objectForKey:@"error"];
            if ((NSNull *)value == nil)
            {
                NSString *unknown = [[NSString alloc]initWithFormat:@"%@",[dictionary objectForKey:@"unknown"]];
                NSString *ok = [[NSString alloc]initWithFormat:@"%@",[dictionary objectForKey:@"ok"]];
                
                if ([unknown isEqualToString:@"1"])
                {
                    self.sjValidateIdentity = [[SJ_ValidateIdentity alloc] initWithBlock:access_token complete:^(NSString *str1, NSString *str2){
                        [self dismissWithAnimation:YES];
                    } landscape:self.landcape];
                    [self.sjValidateIdentity show:self];
                    
                }else
                {
                    [self dismissWithAnimation:YES];
                    
                }
            }
            
        }
        @catch(NSException * e)
        {
            [self dismissWithAnimation:YES];
        }
    } failCallbackSJIOS:^(NSError *code) {
        [self dismissWithAnimation:YES];
        [[SJIOSSdkImp sharedInstance]showSJIOSToast:@"获取身份证认证信息失败" ];
    }];
}



//关闭按钮
- (void) closeLogin{
    [super dismissWithAnimation:YES];
}

-(void)processSJIOSShow {
    if (self.process == nil) {
        self.process = [[SJIOSProgressHUD alloc] initWithView:self.alertContainer];
        
    }
    [self.alertContainer addSubview:_process];
    _process.labelText = @"正在登录";
    
    [_process showAnimated:YES whileExecutingBlock:^{
        int count = 0;
        while (self.SHOWPROCESS)
        {
            count ++;
            [NSThread sleepForTimeInterval:1];
            if (count > 60) {
                [[SJIOSSdkImp sharedInstance] showSJIOSToast:@"网络不太好，请重试！！！"];
                break;
            }
        }
    } successCallback:^{
        [_process removeFromSuperview];
    }];
    
    
    
}


@end
