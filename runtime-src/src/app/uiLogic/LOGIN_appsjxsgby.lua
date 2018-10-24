local LOGIN_appsjxsgby = class("LOGIN_appsjxsgby", require("app.uiLogic.LOGIN"):new())

function LOGIN_appsjxsgby:ctor()

end
function LOGIN_appsjxsgby:create(view, param)
    local logic = LOGIN_appsjxsgby:new();
    logic.view = view;
    logic:init();
    
    return logic;
end

function LOGIN_appsjxsgby:initAni()

end

function LOGIN_appsjxsgby:layout(  )
    UIManager:alignRight(self.view, "switchAccount");    
    UIManager:alignLeft(self.view, "versionText"); 
end

return LOGIN_appsjxsgby
