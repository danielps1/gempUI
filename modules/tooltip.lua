local F, G, V = unpack(select(2, ...))

GameTooltipHeaderText:SetFont(G.fonts.roboto, 14, "NONE")
GameTooltipText:SetFont(G.fonts.roboto, 12, "NONE")
Tooltip_Small:SetFont(G.fonts.roboto, 11, "NONE")

GameTooltip:SetBackdrop(nil)

GameTooltip.bg = CreateFrame("Frame", nil, GameTooltip)
GameTooltip.bg:SetAllPoints(true)
F.addBackdrop(GameTooltip.bg)
GameTooltip.bg:SetFrameLevel(0)

GameTooltipStatusBar:ClearAllPoints()
GameTooltipStatusBar:SetPoint("LEFT", 1, 0)
GameTooltipStatusBar:SetPoint("RIGHT", -1, 0)
GameTooltipStatusBar:SetPoint("BOTTOM", GameTooltipStatusBar:GetParent(), "TOP", 0, 0)
GameTooltipStatusBar:SetHeight(3)
GameTooltipStatusBar:SetStatusBarTexture("Interface\\AddOns\\gempUI\\textures\\flat.tga")

GameTooltipStatusBar.bg = GameTooltipStatusBar:CreateTexture(nil, "BACKGROUND", nil, -8)
GameTooltipStatusBar.bg:SetPoint("TOPLEFT", -1, 1)
GameTooltipStatusBar.bg:SetPoint("BOTTOMRIGHT", 1, -1)
GameTooltipStatusBar.bg:SetTexture(1, 1, 1)
GameTooltipStatusBar.bg:SetVertexColor(unpack(G.colors.border))


local function TooltipOnShow(self, ...)

	local itemName, itemLink = self:GetItem()
	if itemLink then
		local itemRarity = select(3, GetItemInfo(itemLink))
		if itemRarity then
			GameTooltip.bg:SetBackdropBorderColor(unpack({ GetItemQualityColor(itemRarity) }))
		end
	else
		GameTooltip.bg:SetBackdropBorderColor(unpack(G.colors.border))
	end
end

local tooltips = { GameTooltip, ItemRefTooltip, ShoppingTooltip1, ShoppingTooltip2, ShoppingTooltip3, WorldMapTooltip, }
for idx, tooltip in ipairs(tooltips) do

	tooltip:HookScript("OnShow", TooltipOnShow)
end
