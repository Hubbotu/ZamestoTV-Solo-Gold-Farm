local myaddon = ...
local L = LibStub("AceLocale-3.0"):NewLocale(myaddon, "ruRU", false)

if not L then return end

-- Gold
L["Moltenbinder Disciple"] = "|cFFFFFFFFУченица Плавильщицы|r"
L["Moltenbinder Disciple Note"] = "|cFFDC143CЕЖЕДНЕВНО:|r С шансом 11% может выпасть игрушка |cFF0070DDШар из жидкой лавы|r"
L["Rohzor"] = "|cFFFFFFFFРозор Кузнекрушитель|r"
L["Rohzor Note"] = "|cFFDC143CЕЖЕДНЕВНО:|r Небольшой шанс получения рецепта |cFF1EFF00Чертеж: питомец Наковалик|r. Участвовать можно с 60+."
L["Alvin the Anvil"] = "|cFFFFFFFFГлавный кузнец Горек (Нелтарий)|r"
L["Alvin the Anvil Note"] = "|cFFDC143CПОСТОЯННО:|r Небольшой шанс получения рецепта |cFF1EFF00Чертеж: питомец Наковалик|r. Участвовать можно с 60+."
L["Misty Satchel"] = "|cFFFFFFFFОкутанный туманом сундук сокровищ|r"
L["Misty Satchel Note"] = "Содержит |cFF0070DDСумку туманов|r на 34 ячейки."
L["Cave Entrance"] = "|cFFFFFFFFВход в пещеру|r"
L["Cave Entrance Note"] = "Вход в пещеру ведущую к порталу."
L["Portal Forbidden Reach"] = "|cFFFFFFFFПортал в Запретный край|r"
L["Portal Forbidden Reach Note"] = "При наличии в сумке |cFF0070DDИнструментов Нелтариона|r."
L["Dinn"] = "|cFFFFFFFFДинн|r"
L["Dinn Note"] = "|cFFDC143CЕЖЕДНЕВНО:|r С шансом 7% может выпасть игрушка |cFF0070DDБарабан Динна|r"
L["Surveyor's Magnifying Glass"] = "|cFFFFFFFFУвеличительное стекло геодезиста|r"
L["Surveyor's Magnifying Glass Note"] = "Содержит |cFF1EFF00Лупа для левшей|r и |cFFFFFFFF323 золотых.|r"
L["Sandy Wooden Duck"] = "|cFFFFFFFFПесочная деревянная утка|r"
L["Sandy Wooden Duck Note"] = "Содержит |cFFFFFFFF450 золотых.|r"
L["Yennu's Map"] = "|cFFFFFFFFКарта Йенну|r"
L["Yennu's Map Note"] = "Заберите |cFF1EFF00Карта Йенну|r для сокровища |cFFFFFFFFПесочная деревянная утка.|r"
L["Snowclaw Cub"] = "|cFFFFFFFFИзначальный медвежонок|r"
L["Snowclaw Cub Note"] = "|cFFDC143CЕЖЕНЕДЕЛЬНО:|r Обменяйте х3 Ломоть мяса рогоплава и х1 Медовый батончик на питомца |cFF0070DDСнежнолапый медвежонок.|r"

-- TTW
L["Gold"] = "|cFFFFFFFFРольдира|r"
L["Gold Note"] = "Задание Ремесло на заказ, доступно с 70 уровня. На выбор несколько сумок с предметами для ремесел."
L["Gold 2"] = "|cFFFFFFFFМиддлс|r"
L["Gold 2 Note"] = "Обмен Странный кусок воска, на Огненный рубин. Огненный рубин меняется у Грызлса на мешки."
L["Gold 3"] = "|cFFFFFFFFКонцентрированная тень|r"
L["Gold 3 Note"] = "Данные сундуки появляющиеся только во время темновой фазы Беледара."
L["Gold 4"] = "|cFFFFFFFFТеатральная труппа|r"
L["Gold 4 Note"] = "|cFFDC143C(Только для 80 уровня)|r: |cFF0070DDЭскиз: узы связи|r падает с |cFF0070DDКлад театральной труппы|r, дается за еженедельное задание |cFFA335EEТеатральная труппа|r."

-- Waypoints
L["Create waypoint"] = "Создать путевую точку"
L["Create all waypoints"] = "Создать все путевые точки"
L["Hide node"] = "Скрыть точку"
L["Close"] = "Закрыть"

-- Options
L["Icon settings"] = "Настройки Значков"
L["These settings control the look of the icon."] = "Эти настройки управляют внешним видом значка."
L["Icon Scale"] = "Масштаб Значков"
L["The scale of the icons"] = "Масштаб Значков"
L["Icon Alpha"] = "Альфа Значок"
L["The alpha transparency of the icons"] = "Прозрачность значков"
L["World Map"] = "Карта Мира"
L["Show icons on world map"] = "Показать значки на карте мира"
L["Minimap"] = "Мини-карта"
L["Show icons on the minimap"] = "Показать значки на мини-карте"
L["What to display"] = "Что отображать"
L["Show Zamros"] = "Показать места фарма золота"
L["Show Zamros gold"] = "Показать точки активностей, с помощью которых можно зарабатывать золото"
L["Reset hidden nodes"] = "Сбросить скрытые точки"
L["Show all nodes that you manually hid by right-clicking on them and choosing \"hide\"."] = "Показать все точки, которые вы вручную скрыли, щелкнув по ним правой кнопкой мыши и выбрав \"скрыть\"."