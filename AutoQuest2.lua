local addonName, addon = ...
local frame = CreateFrame("Frame", "QuestCompletionFrame", UIParent)
frame:SetSize(100, 100)
frame:SetPoint("CENTER")
frame:EnableMouse(true)
frame:SetMovable(true)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", frame.StopMovingOrSizing)

local text = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
text:SetPoint("CENTER")

local Quests_Completed = Quests_Completed or {}

local function QuestTurnedIn(...)
    local questID, xpReward, moneyReward = ...
    local isCompleted = C_QuestLog.IsQuestFlaggedCompleted(questID)   -- Returns true
    print("Quest: ", questID,"XP: ", xpReward,"Money: ", moneyReward,"Completed: ",isCompleted)
    Quests_Completed[questID].Completed = isCompleted
end

local function QuestAccepted(...)
    local questID = ...
    local questLogIndex = C_QuestLog.GetLogIndexForQuestID(questID)
    local info = { C_QuestLog.GetInfo(questLogIndex) }
    print("Accepted Quest: ", questID, info["title"])
    Quests_Completed[questID] = info
end

frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        self.elapsed = 0 -- Initialize elapsed time
        self:RegisterEvent("QUEST_TURNED_IN")
        self:RegisterEvent("QUEST_ACCEPTED")
    end
end)

frame:SetScript("OnUpdate", function(self, elapsed)
    self.elapsed = self.elapsed + elapsed
    if self.elapsed >= 1 then -- Check every 1 second
        local completedQuests = {}
        local questIDs = {70893, 71995}

        for _, questID in ipairs(questIDs) do
            local isCompleted = C_QuestLog.IsQuestFlaggedCompleted(questID)
            completedQuests[questID] = isCompleted
        end

        local localization = {
            ["enUS"] = {
                ["quest70893"] = "|cFFDEB887Community Feast:|r",
                ["quest71995"] = "|cFFDEB887Trial of the Elements:|r",
                ["yes"] = "|cFF1EFF00Complete|r",
                ["no"] = "|cFFDC143CIncomplete|r"
            },
            ["ruRU"] = {
                ["quest70893"] = "|cFFDEB887Большое Пиршество:|r",
                ["quest71995"] = "|cFFDEB887Испытание Стихии:|r",
                ["yes"] = "|cFF1EFF00Выполнено|r",
                ["no"] = "|cFFDC143CНе выполнено|r"
            }
        }

        local locale = GetLocale()
        local locStrings = localization[locale] or localization["enUS"]

        local questStatus = locStrings["quest70893"] .. " "
        if completedQuests[70893] then
            questStatus = questStatus .. locStrings["yes"]
        else
            questStatus = questStatus .. locStrings["no"]
        end

        questStatus = questStatus .. "\n" .. locStrings["quest71995"] .. " "
        if completedQuests[71995] then
            questStatus = questStatus .. locStrings["yes"]
        else
            questStatus = questStatus .. locStrings["no"]
        end

        text:SetText(questStatus)
        
        self.elapsed = 0 -- Reset elapsed time
    end
end)

frame:RegisterEvent("PLAYER_LOGIN")