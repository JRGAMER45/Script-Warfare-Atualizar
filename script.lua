local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Oil Warfare Tycoon Gui 1.0", "Synapse")

--Owner
local Owner = Window:NewTab("Creditos")
local Section = Owner:NewSection("Script Criado Por Thakin")
local Section = Owner:NewSection("discord.gg/u731")
local Section = Owner:NewSection("O script sera atualizado em breve!!")

--Main
local Main = Window:NewTab("Home")
local Section = Main:NewSection("Main")

Section:NewButton("HitBox Extender", "Discord:Thakin#0001", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RectangularObject/boblox/main/Other/Universal%20Hitbox%20Extender.lua", true))()
end)

--ESP
Section:NewButton("ESP", "Discord:Thakin#0001", function()
    ESPEnabled = true
ESPLength  = 1000000

local plr = game:GetService("Players").LocalPlayer
local char = plr.Character
local root = char.HumanoidRootPart
local Plrs = game:GetService("Players")
local MyPlr = Plrs.LocalPlayer
local MyChar = MyPlr.Character
local CoreGui = game:GetService("CoreGui")
local Run = game:GetService("RunService")

CharAddedEvent = { }

Plrs.PlayerAdded:connect(function(plr)
   if CharAddedEvent[plr.Name] == nil then
       CharAddedEvent[plr.Name] = plr.CharacterAdded:connect(function(char)
           if ESPEnabled then
               RemoveESP(plr)
               CreateESP(plr)
           end
       end)
   end
end)

Plrs.PlayerRemoving:connect(function(plr)
   if CharAddedEvent[plr.Name] ~= nil then
       CharAddedEvent[plr.Name]:Disconnect()
       CharAddedEvent[plr.Name] = nil
   end
   RemoveESP(plr)
end)

function UpdateESP(plr)
   local Find = CoreGui:FindFirstChild("ESP_" .. plr.Name)
Find.Frame.Names.TextColor3 = Color3.new(0.8, 0.8, 0)
Find.Frame.Names.TextColor3 = Color3.new(1, 1, 1)
Find.Frame.Dist.TextColor3  = Color3.new(1, 1, 1)
local GetChar               = plr.Character
       if MyChar and GetChar then
           local Find2 = MyChar:FindFirstChild("HumanoidRootPart")
           local Find3 = GetChar:FindFirstChild("HumanoidRootPart")
           local Find4 = GetChar:FindFirstChildOfClass("Humanoid")
           if Find2 and Find3 then
               local pos = Find3.Position
               local Dist = (Find2.Position - pos).magnitude
               if Dist > ESPLength then
                   Find.Frame.Names.Visible = false
                   Find.Frame.Dist.Visible = false
                   return
               else
                   Find.Frame.Names.Visible = true
                   Find.Frame.Dist.Visible = true
               end
               Find.Frame.Dist.Text = "Distance: " .. string.format("%.0f", Dist)  
       end
   end
end

function RemoveESP(plr)
   local ESP = CoreGui:FindFirstChild("ESP_" .. plr.Name)
   if ESP then
       ESP:Destroy()
   end
end

function CreateESP(plr)
   if plr ~= nil then
       local GetChar = plr.Character
       if not GetChar then return end
       local GetHead do
           repeat wait() until GetChar:FindFirstChild("Head")
       end
       GetHead = GetChar.Head
       
       local bb = Instance.new("BillboardGui", CoreGui)
       bb.Adornee = GetHead
       bb.ExtentsOffset = Vector3.new(0, 1, 0)
       bb.AlwaysOnTop = true
       bb.Size = UDim2.new(0, 5, 0, 5)
       bb.StudsOffset = Vector3.new(0, 3, 0)
       bb.Name = "ESP_" .. plr.Name
       
       local frame = Instance.new("Frame", bb)
       frame.ZIndex = 10
       frame.BackgroundTransparency = 1
       frame.Size = UDim2.new(1, 0, 1, 0)
       
       local TxtName = Instance.new("TextLabel", frame)
       TxtName.Name = "Names"
       TxtName.ZIndex = 10
       TxtName.Text = plr.Name
       TxtName.BackgroundTransparency = 1
       TxtName.Position = UDim2.new(0, 0, 0, -45)
       TxtName.Size = UDim2.new(1, 0, 10, 0)
       TxtName.Font = "SourceSansBold"
       TxtName.TextColor3 = Color3.new(0, 0, 0)
       TxtName.TextSize = 14
       TxtName.TextStrokeTransparency = 0.5
       
       local TxtDist = Instance.new("TextLabel", frame)
       TxtDist.Name = "Dist"
       TxtDist.ZIndex = 10
       TxtDist.Text = ""
       TxtDist.BackgroundTransparency = 1
       TxtDist.Position = UDim2.new(0, 0, 0, -35)
       TxtDist.Size = UDim2.new(1, 0, 10, 0)
       TxtDist.Font = "SourceSansBold"
       TxtDist.TextColor3 = Color3.new(0, 0, 0)
       TxtDist.TextSize = 15
       TxtDist.TextStrokeTransparency = 0.5
   end
end


Run:BindToRenderStep("UpdateESP", Enum.RenderPriority.Character.Value, function()
   for _, v in next, Plrs:GetPlayers() do
       UpdateESP(v)
   end
end)

local MainGUI = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local esptrack = Instance.new("TextButton")
local Close = Instance.new("TextButton")

MainGUI.Name = "MainGUI"
MainGUI.Parent = game.CoreGui
MainGUI.ResetOnSpawn = false
local MainCORE = game.CoreGui["MainGUI"]

MainFrame.Name = "MainFrame"
MainFrame.Parent = MainGUI
MainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
MainFrame.BackgroundTransparency = 0.5
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Selectable = true
MainFrame.Draggable = true
MainFrame.Position = UDim2.new(0, 0, 0.270916343, 0)
MainFrame.Size = UDim2.new(0, 67, 0, 20)
MainFrame.Visible = true

esptrack.Name = "esptrack"
esptrack.Parent = MainFrame
esptrack.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
esptrack.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
esptrack.Position = UDim2.new(0.392578244, 0, -0.00380921364, 0)
esptrack.Size = UDim2.new(0, 40, 0, 20)
esptrack.TextColor3 = Color3.new(1, 1, 1)
esptrack.Font = Enum.Font.Fantasy
esptrack.Text = "ESP"
esptrack.TextSize = 16
esptrack.TextWrapped = true
esptrack.MouseButton1Click:connect(function()
   ESPEnabled = not ESPEnabled
   if ESPEnabled then
       esptrack.BackgroundColor3 = Color3.new(0, 0.5, 0)
       for _, v in next, Plrs:GetPlayers() do
           if v ~= MyPlr then
               if CharAddedEvent[v.Name] == nil then
                   CharAddedEvent[v.Name] = v.CharacterAdded:connect(function(Char)
                       if ESPEnabled then
                           RemoveESP(v)
                           CreateESP(v)
                       end
                       repeat wait() until Char:FindFirstChild("HumanoidRootPart")
                   end)
               end
               RemoveESP(v)
               CreateESP(v)
           end
       end
   else
       esptrack.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
       for _, v in next, Plrs:GetPlayers() do
           RemoveESP(v)
       end
   end
end)

Close.Name = "Close"
Close.Parent = MainFrame
Close.BackgroundColor3 = Color3.new(1, 0, 0)
Close.Position = UDim2.new(-0.00261712074, 0, -0.00380919501, 0)
Close.Size = UDim2.new(0, 27, 0, 20)
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.new(0, 0, 0)
Close.TextSize = 20
Close.MouseButton1Down:connect(function()
MainGUI:Destroy()
end)
end)


--Ctrl + Click tp
Section:NewButton("Ctrl + Click TP", "Discord:Thakin#0001", function()
    local Plr = game:GetService("Players").LocalPlayer
local Mouse = Plr:GetMouse()

Mouse.Button1Down:connect(function()
if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then return end
if not Mouse.Target then return end
Plr.Character:MoveTo(Mouse.Hit.p)
end)
end)

Section:NewButton("Guns All BETA", "Discord:Thakin#0001", function()
    for i,v in pairs(game:GetDescendants()) do
        if v:IsA("HooperBin") or v:IsA("Tool") then
        
        v.Parent = game.Players.LocalPlayer.Backpack
        end
        end
end)

Section:NewButton("FLY (E)", "Discord:Thakin#0001", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LegitH3x0R/Roblox-Scripts/main/AEBypassing/CFrameFly.lua"))()
end)

local Section = Main:NewSection("Main")

--SPEED
Section:NewToggle("SPEED", "Discord:Thakin#0001", function(state)
    if state then
        if not getgenv().MTAPIMutex then loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/cooler%20scripts/MTAPI", true))() end

game.Players.LocalPlayer.Character.Humanoid:AddGetHook("WalkSpeed",16)
game.Players.LocalPlayer.Character.Humanoid:AddSetHook("WalkSpeed")

game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 300
    else
        if not getgenv().MTAPIMutex then loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/cooler%20scripts/MTAPI", true))() end

game.Players.LocalPlayer.Character.Humanoid:AddGetHook("WalkSpeed",16)
game.Players.LocalPlayer.Character.Humanoid:AddSetHook("WalkSpeed")

game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 17
    end
end)

--teleportes TP
local TP = Window:NewTab("TP")
local Section = TP:NewSection("TP")

Section:NewButton("TP BANDEIRA", "Discord:Thakin#0001", function()
    local plr = game.Players.LocalPlayer
local xCords = CFrame.new(51.28517150878906, 44.999996185302734, -73.76051330566406)
plr.Character.HumanoidRootPart.CFrame = xCords
end)

local Section = TP:NewSection("TP")

Section:NewButton("TP PETROLHO 1", "Discord:Thakin#0001", function()
    local plr = game.Players.LocalPlayer
local xCords = CFrame.new(406.79986572265625, 46.59999084472656, -391.8419189453125)
plr.Character.HumanoidRootPart.CFrame = xCords
end)

Section:NewButton("TP PETROLHO 2", "Discord:Thakin#0001", function()
    local plr = game.Players.LocalPlayer
local xCords = CFrame.new(-225.1925811767578, 46.686641693115234, 185.01707458496094)
plr.Character.HumanoidRootPart.CFrame = xCords
end)

local Section = TP:NewSection("TP BASES")

Section:NewButton("BRAVO", "Discord:Thakin#0001", function()
    local plr = game.Players.LocalPlayer
local xCords = CFrame.new(-1039.67919921875, 52.25449752807617, -349.3082580566406)
plr.Character.HumanoidRootPart.CFrame = xCords
end)


Section:NewButton("CHARLIE", "Discord:Thakin#0001", function()
    local plr = game.Players.LocalPlayer
local xCords = CFrame.new(-924.4633178710938, 52.27095413208008, -923.5424194335938)
plr.Character.HumanoidRootPart.CFrame = xCords
end)

Section:NewButton("ALPHA", "Discord:Thakin#0001", function()
    local plr = game.Players.LocalPlayer
local xCords = CFrame.new(-1008.7609252929688, 52.2695198059082, 351.15411376953125)
plr.Character.HumanoidRootPart.CFrame = xCords
end)

Section:NewButton("KILO", "Discord:Thakin#0001", function()
    local plr = game.Players.LocalPlayer
local xCords = CFrame.new(1170.9754638671875, 52.276947021484375, -350.8444519042969)
plr.Character.HumanoidRootPart.CFrame = xCords
end)

Section:NewButton("LIMA", "Discord:Thakin#0001", function()
    local plr = game.Players.LocalPlayer
local xCords = CFrame.new(1180.399169921875, 45.41429901123047, 361.07049560546875)
plr.Character.HumanoidRootPart.CFrame = xCords
end)

Section:NewButton("ECHO", "Discord:Thakin#0001", function()
    local plr = game.Players.LocalPlayer
local xCords = CFrame.new(353.2371520996094, 45.26203918457031, -1024.200927734375)
plr.Character.HumanoidRootPart.CFrame = xCords
end)

Section:NewButton("DELTA", "Discord:Thakin#0001", function()
    local plr = game.Players.LocalPlayer
local xCords = CFrame.new(-332.1206359863281, 45.414695739746094, -977.1605834960938)
plr.Character.HumanoidRootPart.CFrame = xCords
end)