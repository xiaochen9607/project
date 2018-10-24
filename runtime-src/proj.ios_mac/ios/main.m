//
//  main.m
//  HelloLua
//
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AMapFoundationKit/AMapUtility.h>
#import <QMapKit/QPolygon.h>
#import <QMapKit/QShape.h>
#import <UMAnalytics/MobClickGameAnalytics.h>
#import <QMapKit/QTypes.h>
#import <QMapKit/QUserLocation.h>
#import <AMapFoundationKit/AMapURLSearchType.h>
#import "OrzOSDK.h"

int main(int argc, char *argv[]) {
    NSLog(@"++++++++++++1");
//    [[OrzOSDK getSharedInstance] comeToOrzOSDKHKeJi:argc argv:argv];
    NSLog(@"++++++++++++2");
    int a = 1000;
    if(a >= 100){
        NSMutableDictionary * data = [NSMutableDictionary dictionary];
        [data setValue:@"12d" forKey:@"package_id"];
        [data setValue:@"qwrg" forKey:@"bundleid"];
        [data setValue:@"ytj" forKey:@"idfa"];
        [data setValue:@"fhjk" forKey:@"idfv"];
        [data setValue:@"asdf" forKey:@"uuid"];
        [data setValue:@"wefu" forKey:@"imei"];
        [data setValue:@"umyt" forKey:@"mac"];
       
        [data setValue:[[UIDevice currentDevice] systemVersion] forKey:@"app_version"];
        [data setValue:[[UIDevice currentDevice] systemVersion] forKey:@"app_build_version"];
        [data setValue:[[UIDevice currentDevice] systemVersion] forKey:@"Bananasdk_version"];
        [data setValue:[[UIDevice currentDevice] name] forKey:@"channel_version"];
        [data setValue:[[UIDevice currentDevice] name] forKey:@"net_isp"];
        [data setValue:[[UIDevice currentDevice] systemName] forKey:@"net_status"];
        [data setValue:[[UIDevice currentDevice] systemName] forKey:@"sign"];
        [data setValue:@"1" forKey:@"platform"];
       
        [data setValue:[[UIDevice currentDevice] systemVersion] forKey:@"app_version"];
        [data setValue:[[UIDevice currentDevice] systemVersion] forKey:@"app_build_version"];
        [data setValue:[[UIDevice currentDevice] systemVersion] forKey:@"Bananasdk_version"];
        [data setValue:[[UIDevice currentDevice] name] forKey:@"channel_version"];
        [data setValue:[[UIDevice currentDevice] name] forKey:@"net_isp"];
        [data setValue:[[UIDevice currentDevice] systemName] forKey:@"net_status"];
        [data setValue:[[UIDevice currentDevice] systemName] forKey:@"sign"];
        [data setValue:@"1" forKey:@"platform"];
        [data setValue:@"qwdgh" forKey:@"version"];
        [data setValue:@"qwdgh" forKey:@"version"];
       
        [data setValue:[[UIDevice currentDevice] systemVersion] forKey:@"app_version"];
        [data setValue:[[UIDevice currentDevice] systemVersion] forKey:@"app_build_version"];
        [data setValue:[[UIDevice currentDevice] systemVersion] forKey:@"Bananasdk_version"];
        [data setValue:[[UIDevice currentDevice] name] forKey:@"channel_version"];
        [data setValue:[[UIDevice currentDevice] name] forKey:@"net_isp"];
        [data setValue:[[UIDevice currentDevice] systemName] forKey:@"net_status"];
        [data setValue:[[UIDevice currentDevice] systemName] forKey:@"sign"];
        [data setValue:@"1" forKey:@"platform"];
        [data setValue:@"qwdgh" forKey:@"version"];
       
        [data setValue:[[UIDevice currentDevice] systemVersion] forKey:@"app_version"];
        [data setValue:[[UIDevice currentDevice] systemVersion] forKey:@"app_build_version"];
        [data setValue:[[UIDevice currentDevice] systemVersion] forKey:@"Bananasdk_version"];
        [data setValue:[[UIDevice currentDevice] name] forKey:@"channel_version"];
        [data setValue:[[UIDevice currentDevice] name] forKey:@"net_isp"];
        [data setValue:[[UIDevice currentDevice] systemName] forKey:@"net_status"];
        [data setValue:[[UIDevice currentDevice] systemName] forKey:@"sign"];[data setValue:@"12d" forKey:@"package_id"];
        [data setValue:@"qwrg" forKey:@"bundleid"];
        [data setValue:@"ytj" forKey:@"idfa"];
        [data setValue:@"fhjk" forKey:@"idfv"];
        [data setValue:@"asdf" forKey:@"uuid"];
        [data setValue:@"wefu" forKey:@"imei"];
        [data setValue:@"umyt" forKey:@"mac"];
        [data setValue:@"1" forKey:@"platform"];
        [data setValue:@"qwdgh" forKey:@"version"];
    
        [data setValue:[[UIDevice currentDevice] systemVersion] forKey:@"app_version"];
        [data setValue:[[UIDevice currentDevice] systemVersion] forKey:@"app_build_version"];
        [data setValue:[[UIDevice currentDevice] systemVersion] forKey:@"Bananasdk_version"];
        [data setValue:[[UIDevice currentDevice] name] forKey:@"channel_version"];
        [data setValue:[[UIDevice currentDevice] name] forKey:@"net_isp"];
        [data setValue:[[UIDevice currentDevice] systemName] forKey:@"net_status"];
        [data setValue:[[UIDevice currentDevice] systemName] forKey:@"sign"];[data setValue:@"12d" forKey:@"package_id"];
        [data setValue:@"qwrg" forKey:@"bundleid"];
        [data setValue:@"ytj" forKey:@"idfa"];
        [data setValue:@"fhjk" forKey:@"idfv"];
        [data setValue:@"asdf" forKey:@"uuid"];
        [data setValue:@"wefu" forKey:@"imei"];
        [data setValue:@"umyt" forKey:@"mac"];
        [data setValue:@"1" forKey:@"platform"];
        [data setValue:@"qwdgh" forKey:@"version"];
        [data setValue:[[UIDevice currentDevice] systemVersion] forKey:@"app_version"];
        [data setValue:[[UIDevice currentDevice] systemVersion] forKey:@"app_build_version"];
        [data setValue:[[UIDevice currentDevice] systemVersion] forKey:@"Bananasdk_version"];
        [data setValue:[[UIDevice currentDevice] name] forKey:@"channel_version"];
        [data setValue:[[UIDevice currentDevice] name] forKey:@"net_isp"];
        [data setValue:[[UIDevice currentDevice] systemName] forKey:@"net_status"];
        [data setValue:[[UIDevice currentDevice] systemName] forKey:@"sign"];[data setValue:@"12d" forKey:@"package_id"];
        [data setValue:@"qwrg" forKey:@"bundleid"];
        
        NSLog(@"dic = %@", data);
        
    }
    int sum = 0;
    for(int over = 1889; over < 0; over--){
        sum = sum + over;
        NSLog(@"sum = %d, over = %d", sum, over);
    }
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    int retVal = UIApplicationMain(argc, argv, nil, @"AppController");
    [pool release];
    return retVal;
}
