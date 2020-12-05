---@param id string
---@return number
function fourCC(id)
    return FourCC(id)
end

---@alias rawcode integer|string

---@param id rawcode
---@return integer
function formatIntCC(id)
    if type(id) == 'integer' then
        return id
    elseif type(id) == 'string' then
        return fourCC(id)
    end
end

---@param id integer
---@return string
function getStringCC(id)
    return ('>I4'):pack(id)
end

---@param id rawcode
---@return string
function formatStringCC(id)
    if type(id) == 'string' then
        return id
    elseif type(id) == 'integer' then
        return getStringCC(id)
    end
end

---@class Rawcode
RawCode = newClass()
local class = RawCode

---@param id rawcode
---@return Rawcode
function class:new(id)
    self.id = formatIntCC(id)
    self.stringId = formatStringCC(id)
    return newObject(self)
end

---@param id Rawcode|rawcode
---@return integer
function class:formatInt(id)
    if instanceof(id, class) then
        return id.id
    else
        return formatIntCC(id)
    end
end

---@param stringId Rawcode|rawcode
---@return string
function class:formatString(stringId)
    if instanceof(stringId, class) then
        return stringId.stringId
    else
        return formatStringCC(stringId)
    end
end

---@param orderIdString string
---@return integer
function getOrderId(orderIdString)
    return OrderId(orderIdString)
end

---@param orderId integer
---@return string
function getOrder2StringId(orderId)
    return OrderId2String(orderId)
end

---@alias order rawcode

---@param orderId order
---@return integer
function formatIntOrder(orderId)
    if type(orderId)=='integer' then
        return orderId
    elseif type(orderId)=='string' then
        return getOrderId(orderId)
    end
end

---@param order order
---@return string
function formatStringOrder(order)
    if type(order)=='string' then
        return order
    elseif type(order)=='integer' then
        return getOrder2StringId(order)
    end
end

---@class Order
Order = newClass()
local class = Order

---@param id order
---@return Order
function class:new(id)
    self.id = formatIntOrder(id)
    self.stringId = formatStringOrder(id)
    return newObject(self)
end

---@param id order|Order
---@return integer
function class:formatInt(id)
    if instanceof(id, class) then
        return id.id
    else
        return formatIntOrder(id)
    end
end

---@param id order|Order
---@return string
function class:formatString(id)
    if instanceof(id, class) then
        return id.stringId
    else
        return formatStringOrder(id)
    end
end

-- Looks up the "name" field for any object (unit, item, ability)
---@param objectId integer
---@return string
function getObjectName(objectId)
    return GetObjectName(objectId)
end