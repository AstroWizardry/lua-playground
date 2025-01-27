-- binary_tree.lua

-- Binary Tree Node
local Node = {}
Node.__index = Node

function Node:new(value)
    local node = {
        value = value,
        left = nil,
        right = nil
    }
    setmetatable(node, Node)
    return node
end

-- Binary Tree
local BinaryTree = {}
BinaryTree.__index = BinaryTree

function BinaryTree:new()
    local tree = {
        root = nil
    }
    setmetatable(tree, BinaryTree)
    return tree
end

function BinaryTree:insert(value)
    local newNode = Node:new(value)
    if not self.root then
        self.root = newNode
    else
        self:insertNode(self.root, newNode)
    end
end

function BinaryTree:insertNode(current, newNode)
    if newNode.value < current.value then
        if not current.left then
            current.left = newNode
        else
            self:insertNode(current.left, newNode)
        end
    else
        if not current.right then
            current.right = newNode
        else
            self:insertNode(current.right, newNode)
        end
    end
end

function BinaryTree:search(value)
    return self:searchNode(self.root, value)
end

function BinaryTree:searchNode(current, value)
    if not current then
        return false
    elseif current.value == value then
        return true
    elseif value < current.value then
        return self:searchNode(current.left, value)
    else
        return self:searchNode(current.right, value)
    end
end

function BinaryTree:inOrderTraversal(node, visit)
    if node then
        self:inOrderTraversal(node.left, visit)
        visit(node.value)
        self:inOrderTraversal(node.right, visit)
    end
end

-- Example usage
local tree = BinaryTree:new()
tree:insert(5)
tree:insert(3)
tree:insert(7)
tree:insert(2)
tree:insert(4)

print("In-order Traversal:")
tree:inOrderTraversal(tree.root, function(value) print(value) end)

local searchValue = 4
print("Searching for " .. searchValue .. ": " .. tostring(tree:search(searchValue))) 