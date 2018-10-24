TYPOS_LUA_ERROR_CALLBACK = nil;--出错的回调
print("reloadLuaFiles >>>>>>>> ")
local TYPOSTimeInMem = package.loaded;
if TYPOSEnterAllLuaInMem ~= nil then
    if GameGlobal then
        GameGlobal:reset();
    end
    for key,var in pairs(TYPOSTimeInMem) do
        if TYPOSEnterAllLuaInMem[key] == nil then
            package.loaded[key] = nil
        end 
    end
else
    TYPOSEnterAllLuaInMem = {};
    for k,v in pairs(package.loaded) do
        TYPOSEnterAllLuaInMem[k] = 1;
    end    
    
end


