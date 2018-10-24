if opToSprEx == "+" then
      r = aSpr + bSpr
    elseif opToSprEx == "-" then
      r = aSpr - bSpr
    elseif opToSprEx == "*" then
      r = aSpr*bSpr
    elseif opToSprEx == "/" then
      r = aSpr/bSpr
    else
      error("invalid operation")
    end