local addonName, addon = ...
local llRI = nil
local npcToWatch = 205089
 
local function OnEvent(self,event,...)
   if event == "PLAYER_TARGET_CHANGED" then
 
      local guid = UnitGUID("target")
      if guid == nil then return end
 
      local guidType, _, _, _, _, npc_id, _ = strsplit("-",guid)
      if guidType == "Creature" and tonumber(npc_id) == npcToWatch then      
         if GetRaidTargetIndex("target") == nil then 
            if llRI == nil then 
               llRI = 0 
            end 
            llRI = (llRI % 8) + 1 
            if GetRaidTargetIndex("target") ~= llRI then 
               SetRaidTarget("target", llRI) 
               PlaySound(SOUNDKIT.GM_CHAT_WARNING) 
            end
         end
      end
   end
end
 
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_TARGET_CHANGED")
f:SetScript("OnEvent",OnEvent)