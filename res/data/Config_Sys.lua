Config_Sys = {}
Config_Sys.serverId = 0;
Config_Sys.sokectAddress = "res.xh.gcsg.yileweb.com" 
Config_Sys.sokectPort = "13443" 
Config_Sys.chatAddress = "res.xh.gcsg.yileweb.com"
Config_Sys.chatPort = "14443"
-----------------------------
Config_Sys.shieldForCheck = 0;  -- 0不屏蔽功能 1 屏蔽功能(兑换码)
Config_Sys.showTerrain = false;--是否显示地形
Config_Sys.showPrint = 0;--是否显示Log:out的内容。0是不显示     1是仅显示     2不但显示还要写到sd卡
Config_Sys.printTime = 2;--是否在打印Log的时候显示打印时间（当showPrint是1的时候有效）。0不显示     1显示秒级别（lua方法）    2显示毫秒级别（c++方法）
Config_Sys.aStarForC = 1; --1是使用C++的Astar否则是LUA的
Config_Sys.enterGameInitDropData = 0;--是否在进入游戏前初始化掉落数据（为1时能优化性能，后续使用掉落数据时反应迅速）
Config_Sys.skipNewBie = 0--是否跳过所有新手（不包括升级新手引导） 0不跳过    1需要跳过
Config_Sys.skipNewBieLv = 0--是否跳过所有升级引导  0不跳过    1需要跳过
Config_Sys.showFps = 0;--是否显示帧频
Config_Sys.showLuaErrorMsg = 1;--LUA ERROR崩溃时是否弹出错误信息。1显示       0不显示
Config_Sys.forcePlatForm = ""--cc.PLATFORM_OS_ANDROID;--是否强制把平台改为某某。不需要请填""。例子：Config_Sys.forcePlatForm = cc.PLATFORM_OS_ANDROID
Config_Sys.serverListPath = "http://cont.gcsg.yileweb.com/api.php?"--"http://res.xh.gcsg.yileweb.com/resource/dwsg/serverList.txt"--"http://101.200.82.207/resource/dwsg/serverList.txt";-- "http://101.200.82.207/resource/dwsg/serverList.txt";--"http://101.200.82.207/resource/gcsg/serverList.txt";--此值若为""则socket的地址读此配置；否则根据远端服务器列表而定
Config_Sys.callBoardPath = "http://res.xh.gcsg.yileweb.com/resource/dwsg/notice.txt"  --公告的文档路径。若填""，则不显示公告。若填写了此路径，会在.txt前面加上_PACKAGE_PF的值��即最终变�����：notice_pf_yile.txt
Config_Sys.payRatio = 1; --支付比例(若serverListPath不为""，则后续会从服务器列表中，根据用户所选服来覆盖此值)
Config_Sys.VersionCodePath= "http://res.xh.gcsg.yileweb.com/resource/dwsg/Ios/version.manifest" ; --版本获取路径。不填写的话，则点开始按钮时不检测
Config_Sys.IDFAServerPath = "";--"http://s10001.360.gcsg.yileweb.com:8091/dwsgstatist/stat360/sendIdfa.jsp?";
Config_Sys.shieldForCharge = 1;--是否屏蔽充值相关功能    0不屏蔽   1屏蔽（充值、vip相关的按钮、界面、弹出框等），若配置了serverListPath，则会根据服务器列表的配置来决定是否屏蔽充值功能
Config_Sys.stat = 1;--0是维护中     1是正常（可以进）    2火爆（也能进）
Config_Sys.checkUpdate = 0;--是否检查版本更新    0不检查    1检查
return Config_Sys

