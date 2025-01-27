-- valid_parentheses.lua

function isValid(s)
    local stack = {}
    local mapping = {[')'] = '(', [']'] = '[', ['}'] = '{'}

    for char in s:gmatch(".") do
        if mapping[char] then
            local topElement = table.remove(stack)
            if topElement ~= mapping[char] then
                return false
            end
        else
            table.insert(stack, char)
        end
    end

    return #stack == 0
end

-- Example usage
local s = "{[]}"
print("Is valid: " .. tostring(isValid(s))) 