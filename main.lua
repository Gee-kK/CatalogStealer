local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")

local ScreenGui = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local BackgroundGui = Instance.new("ImageLabel")
local Clone = Instance.new("TextButton")
local Export = Instance.new("TextButton")
local Steal = Instance.new("TextButton")
local PlayerTextBox = Instance.new("TextBox")
local Stroke = Instance.new("UIStroke")


ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui
ScreenGui.ResetOnSpawn = false

main.Name = "main"
main.Parent = ScreenGui
main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
main.BorderColor3 = Color3.fromRGB(0, 0, 0)
main.BorderSizePixel = 0
main.Position = UDim2.new(0.743075967, 0, 0.238778234, 0)
main.Size = UDim2.new(0, 229, 0, 414)

BackgroundGui.Name = "BackgroundGui"
BackgroundGui.Parent = main
BackgroundGui.AnchorPoint = Vector2.new(0.5, 0.5)
BackgroundGui.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BackgroundGui.BackgroundTransparency = 1.000
BackgroundGui.BorderColor3 = Color3.fromRGB(0, 0, 0)
BackgroundGui.BorderSizePixel = 0
BackgroundGui.Position = UDim2.new(0.5, 0, 0.5, 0)
BackgroundGui.Size = UDim2.new(1.79999995, 0, 1.60000002, 0)
BackgroundGui.ZIndex = 0
BackgroundGui.Image = "rbxassetid://11509756389"
BackgroundGui.ImageColor3 = Color3.fromRGB(0, 0, 0)

Clone.Name = "Clone"
Clone.Parent = main
Clone.AnchorPoint = Vector2.new(0.5, 0)
Clone.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Clone.BorderColor3 = Color3.fromRGB(0, 0, 0)
Clone.BorderSizePixel = 0
Clone.Position = UDim2.new(0.5, 0, 0.35265699, 0)
Clone.Size = UDim2.new(0.873362422, 0, 0.0821256042, 0)
Clone.Font = Enum.Font.Unknown
Clone.Text = "Clone"
Clone.TextColor3 = Color3.fromRGB(0, 0, 0)
Clone.TextSize = 25.000
Clone.TextWrapped = true
Clone.Font = Enum.Font.GothamBold

Export.Name = "Export"
Export.Parent = main
Export.AnchorPoint = Vector2.new(0.5, 0)
Export.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Export.BorderColor3 = Color3.fromRGB(0, 0, 0)
Export.BorderSizePixel = 0
Export.Position = UDim2.new(0.5, 0, 0.83816427, 0)
Export.Size = UDim2.new(0.873362422, 0, 0.0942028984, 0)
Export.Font = Enum.Font.Unknown
Export.Text = "Export"
Export.TextColor3 = Color3.fromRGB(0, 0, 0)
Export.TextSize = 25.000
Export.TextWrapped = true
Export.Font = Enum.Font.GothamBold

Steal.Name = "Steal"
Steal.Parent = main
Steal.AnchorPoint = Vector2.new(0.5, 0)
Steal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Steal.BorderColor3 = Color3.fromRGB(0, 0, 0)
Steal.BorderSizePixel = 0
Steal.Position = UDim2.new(0.5, 0, 0.253623188, 0)
Steal.Size = UDim2.new(0.873362422, 0, 0.0821256042, 0)
Steal.Font = Enum.Font.Unknown
Steal.Text = "Steal"
Steal.TextColor3 = Color3.fromRGB(0, 0, 0)
Steal.TextSize = 25.000
Steal.TextWrapped = true
Steal.Font = Enum.Font.GothamBold

PlayerTextBox.Name = "Player"
PlayerTextBox.Parent = main
PlayerTextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PlayerTextBox.BackgroundTransparency = 1.000
PlayerTextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
PlayerTextBox.BorderSizePixel = 0
PlayerTextBox.Position = UDim2.new(0.0611353703, 0, 0.0628019348, 0)
PlayerTextBox.Size = UDim2.new(0.873362422, 0, 0.0821256042, 0)
PlayerTextBox.ClearTextOnFocus = false
PlayerTextBox.Font = Enum.Font.GothamBold
PlayerTextBox.Text = ""
PlayerTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerTextBox.TextSize = 14.000
PlayerTextBox.Font = Enum.Font.GothamBold

Stroke.Parent = PlayerTextBox
Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Stroke.Thickness = 2
Stroke.Color = Color3.new(1, 1, 1)

-- Scripts:

local frame = main
local UserInputService = game:GetService("UserInputService")

local dragging = false
local dragStart, startPos

local function update(input)
	local delta = input.Position - dragStart
	frame.Position = UDim2.new(
		startPos.X.Scale,
		startPos.X.Offset + delta.X,
		startPos.Y.Scale,
		startPos.Y.Offset + delta.Y
	)
end

frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

frame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		if dragging then
			update(input)
		end
	end
end)


local OutfitFolder = Instance.new("Folder")
OutfitFolder.Name = "StolenOutfits"
OutfitFolder.Parent = game.Workspace

local targetPlr = nil

local function clone()
	TextChatService.TextChannels.RBXGeneral:SendAsync("/clone")
end

local function GetHumanDescProperties(arg1, arg2) -- Line 130
	if arg2 then
		return {
			Clothes = {"GraphicTShirt", "Pants", "Shirt"};
			Accessory = {"BackAccessory", "FaceAccessory", "FrontAccessory", "HairAccessory", "HatAccessory", "NeckAccessory", "ShouldersAccessory", "WaistAccessory"};
			Animation = {"ClimbAnimation", "FallAnimation", "IdleAnimation", "JumpAnimation", "RunAnimation", "SwimAnimation", "WalkAnimation", "MoodAnimation"};
			BodyParts = {"Face", "Head", "LeftArm", "LeftLeg", "RightArm", "RightLeg", "Torso"};
			BodyColors = {"HeadColor", "LeftArmColor", "LeftLegColor", "RightArmColor", "RightLegColor", "TorsoColor"};
			Scale = {"BodyTypeScale", "DepthScale", "HeadScale", "HeightScale", "ProportionScale", "WidthScale"};
		}
	end
	return {
		Clothes = {"GraphicTShirt", "Pants", "Shirt"};
		Accessory = {"BackAccessory", "FaceAccessory", "FrontAccessory", "HairAccessory", "HatAccessory", "NeckAccessory", "ShouldersAccessory", "WaistAccessory"};
		Animation = {"ClimbAnimation", "FallAnimation", "IdleAnimation", "JumpAnimation", "RunAnimation", "SwimAnimation", "WalkAnimation", "MoodAnimation"};
		BodyParts = {"Face", "Head", "LeftArm", "LeftLeg", "RightArm", "RightLeg", "Torso"};
	}
end

local function ToDictionary(humanoidDescription)
	local result = {}

	----------------------------------------------------------------------
	-- 1. Human Description Properties
	----------------------------------------------------------------------
	for category, props in pairs(GetHumanDescProperties(false, true)) do
		for _, propName in pairs(props) do
			if category == "BodyColors" then
				local color = humanoidDescription[propName]
				result[propName] = {
					IsRGBTable = true,
					r = color.r * 255,
					g = color.g * 255,
					b = color.b * 255
				}
			else
				result[propName] = humanoidDescription[propName]
			end
		end
	end

	----------------------------------------------------------------------
	-- 2. Layered Accessories (basic info + value type conversion)
	----------------------------------------------------------------------
	local layeredAccessories = humanoidDescription:GetAccessories(false) or {}

	for _, accessory in pairs(layeredAccessories) do
		-- Replace AccessoryType object with its Name
		accessory.AccessoryType = accessory.AccessoryType and accessory.AccessoryType.Name

		-- Convert Vector3 and EnumItem values
		for key, value in pairs(accessory) do
			if typeof(value) == "Vector3" then
				accessory[key] = { Vector3 = true, X = value.X, Y = value.Y, Z = value.Z }
			elseif typeof(value) == "EnumItem" then
				accessory[key] = tostring(value)
			end
		end
	end

	result.LayeredAccessories = layeredAccessories

	----------------------------------------------------------------------
	-- 3. Accessory Refinements (non-default transforms)
	----------------------------------------------------------------------
	local refinements = {}

	for _, acc in pairs(humanoidDescription:GetAccessories(true)) do
		local isNonDefaultPos = acc.Position and acc.Position ~= Vector3.new(0, 0, 0)
		local isNonDefaultRot = acc.Rotation and acc.Rotation ~= Vector3.new(0, 0, 0)
		local isNonDefaultScale = acc.Scale and acc.Scale ~= Vector3.new(1, 1, 1)

		if not acc.Position or isNonDefaultPos or isNonDefaultRot or isNonDefaultScale then
			local idKey = tostring(acc.AssetId)
			refinements[idKey] = refinements[idKey] or {}

			if isNonDefaultPos then
				refinements[idKey].Position = {
					Vector3 = true,
					X = acc.Position.X,
					Y = acc.Position.Y,
					Z = acc.Position.Z
				}
			end

			if isNonDefaultRot then
				refinements[idKey].Rotation = {
					Vector3 = true,
					X = acc.Rotation.X,
					Y = acc.Rotation.Y,
					Z = acc.Rotation.Z
				}
			end

			if isNonDefaultScale then
				refinements[idKey].Scale = {
					Vector3 = true,
					X = acc.Scale.X,
					Y = acc.Scale.Y,
					Z = acc.Scale.Z
				}
			end
		end
	end

	result.AccessoryRefinements = refinements

	----------------------------------------------------------------------
	-- Done
	----------------------------------------------------------------------
	return result
end

local function stealOutfit(plr : Player)
	game.ReplicatedStorage.CatalogGuiRemote:InvokeServer({
		Action = "CreateAndWearHumanoidDescription";
		Properties = ToDictionary(plr.Character.Humanoid:GetAppliedDescription());
		RigType = plr.Character.Humanoid.RigType;
	})
end

PlayerTextBox.FocusLost:Connect(function()
	local potentialPlr = game.Players[PlayerTextBox.Text]
	if potentialPlr then
		targetPlr = potentialPlr
	else
		warn("Player Not Found")
	end
end)

Steal.Activated:Connect(function()
	if targetPlr then
		stealOutfit(targetPlr)
	end
end)

Clone.Activated:Connect(function()
	if targetPlr then
		clone()
	end
end)

Export.Activated:Connect(function()
	for _, c in game.Workspace:GetChildren() do
		if c.Name == "LocalPlayerClone" then
			c.Parent = OutfitFolder
		end
	end
	
	task.wait(1)
	saveinstance(OutfitFolder)
end)

print("aaaa")
