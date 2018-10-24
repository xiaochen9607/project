--[[ 以初始索引在"statetab"中随机取值，
     不断的以新的值与旧的索引值组合成为新的索引，再次在"statetab"中随机取值，
     循环往复，打印出找打的值。]]
local w1 = TYPOSYYWORD; w2 = TYPOSNNWORD    -- 重新初始化索引值为默认的索引值。
for i = 1, TYPOSMAXGEN do    -- 最大结果数量为"MAXGEN"个。
    local list = statetab[prefix(w1, w2)]
    -- 产生随机数种子。
    math.randomseed(tonumber(tostring(os.time()):reverse():sub(1, 6)))
    --[[ 从"list"中随机选择一个元素，
         比如[more we] = {"try", "do", }对应"try"和"do"两个元素，随机选择一个。]]
    local r = math.random(#list)    -- 生成随机数。
    local nextword = list[r]
    if nextword == TYPOSNNWORD then    -- 如果到了默认的索引值，就不再找了。
        break
    end
    io.write(nextword, " ")
    w1 = w2; w2 = nextword    -- 不断的以新的值与旧的索引值组合成为新的索引。
end