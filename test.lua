-- Placeid: 17625359962, Nothing changed, in 1v1? nothing, Begin 1v1? nothing just a private server lol

local repo = 'https://raw.githubusercontent.com/mstudio45/LinoriaLib/refs/heads/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ESPLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Exunys-ESP/main/src/ESP.lua"))()
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
LeftGroupBoxMain:AddLabel('Client side!')
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
        getgenv().ExunysDeveloperESP = {
            DeveloperSettings = {
                Path = "Exunys Developer/Exunys ESP/Configuration.cfg",
                UnwrapOnCharacterAbsence = false,
                UpdateMode = "RenderStepped",
                TeamCheckOption = "TeamColor",
                RainbowSpeed = 1, -- Bigger = Slower
                WidthBoundary = 1.5 -- Smaller Value = Bigger Width
            },
        
            Settings = {
                Enabled = true,
                PartsOnly = false,
                TeamCheck = true,
                AliveCheck = true,
                LoadConfigOnLaunch = true,
                EnableTeamColors = false,
                TeamColor = Color3.fromRGB(170, 170, 255),
                StretchScreenResoultion = false,
                StretchAmount = 0.75
            },
        
            Properties = {
                ESP = {
                    Enabled = true,
                    RainbowColor = false,
                    RainbowOutlineColor = false,
                    Offset = 10,
        
                    Color = Color3.fromRGB(255, 255, 255),
                    Transparency = 1,
                    Size = 14,
                    Font = DrawingFonts.Plex, -- Direct2D Fonts: {UI, System, Plex, Monospace}; ROBLOX Fonts: {Roboto, Legacy, SourceSans, RobotoMono}
        
                    OutlineColor = Color3.fromRGB(0, 0, 0),
                    Outline = true,
        
                    DisplayDistance = true,
                    DisplayHealth = false,
                    DisplayName = false,
                    DisplayDisplayName = true,
                    DisplayTool = true
                },
        
                Tracer = {
                    Enabled = true,
                    RainbowColor = false,
                    RainbowOutlineColor = false,
                    Position = 1, -- 1 = Bottom; 2 = Center; 3 = Mouse
        
                    Transparency = 1,
                    Thickness = 1,
                    Color = Color3.fromRGB(255, 255, 255),
        
                    Outline = true,
                    OutlineColor = Color3.fromRGB(0, 0, 0)
                },
        
                HeadDot = {
                    Enabled = true,
                    RainbowColor = false,
                    RainbowOutlineColor = false,
        
                    Color = Color3.fromRGB(255, 255, 255),
                    Transparency = 1,
                    Thickness = 1,
                    NumSides = 30,
                    Filled = false,
        
                    OutlineColor = Color3.fromRGB(0, 0, 0),
                    Outline = true
                },
        
                Box = {
                    Enabled = true,
                    RainbowColor = false,
                    RainbowOutlineColor = false,
        
                    Color = Color3.fromRGB(255, 255, 255),
                    Transparency = 1,
                    Thickness = 1,
                    Filled = false,
        
                    OutlineColor = Color3.fromRGB(0, 0, 0),
                    Outline = true
                },
        
                HealthBar = {
                    Enabled = true,
                    RainbowOutlineColor = false,
                    Offset = 4,
                    Blue = 100,
                    Position = 3, -- 1 = Top; 2 = Bottom; 3 = Left; 4 = Right
        
                    Thickness = 1,
                    Transparency = 1,
        
                    OutlineColor = Color3.fromRGB(0, 0, 0),
                    Outline = true
                },
        
                Crosshair = {
                    Enabled = true,
                    RainbowColor = false,
                    RainbowOutlineColor = false,
                    TStyled = false,
                    Position = 1, -- 1 = Mouse; 2 = Center
        
                    Size = 12,
                    GapSize = 6,
                    Rotation = 0,
        
                    Rotate = false,
                    RotateClockwise = true,
                    RotationSpeed = 5,
        
                    PulseGap = false,
                    PulsingStep = 10,
                    PulsingSpeed = 5,
                    PulsingBounds = {4, 8}, -- {...}[1] => GapSize Min; {...}[2] => GapSize Max
        
                    Color = Color3.fromRGB(0, 255, 0),
                    Thickness = 1,
                    Transparency = 1,
        
                    OutlineColor = Color3.fromRGB(0, 0, 0),
                    Outline = true,
        
                    CenterDot = {
                        Enabled = true,
                        RainbowColor = false,
                        RainbowOutlineColor = false,
        
                        Radius = 2,
        
                        Color = Color3.fromRGB(0, 255, 0),
                        Transparency = 1,
                        Thickness = 1,
                        NumSides = 60,
                        Filled = false,
        
                        OutlineColor = Color3.fromRGB(0, 0, 0),
                        Outline = true
                    }
                }
            }
        }
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
