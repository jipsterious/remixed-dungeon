---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by mike.
--- DateTime: 7/19/21 12:13 AM
---

local buff = require "scripts/lib/buff"
local RPD  = require "scripts/lib/commonClasses"

local phrases = {
    "EncumbranceBuff_CharAct_1",
    "EncumbranceBuff_CharAct_2",
    "EncumbranceBuff_CharAct_3",
    "EncumbranceBuff_CharAct_4",
    "EncumbranceBuff_CharAct_5"
}

return buff.init{

    icon = function(self, buff)
        return 50
    end,

    name = function(self, buff)
        return "EncumbranceBuff_Name"
    end,

    charAct = function(self,buff)
        if RPD.GameLoop:getDifficulty() >= 2 then
            return
        end

        if math.random() < 0.05 then
            local target = buff.target
            target:yell(RPD.format(RPD.oneOf(phrases), target:getBelongings():encumbranceCheck():name()))
        end
    end,

    attachTo = function(self, buff, target)
        target:yell(RPD.format(RPD.oneOf(phrases), target:getBelongings():encumbranceCheck():name()))
        return true
    end,

    info = function(self, buff)
        return  RPD.format(
                    "EncumbranceBuff_Info",
                    buff.target:
                    getBelongings():
                    encumbranceCheck():
                    name())
    end,

}