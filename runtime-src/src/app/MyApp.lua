require("config")
require("cocos.init")
require("framework.init")

--全局计时器
scheduler = require("framework.scheduler");
local MyApp = class("MyApp", cc.mvc.AppBase)

require("src.app.PF_CONF");

function MyApp:ctor()
    MyApp.super.ctor(self)
end
function MyApp:needClearCache()
    local writablePath = cc.FileUtils:getInstance():getWritablePath()
    local path = writablePath.."installVersion.txt";
    local tt = cc.FileUtils:getInstance():getValueMapFromFile(path)
    local installVersion = tt.version;

    local fileName = "version/version.manifest";
    local strCon = cc.FileUtils:getInstance():getStringFromFile(fileName)
    local _strJson = json.decode(strCon)
    local version =  _strJson.version;

    if cc.FileUtils:getInstance():isDirectoryExist(writablePath.."talks/") then
        cc.FileUtils:getInstance():removeDirectory(writablePath.."talks/");
    end


    if tt.version == nil then --没有缓存文件 写入
        if cc.FileUtils:getInstance():isDirectoryExist(writablePath.."new_version/" ) then
            cc.FileUtils:getInstance():removeDirectory(writablePath.."new_version/" );
        end
        --cc.FileUtils:getInstance():removeDirectory(writablePath.."new_version/src/" );
        tt = { version = _strJson.version }
        --win32、mac下不写installVersion文件
        if device.platform ~= "windows" and device.platform ~= cc.PLATFORM_OS_MAC then
            cc.FileUtils:getInstance():writeToFile(tt,path);
        end
        if cc.FileUtils:getInstance():isDirectoryExist(writablePath.."new_version/" ) then
            _G.cannotClearCache  = true
            return false;
        end
        return true
    end
    --如果是新装的包且缓存未删掉
    if installVersion ~= version then
        if cc.FileUtils:getInstance():isDirectoryExist(writablePath.."new_version/" ) then
            cc.FileUtils:getInstance():removeDirectory(writablePath.."new_version/" );
        end
       -- cc.FileUtils:getInstance():removeDirectory(writablePath.."new_version/src/" );
        tt = { version = _strJson.version }
        --win32、mac下不写installVersion文件
        if device.platform ~= "windows" and device.platform ~= cc.PLATFORM_OS_MAC then
            cc.FileUtils:getInstance():writeToFile(tt,path);
        end
        if cc.FileUtils:getInstance():isDirectoryExist(writablePath.."new_version/" ) then
            _G.cannotClearCache  = true
            return false;
        end
        return true
    end
end
function MyApp:run()

    --资源、lua搜索路径    
    local writablePath = cc.FileUtils:getInstance():getWritablePath()
    local storagePath = writablePath.."new_version" 
    local storagePathRes = writablePath.."new_version/res" 
    local storagePathSrc = writablePath.."new_version/src"
    cc.FileUtils:getInstance():addSearchPath(storagePath)
    cc.FileUtils:getInstance():addSearchPath(storagePathRes)
    cc.FileUtils:getInstance():addSearchPath(storagePathSrc)
    
    cc.FileUtils:getInstance():addSearchPath("res")
    cc.FileUtils:getInstance():addSearchPath("src")

    --文件读取优先指向new_version
    local searchPaths = cc.FileUtils:getInstance():getSearchPaths()
    local correctSearchPaths = {}
    correctSearchPaths[1] = cc.FileUtils:getInstance():getWritablePath().."new_version/" 
    for i = 1,#searchPaths do
        correctSearchPaths[i+1] = searchPaths[i];
    end
    cc.FileUtils:getInstance():setSearchPaths(correctSearchPaths)

    self:needClearCache();
    -- if not self:needClearCache() then --是否需要清除缓存 
    --     self:enterScene("MainScene");
    --     return
    -- end
    -- if device.platform == "ios" then --平台ios 发送IDFA

    --     require("app.utils.LuaCallOc")
    --     --------------------------------

    --     local lcoc = LuaCallOc:new()
    --     local ok ,idfa = lcoc:getIDFA()
    --     if ok then 

    --             print("idfa-----:",idfa) 
    --             -- self:sendIDFA(idfa);
    --             self:loadIDFA(idfa)
    --     end

    --     --------------------------------
       
    --  end 

 ----测试代码begin：跳过热更新直接进游戏------------------------------        
 --self:enterScene("MainScene")
  --if true then return end
 ----测试代码end--------------------------------------
  -- local shieldForCheck = require("data.Config_Sys").shieldForCheck
  --    if device.platform == "android" or  device.platform == "ios" and  shieldForCheck ~= 1  then
  --        print("进入更新------")
  --      self:checkUpdate(self  )
  --   else  
  --        print("直接进入游戏------")
  --        self:enterScene("MainScene")
  --     end
    
    -- local fileNameVersion = writablePath.."new_version/project.manifest"
    -- local strConVersion = cc.FileUtils:getInstance():getStringFromFile(fileNameVersion);
    -- if strConVersion ~= nil and strConVersion ~= "" then
    --     --正常进游戏
    --     self:enterScene("MainScene");
    -- else
    --     --new_version底下没有找到version.manifest，则在游戏包内找version.manifest
    --     local fileNameVersion = "src/version/version.manifest";
    --     local strConVersion = cc.FileUtils:getInstance():getStringFromFile(fileNameVersion);
    --     if strConVersion ~= nil and strConVersion ~= "" then
    --         local _strJson = json.decode(strConVersion)
    --         --小于1，证明是小包，则立即检查热更新
    --         if tonumber(_strJson.version) < 1 then
    --             self:checkUpdate(self  )
    --         else
    --             --正常进游戏
    --             self:enterScene("MainScene");
    --         end
    --     end
    -- end
    ---------------------------------------------------------------------
    --正常进游戏
    self:enterScene("MainScene");
end
function MyApp:checkUpdate( parent )
	 
    --Logger:out(" 进入更新检测>>>>>>> ")
    local UpdateManager = require("src.app.UpdateManager_new.lua"):create(parent)
    
    if cc.Director:getInstance():getRunningScene() then
            cc.Director:getInstance():replaceScene(UpdateManager)
    else
            cc.Director:getInstance():runWithScene(UpdateManager)
    end

end

function MyApp:loadIDFA(idfa)
  local function load(  )
    
    local xhr = cc.XMLHttpRequest:new()
    xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING; 
    if require("data.Config_Sys").IDFAServerPath == "" then
        --不发送
        return
    end
    local path = require("data.Config_Sys").IDFAServerPath--接收方的网址
    xhr:open("POST", path ,true);
    local function onReadyStateChange()
        if xhr.readyState == 4 and (xhr.status == 200) then
            print("发送成功 收到返回消息.."..xhr.response);
        else
            print("xhr.readyState is:", xhr.readyState, "xhr.status is: ",xhr.status)
             --不成功则重新发送，延迟20秒
            scheduler.performWithDelayGlobal(load,20)  
        end
    end
    print("idfa请求中：xhr.send...");
    xhr:registerScriptHandler(onReadyStateChange)
    xhr:send("idfa="..idfa.."&plat=3&step=1")
  end
  load()
end


return MyApp
