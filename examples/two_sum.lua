-- two_sum.lua

function twoSum(nums, target)
    local numMap = {}
    for i, num in ipairs(nums) do
        local complement = target - num
        if numMap[complement] then
            return {numMap[complement], i}
        end
        numMap[num] = i
    end
    return nil -- Return nil if no solution is found
end

-- Example usage
local nums = {2, 7, 11, 15}
local target = 9
local result = twoSum(nums, target)
if result then
    print("Indices: " .. result[1] .. ", " .. result[2])
else
    print("No two sum solution found.")
end 