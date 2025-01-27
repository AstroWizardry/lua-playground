-- tables.lua
-- This script demonstrates how to use tables in Lua.

local fruits = {"apple", "banana", "cherry"}

for index, value in ipairs(fruits) do
    print(index .. ": " .. value)
end 