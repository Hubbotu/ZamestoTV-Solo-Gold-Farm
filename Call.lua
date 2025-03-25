local ADDON, SoloGold_Calendar = ...

-- 1 START DAYS
local soloGoldDays = {
    "2025-04-06",
    "2025-05-04",
    "2025-06-01",
    "2025-07-06",
    "2025-08-03",
    "2025-09-07",
    "2025-10-05",
    "2025-11-02",
    "2025-12-07",
}

-- 1 END DAYS
local soloGoldDaysEnds = {
    "2025-04-13",
    "2025-05-11",
    "2025-06-08",
    "2025-07-13",
    "2025-08-10",
    "2025-09-14",
    "2025-10-12",
    "2025-11-09",
    "2025-12-14",
}

-- 2 START DAYS
local superSoloGoldDays = {
    "2025-05-07",
}

-- 2 END DAYS
local superSoloGoldDaysEnds = {
    "2025-05-14",
}

-- 3 START DAYS
local GoldBonusDays = {
    "2025-06-21",
}

-- 3 END DAYS
local GoldBonusDaysEnds = {
    "2025-07-06",
}

-- FUNCTION TO CONVERT DATE STRINGS TO TIMESTAMPS
local function ConvertDateStringsToTimestamps(dateList)
    local timestampList = {}
    for _, dateStr in ipairs(dateList) do
        local year, month, day = strsplit("-", dateStr)
        year, month, day = tonumber(year), tonumber(month), tonumber(day)
        local timestamp = time({year = year, month = month, day = day})
        table.insert(timestampList, {timestamp = timestamp, dateStr = dateStr})
    end
    return timestampList
end

-- CACHED TIMESTAMPS
local soloGoldDaysTimestamps = ConvertDateStringsToTimestamps(soloGoldDays)
local soloGoldDaysEndsTimestamps = ConvertDateStringsToTimestamps(soloGoldDaysEnds)
local superSoloGoldDaysTimestamps = ConvertDateStringsToTimestamps(superSoloGoldDays)
local superSoloGoldDaysEndsTimestamps = ConvertDateStringsToTimestamps(superSoloGoldDaysEnds)
local GoldBonusDaysTimestamps = ConvertDateStringsToTimestamps(GoldBonusDays)
local GoldBonusDaysEndsTimestamps = ConvertDateStringsToTimestamps(GoldBonusDaysEnds)

-- FUNCTION TO FORMAT DATE STRING
local function FormatDateString(dateStr)
    local year, month, day = strsplit("-", dateStr)
    local formattedDate = date("%B %d, %Y", time({year = tonumber(year), month = tonumber(month), day = tonumber(day)}))
    return formattedDate
end

-- FUNCTION TO DISPLAY EVENT TIMES INCLUDING DAYS REMAINING IF EVENT HAS STARTED
function SoloGold_Calendar:GetNextEventInfo(startTimestampsList, endTimestampsList)
    local currentTime = GetServerTime()

    for i, startInfo in ipairs(startTimestampsList) do
        local endInfo = endTimestampsList[i]

        -- CHECK IF EVENT HAS STARTED AND IS ONGOING
        if currentTime >= startInfo.timestamp and currentTime <= endInfo.timestamp then
            local secondsRemaining = difftime(endInfo.timestamp, currentTime)
            local daysRemaining = math.ceil(secondsRemaining / (60 * 60 * 24))
            return "More (" .. daysRemaining .. ")", FormatDateString(startInfo.dateStr), FormatDateString(endInfo.dateStr)
        end

        -- IF THE EVENT IS IN THE FUTURE, CALCULATE DAYS UNTIL NEXT EVENT
        if startInfo.timestamp > currentTime then
            local secondsUntilNext = difftime(startInfo.timestamp, currentTime)
            local daysUntilNext = math.ceil(secondsUntilNext / (60 * 60 * 24))
            return daysUntilNext, FormatDateString(startInfo.dateStr), FormatDateString(endInfo.dateStr)
        end
    end

    return "No Upcoming Dates!", "", ""
end

-- FUNCTION TO CREATE CALENDAR WINDOW
function SoloGold_Calendar:ShowCalendarWindow()
    if self.calendarWindow and self.calendarWindow:IsShown() then
        return
    end

    if CalendarViewHolidayFrame and CalendarViewHolidayFrame:IsShown() then
        CalendarViewHolidayFrame:Hide()
    end

    local window = CreateFrame("Frame", nil, UIParent, "BasicFrameTemplateWithInset")
    window:SetSize(310, 308)
    window:SetPoint("TOPRIGHT", CalendarFrame, "TOPRIGHT", 316, -30)
    
    if window.TitleText then
        window.TitleText:SetText("Solo Gold / Calendar")
    end

    local dayOfWeek = date("%A")
    local fullDate = date("%B %d, %Y")
    local soloGoldStatus, nextSoloGoldStartDate, nextSoloGoldEndDate = self:GetNextEventInfo(soloGoldDaysTimestamps, soloGoldDaysEndsTimestamps)
    local superSoloGoldStatus, nextSuperSoloGoldStartDate, nextSuperSoloGoldEndDate = self:GetNextEventInfo(superSoloGoldDaysTimestamps, superSoloGoldDaysEndsTimestamps)
    local petBonusStatus, nextPetBonusStartDate, nextPetBonusEndDate = self:GetNextEventInfo(GoldBonusDaysTimestamps, GoldBonusDaysEndsTimestamps)

    -- ADD CURRENT DAY AND DATE
    local dayLabel = window:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    dayLabel:SetPoint("TOP", window, "TOP", 0, -40)
    dayLabel:SetText("|cff00ff00" .. dayOfWeek .. "|r")

    local dateLabel = window:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    dateLabel:SetPoint("TOP", dayLabel, "BOTTOM", 0, -10)
    dateLabel:SetText("|cff00ff00" .. fullDate .. "|r")

    -- ADD SOLOGOLD DAY LABEL
    local soloGoldLabel = window:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    soloGoldLabel:SetPoint("TOP", dateLabel, "BOTTOM", 0, -50)

    if string.find(soloGoldStatus, "Ongoing") then
        soloGoldLabel:SetText("Darkmoon Faire: |cff00ff00" .. soloGoldStatus .. "|r")
    elseif soloGoldStatus == "No Upcoming Dates!" then
        soloGoldLabel:SetText("Darkmoon Faire: |cff00ff00" .. soloGoldStatus .. "|r")
    else
        soloGoldLabel:SetText("Darkmoon Faire: |cff00ff00" .. soloGoldStatus .. " Days Left|r")
    end

    local soloGoldDateLabel = window:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    soloGoldDateLabel:SetPoint("TOP", soloGoldLabel, "BOTTOM", 0, -5)
    soloGoldDateLabel:SetText("Start: " .. nextSoloGoldStartDate .. "\nEnd: " .. nextSoloGoldEndDate)

    -- ADD SUPER SOLOGOLD DAY LABEL
    local superSoloGoldLabel = window:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    superSoloGoldLabel:SetPoint("TOP", soloGoldDateLabel, "BOTTOM", 0, -20)

    if string.find(superSoloGoldStatus, "Ongoing") then
        superSoloGoldLabel:SetText("Delves Bonus Event: |cff00ff00" .. superSoloGoldStatus .. "|r")
    elseif superSoloGoldStatus == "No Upcoming Dates!" then
        superSoloGoldLabel:SetText("Delves Bonus Event: |cff00ff00" .. superSoloGoldStatus .. "|r")
    else
        superSoloGoldLabel:SetText("Delves Bonus Event: |cff00ff00" .. superSoloGoldStatus .. " Days Left|r")
    end

    local superSoloGoldDateLabel = window:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    superSoloGoldDateLabel:SetPoint("TOP", superSoloGoldLabel, "BOTTOM", 0, -5)
    superSoloGoldDateLabel:SetText("Start: " .. nextSuperSoloGoldStartDate .. "\nEnd: " .. nextSuperSoloGoldEndDate)

    -- ADD PET BATTLE BONUS DAY LABEL
    local petBonusLabel = window:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    petBonusLabel:SetPoint("TOP", superSoloGoldDateLabel, "BOTTOM", 0, -20)

    if string.find(petBonusStatus, "Ongoing") then
        petBonusLabel:SetText("Midsummer Fire Festival: |cff00ff00" .. petBonusStatus .. "|r")
    elseif petBonusStatus == "No Upcoming Dates!" then
        petBonusLabel:SetText("Midsummer Fire Festival: |cff00ff00" .. petBonusStatus .. "|r")
    else
        petBonusLabel:SetText("Midsummer Fire Festival: |cff00ff00" .. petBonusStatus .. " Days Left|r")
    end

    local petBonusDateLabel = window:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    petBonusDateLabel:SetPoint("TOP", petBonusLabel, "BOTTOM", 0, -5)
    petBonusDateLabel:SetText("Start: " .. nextPetBonusStartDate .. "\nEnd: " .. nextPetBonusEndDate)

    CalendarFrame:HookScript("OnHide", function()
        window:Hide()
    end)

    window:Show()
    self.calendarWindow = window
end

-- FUNCTION TO CREATE A TAB
function SoloGold_Calendar:CreateCalendarTab()
    local tab = CreateFrame("Button", "SoloGoldCalendarTab", CalendarFrame)
    tab:SetSize(90, 90)
    tab:SetPoint("BOTTOMRIGHT", CalendarFrame, "BOTTOMRIGHT", 90, -20)

    tab.icon = tab:CreateTexture(nil, "ARTWORK")
    tab.icon:SetTexture("Interface\\Spellbook\\spellbook-skilllinetab")
    tab.icon:SetAllPoints()

    tab:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)

    tab:SetScript("OnClick", function(self)
        SoloGold_Calendar:ShowCalendarWindow(self)
    end)

    local button = CreateFrame("Button", "SoloGoldCalendarButton", tab)
    button:SetSize(48, 48)
    button:SetPoint("CENTER", tab, "CENTER", -18, 6)

    button.icon = button:CreateTexture(nil, "ARTWORK")
    button.icon:SetTexture("Interface\\Icons\\inv_misc_herb_goldclover")
    button.icon:SetAllPoints()

    local highlight = button:CreateTexture(nil, "HIGHLIGHT")
    highlight:SetTexture("Interface\\Buttons\\UI-Common-MouseHilight")
    highlight:SetBlendMode("ADD")
    highlight:SetAllPoints(button)

    button:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("Solo Gold Calendar", 1, 1, 1, 1, true)
        GameTooltip:Show()
    end)

    button:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)

    button:SetScript("OnClick", function(self)
        if CalendarViewHolidayFrame and CalendarViewHolidayFrame:IsShown() then
            CalendarViewHolidayFrame:Hide()
            SoloGold_Calendar:ShowCalendarWindow(self)
        else
            if SoloGold_Calendar.calendarWindow and SoloGold_Calendar.calendarWindow:IsShown() then
                SoloGold_Calendar.calendarWindow:Hide()
            else
                SoloGold_Calendar:ShowCalendarWindow(self)
            end
        end
    end)
end

-- REGISTER EVENT FOR CALENDAR FRAME LOADING
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:SetScript("OnEvent", function(self, event, addonName)
    if addonName == "Blizzard_Calendar" then
        SoloGold_Calendar:CreateCalendarTab()
    end
end)