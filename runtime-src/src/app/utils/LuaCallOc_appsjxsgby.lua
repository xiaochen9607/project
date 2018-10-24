LuaCallOc_appsjxsgby = class("LuaCallOc_appsjxsgby", function(self)
        local tar = require("app/utils/AppSanjiuZYBase"):new(); 
        return tar;
    end 
)

function LuaCallOc_appsjxsgby:ctor()
    self.className = "OrzOSDKViewController"
    self.needHuTong = true
end

function LuaCallOc_appsjxsgby:getIosStr(itemID)
    -- com.mengwan.lcsg.t3
    local iosStrArr = StringUtil:split(Config_Recharge[itemID].iosStr,".");--用.来拆这个形式：com.duwan.gcsg.ios.t1
    local result = "com.duwan.gcsg.ios.appdjsg."..iosStrArr[5];
    return result;
end

return LuaCallOc_appsjxsgby

