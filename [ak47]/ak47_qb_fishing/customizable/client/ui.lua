Notify = function(msg, type, duration)
    lib.notify({
        type = type or 'info',
        description = msg,
        position = 'top',
        duration = duration
    })
end

ShowTextUI = function( text, options )
    lib.showTextUI(text, options)
end

HideTextUI = function( text, options )
    lib.hideTextUI()
end