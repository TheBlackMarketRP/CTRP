function Sup.ShowNotification(msg)
    exports['okokNotify']:Alert('Store Robbery', msg, 1500, 'error')
end

function Sup.AdvencedNotification(title, subtitle, msg, img1, img2)
    ---custom your advanced notify
    exports['okokNotify']:Alert(title, msg, 1500, 'error')
end


function Sup.ShowHelpNotification(msg)
    ---custom your advanced notify
    exports['okokNotify']:Alert('Store Robbery', msg, 1500, 'error')
end
