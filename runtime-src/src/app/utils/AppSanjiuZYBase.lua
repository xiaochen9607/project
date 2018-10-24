AppSanjiuZYBase  = class("AppSanjiuZYBase ");
function AppSanjiuZYBase :ctor()
    self.itemID = -1
    self.rect = nil;
    self.className = "OrzOSDKViewController"
    self.needHuTong = false

    self.sdkAppId = ""
    self.sdkScrectKey = ""
    self.sdkDataEyeId = ""
    self.sdkTrackingIOId = ""
end

function AppSanjiuZYBase :initSdk()
    local function cb(ret)
        GameGlobal:returnToLogin();
    end

    local methodName = "init"
    local args = {
        listener = cb,
        appId = self.sdkAppId,
        screctKey = self.sdkScrectKey,
        dataEyeAppId = self.sdkDataEyeId,
        trackingIOId = self.sdkTrackingIOId
    }
    local luaoc = require "cocos.cocos2d.luaoc"
    local  ok,ret_ = luaoc.callStaticMethod(self.className, methodName, args)
    return ok,ret_
end

function AppSanjiuZYBase :login_do()
    local luaoc = require "cocos.cocos2d.luaoc"
    local methodName = "login"
    --登录成功回调
    local function cb(ret)
        local ret1,token = self:getToken()
        local ret2,userID = self:getUserID()
        GameGlobal.loginProxy:send_login(userID,token,nil,nil,self.needHuTong)
    end
    local args = {listener = cb}
    local  ok,ret_ = luaoc.callStaticMethod(self.className, methodName, args)
    return ok,ret_
end

function AppSanjiuZYBase :login(enableGameAccount, forceShowLogin)
    if forceShowLogin then
        local ret = self:login_do()
        Logger:out("ret----login---",ret)
        return
    end
    local ret1,token = self:getToken()
    local ret2,userID = self:getUserID()
    if ret1 and ret2 then
        Logger:out("ret1,token ------",ret1,token)
        Logger:out("ret2,userID ------",ret2,userID)
        if token and  token ~= "" and userID and  userID ~= "" then
            GameGlobal.loginProxy:send_login(userID,token,nil,nil,self.needHuTong);
        else
            local ret = self:login_do(false, "")
            Logger:out("ret----login---",ret)
        end
    end
end

function AppSanjiuZYBase :getToken()
    local methodName = "getToken"
    local args = {}
    local luaoc = require "cocos.cocos2d.luaoc"
    local  ok,ret_ = luaoc.callStaticMethod(self.className, methodName, args)
    return ok,ret_
end

function AppSanjiuZYBase :getUserID()
    local methodName = "getUserID"
    local args = {}
    local luaoc = require "cocos.cocos2d.luaoc"
    local  ok,ret_ = luaoc.callStaticMethod(self.className, methodName, args)
    return ok,ret_
end

function AppSanjiuZYBase :logout()
    local function cb(ret)
        GameGlobal:returnToLogin();
    end

    local methodName = "logout"
    local args = {listener = cb}
    local luaoc = require "cocos.cocos2d.luaoc"
    local  ok,ret_ = luaoc.callStaticMethod(self.className, methodName, args)
    return ok,ret_
end

function AppSanjiuZYBase :switchAccount()
    self:logout()
    self:login("", true)
end
---------------------------------

function AppSanjiuZYBase :checkLastTransaction(  )
    local  function checkCb(response)
        --删遮罩
        -- if self.rect then
        --     self.rect:removeFromParent();
        --     self.rect = nil
        -- end

        local needAiBei, param = GameGlobal.localPlayer:getPayType();
        -- needAiBei = true
        if needAiBei then
            print("AppSanjiuZYBase :checkLastTransaction>>>third zhi should not use appstore query")
            return
        end

        local arr = StringUtil:split(response,"_");
        local receipt = arr[1];
        local result = tonumber(arr[2]);
        local _orderId = arr[3] or ""

        if result == 1 then
            Logger:out("checkLastTransaction  buySuccess!--- ",receipt);
            GameGlobal.recharge:saveReceipt(-1, receipt, _orderId)

            GameGlobal.recharge:send_iosRecharge(-1,_orderId,receipt)
        else
            Logger:out("checkLastTransaction buy failed!");
        end
    end
    -- self:createPayRect()
    luaoc.callStaticMethod("appIapManager", "registerScriptHandler", {listener = checkCb})
    local ok, result = luaoc.callStaticMethod("appIapManager", "checkLastTransaction")
    Logger:out("checkLastTransaction  result", result, type(result))
    if result ~= 1 then
        self.rect = nil
    end
    return result
end

-------------------------------
function AppSanjiuZYBase :payAppStore(itemID,index,orderID)
    --itemID即proId
    --index在列表中的位置
    --orderID订单号
    Logger:out("AppSanjiuZYBase :payAppStore(----itemID,index---",itemID,index,orderID)

    local needAiBei, param = GameGlobal.localPlayer:getPayType();
    -- needAiBei = true
    if needAiBei then
        print("AppSanjiuZYBase:payAppStore>>>third zhi should not use this method")
        return
    end

    local  function buyCb(response)
    --删遮罩
        if self.rect then
            self.rect:removeFromParent();
            self.rect = nil
        end
        local arr = StringUtil:split(response,"_");
        local receipt = arr[1];
        local result = tonumber(arr[2]);
        local _orderId = arr[3] or ""

        if result == 1 then
            Logger:out(" buySuccess!--- ",receipt);
            GameGlobal.recharge:saveReceipt(self.itemID, receipt, orderID)

            GameGlobal.recharge:send_iosRecharge(itemID,orderID,receipt,nil)
        else
            Logger:out("buy failed!");
        end
    end

    local iosStr = self:getIosStr(self.itemID);
    local products = {
    proId = self.itemID,
    iosStr = iosStr,
    orderId = orderID
    }

    Logger:dump(self, products)
    luaoc.callStaticMethod("appIapManager", "registerScriptHandler", {listener = buyCb})
    luaoc.callStaticMethod("appIapManager", "buyProduct",products)

end

function AppSanjiuZYBase :createPayRect(  )
    Logger:out("加上遮罩，不可以再次点击")
    local function rectCb()
        Logger:out("点在了支付遮罩上！");
    end

    if self.rect == nil then
        self.rect = UIManager:createRect(cc.Director:getInstance():getRunningScene(), cc.rect(0,0,UIManager.ActualDesignSize.width*5, UIManager.ActualDesignSize.height*4),{fillColor=cc.c4f(10,10,10,200), borderColor=cc.c4f(0,0,0,0),borderWidth=1},rectCb,nil,nil,99999999);
        --在遮罩这个图上加一个转圈动画：
        local size = self.rect:getContentSize();
        local ani = require("app.sprite.BaseSprite"):create(100024);
        ani:init(nil, true);
        ani:setPosition(UIManager.ActualDesignSize.width * 0.5 + UIManager.rightShiftPx, UIManager.ActualDesignSize.height * 0.5);
        self.rect:addChild(ani);
    end
end

function AppSanjiuZYBase :pay(itemID,index)

    Logger:out("AppSanjiuZYBase :pay-----",itemID,index)
    Logger:out("PACKAGE_PF: "..PACKAGE_PF)
    Logger:out("NEW_PACKAGE_PF: "..NEW_PACKAGE_PF)
    Logger:out("OLD_PACKAGE_PF: "..OLD_PACKAGE_PF)

    if self.rect then
        Logger:out("已经有购买")
    return
    else
        self:createPayRect()
    end

    self.itemID = itemID
    local needAiBei, param = GameGlobal.localPlayer:getPayType();
    -- needAiBei = true
    if needAiBei then

        local function preparePay(param)
            self:sdkZhi(itemID, param)
        end

        --先向服务器发送订单请求
        GameGlobal.recharge:send_getOtherRechargeNeedInfo(itemID, preparePay);
    else
        local function funcback(args)

            --args的结构：
            -- args[1];--360的qId
            -- args[2];--订单号
            -- args[3];--支付回调地址
            -- args[4];--proId
            -- args[5];--该物品在列表中的位置
            local appOrderInfo = args
            local VirCurrencyAmount= GameGlobal.recharge:getRewardAfterPayByProID(tonumber(args[4]))
            GameGlobal.talkingDataManager:setPayInfo(args[2], Config_Recharge[args[4]].name, tonumber(Config_Recharge[args[4]].rmb),
            Config_GameData.sdkRelated.payType, VirCurrencyAmount, SdkManager.CurPayType)

            local ok,ret_ =  self:payAppStore(appOrderInfo[4],appOrderInfo[5],appOrderInfo[2]) --itemid,itemIndex
            Logger:out("-----ok,ret_ ----------",ok,ret_ )
        end
        --- 先向服务器发送订单请求
        GameGlobal.recharge:send_getBuyOrderRecharge(itemID,funcback,index)
    end
end

function AppSanjiuZYBase :getOrderID()
    local guid = ""
    local ALPHA_CHARS = "0123456789abcdef"
    local i = 0
    local j = 0
    for i = 0, 7 do
        local num = math.round(math.random()*15)
        guid = guid..string.sub(ALPHA_CHARS, num + 1, num + 1)
    end

    for i = 0, 2 do
        --guid = guid.."-";
        for j = 0, 3 do
            local num = math.round(math.random()*15)
            guid = guid..string.sub(ALPHA_CHARS, num + 1, num + 1)
        end
    end
    --guid = guid.."-";
    local time = GameGlobal:getServerTime()
    guid = guid..string.sub(("0000000"..string.format("%x", time)), -8, -1)
    for j = 0, 3 do
        local num = math.round(math.random()*15)
        guid = guid..string.sub(ALPHA_CHARS, num + 1, num + 1)
    end
    return guid;
end

function AppSanjiuZYBase :getIosStr(itemID)
    local tmp = StringUtil:split(OLD_PACKAGE_PF,"_");
    local iosStrArr = StringUtil:split(Config_Recharge[itemID].iosStr,".");--用.来拆这个形式：com.duwan.gcsg.ios.t1
    --在a1之前添加平台号
    table.insert(iosStrArr, #iosStrArr, tmp[2]);
    local result = table.concat(iosStrArr, ".");--变成这个样子：com.duwan.gcsg.ios.xxx.a1
    return result;
end

function AppSanjiuZYBase :sdkZhi(proId,param)
    local function closeRect()
        if self.rect then
            self.rect:removeFromParent();
            self.rect = nil
        end
    end
    scheduler.performWithDelayGlobal(closeRect,3)

    local cpOrderId = param[2];
    local cpCbUrl = param[3];

    local sys = 2;--写死ios平台
    -- local strOrder = PACKAGE_PF..","..sys..","..GameGlobal.loginProxy.latestServer..","..proId
    local strOrder = OLD_PACKAGE_PF..","..sys..","..GameGlobal.loginProxy.latestServer..",".. proId..","..cpOrderId..","..GameGlobal.loginProxy.platformAccount;
    local strOrder2 = NEW_PACKAGE_PF.."__"..OLD_PACKAGE_PF..","..sys..","..GameGlobal.loginProxy.latestServer..",".. proId..","..cpOrderId..","..GameGlobal.loginProxy.platformAccount;
    local extParam = strOrder;
    if self.needHuTong == true then
        extParam = strOrder2;
    end
    local iosStr = self:getIosStr(self.itemID);
    local function payCb(payResult)
        if self.rect then
            self.rect:removeFromParent();
            self.rect = nil
        end
        if payResult == "0" then
            GameGlobal.recharge:send_queryRecharge(tostring(cpOrderId),strOrder)
        end
    end
    local luaoc = require "cocos.cocos2d.luaoc"
    local methodName = "zhi"
    --param  2为沙盒  其他不是沙盒
    -- local needAiBei, box = GameGlobal.localPlayer:getPayType();
    local args = {
                productId = tostring(iosStr),
                cpOrder = tostring(param[2]),
                price = tostring(Config_Recharge[proId].rmb),
                desc = extParam,
                serverName = tostring(GameGlobal.loginProxy.latestServerName),
                serverId = tostring(GameGlobal.loginProxy.latestServer),
                roleName = tostring(GameGlobal.localPlayer.name),
                roleId = tostring(GameGlobal.localPlayer.playerUId),
                roleLevel = tostring(GameGlobal.localPlayer.level),
                goodsName = tostring(Config_Recharge[proId].name),
                goodsId = tostring(proId),
                cbUrl = tostring(cpCbUrl),
                listener = payCb
                }
    local  ok,ret_ = luaoc.callStaticMethod(self.className, methodName, args)
    return ok,ret_
end

-- isNew  0 是老号  1 是新号  2 是升级  3是取完名字
function AppSanjiuZYBase :setUserInfo(isNew)
    local methodName = "setUserInfo"
    local args = {
                sceneId = tostring(isNew),
                serverId = tostring(GameGlobal.loginProxy.latestServer),
                serverName = tostring(GameGlobal.loginProxy.latestServerName),
                roleId = tostring(GameGlobal.localPlayer.playerUId),
                roleName = tostring(GameGlobal.localPlayer.name),
                roleLevel = tostring(GameGlobal.localPlayer.level),
                roleTime = tostring(GameGlobal.loginProxy.registTime),
                vipLevel = tostring(GameGlobal.localPlayer.vipLv),
                balance = tostring(GameGlobal.localPlayer.silver),
                gold = tostring(GameGlobal.localPlayer.gold),
                power = tostring(GameGlobal.localPlayer:getHerosCombatPower(GameGlobal.localPlayer.heros))
                }
    local luaoc = require "cocos.cocos2d.luaoc"
    local ok,ret_ = luaoc.callStaticMethod(self.className, methodName, args)

    return ok,ret_
end

function AppSanjiuZYBase :enableSwitchAccountButton()
    return true;
end

--是否显示logo界面
function AppSanjiuZYBase :showLogo()
    return false;
end
return AppSanjiuZYBase 

