local frame = CreateFrame("FRAME", "CoordekamesFrame")
frame:RegisterEvent("PLAYER_LOGIN")

local function eventHandler(self, event, ...)
    if event == "PLAYER_LOGIN" then
        local coordsFrame = CreateFrame("FRAME", "CoordekamesCoordsFrame", UIParent)
        coordsFrame:SetWidth(200)
        coordsFrame:SetHeight(20)
        coordsFrame:SetPoint("TOP", 0, -20)

        local coordsText = coordsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        coordsText:SetPoint("CENTER", 0, 0)

        coordsFrame:SetScript("OnUpdate", function()
            local playerName = UnitName("player")
            local uiMapID = C_Map.GetBestMapForUnit("player")
            if uiMapID then
                local mapInfo = C_Map.GetMapInfo(uiMapID)
                if mapInfo then
                    local x, y = C_Map.GetPlayerMapPosition(uiMapID, "player"):GetXY()
                    local zoneName = mapInfo.name
                    coordsText:SetText(format("Joder %s estas en %.2f, %.2f (%s) . Ven a chuparme el pito", playerName, x * 100, y * 100, zoneName))
                    return
                end
            end
            coordsText:SetText(format("[%s] estás en ª", playerName))
        end)
    end
end

frame:SetScript("OnEvent", eventHandler)
