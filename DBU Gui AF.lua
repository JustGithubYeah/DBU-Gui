local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/BimbusCoder/Roblox-Scripts/master/MaterialLua"))()
local UI = Material.Load({Title = "Dragon Blox Ultimate | {}#0001", Style = 1, SizeX = 250, SizeY = 250, Theme = "Mocha"})

-- Tabs
local Main = UI.New({Title = "Main"})
local plr = game.Players.LocalPlayer
local RunService = game:GetService('RunService')
local questRemote = game:GetService("ReplicatedStorage").Package.Events.Qaction 
local punchRemote = game:GetService("ReplicatedStorage").Package.Events.p
local equipRemote = game:GetService("ReplicatedStorage").Package.Events.equipskill
local rebirthRemote = game:GetService("ReplicatedStorage").Package.Events.reb
local kickRemote = game:GetService("ReplicatedStorage").Package.Events.mel
local Settings = {Tables = {Forms = {'SSJB4','Ultra Ego','SSJBUI','LBSSJ4','SSJR3','SSJB3','True God of Destruction','True God of Creation','God of Destruction','God of Creation','Super Broly','Jiren Ultra Instinct','Mastered Ultra Instinct','Godly SSJ2','LSSJG','Ultra Instinct Omen','Evil SSJ','Blue Evolution','Dark Rose','Kefla SSJ2','SSJ Berserker','LSSJ4','True Rose','SSJG4','SSJB Kaioken','LSSJ3','SSJ Rose','SSJ Blue','SSJ5','Mystic Kaioken','Corrupt SSJ','SSJ Rage','LSSJ Kaioken','SSJG','SSJ4','Mystic','LSSJ','SSJ3','Spirit SSJ','SSJ2 Majin','SSJ2 Kaioken','SSJ2','SSJ Kaioken','SSJ','FSSJ','Kaioken'}};Variables = {Farm = false}}
local chargeRemote = game:GetService("ReplicatedStorage").Package.Events.cha
_G.autoEquip = True

spawn(function()
    while _G.autoEquip == true do
    local args = ("Mach Kick")
        equipRemote:InvokeServer()
    wait(15)
    end
end)
   
local function returnQuest(boolean)
    local quest = getrenv()._G.x.GetRecommendedQuest(game.Players.LocalPlayer)
    if (boolean) and quest:find('Vills Planet') then 
        return 'SSJG Kakata'
    else 
    if (boolean) and quest:find('Kaio Student') then
        return 'Super Vegetable'
    else
    if (boolean) and quest:find('Citizen') then 
        return 'Mapa'
    else
    if (boolean) and quest:find('Turtle Student') then 
        return 'Kid Nohag'
    else
    if (boolean) and quest:find('X Fighter Trainer') then
        return 'Klirin'
    else
        return quest
                    end 
                end
            end
        end
    end
end

local function transform()
    pcall(function()
        for i,v in pairs(Settings.Tables.Forms) do
            if equipRemote:InvokeServer(v) then
                break
            end 
        end
        repeat wait()
            if game:GetService("Players").LocalPlayer.Status.SelectedTransformation.Value ~= game:GetService("Players").LocalPlayer.Status.Transformation.Value then do
            game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
            end
       end    until game:GetService("Players").LocalPlayer.Status.SelectedTransformation.Value == game:GetService("Players").LocalPlayer.Status.Transformation.Value
    end)
end

RunService.RenderStepped:Connect(function()
    if Settings.Variables.Farm then 
        plr.Character:WaitForChild('Humanoid'):ChangeState(11)
    end 
end)
local RebirthFarm = Main.Toggle({
    Text = 'Auto Farm',
    Callback = function(bool)
        Settings.Variables.Farm = bool 
        while bool and wait() do 
            if (not plr.PlayerGui.Main.MainFrame.Frames.Quest.Nop.Visible and bool) then
                for i,v in next, workspace.Living:GetChildren() do 
                    if (v.Name == returnQuest(true) or v.Name == game:GetService("ReplicatedStorage").Package.Quests[returnQuest(true)].Objective.Value) and not plr.PlayerGui.Main.MainFrame.Frames.Quest.Nop.Visible and v:FindFirstChild('Humanoid') and v:FindFirstChild('HumanoidRootPart') and v.Humanoid.Health > 0 then 
                        repeat wait()
                             pcall(function() plr.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,2) end)
                             punchRemote:FireServer("Blacknwhite27",1)
                             kickRemote:InvokeServer("Mach Kick","Blacknwhite27")
                        until not v or not v:FindFirstChild('Humanoid') or not v:FindFirstChild('HumanoidRootPart') or v.Humanoid.Health <= 0 or not Settings.Variables.Farm or plr.PlayerGui:WaitForChild('Main').MainFrame.Frames.Quest.Nop.Visible
                    end 
                end 
            else 
                pcall(function() questRemote:InvokeServer(workspace.Others.NPCs[returnQuest(true)]) end)
            end 
        end 
    end
})

local AutoTransform = Main.Toggle({
    Text = 'Auto Form',
    Callback = function(bool)
        pcall(function()
            while bool and wait() do 
                transform()
            end
        end)
    end 
})
local AutoRebirth = Main.Toggle({
    Text = 'Auto Rebirth',
    Callback = function(bool)
        while bool and wait() do 
            rebirthRemote:InvokeServer()
        end 
    end 
})
local AutoCharge = Main.Toggle({
    Text = 'Auto Charge',
    Callback = function(bool) 
        while bool and wait() do 
            chargeRemote:InvokeServer('Blacknwhite27')
        end
    end 
})