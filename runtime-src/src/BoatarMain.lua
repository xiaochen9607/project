function VarToString(var, level)  
    local SPLIT_CHAR     = '\n';  
    local SPLIT_CHAR_WIN = '\r\n';  
    local SPLIT_TABLE = '    ';  
    local szRet = "";  
      
    if(level==nil) then level = 0; end;  
      
    local function Tabs(n)  
        local szTabs = '';  
        for i = 0,n do  szTabs = szTabs .. SPLIT_TABLE; end  
        return szTabs;  
    end  
      
    local szType = type(var);  
    if szType == "number" then  
        szRet = szRet .. var;  
    elseif szType == "boolean" then  
        szRet = szRet .. tostring(var);  
    elseif szType == "string" then  
        szRet = szRet .. string.format("%q", var);  
    elseif szType == "table" then  
        szRet = szRet .. "{" .. SPLIT_CHAR_WIN;  
        for k, v in pairs(var) do  
            local szKey = VarToString(k);  
            local szVal = VarToString(v);  
            if (szKey and szVal) then  
                szRet = szRet .. Tabs(level) .. "[" .. VarToString(k) .. "]=" .. VarToString(v, level+1) .. ',' .. SPLIT_CHAR_WIN;  
            end  
        end       
          
        local metatable = getmetatable(var);  
        if metatable ~= nil and type(metatable.__index) == "table" then  
            for k, v in pairs(metatable.__index) do  
                local szKey = VarToString(k);  
                local szVal = VarToString(v);  
                if (szKey and szVal) then  
                    szRet = szRet .. Tabs(level) .. "[" .. VarToString(k) .. "]=" .. VarToString(v, level+1) .. "," .. SPLIT_CHAR_WIN;  
                end  
            end  
        end  
          
        szRet = szRet .. Tabs(level-1) .. "}";  
          
        elseif szType == "function" then  
            szRet = szRet .. tostring(var);   
        elseif szType == "nil" then  
            return nil;  
        end  
      
    return szRet;  
end  


