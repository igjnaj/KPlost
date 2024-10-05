-- super rivals hax!
-- recommend delta hax
print("KPlost | Loading...")
print("made with <3 by revmp")
local repo = 'https://raw.githubusercontent.com/mstudio45/LinoriaLib/refs/heads/main/'
local Library = game:HttpGet(repo .. 'Library.lua')
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
--function, i dunno why i add here lol. also this is skidded
local function toggleTableAttribute(attribute, value)
    for _, gcVal in pairs(getgc(true)) do
        if type(gcVal) == "table" and rawget(gcVal, attribute) then
            gcVal[attribute] = value
        end
    end
local Window = Library:CreateWindow({
    Title = 'KPlost | Rivals',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0,
})
local Tabs = {
    Main = Window:AddTab('Main'),
    Misc = Window:AddTab('Misc'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}
local mainrgroup = Tabs.Main:AddRightGroupBox('placeholder')
local mainlgroup = Tabs.Main:AddLeftGroupBox('Gun')
local mainldgroup = Tabs.Main:AddLeftGroupBox('ESP') --left down
mainrgroup:AddLabel('HIGH RISK OF BAN! USE ALT!')
mainrgroup:AddToggle('PlaceholderToggle', {
    Text = 'This is a toggle',
    Default = true,
    Tooltip = 'PlaceHolder Toggle',

    Callback = function(Value)
        print('[cb] MyToggle changed to:', Value)
    end
})
local MyButton = mainrgroup:AddButton({
    Text = 'Button',
    Func = function()
        print('You clicked a button!')
    end,
    DoubleClick = false,
    Tooltip = 'another place holder lol',
})
-- end of main RIGHt group, start main Left group
mainlgroup:AddSlider('shootCoolDown', {
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
mainlgroup:AddSlider('shootRecoil', {
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
mainlgroup:AddSlider('shootSpread', {
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
-- end of main LEFT group, start of main LEFT DOWN Group
RightGroupboxMain:AddToggle('PlayerESP', {
    Text = 'Player ESP',
    Default = false,
    Tooltip = 'Player esp, that it',

    Callback = function(Value)
        local Players = game:GetService("Players")
        if Value == true then
            Players.PlayerAdded:Connect(function(player)
                player.CharacterAdded:Connect(function(character)
                    local highlight = Instance.new('Highlight')
                    highlight.Parent = character
                    local head = character:WaitForChild("Head", 10)
                    if head then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Parent = head
                        billboard.Size = UDim2.new(0, 200, 0, 50)
                        billboard.StudsOffset = Vector3.new(0, 2, 0)
                        billboard.AlwaysOnTop = true
                        local textLabel = Instance.new("TextLabel")
                        textLabel.Parent = billboard
                        textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        textLabel.BackgroundTransparency = 1
                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                        textLabel.Font = Enum.Font.SourceSans
                        textLabel.Text = "100%" --placeholder
                        textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                        textLabel.TextSize = 60
                    else
                        warn("Head not found for player " .. player.Name)
                    end
                end)
                player.AncestryChanged:Connect(function(_, parent)
                    if not parent then
                        local character = player.Character or game.Workspace:FindFirstChild(player.Name)
                        if character then
                            local highlight = character:FindFirstChildOfClass("Highlight")
                            if highlight then
                                highlight:Destroy()
                            end
                            
                            local head = character:FindFirstChild("Head")
                            if head then
                                local billboard = head:FindFirstChildOfClass("BillboardGui")
                                if billboard then
                                    billboard:Destroy()
                                end
                            end
                        end
                    end
                end)
            end)
        else
            if highlight then
                highlight:Destroy()
            end
            if billboard then
                billboard:Destroy()
            end
        end

})
--end
Library:SetWatermarkVisibility(true)
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

Library.KeybindFrame.Visible = false;
Library:OnUnload(function()
    WatermarkConnection:Disconnect()

    print('Unloaded!')
    Library.Unloaded = true
end)
local MenuGroup = Tabs['UI Settings']:AddLeftGroupBox('Menu')
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })
MenuGroup:AddToggle('KeybindFrame', {
    Text = 'Toggle KeybindFrame',
    Default = true,
    Tooltip = 'Toggle a Keybind Frame to view keybinds',

    Callback = function(Value)
        Library.KeybindFrame.Visible = Value;
    end
})
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
