RubbyFilePathExt_LUA_ERROR_CALLBACK = nil;--出错的回调

RubbyFilePathExtToReturn = "/addSearchPath/try/test/ext"

local function getExtFilePath() 
    return RubbyFilePathExtToReturn
end

--添加搜索路径
local __fileUtils = cc.FileUtils:getInstance()

local writablePath = __fileUtils:getWritablePath()
local storagePath = writablePath.."new_version" 
local storagePathRes = writablePath.."new_version/res" 
local storagePathSrc = writablePath.."new_version/src"
__fileUtils:addSearchPath(storagePath)
__fileUtils:addSearchPath(storagePathRes)
__fileUtils:addSearchPath(storagePathSrc)

__fileUtils:addSearchPath(__fileUtils:getWritablePath())


