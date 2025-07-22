--[[ 
    NovaUtils.lua
    🔧 Utility functions for NovaModule
    Author: NovaInjector
    GitHub: https://github.com/NovaInjector/NovaModule
--]]

local NovaUtils = {}

-- Colorized console output
function NovaUtils:Log(msg)
    rconsoleprint("@@CYAN@@[Nova] >> @@WHITE@@" .. tostring(msg) .. "\n")
end

-- Safe call wrapper
function NovaUtils:SafeCall(callback)
    local success, result = pcall(callback)
    if not success then
        self:Log("Error: " .. result)
    end
    return result
end

-- Simple tween example (fake visual effect)
function NovaUtils:TweenPart(part)
    if typeof(part) ~= "Instance" or not part:IsA("BasePart") then
        return self:Log("Invalid part!")
    end

    local TweenService = game:GetService("TweenService")
    local goal = {Transparency = 0.5}
    local info = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(part, info, goal)
    tween:Play()
end

return NovaUtils
