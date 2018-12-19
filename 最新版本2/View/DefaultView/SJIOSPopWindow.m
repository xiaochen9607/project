

#import "SJIOSPopWindow.h"
#import "SJIOSSettingViewController.h"
#import "SJIOSNavViewController.h"
#import "SJIOSSdkImp.h"
#import "SJIOSWebInterface.h"
#import "SJIOSUserInfo.h"
#import "SJIOSDataBase.h"
#import "SJIOSSdk.h"
#import "SJIOSUserCenterView.h"
#define WIDTH self.frame.size.width
#define HEIGHT self.frame.size.height


@interface SJIOSPopWindow()
@property (nonatomic) int show;
@property (nonatomic, strong)SJIOSSettingViewController *destionController;
@property (nonatomic, strong)SJIOSNavViewController *destionNavController;
@property (nonatomic,strong) UIViewController *controller;
@property (nonatomic,strong) UIImageView *leftBackground;
@property(nonatomic,strong) UIImageView *rightBackground;
@property (nonatomic) CGFloat kScreenWidth;
@property (nonatomic) CGFloat kScreenHeight;
@property (nonatomic) CGPoint positon;
@property (nonatomic) float lastX;
@property (nonatomic) float lastY;
@property (nonatomic,strong)SJIOSPopWindow *SJIOSPopWindow;


@end

@implementation SJIOSPopWindow


- (id)initWithFrameSJIOSPopWindow:(CGRect)frame controller:(UIViewController *)controller landspace:(BOOL) landspace accessToken:(NSString *)accessToken
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.accessToken=accessToken;
        self.landscape=landspace;
        self.show=0;
        self.controller=controller;
        
        self.ButtonBackground = [[UIView alloc]init];
        
        
        if(self.landscape){
            [self setLandScapeView];
            
        }else{
            [self setPortraitView];
        }
        
    }
    return self;
}

    //横屏状态下的默认登录界面
    -(void)setLandScapeView{
        UIImage *leftbackImage = [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"SJIOS.bundle/SJIOS_float_leftBackground_hengban.png"]] ;
        self.leftBackground= [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 155, 50)];
        self.leftBackground.image = leftbackImage;
        
        UIImage *rightbackImage = [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"SJIOS.bundle/SJIOS_float_rightBackground_hengban.png"]] ;
        self.rightBackground= [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 155, 50)];
        self.rightBackground.image = rightbackImage;
        
        NSUserDefaults *server = [NSUserDefaults standardUserDefaults];//获取单例
        NSString *serverid = [server objectForKey:@"jhserverid"];
        if([serverid isEqual: @"set0"]){
            NSLog(@"serveridset0 == %@",serverid);
        }else{
            UIImage *floatImage = [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"SJIOS.bundle/SJIOS_company_logo.png"]];
            self.floatButton=[[UIButton alloc] initWithFrame:CGRectMake(0,0,60,60)];
            [self.floatButton setImage:floatImage forState:UIControlStateNormal];
            [self.floatButton addTarget:self action:@selector(showPop) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:self.floatButton];
        }
        
        
        

        //用户中心按钮
        self.accountButton = [[UIButton alloc]init];
        UIImage *userInfoImage = [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"SJIOS.bundle/SJIOS_userinfo_server.png"]] ;
        [self.accountButton setImage:userInfoImage forState:UIControlStateNormal];
        [self.accountButton addTarget:self action:@selector(accountClick) forControlEvents:UIControlEventTouchUpInside];
        
        //隐藏悬浮按钮
        self.ymFloatHideButton = [[UIButton alloc]init];
        UIImage *hideFloatSJIOSImage = [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"SJIOS.bundle/SJIOS_float_hide.png"]] ;
        [self.ymFloatHideButton setImage:hideFloatSJIOSImage forState:UIControlStateNormal];
        [self.ymFloatHideButton addTarget:self action:@selector(ym_hideSJIOSPopWindow:) forControlEvents:UIControlEventTouchUpInside];
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(locationChange:)];
        [self addGestureRecognizer:pan];
        pan.delaysTouchesBegan=YES;
        self.userInteractionEnabled = YES;
        CGRect rect=[[UIScreen mainScreen]bounds];
        if (ios8) {
            self.kScreenWidth=rect.size.width;
            self.kScreenHeight=rect.size.height;
        }else{
            if (self.landscape) {
                self.kScreenWidth=rect.size.height;
                self.kScreenHeight=rect.size.width;
            }else{
                self.kScreenWidth=rect.size.width;
                self.kScreenHeight=rect.size.height;
            }
        }
        self.center=CGPointMake(self.kScreenWidth-28, 128);
        [self.controller.view addSubview:self];
        [self.controller.view bringSubviewToFront:self];
        [self changeColor_landscape];
        [self setFloatButtonBackground];
        self.userInteractionEnabled=YES;
        
    }
    
    //竖屏状态下的默认登录界面
    -(void)setPortraitView{
        
        //        UIImage *leftbackImage = [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"SJIOS.bundle/SJIOS_float_leftBackground.png"]] ;
        UIImage *leftbackImage = [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"SJIOS.bundle/SJIOS_float_Background_shuban.png"]] ;
        self.leftBackground= [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 155, 50)];
        self.leftBackground.image = leftbackImage;
        
        //        UIImage *rightbackImage = [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"SJIOS.bundle/SJIOS_float_rightBackground.png"]] ;
        UIImage *rightbackImage = [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"SJIOS.bundle/SJIOS_float_Background_shuban.png"]] ;
        self.rightBackground= [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 155, 50)];
        self.rightBackground.image = rightbackImage;
        
        NSUserDefaults *server = [NSUserDefaults standardUserDefaults];//获取单例
        NSString *serverid = [server objectForKey:@"jhserverid"];
        if([serverid isEqual: @"set0"]){
            NSLog(@"serveridset0 == %@",serverid);
        }else{
            UIImage *floatImage = [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"SJIOS.bundle/SJIOS_company_logo.png"]];
            self.floatButton=[[UIButton alloc] initWithFrame:CGRectMake(0,0,60,60)];
            [self.floatButton setImage:floatImage forState:UIControlStateNormal];
            [self.floatButton addTarget:self action:@selector(showPop) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:self.floatButton];
        }
        
        //用户中心按钮
        self.accountButton = [[UIButton alloc]init];
        UIImage *userInfoImage = [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"SJIOS.bundle/SJIOS_userinfo_server.png"]] ;
        [self.accountButton setImage:userInfoImage forState:UIControlStateNormal];
        [self.accountButton addTarget:self action:@selector(accountClick) forControlEvents:UIControlEventTouchUpInside];
        
        //隐藏悬浮按钮
        self.ymFloatHideButton = [[UIButton alloc]init];
        UIImage *hideFloatSJIOSImage = [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"SJIOS.bundle/SJIOS_float_hide.png"]] ;
        [self.ymFloatHideButton setImage:hideFloatSJIOSImage forState:UIControlStateNormal];
        [self.ymFloatHideButton addTarget:self action:@selector(ym_hideSJIOSPopWindow:) forControlEvents:UIControlEventTouchUpInside];
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(locationChange:)];
        [self addGestureRecognizer:pan];
        pan.delaysTouchesBegan=YES;
        self.userInteractionEnabled = YES;
        CGRect rect=[[UIScreen mainScreen]bounds];
            if (ios8) {
            self.kScreenWidth=rect.size.width;
            self.kScreenHeight=rect.size.height;
                    }else{
                            if (self.landscape) {
                                self.kScreenWidth=rect.size.height;
                                self.kScreenHeight=rect.size.width;
                            }else{
                                self.kScreenWidth=rect.size.width;
                                self.kScreenHeight=rect.size.height;
            }
        }
            self.center=CGPointMake(self.kScreenWidth-28, 128);
            [self.controller.view addSubview:self];
            [self.controller.view bringSubviewToFront:self];
            [self changeColor_portrait];
            [self setFloatButtonBackground];
            self.userInteractionEnabled=YES;
    }





-(void)setFloatButtonBackground{

    SJIOS_VSD_BLOCK successCallback = ^(NSDictionary *responseString, NSDictionary *headers) {

            UIImage *normalAccountImage = [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"SJIOS.bundle/SJIOS_userinfo_server.png"]] ;
            [self.accountButton setImage:normalAccountImage forState:UIControlStateNormal];
        
        NSString *str = [NSString stringWithFormat:@"%@", responseString];
        if([str containsString:@"failed"]){
            NSUserDefaults *server = [NSUserDefaults standardUserDefaults];//获取单例
            NSString *serverid = [server objectForKey:@"jhserverid"];
            if([serverid isEqual: @"set0"]){
                NSLog(@"serveridset0 == %@",serverid);
            }else{
                UIImage *floatImage = [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"SJIOS.bundle/SJIOS_company_logo_nobind.png"]];
                [self.floatButton setImage:floatImage forState:UIControlStateNormal];
            }
            
            
        }else{
            NSUserDefaults *server = [NSUserDefaults standardUserDefaults];//获取单例
            NSString *serverid = [server objectForKey:@"jhserverid"];
            if([serverid isEqual: @"set0"]){
                NSLog(@"serveridset0 == %@",serverid);
            }else{
                UIImage *floatImage = [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"SJIOS.bundle/SJIOS_company_logo.png"]];
                [self.floatButton setImage:floatImage forState:UIControlStateNormal];
            }
            
        }
        
    };
    [[SJIOSWebInterface sharedInstance] checkSJIOSPhone:self.accessToken successCallbackSJIOS:successCallback failCallbackSJIOS:^(NSError *code) {
        
    }];
}






-(void) showPop{
    SJIOSUserCenterView *usercenter = [[SJIOSUserCenterView alloc] initSJIOSUserCenterView:self.landscape accessToken:self.accessToken];
    [usercenter showSJIOSUserCenterView:[UIApplication sharedApplication].keyWindow.rootViewController.view];
//    [self.layer removeAllAnimations];
//
//    self.alpha=1;
//    if (self.show==0) {
//        self.show=1;
//
//        if(self.landscape){
//             [self setPositionShow_landscape];
//
//        }else{
//             [self setPositionShow_portrait];
//        }
//
//
//
//
//    }else{
//        self.show=0;
//        if(self.landscape){
//            [self setPositonHidden_landscape];
//        }else{
//            [self setPositonHidden_portrait];
//        }
//
//
//    }
//
}



//========================竖屏下的悬浮图片
-(void)setPositionShow_portrait
{
    
    CGRect rect=self.frame;
    if(self.frame.origin.x<=self.kScreenWidth/2){//悬浮标在左边
        
        [self.rightBackground removeFromSuperview];
        self.frame=CGRectMake(0, rect.origin.y, 150, rect.size.height);
        self.floatButton.frame=CGRectMake(0, 0, 50, 50);
        self.ButtonBackground.frame=CGRectMake(0, 0, 100, 53);
        [self.ButtonBackground addSubview:self.leftBackground];
        [self addSubview:self.ButtonBackground];
        [self addSubview:self.floatButton];
        
        self.accountButton.frame=CGRectMake(55, 10, 35, 35);//隐藏按钮
        [self.ButtonBackground addSubview:self.accountButton];
        self.ymFloatHideButton.frame=CGRectMake(95, 10, 35, 35);//注销按钮
        [self.ButtonBackground addSubview:self.ymFloatHideButton];
        
    }else{//悬浮标在右边
        
        [self.leftBackground removeFromSuperview];
        self.frame=CGRectMake(self.kScreenWidth-150, rect.origin.y, 150, rect.size.height);
        self.floatButton.frame=CGRectMake(100, 0, 50, 50);
        self.ButtonBackground.frame=CGRectMake(0, 0, 100, 53);
        [self.ButtonBackground addSubview:self.rightBackground];
        [self addSubview:self.ButtonBackground];
        [self addSubview:self.floatButton];
        
        self.accountButton.frame=CGRectMake(20, 10, 35, 35);//隐藏按钮
        [self.ButtonBackground addSubview:self.accountButton];
        self.ymFloatHideButton.frame=CGRectMake(65, 10, 35, 35);//注销按钮
        [self.ButtonBackground addSubview:self.ymFloatHideButton];
        
    }
}

//========================竖屏下的悬浮图片=========

//========================横屏下的悬浮图片=========
-(void)setPositionShow_landscape
{
    
    CGRect rect=self.frame;
    if(self.frame.origin.x<=self.kScreenWidth/2){
        [self.rightBackground removeFromSuperview];
        //        self.frame=CGRectMake(0, rect.origin.y, 200, rect.size.height);
        self.frame=CGRectMake(0, rect.origin.y, 200, 60);
        self.floatButton.frame=CGRectMake(0, 0, 60, 60);
        self.ButtonBackground.frame=CGRectMake(25, 5, 150, 50);
        [self.ButtonBackground addSubview:self.leftBackground];
        [self addSubview:self.ButtonBackground];
        
        [self addSubview:self.floatButton];
        

        self.accountButton.frame=CGRectMake(38, 5, 40, 40);
        [self.ButtonBackground addSubview:self.accountButton];
        self.ymFloatHideButton.frame=CGRectMake(100, 5, 40, 40);
        [self.ButtonBackground addSubview:self.ymFloatHideButton];
        
        
        
    }else{
        [self.leftBackground removeFromSuperview];
        self.frame=CGRectMake(self.kScreenWidth-240, rect.origin.y, 240, rect.size.height);
        self.floatButton.frame=CGRectMake(180, 0, 60, 60);
        self.ButtonBackground.frame=CGRectMake(65, 5, 160, 53);
        [self.ButtonBackground addSubview:self.rightBackground];
        [self addSubview:self.ButtonBackground];
        
        [self addSubview:self.floatButton];
        
        self.accountButton.frame=CGRectMake(12, 5, 40, 40);
        [self.ButtonBackground addSubview:self.accountButton];
        self.ymFloatHideButton.frame=CGRectMake(75, 5, 40, 40);
        [self.ButtonBackground addSubview:self.ymFloatHideButton];
        
        
        
    }
}
//========================横屏下的悬浮图片

-(void)setPositonHidden_portrait
{
    [self.ButtonBackground removeFromSuperview];
    CGRect rect=self.frame;
    if (self.frame.origin.x<=self.kScreenWidth/2) {
        self.frame=CGRectMake(0, rect.origin.y, 50, rect.size.height);
        self.floatButton.frame=CGRectMake(0, 0, 50, 50);
        [self addSubview:self.floatButton];
    }else{
        self.frame=CGRectMake(self.kScreenWidth-50, rect.origin.y, 50, rect.size.height);
        self.floatButton.frame=CGRectMake(0, 0, 50, 50);
        [self addSubview:self.floatButton];
    }
  
    [self changeColor_portrait];
}

-(void)setPositonHidden_landscape
{
    [self.ButtonBackground removeFromSuperview];
    CGRect rect=self.frame;
    if (self.frame.origin.x<=self.kScreenWidth/2) {
        self.frame=CGRectMake(0, rect.origin.y, 60, rect.size.height);
        self.floatButton.frame=CGRectMake(0, 0, 50, 50);
        [self addSubview:self.floatButton];
    }else{
        self.frame=CGRectMake(self.kScreenWidth-60, rect.origin.y, 60, rect.size.height);
        self.floatButton.frame=CGRectMake(0, 0, 50, 50);
        [self addSubview:self.floatButton];
    }
    
    [self changeColor_landscape];
}

//改变位置
-(void)locationChange:(UIPanGestureRecognizer*)p
{
  
    if (self.show==1) {
        return;
        }
      [self.layer removeAllAnimations];
    
    
    CGPoint panPoint = [p translationInView:p.view.superview];
    if (p.state == UIGestureRecognizerStateBegan) {
        
        
        self.lastX = self.center.x;
        self.lastY = self.center.y;
        self.alpha=1;
    }else if([p state]==UIGestureRecognizerStateChanged){
        
       panPoint = CGPointMake(self.lastX + panPoint.x, self.lastY + panPoint.y);
        p.view.center=panPoint;
    }  else if(p.state == UIGestureRecognizerStateEnded)
    {
       if(p.view.center.x <= _kScreenWidth/2)
        {
            if (p.view.center.y<=HEIGHT/2) {
                [UIView animateWithDuration:0.4 animations:^{
                    p.view.center = CGPointMake(WIDTH/2,HEIGHT/2);
                }];
            }else if(p.view.center.y>=self.kScreenHeight-HEIGHT/2){
                [UIView animateWithDuration:0.4 animations:^{
                    p.view.center = CGPointMake(WIDTH/2, self.kScreenHeight-HEIGHT/2);
                }];
            }else{
                
                [UIView animateWithDuration:0.4 animations:^{
                    p.view.center = CGPointMake(WIDTH/2, p.view.center.y);
                }];
            }
            
        }else
        {
            if (p.view.center.y<=HEIGHT/2) {
                [UIView animateWithDuration:0.4 animations:^{
                    p.view.center = CGPointMake(self.kScreenWidth- WIDTH/2,HEIGHT/2);
                }];
            }else if(p.view.center.y>=self.kScreenHeight-HEIGHT/2){
                [UIView animateWithDuration:0.4 animations:^{
                    p.view.center = CGPointMake(self.kScreenWidth- WIDTH/2, self.kScreenHeight-HEIGHT/2);
                }];
            }else{
                
                [UIView animateWithDuration:0.4 animations:^{
                    p.view.center = CGPointMake(self.kScreenWidth- WIDTH/2, p.view.center.y);
                }];
            }
         }
        
        if(self.landscape){
            
            [self changeColor_landscape];
            
        }else{
            
            [self changeColor_portrait];
            
        }
      
}
}


-(void)changeColor_portrait
{
    [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionAllowUserInteraction animations:^{
        //
        CGRect rect=self.frame;
        if(self.frame.origin.x<=self.kScreenWidth/2){
            
            
            self.floatButton.frame=CGRectMake(0, 0, 50, 50);
            
            
            self.frame=CGRectMake(-30, rect.origin.y, 50, rect.size.height);
        }else{
            
            
            self.floatButton.frame=CGRectMake(0, 0, 50, 50);
            
            self.frame=CGRectMake(self.kScreenWidth-50+20, rect.origin.y, 50, rect.size.height);
            
        }
        self.alpha=0.2;
        
    } completion:^(BOOL finished) {
        
    }];
}

-(void)changeColor_landscape
{
    [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionAllowUserInteraction animations:^{
        //
        CGRect rect=self.frame;
        if(self.frame.origin.x<=self.kScreenWidth/2){
            
            
            self.floatButton.frame=CGRectMake(0, 0, 60, 60);
            
            
            self.frame=CGRectMake(-30, rect.origin.y, 60, rect.size.height);
        }else{
            
            
            self.floatButton.frame=CGRectMake(0, 0, 60, 60);
            
            self.frame=CGRectMake(self.kScreenWidth-60+20, rect.origin.y, 60, rect.size.height);
            
        }
        self.alpha=0.2;
        
    } completion:^(BOOL finished) {
        
    }];
}

-(void)serviceClick{
    if (self.controller == nil) {
        
    }
    else {
        if (self.destionController == nil) {
            self.destionController = [[SJIOSSettingViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:NULL];
            self.destionNavController = [[SJIOSNavViewController alloc]initWithRootViewController:self.destionController];
            self.destionController.view.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        }
        
        self.destionController.landscape = self.landscape;
        self.destionController.accessToken = self.accessToken;
        self.destionController.pageIndex = 0;
        NSLog(@"2");
        [self.controller presentViewController:self.destionNavController animated:YES completion:^{
        }];
    }

}
-(void)accountClick{
    if (self.controller == nil) {
        
        NSLog(@"accountClick-----1");
    }
    else {
        if (self.destionController == nil) {
            
            NSLog(@"accountClick-----2");
            
            //创建一个消息对象
            NSNotification * notice = [NSNotification notificationWithName:@"openSJUserCenter" object:nil userInfo:nil];
            //发送消息
            [[NSNotificationCenter defaultCenter]postNotification:notice];
            
            self.destionController = [[SJIOSSettingViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:NULL];
            self.destionNavController = [[SJIOSNavViewController alloc]initWithRootViewController:self.destionController];
            self.destionController.view.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
            
        }
        self.destionController.landscape = self.landscape;
        self.destionController.accessToken = self.accessToken;
        self.destionController.pageIndex = 1;
        [self.controller presentViewController:self.destionNavController animated:YES completion:^{
        }];
    }
}

//隐藏悬浮框
-(void)ym_hideSJIOSPopWindow:(id)sender {
    
    [SJIOSSdk hideFloatSJIOS];
    

}




- (void)dismissWithAnimation:(BOOL)animated
{
    
    NSString *className=[[NSString alloc]initWithFormat:@"%s",object_getClassName(self)];
    [self removeFromSuperview];
    
    
    
}
@end
