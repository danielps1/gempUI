local F, G, V = unpack(select(2, ...))

msButton = CreateFrame("Button", "button_gDamage", UIParent)
msButton:SetPoint("TOP", Minimap, "BOTTOM", -59, 1)
msButton:SetWidth(60)
msButton:SetHeight(25)
msButton:SetFrameStrata("BACKGROUND")
msButton:RegisterForClicks("LeftButtonDown")
msButton:SetScript("OnClick", function()
	gDMG_Toggle()
end)
F.addBackdrop(msButton)
F.createOverlay(msButton)


clockButton = CreateFrame("Button", "button_gAutomatorConfig", UIParent)
clockButton:SetPoint("TOP", Minimap, "BOTTOM", 0, 1)
clockButton:SetWidth(60)
clockButton:SetHeight(25)
clockButton:SetFrameStrata("BACKGROUND")
clockButton:RegisterForClicks("LeftButtonDown")
clockButton:SetScript("OnClick", function()
	if ( not IsAddOnLoaded("Blizzard_Calendar") ) then
		UIParentLoadAddOn("Blizzard_Calendar");
	end
	if ( Calendar_Toggle ) then
		Calendar_Toggle();
	end
end)
F.addBackdrop(clockButton)
F.createOverlay(clockButton)


fpsButton = CreateFrame("Button", "button_gWorldmarkers", UIParent)
fpsButton:SetPoint("TOP", Minimap, "BOTTOM", 59, 1)
fpsButton:SetWidth(60)
fpsButton:SetHeight(25)
fpsButton:SetFrameStrata("BACKGROUND")
fpsButton:RegisterForClicks("LeftButtonDown")
fpsButton:SetScript("OnClick", function()
	gWM_Toggle()
end)
F.addBackdrop(fpsButton)
F.createOverlay(fpsButton)
