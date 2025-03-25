local addonName, addon = ...
local L, MyRegion
local RegionTimes = {
    EU = {
        startTime = 1710482400,
        totalDuration = 18000, -- complete session time 5 hours repeating
        A = { -- sub-session -- event runs 3 times
            duration = 7200, -- 2 hours
            interval = 3600, -- runs every 2 hours
            eventtime = 600, -- 10 minutes runtime
        },
        B = { -- sub-session -- just waiting.
            duration = 10200, -- 3 hours 50 minutes
        },
    },
    NA = {
        startTime = 1714323600, -- NA start time
        totalDuration = 18000, -- NA total duration
        A = {
            duration = 7200,
            interval = 3600,
            eventtime = 600,
        },
        B = {
            duration = 10200,
        },
    },
}

local Localizations = {
    enUS = {
        Waiting = "|cFFDEB887Trial of the Elements:%s\nbefore the start: %s%s|r",
        Running = "|cFF35BE21Trial of the Elements:%s\n%s%s until completion|r",
    },
    ruRU = {
        Waiting = "|cFFDEB887Испытание Стихий:%s\nдо начала: %s%s|r",
        Running = "|cFF35BE21Испытание Стихий:%s\n%s%s до завершения|r",
    },
}

local defaults = {
    useColor = true,
    useSound = true,
    alert1 = 600, -- Alarm 1 set to 10 minutes before event
    alert1Color = "|cffffff00", -- Yellow
    alert2 = 300, -- Alarm 2 set to 5 minutes before event
    alert2Color = "|cffff0000", -- Red
    soundKit = 32585, -- Alarm sound
}

local function CalcTime(starttime, servertime, duration, interval)
    local timeToEvent = (starttime - servertime) % interval
    local inEvent, timeToRun
    if timeToEvent > (interval - duration) then -- Is there between 1:15 and 1:30 to go? If so, we're in the event
        inEvent = true
        timeToRun = duration - (interval - timeToEvent)
    else -- Otherwise, set the timer to time to the next event
        inEvent = false
        timeToRun = timeToEvent
    end
    return inEvent, timeToRun
end

local function printTime(self)
    local serverTime = GetServerTime()
    local remainingTime = (MyRegion.startTime - serverTime) % MyRegion.totalDuration
    local longWait = ""
    local inEvent
    if remainingTime > MyRegion.B.duration then
        inEvent, remainingTime = CalcTime(MyRegion.startTime, serverTime, MyRegion.A.eventtime, MyRegion.A.interval)
    else
        longWait = "|cffffff00|r"
    end
    local hideSeconds = remainingTime >= 120
    local msg = L.Waiting
    local msgColor = "|cffffffff"
    if inEvent then
        msg = L.Running
    else
        if defaults.useColor and remainingTime <= defaults.alert2 then
            msgColor = defaults.alert2Color
        elseif remainingTime <= defaults.alert1 then
            if defaults.useSound and not self.Alerted then
                self.Alerted = true
                PlaySound(defaults.soundKit, "Master")
            end
            if defaults.useColor then
                msgColor = defaults.alert1Color
            end
        end
    end
    self.Text:SetText(format(msg, longWait, msgColor, SecondsToTime(remainingTime, false)))
end

local Backdrop = {
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 16,
    insets = {
        left = 5,
        right = 5,
        top = 5,
        bottom = 5,
    },
}

local frame_x = 100
local frame_y = -250
local f = CreateFrame("Button", "ZAMTimer777", UIParent, "BackdropTemplate")
f:SetWidth(185)
f:SetHeight(30)
f:SetPoint("CENTER")
f:SetBackdrop(Backdrop)
f:SetClampedToScreen(true)
f:EnableMouse(true)
f:SetMovable(true)
f:SetUserPlaced(true)
f:RegisterForDrag("LeftButton")
f:RegisterForClicks("AnyUp")
f.Text = f:CreateFontString(nil, "OVERLAY", "GameTooltipText")
f.Text:SetPoint("CENTER")
f.Elapsed = 0
f:SetScript("OnDragStart", function(self)
    self:StartMoving()
end)
f:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
end)
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self)
    local locale = GetLocale()
    L = Localizations[locale] or Localizations.enUS
    local currentRegion = GetCVar("portal")
    if currentRegion == "EU" then
        MyRegion = RegionTimes.EU
    else
        MyRegion = RegionTimes.NA
    end
    self:SetScript("OnUpdate", function(self, elapsed)
        self.Elapsed = self.Elapsed - elapsed
        if self.Elapsed > 0 then
            return
        end
        self.Elapsed = 1
        printTime(self)
    end)
end)

SLASH_ZAM1 = "/zam"
SlashCmdList["ZAM"] = function(msg)
    if strupper(strtrim(msg)) == "HD" then
        ZAMTimer777:SetShown(not ZAMTimer777:IsShown())
        return
    end
    updateData()
    updateList()
    ZAMTimer777:Show()
end
