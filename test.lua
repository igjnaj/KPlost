-- Placeid: 17625359962, Nothing changed, in 1v1? nothing, Begin 1v1? nothing just a private server lol

local repo = 'https://raw.githubusercontent.com/mstudio45/LinoriaLib/refs/heads/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local esp, esp_renderstep, framework = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostDuckyy/ESP-Library/refs/heads/main/nomercy.rip/source.lua"))();
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'KPlost | Rivals',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0
})
local Tabs = {
    Main = Window:AddTab('Main'),
    Misc = Window:AddTab('Misc'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local LeftGroupBoxMain = Tabs.Misc:AddLeftGroupbox('Gun')
LeftGroupBoxMain:AddLabel('HIGH RISK OF BAN! Use on an ALT!')
LeftGroupBoxMain:AddToggle('MyToggle', {
    Text = 'This is a toggle',
    Default = true, -- Default value (true / false)
    Tooltip = 'PlaceHolder Toggle', -- Information shown when you hover over the toggle

    Callback = function(Value)
        print('[cb] MyToggle changed to:', Value)
    end
})
--Toggles.MyToggle:OnChanged(function()
--    -- here we get our toggle object & then get its value
--    print('MyToggle changed to:', Toggles.MyToggle.Value)
--end)
--Toggles.MyToggle:SetValue(false)
local MyButton = LeftGroupBoxMain:AddButton({
    Text = 'Button',
    Func = function()
        print('You clicked a button!')
    end,
    DoubleClick = false,
    Tooltip = 'This is the main button'
})
local function toggleTableAttribute(attribute, value)
    for _, gcVal in pairs(getgc(true)) do
        if type(gcVal) == "table" and rawget(gcVal, attribute) then
            gcVal[attribute] = value
        end
    end
end
LeftGroupBoxMain:AddSlider('shootCoolDown', {
    Text = 'Shoot Cooldown',
    Default = 0,
    Min = 0,
    Max = 1,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        toggleTableAttribute("ShootCooldown", Value)
    end
})
LeftGroupBoxMain:AddSlider('shootRecoil', {
    Text = 'Shoot Recoil',
    Default = 0,
    Min = 0,
    Max = 1,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        toggleTableAttribute("ShootRecoil", Value)
    end
})
LeftGroupBoxMain:AddSlider('shootSpread', {
    Text = 'Shoot Spread',
    Default = 0,
    Min = 0,
    Max = 1,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        toggleTableAttribute("ShootSpread", Value)
    end
})
local RightGroupboxMisc = Tabs.Main:AddRightGroupbox('placeHolder');

local RightGroupboxMain = Tabs.Main:AddRightGroupbox('ESP and AIM');
RightGroupboxMain:AddToggle('MyToggle', {
    Text = 'Player ESP',
    Default = false, -- Default value (true / false)
    Tooltip = 'Player esp, that it', -- Information shown when you hover over the toggle

    Callback = function(Value)
        print(Value)
        local players = game.Players;
        for _, player in pairs(players:GetPlayers()) do
            if player == players.LocalPlayer then continue; end;
            esp:Player(player);
        end;
        players.PlayerAdded:Connect(function(player)
            esp:Player(player);
        end);
        players.PlayerAdded:Connect(function(player)
            local obj = esp:GetObject(player)
            if obj then
                obj:Destroy();
            end;
        end);

        esp.Settings.Enabled = Value;
        esp.Settings.Maximal_Distance = 500;
        esp.Settings.Object_Maximal_Distance = 500;

        esp.Settings.Box.Enabled = true;
        esp.Settings.Box_Outline.Enabled = true;

        esp.Settings.Name.Enabled = true;
        esp.Settings.Name.Position = "Bottom";
            end
})

-- Library functions
-- Sets the watermark visibility
Library:SetWatermarkVisibility(true)

-- Example of dynamically-updating watermark with common traits (fps and ping)
local FrameTimer = tick()
local FrameCounter = 0;
local FPS = 60;

local WatermarkConnection = game:GetService('RunService').RenderStepped:Connect(function()
    FrameCounter += 1;

    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter;
        FrameTimer = tick();
        FrameCounter = 0;
    end;

    Library:SetWatermark(('KPlost | %s fps | %s ms'):format(
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
    ));
end);

Library.KeybindFrame.Visible = true; -- todo: add a function for this

Library:OnUnload(function()
    WatermarkConnection:Disconnect()

    print('Unloaded!')
    Library.Unloaded = true
end)

-- UI Settings
local MenuGroup = Tabs['UI Settings']:AddLeftGroupBox('Menu')

-- I set NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
ThemeManager:SetFolder('KPlost')
SaveManager:SetFolder('KPlost/Rivals')
SaveManager:BuildConfigSection(Tabs['UI Settings'])
ThemeManager:ApplyToTab(Tabs['UI Settings'])
SaveManager:LoadAutoloadConfig()
