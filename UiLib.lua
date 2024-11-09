local player = game.Players.LocalPlayer
local userId = player.UserId
local Players = game:GetService("Players")
local uis = game:GetService("UserInputService")

local Library = {}

function Library:CreateWindow(Options)
	Options.Title = Options.Title or "Ui LIb"
	Options.Mobile = Options.Mobile or false
	Options.KeyCode = Options.KeyCode or "K"
	Options.Opacity = Options.Opacity or false
	Options.Animation = Options.Animation or false
	Options.TitleAnimation = Options.TitleAnimation or "AKAIDO UI LIB"
	Options.Theme = Options.Theme or "Darker"
	Options.WallPaper  = Options.WallPaper or true
	
	local Back = Enum.EasingDirection.InOut
	local Out = Enum.EasingStyle.Quad
	local Time1 = 0.5
	local Time2 = 0.8
	local Position = UDim2.new(0.5, -1555, 0.5, 0)
	
	local Font1 = Enum.Font.Ubuntu
	local Font2 = Enum.Font.Michroma
	local Font3 = Enum.Font.Jura
	
	local Themes = {
		["Darker"] = {
			Main = Color3.fromRGB(35, 35, 35),
			UiStrokeMain = Color3.fromRGB(35, 35, 35),
			Thickness = 0,
			Imagem = "",
			ImageColor = Color3.fromRGB(35, 35, 35),
			Shadow = Color3.fromRGB(0, 0, 0),
			TextBananas = Color3.fromRGB(35, 35, 35),
			TextPlaceHolder = Color3.fromRGB(200, 200, 200),
			Text = Color3.fromRGB(200, 200, 200),
			Image = Color3.fromRGB(200, 200, 200),
			Lines = Color3.fromRGB(81, 81, 81),
			Tabs = Color3.fromRGB(35, 35, 35),
			TabsOpacity = 0.400,
			TabsThicknes = Color3.fromRGB(35, 35, 35),
			Section = Color3.fromRGB(35, 35, 35),
			Options = Color3.fromRGB(35, 35, 35),
			OptionsDrop = Color3.fromRGB(45, 45, 45),
			TogglesActiveHolder = Color3.fromRGB(200, 200, 200),
			TogglesInactivelder = Color3.fromRGB(35, 35, 35),
			Draggable = Color3.fromRGB(200, 200, 200),
			UiStroke = Color3.fromRGB(81, 81, 81)
		},
		["Light"] = {
			Main = Color3.fromRGB(255, 255, 255),
			UiStrokeMain = Color3.fromRGB(255, 255, 255),
			Thickness = 0,
			Imagem = "",
			ImageColor = Color3.fromRGB(255, 255, 255),
			Shadow = Color3.fromRGB(240, 240, 240),
			TextBananas = Color3.fromRGB(200, 200, 200),
			TextPlaceHolder = Color3.fromRGB(35, 35, 35),
			Text = Color3.fromRGB(0, 0, 0),
			Image = Color3.fromRGB(0, 0, 0),
			Lines = Color3.fromRGB(35, 35, 35),
			Tabs = Color3.fromRGB(255, 255, 255),
			TabsOpacity = 0,
			TabsThicknes = Color3.fromRGB(255, 255, 255),
			Section = Color3.fromRGB(255, 255, 255),
			Options = Color3.fromRGB(240, 240, 240),
			OptionsDrop = Color3.fromRGB(200, 200, 200),
			TogglesActiveHolder = Color3.fromRGB(35, 35, 35),
			TogglesInactivelder = Color3.fromRGB(200, 200, 200),
			Draggable = Color3.fromRGB(200, 200, 200),
			UiStroke = Color3.fromRGB(35, 35, 35)
		},
		["Void"] = {
			Main = Color3.fromRGB(35, 35, 35),
			UiStrokeMain = Color3.fromRGB(35, 35, 35),
			Thickness = 0,
			Shadow = Color3.fromRGB(32, 0, 48),
			Imagem = "http://www.roblox.com/asset/?id=95061010192858",
			ImageColor = Color3.fromRGB(140, 140, 140),
			TextBananas = Color3.fromRGB(35, 35, 35),
			TextPlaceHolder = Color3.fromRGB(200, 200, 200),
			Text = Color3.fromRGB(200, 200, 200),
			Image = Color3.fromRGB(200, 200, 200),
			Lines = Color3.fromRGB(81, 81, 81),
			Tabs = Color3.fromRGB(35, 35, 35),
			TabsOpacity = 0.400,
			TabsThicknes = Color3.fromRGB(35, 35, 35),
			Section = Color3.fromRGB(35, 35, 35),
			Options = Color3.fromRGB(35, 35, 35),
			OptionsDrop = Color3.fromRGB(45, 45, 45),
			TogglesActiveHolder = Color3.fromRGB(200, 200, 200),
			TogglesInactivelder = Color3.fromRGB(35, 35, 35),
			Draggable = Color3.fromRGB(200, 200, 200),
			UiStroke = Color3.fromRGB(81, 81, 81)
		},
		["AKAIDO"] = {
			Main = Color3.fromRGB(35, 35, 35),
			Imagem = "http://www.roblox.com/asset/?id=71473639720364",
			ImageColor = Color3.fromRGB(100, 100, 100),
			UiStrokeMain = Color3.fromRGB(84, 0, 0),
			Thickness = 1,
			Shadow = Color3.fromRGB(84, 0, 0),
			TextBananas = Color3.fromRGB(84, 0, 0),
			TextPlaceHolder = Color3.fromRGB(200, 200, 200),
			Text = Color3.fromRGB(200, 200, 200),
			Image = Color3.fromRGB(200, 200, 200),
			Lines = Color3.fromRGB(84, 0, 0),
			Tabs = Color3.fromRGB(35, 35, 35),
			TabsOpacity = 0.400,
			TabsThicknes = Color3.fromRGB(84, 0, 0),
			Section = Color3.fromRGB(35, 35, 35),
			Options = Color3.fromRGB(35, 35, 35),
			OptionsDrop = Color3.fromRGB(45, 45, 45),
			TogglesActiveHolder = Color3.fromRGB(84, 0, 0),
			TogglesInactivelder = Color3.fromRGB(35, 35, 35),
			Draggable = Color3.fromRGB(200, 200, 200),
			UiStroke = Color3.fromRGB(84, 0, 0)
		}
	}
	
	Options.theme = Options.Theme
	
	local Theme = Themes[Options.Theme]
	if Theme == nil then
		error("There's no theme called: "..Options.Theme, 0)
	end
	
	local Criadores = {
		5860126267,
		4777736527,
		1570907477
	}
	
	local MyLibrary = Instance.new("ScreenGui")
	local Main = Instance.new("ImageLabel")
	local UICorner = Instance.new("UICorner")
	local DropShadowHolder = Instance.new("Frame")
	local DropShadow = Instance.new("ImageLabel")
	local Navegation = Instance.new("Frame")
	local Cors = Instance.new("Frame")
	local Colors = Instance.new("Frame")
	local R = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local UIListLayout = Instance.new("UIListLayout")
	local Y = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local G = Instance.new("Frame")
	local UICorner_4 = Instance.new("UICorner")
	local Title = Instance.new("TextLabel")
	local UIPadding = Instance.new("UIPadding")
	local Line = Instance.new("Frame")
	local Line_2 = Instance.new("Frame")
	local SearchFrame = Instance.new("Frame")
	local UIPadding_2 = Instance.new("UIPadding")
	local Search = Instance.new("TextBox")
	local UICorner_5 = Instance.new("UICorner")
	local UIPadding_3 = Instance.new("UIPadding")
	local Line_3 = Instance.new("Frame")
	local Icon = Instance.new("ImageLabel")
	local X = Instance.new("ImageButton")
	local PlayerFrame = Instance.new("Frame")
	local Line_4 = Instance.new("Frame")
	local FUser = Instance.new("Frame")
	local UIPadding_4 = Instance.new("UIPadding")
	local UIListLayout_2 = Instance.new("UIListLayout")
	local User = Instance.new("ImageButton")
	local UICorner_6 = Instance.new("UICorner")
	local Name = Instance.new("TextLabel")
	local UIPadding_5 = Instance.new("UIPadding")
	local Bla = Instance.new("TextLabel")
	local UIPadding_6 = Instance.new("UIPadding")
	local UIPadding_7 = Instance.new("UIPadding")
	local TabNavegation = Instance.new("Frame")
	local Tabs = Instance.new("ScrollingFrame")
	local UIListLayout_3 = Instance.new("UIListLayout")
	local UIPadding_8 = Instance.new("UIPadding")
	local ContainerHolder = Instance.new("Frame")
	local NamePage = Instance.new("Frame")
	local Line_5 = Instance.new("Frame")
	local Icon_4 = Instance.new("ImageLabel")
	
	MyLibrary.Name = "MyLibrary"
	MyLibrary.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	MyLibrary.ResetOnSpawn = false
	MyLibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Main.Name = "Main"
	Main.Parent = MyLibrary
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = Theme.Main
	Main.BackgroundTransparency = Options.Opacity and 0.080 or 0
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.Active = true
	Main.Draggable = true
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Size = UDim2.new(0, 467, 0, 300)
	Main.Image = Theme.Imagem
	Main.ImageColor3 = Theme.ImageColor
	Main.TileSize = UDim2.new(1, 0, 1, 0)
	Main.ScaleType = Enum.ScaleType.Tile

	UICorner.Parent = Main
	
	local s =Instance.new("UIStroke")
	s.Parent = Main
	s.Color  = Theme.UiStrokeMain
	s.Thickness = Theme.Thickness
	s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	
	if Options.WallPaper == true then
		Main.Image = Theme.Imagem
	else
		Main.Image = ""
	end
	
	local function Animation()
		if Options.Animation == true then
			Main.Visible = false

			local Animation = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local DropShadowHolder = Instance.new("Frame")
			local DropShadow = Instance.new("ImageLabel")
			local Content = Instance.new("Frame")
			local Name = Instance.new("TextLabel")
			local Loading = Instance.new("ImageLabel")

			-- Configurações do Frame da Animação
			Animation.Name = "Animation"
			Animation.Parent = MyLibrary
			Animation.AnchorPoint = Vector2.new(0.5, 0.5)
			Animation.BackgroundColor3 = Theme.Main
			Animation.BackgroundTransparency = 0.08
			Animation.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Animation.BorderSizePixel = 0
			Animation.Position = UDim2.new(0.5, 0, 0.5, 0)
			Animation.Size = UDim2.new(0, 0, 0, 0)

			UICorner.CornerRadius = UDim.new(0, 5)
			UICorner.Parent = Animation

			-- Configurações do DropShadow
			DropShadowHolder.Name = "DropShadowHolder"
			DropShadowHolder.Parent = Animation
			DropShadowHolder.BackgroundTransparency = 1
			DropShadowHolder.BorderSizePixel = 0
			DropShadowHolder.Visible = false
			DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
			DropShadowHolder.ZIndex = 0

			DropShadow.Name = "DropShadow"
			DropShadow.Parent = DropShadowHolder
			DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
			DropShadow.BackgroundTransparency = 1
			DropShadow.BorderSizePixel = 0
			DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
			DropShadow.Size = UDim2.new(1, 47, 1, 47)
			DropShadow.ZIndex = 0
			DropShadow.Image = "rbxassetid://6014261993"
			DropShadow.ImageColor3 = Theme.Shadow
			DropShadow.ImageTransparency = 0.5
			DropShadow.ScaleType = Enum.ScaleType.Slice
			DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

			-- Configurações do Conteúdo
			Content.Name = "Content"
			Content.Parent = Animation
			Content.AnchorPoint = Vector2.new(0, 0.5)
			Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Content.BackgroundTransparency = 1
			Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Content.BorderSizePixel = 0
			Content.Visible = false
			Content.Position = UDim2.new(0, 0, 0.5, 0)
			Content.Size = UDim2.new(1, 0, 1, -50)

			Name.Name = "Name"
			Name.Parent = Content
			Name.AnchorPoint = Vector2.new(0.5, 0.5)
			Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Name.BackgroundTransparency = 1.000
			Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Name.BorderSizePixel = 0
			Name.Position = UDim2.new(0.5, 0, 0.5, -28)
			Name.Size = UDim2.new(0, 200, 0, 20)
			Name.Font = Font2
			Name.Text = Options.TitleAnimation
			Name.TextColor3 = Theme.Text
			Name.TextSize = 14.000
			Name.TextWrapped = true

			Loading.Name = "Loading"
			Loading.Parent = Content
			Loading.AnchorPoint = Vector2.new(0.5, 0.5)
			Loading.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Loading.BackgroundTransparency = 1.000
			Loading.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Loading.BorderSizePixel = 0
			Loading.Position = UDim2.new(0.5, 0, 0.5, 0)
			Loading.Size = UDim2.new(0, 28, 0, 28)
			Loading.Image = "rbxassetid://7733992358"
			Loading.ImageColor3 = Theme.Image

			-- Animação de rotação da imagem
			local function load()
				while true do 
					Loading.Rotation = (Loading.Rotation + 10) % 360 -- Incrementa a rotação
					wait(0.05) -- Aguarda um curto período para suavizar a animação
				end
			end

			-- Inicia a rotação em uma nova corrotina
			coroutine.wrap(load)()

			-- Animações de Tamanho
			wait(1)
			Animation:TweenSize(UDim2.new(0, 250, 0, 150), Back, Out, Time2, true)
			wait(0.5)
			DropShadowHolder.Visible = true
			Content.Visible = true
			wait(3)
			Animation:TweenSize(UDim2.new(0, 0, 0, 0), Back, Out, Time2, true)
			wait(0.1)
			DropShadowHolder.Visible = false
			Content.Visible = false
			wait(1)
			Animation:Destroy()
			Main.Visible = true
		end
	end

	Animation()
	
	local On = false

	if Options.Mobile == false then
		uis.InputBegan:Connect(function(input, gameProcessed)
			if gameProcessed then return end

			if input.KeyCode == Enum.KeyCode[Options.KeyCode] then
				On = not On
				Main:TweenPosition(Position, Back, Out, Time2, true)
				if On == false then
					Main:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Back, Out, Time2, true)
				end
			end
		end)
	else
		local OpenMobile = Instance.new("TextButton")
		local UICorner = Instance.new("UICorner")
		local DropShadowHolder = Instance.new("Frame")
		local DropShadow = Instance.new("ImageLabel")

		OpenMobile.Name = "OpenMobile"
		OpenMobile.Parent = MyLibrary
		OpenMobile.BackgroundColor3 = Theme.Main
		OpenMobile.BackgroundTransparency = 0.080
		OpenMobile.BorderColor3 = Color3.fromRGB(0, 0, 0)
		OpenMobile.BorderSizePixel = 0
		OpenMobile.Position = UDim2.new(0.01, 0,0.013, 0)
		OpenMobile.Size = UDim2.new(0, 82, 0, 25)
		OpenMobile.AutoButtonColor = false
		OpenMobile.Font = Font3
		OpenMobile.Text = "Menu"
		OpenMobile.TextColor3 = Theme.Text
		OpenMobile.TextSize = 14.000

		UICorner.CornerRadius = UDim.new(0, 5)
		UICorner.Parent = OpenMobile

		DropShadowHolder.Name = "DropShadowHolder"
		DropShadowHolder.Parent = OpenMobile
		DropShadowHolder.BackgroundTransparency = 1.000
		DropShadowHolder.BorderSizePixel = 0
		DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
		DropShadowHolder.ZIndex = 0

		DropShadow.Name = "DropShadow"
		DropShadow.Parent = DropShadowHolder
		DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
		DropShadow.BackgroundTransparency = 1.000
		DropShadow.BorderSizePixel = 0
		DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
		DropShadow.Size = UDim2.new(1, 34, 1, 34)
		DropShadow.ZIndex = 0
		DropShadow.Image = "rbxassetid://6014261993"
		DropShadow.ImageColor3 = Theme.Shadow
		DropShadow.ImageTransparency = 0.500
		DropShadow.ScaleType = Enum.ScaleType.Slice
		DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)	

		OpenMobile.MouseButton1Click:Connect(function()
			On = not On
			Main:TweenPosition(Position, Back, Out, Time2, true)
			if On == false then
				Main:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Back, Out, Time2, true)
			end
		end)
	end
	
	DropShadowHolder.Name = "DropShadowHolder"
	DropShadowHolder.Parent = Main
	DropShadowHolder.BackgroundTransparency = 1.000
	DropShadowHolder.BorderSizePixel = 0
	DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
	DropShadowHolder.ZIndex = 0

	DropShadow.Name = "DropShadow"
	DropShadow.Parent = DropShadowHolder
	DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow.BackgroundTransparency = 1.000
	DropShadow.BorderSizePixel = 0
	DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropShadow.Size = UDim2.new(1, 47, 1, 47)
	DropShadow.ZIndex = 0
	DropShadow.Image = "rbxassetid://6014261993"
	DropShadow.ImageColor3 = Theme.Shadow
	DropShadow.ImageTransparency = 0.500
	DropShadow.ScaleType = Enum.ScaleType.Slice
	DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

	Navegation.Name = "Navegation"
	Navegation.Parent = Main
	Navegation.AnchorPoint = Vector2.new(0, 1)
	Navegation.BackgroundColor3 = Theme.Section
	Navegation.BackgroundTransparency = 1.000
	Navegation.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Navegation.BorderSizePixel = 0
	Navegation.Position = UDim2.new(0, 0, 1, 0)
	Navegation.Size = UDim2.new(0, 140, 1, 0)

	Cors.Name = "Cors"
	Cors.Parent = Navegation
	Cors.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Cors.BackgroundTransparency = 1.000
	Cors.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Cors.BorderSizePixel = 0
	Cors.Size = UDim2.new(1, 0, 0, 27)

	Colors.Name = "Colors"
	Colors.Parent = Cors
	Colors.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Colors.BackgroundTransparency = 1.000
	Colors.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Colors.BorderSizePixel = 0
	Colors.Size = UDim2.new(0.5, 0, 1, 0)

	R.Name = "R"
	R.Parent = Colors
	R.AnchorPoint = Vector2.new(0, 0.5)
	R.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	R.BorderColor3 = Color3.fromRGB(0, 0, 0)
	R.BorderSizePixel = 0
	R.Position = UDim2.new(0, 0, 0.5, 0)
	R.Size = UDim2.new(0, 9, 0, 9)

	UICorner_2.Parent = R

	UIListLayout.Parent = Colors
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	UIListLayout.Padding = UDim.new(0, 7)

	Y.Name = "Y"
	Y.Parent = Colors
	Y.AnchorPoint = Vector2.new(0, 0.5)
	Y.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
	Y.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Y.BorderSizePixel = 0
	Y.Position = UDim2.new(0, 0, 0.5, 0)
	Y.Size = UDim2.new(0, 9, 0, 9)

	UICorner_3.Parent = Y

	G.Name = "G"
	G.Parent = Colors
	G.AnchorPoint = Vector2.new(0, 0.5)
	G.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
	G.BorderColor3 = Color3.fromRGB(0, 0, 0)
	G.BorderSizePixel = 0
	G.Position = UDim2.new(0, 0, 0.5, 0)
	G.Size = UDim2.new(0, 9, 0, 9)

	UICorner_4.Parent = G

	Title.Name = "Title"
	Title.Parent = Cors
	Title.AnchorPoint = Vector2.new(1, 0)
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(1, 0, 0, 0)
	Title.Size = UDim2.new(0.5, 0, 1, 0)
	Title.Font = Font2
	Title.Text = Options.Title
	Title.TextColor3 = Theme.Text
	Title.TextSize = 12.000
	Title.TextXAlignment = Enum.TextXAlignment.Right

	UIPadding.Parent = Title
	UIPadding.PaddingRight = UDim.new(0, 7)

	Line.Name = "Line"
	Line.Parent = Cors
	Line.AnchorPoint = Vector2.new(0, 1)
	Line.BackgroundColor3  = Theme.Lines
	Line.BackgroundTransparency = 0.080
	Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Line.BorderSizePixel = 0
	Line.Position = UDim2.new(0, 0, 1, 0)
	Line.Size = UDim2.new(1, 0, 0, 1)

	Line_2.Name = "Line"
	Line_2.Parent = Navegation
	Line_2.AnchorPoint = Vector2.new(1, 0)
	Line_2.BackgroundColor3  = Theme.Lines
	Line_2.BackgroundTransparency = 0.080
	Line_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Line_2.BorderSizePixel = 0
	Line_2.Position = UDim2.new(1, 0, 0, 0)
	Line_2.Size = UDim2.new(0, 1, 1, 0)

	SearchFrame.Name = "SearchFrame"
	SearchFrame.Parent = Navegation
	SearchFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SearchFrame.BackgroundTransparency = 1.000
	SearchFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SearchFrame.BorderSizePixel = 0
	SearchFrame.Position = UDim2.new(0, 0, 0, 27)
	SearchFrame.Size = UDim2.new(1, 0, 0, 30)

	UIPadding_2.Parent = SearchFrame
	UIPadding_2.PaddingLeft = UDim.new(0, 6)
	UIPadding_2.PaddingRight = UDim.new(0, 6)
	UIPadding_2.PaddingTop = UDim.new(0, 4)

	Search.Name = "Search"
	Search.Parent = SearchFrame
	Search.AnchorPoint = Vector2.new(0, 0.5)
	Search.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Search.BackgroundTransparency = 1.000
	Search.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Search.BorderSizePixel = 0
	Search.Position = UDim2.new(0, 0, 0.5, -3)
	Search.Size = UDim2.new(1, 0, 1, -4)
	Search.Font = Font1
	Search.PlaceholderColor3 = Theme.TextPlaceHolder
	Search.PlaceholderText = "Search..."
	Search.Text = ""
	Search.TextColor3 = Theme.Text
	Search.TextSize = 12.000
	Search.TextWrapped = true
	Search.TextXAlignment = Enum.TextXAlignment.Left

	UICorner_5.CornerRadius = UDim.new(0, 5)
	UICorner_5.Parent = Search

	UIPadding_3.Parent = Search
	UIPadding_3.PaddingLeft = UDim.new(0, 26)
	UIPadding_3.PaddingRight = UDim.new(0, 26)
	
	local s =Instance.new("UIStroke")
	s.Parent = Search
	s.Color  = Theme.UiStroke
	s.Thickness = 0.8
	s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	
	Line_3.Name = "Line"
	Line_3.Parent = SearchFrame
	Line_3.AnchorPoint = Vector2.new(0, 1)
	Line_3.BackgroundColor3  = Theme.Lines
	Line_3.BackgroundTransparency = 0.080
	Line_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Line_3.BorderSizePixel = 0
	Line_3.Position = UDim2.new(0, -6, 1, 0)
	Line_3.Size = UDim2.new(1, 12, 0, 1)

	Icon.Name = "Icon"
	Icon.Parent = SearchFrame
	Icon.AnchorPoint = Vector2.new(0, 0.5)
	Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Icon.BackgroundTransparency = 1.000
	Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Icon.BorderSizePixel = 0
	Icon.Position = UDim2.new(0, 4, 0.5, -3)
	Icon.Size = UDim2.new(0, 18, 0, 18)
	Icon.Image = "http://www.roblox.com/asset/?id=108411121143634"
	Icon.ImageColor3 = Theme.Image

	X.Name = "X"
	X.Parent = SearchFrame
	X.AnchorPoint = Vector2.new(1, 0.5)
	X.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	X.BackgroundTransparency = 1.000
	X.BorderColor3 = Color3.fromRGB(0, 0, 0)
	X.BorderSizePixel = 0
	X.Position = UDim2.new(1, -2, 0.5, -3)
	X.Size = UDim2.new(0, 18, 0, 18)
	X.Image = "http://www.roblox.com/asset/?id=138178429150235"
	X.ImageColor3 = Theme.Image

	PlayerFrame.Name = "PlayerFrame"
	PlayerFrame.Parent = Navegation
	PlayerFrame.AnchorPoint = Vector2.new(0, 1)
	PlayerFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	PlayerFrame.BackgroundTransparency = 1
	PlayerFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	PlayerFrame.BorderSizePixel = 0
	PlayerFrame.Position = UDim2.new(0, 0, 1, 0)
	PlayerFrame.Size = UDim2.new(1, 0, 0, 45)

	Line_4.Name = "Line"
	Line_4.Parent = PlayerFrame
	Line_4.BackgroundColor3 = Theme.Lines
	Line_4.BackgroundTransparency = 0.080
	Line_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Line_4.BorderSizePixel = 0
	Line_4.Position = UDim2.new(0, -6, 0, 0)
	Line_4.Size = UDim2.new(1, 12, 0, 1)

	FUser.Name = "FUser"
	FUser.Parent = PlayerFrame
	FUser.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	FUser.BackgroundTransparency = 1.000
	FUser.BorderColor3 = Color3.fromRGB(0, 0, 0)
	FUser.BorderSizePixel = 0
	FUser.Size = UDim2.new(1, 0, 1, 0)

	UIPadding_4.Parent = FUser
	UIPadding_4.PaddingBottom = UDim.new(0, 2)
	UIPadding_4.PaddingRight = UDim.new(0, 6)
	UIPadding_4.PaddingTop = UDim.new(0, 4)

	UIListLayout_2.Parent = FUser
	UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center
	UIListLayout_2.Padding = UDim.new(0, 3)

	User.Name = "User"
	User.Parent = FUser
	User.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	User.BackgroundTransparency = 1.000
	User.BorderColor3 = Color3.fromRGB(0, 0, 0)
	User.BorderSizePixel = 0
	User.Size = UDim2.new(0, 30, 0, 30)

	UICorner_6.CornerRadius = UDim.new(0, 999)
	UICorner_6.Parent = User
	
	local s =Instance.new("UIStroke")
	s.Parent = User
	s.Color  = Theme.UiStroke
	s.Thickness = 0.8
	s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	
	local s =Instance.new("UIStroke")
	s.Parent = Search
	s.Color  = Theme.UiStroke
	s.Thickness = 0.8
	s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	Name.Name = "Name"
	Name.Parent = FUser
	Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Name.BackgroundTransparency = 1.000
	Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Name.BorderSizePixel = 0
	Name.Size = UDim2.new(1, -30, 1, 0)
	Name.Font = Font2
	Name.Text = player.Name
	Name.TextColor3 = Theme.Text
	Name.TextSize = 14.000
	Name.TextXAlignment = Enum.TextXAlignment.Left
	Name.TextYAlignment = Enum.TextYAlignment.Top

	UIPadding_5.Parent = Name
	UIPadding_5.PaddingTop = UDim.new(0, 3)
	UIPadding_5.PaddingLeft = UDim.new(0, 7)

	Bla.Name = "Bla"
	Bla.Parent = Name
	Bla.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Bla.BackgroundTransparency = 1.000
	Bla.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Bla.BorderSizePixel = 0
	Bla.Size = UDim2.new(1, 0, 1, 0)
	Bla.Font = Font2
	Bla.Text = "DevLog"
	Bla.TextColor3 = Theme.Text
	Bla.TextSize = 13.000
	Bla.TextXAlignment = Enum.TextXAlignment.Left
	Bla.TextYAlignment = Enum.TextYAlignment.Top

	UIPadding_6.Parent = Bla
	UIPadding_6.PaddingLeft = UDim.new(0, 8)
	UIPadding_6.PaddingTop = UDim.new(0, 12)

	UIPadding_7.Parent = PlayerFrame
	UIPadding_7.PaddingBottom = UDim.new(0, 4)
	UIPadding_7.PaddingLeft = UDim.new(0, 6)
	UIPadding_7.PaddingRight = UDim.new(0, 6)
	UIPadding_7.PaddingTop = UDim.new(0, 4)

	TabNavegation.Name = "TabNavegation"
	TabNavegation.Parent = Navegation
	TabNavegation.AnchorPoint = Vector2.new(0, 1)
	TabNavegation.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabNavegation.BackgroundTransparency = 1.000
	TabNavegation.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabNavegation.BorderSizePixel = 0
	TabNavegation.Position = UDim2.new(0, 0, 1, -42)
	TabNavegation.Size = UDim2.new(1, 0, 1, -100)

	Tabs.Name = "Tabs"
	Tabs.Parent = TabNavegation
	Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tabs.BackgroundTransparency = 1.000
	Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Tabs.BorderSizePixel = 0
	Tabs.Selectable = false
	Tabs.Size = UDim2.new(1, 0, 1, 0)
	Tabs.ScrollBarThickness = 0

	UIListLayout_3.Parent = Tabs
	UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_3.Padding = UDim.new(0, 5)

	UIPadding_8.Parent = Tabs
	UIPadding_8.PaddingBottom = UDim.new(0, 2)
	UIPadding_8.PaddingLeft = UDim.new(0, 6)
	UIPadding_8.PaddingRight = UDim.new(0, 6)
	UIPadding_8.PaddingTop = UDim.new(0, 4)
	
	ContainerHolder.Name = "ContainerHolder"
	ContainerHolder.Parent = Main
	ContainerHolder.AnchorPoint = Vector2.new(1, 0)
	ContainerHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ContainerHolder.BackgroundTransparency = 1.000
	ContainerHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ContainerHolder.BorderSizePixel = 0
	ContainerHolder.Position = UDim2.new(1, 0, 0, 0)
	ContainerHolder.Size = UDim2.new(1, -140, 1, 0)
	
	NamePage.Name = "NamePage"
	NamePage.Parent = ContainerHolder
	NamePage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NamePage.BackgroundTransparency = 1.000
	NamePage.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NamePage.BorderSizePixel = 0
	NamePage.Size = UDim2.new(1, 0, 0, 40)

	Line_5.Name = "Line"
	Line_5.Parent = NamePage
	Line_5.AnchorPoint = Vector2.new(0, 1)
	Line_5.BackgroundColor3 = Theme.Lines
	Line_5.BackgroundTransparency = 0.080
	Line_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Line_5.BorderSizePixel = 0
	Line_5.Position = UDim2.new(0, 0, 1, 0)
	Line_5.Size = UDim2.new(1, 0, 0, 1)

	Icon_4.Name = "Icon"
	Icon_4.Parent = NamePage
	Icon_4.AnchorPoint = Vector2.new(1, 0.5)
	Icon_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Icon_4.BackgroundTransparency = 1.000
	Icon_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Icon_4.BorderSizePixel = 0
	Icon_4.Position = UDim2.new(1, -6, 0.5, 0)
	Icon_4.Size = UDim2.new(0, 18, 0, 18)
	Icon_4.Image = "http://www.roblox.com/asset/?id=76006957100584"
	Icon_4.ImageColor3 = Theme.Image
	

	local userConfg = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local DropShadowHolder = Instance.new("Frame")
	local DropShadow = Instance.new("ImageLabel")
	local Topbar = Instance.new("Frame")
	local Name1 = Instance.new("TextLabel")
	local UIPadding = Instance.new("UIPadding")
	local Line = Instance.new("Frame")
	local Content = Instance.new("Frame")
	local UIPadding_2 = Instance.new("UIPadding")
	local UserIDD = Instance.new("TextLabel")
	local UIPadding_3 = Instance.new("UIPadding")
	local UIListLayout = Instance.new("UIListLayout")
	local Life = Instance.new("TextLabel")
	local UIPadding_4 = Instance.new("UIPadding")
	local ID = Instance.new("TextLabel")
	local UIPadding_5 = Instance.new("UIPadding")
	local UserPAtent = Instance.new("TextLabel")
	local UIPadding_6 = Instance.new("UIPadding")
	local ID_2 = Instance.new("TextLabel")
	local UIPadding_7 = Instance.new("UIPadding")
	local UserLife = Instance.new("TextLabel")
	local UIPadding_8 = Instance.new("UIPadding")

	userConfg.Name = "userConfg"
	userConfg.Parent = Main
	userConfg.BackgroundColor3 = Theme.Main
	userConfg.BackgroundTransparency = Options.Opacity and 0.080 or 0
	userConfg.BorderColor3 = Color3.fromRGB(0, 0, 0)
	userConfg.BorderSizePixel = 0
	userConfg.AnchorPoint = Vector2.new(1, 0)
	userConfg.Position = UDim2.new(0, -10, 0, 0)
	userConfg.Size = UDim2.new(0, 140, 0, 0)

	UICorner.Parent = userConfg

	DropShadowHolder.Name = "DropShadowHolder"
	DropShadowHolder.Parent = userConfg
	DropShadowHolder.BackgroundTransparency = 1.000
	DropShadowHolder.BorderSizePixel = 0
	DropShadowHolder.Visible = false
	DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
	DropShadowHolder.ZIndex = 0

	DropShadow.Name = "DropShadow"
	DropShadow.Parent = DropShadowHolder
	DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow.BackgroundTransparency = 1.000
	DropShadow.BorderSizePixel = 0
	DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropShadow.Size = UDim2.new(1, 47, 1, 47)
	DropShadow.ZIndex = 0
	DropShadow.Image = "rbxassetid://6014261993"
	DropShadow.ImageColor3 = Theme.Shadow
	DropShadow.ImageTransparency = 0.500
	DropShadow.ScaleType = Enum.ScaleType.Slice
	DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

	Topbar.Name = "Topbar"
	Topbar.Parent = userConfg
	Topbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Topbar.BackgroundTransparency = 1.000
	Topbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Topbar.BorderSizePixel = 04
	Topbar.Visible = false
	Topbar.Size = UDim2.new(1, 0, 0, 25)

	Name1.Name = "Name"
	Name1.Parent = Topbar
	Name1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Name1.BackgroundTransparency = 1.000
	Name1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Name1.BorderSizePixel = 0
	Name1.Size = UDim2.new(1, 0, 1, 0)
	Name1.Font = Font2
	Name1.Text = player.Name
	Name1.TextColor3 = Theme.Text
	Name1.TextSize = 12.000
	Name1.TextXAlignment = Enum.TextXAlignment.Left

	UIPadding.Parent = Name1
	UIPadding.PaddingLeft = UDim.new(0, 7)

	Line.Name = "Line"
	Line.Parent = Topbar
	Line.AnchorPoint = Vector2.new(0, 1)
	Line.BackgroundColor3 = Theme.Lines
	Line.BackgroundTransparency = 0.080
	Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Line.BorderSizePixel = 0
	Line.Position = UDim2.new(0, 0, 1, 0)
	Line.Size = UDim2.new(1, 0, 0, 1)

	Content.Name = "Content"
	Content.Parent = userConfg
	Content.AnchorPoint = Vector2.new(1, 1)
	Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Content.BackgroundTransparency = 1.000
	Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Content.BorderSizePixel = 0
	Content.Visible = false
	Content.Position = UDim2.new(1, 0, 1, 0)
	Content.Size = UDim2.new(1, 0, 1, -25)
	
	UIPadding_2.Parent = Content
	UIPadding_2.PaddingBottom = UDim.new(0, 6)
	UIPadding_2.PaddingLeft = UDim.new(0, 4)
	UIPadding_2.PaddingRight = UDim.new(0, 4)
	UIPadding_2.PaddingTop = UDim.new(0, 6)
	
	UIListLayout.Parent = Content
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 3)
	
	UserPAtent.Name = "UserPAtent"
	UserPAtent.Parent = Content
	UserPAtent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserPAtent.BackgroundTransparency = 1.000
	UserPAtent.BorderColor3 = Color3.fromRGB(0, 0, 0)
	UserPAtent.BorderSizePixel = 0
	UserPAtent.Position = UDim2.new(0, 0, 0.024390243, 0)
	UserPAtent.Size = UDim2.new(1, 0, 0, 18)
	UserPAtent.Font = Font3
	UserPAtent.Text = "User Patent"
	UserPAtent.TextColor3 = Theme.Text
	UserPAtent.TextSize = 12.000
	UserPAtent.TextXAlignment = Enum.TextXAlignment.Left
	UserPAtent.TextYAlignment = Enum.TextYAlignment.Bottom

	UIPadding_6.Parent = UserPAtent
	UIPadding_6.PaddingLeft = UDim.new(0, 7)
	
	ID_2.Name = "ID"
	ID_2.Parent = Content
	ID_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ID_2.BackgroundTransparency = 1.000
	ID_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ID_2.BorderSizePixel = 0
	ID_2.Position = UDim2.new(0.0216882322, 0, 0.947472453, 0)
	ID_2.Size = UDim2.new(1, 0, 0, 18)
	ID_2.Font = Font2
	ID_2.TextColor3 = Theme.Text
	ID_2.TextSize = 11.000
	ID_2.TextXAlignment = Enum.TextXAlignment.Left
	ID_2.TextYAlignment = Enum.TextYAlignment.Top

	UIPadding_7.Parent = ID_2
	UIPadding_7.PaddingLeft = UDim.new(0, 10)
	UIPadding_7.PaddingTop = UDim.new(0, -3)

	UserIDD.Name = "UserIDD"
	UserIDD.Parent = Content
	UserIDD.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserIDD.BackgroundTransparency = 1.000
	UserIDD.BorderColor3 = Color3.fromRGB(0, 0, 0)
	UserIDD.BorderSizePixel = 0
	UserIDD.Position = UDim2.new(0, 0, 0.024390243, 0)
	UserIDD.Size = UDim2.new(1, 0, 0, 18)
	UserIDD.Font = Font3
	UserIDD.Text = "User Id"
	UserIDD.TextColor3 = Theme.Text
	UserIDD.TextSize = 12.000
	UserIDD.TextXAlignment = Enum.TextXAlignment.Left
	UserIDD.TextYAlignment = Enum.TextYAlignment.Bottom

	UIPadding_3.Parent = UserIDD
	UIPadding_3.PaddingLeft = UDim.new(0, 7)

	ID.Name = "ID"
	ID.Parent = Content
	ID.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ID.BackgroundTransparency = 1.000
	ID.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ID.BorderSizePixel = 0
	ID.Position = UDim2.new(0.0216882322, 0, 0.947472453, 0)
	ID.Size = UDim2.new(1, 0, 0, 18)
	ID.Font = Font2
	ID.Text = player.UserId
	ID.TextColor3 = Theme.Text
	ID.TextSize = 11.000
	ID.TextXAlignment = Enum.TextXAlignment.Left
	ID.TextYAlignment = Enum.TextYAlignment.Top

	UIPadding_5.Parent = ID
	UIPadding_5.PaddingLeft = UDim.new(0, 10)
	UIPadding_5.PaddingTop = UDim.new(0, -3)

	UserLife.Name = "UserLife"
	UserLife.Parent = Content
	UserLife.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserLife.BackgroundTransparency = 1.000
	UserLife.BorderColor3 = Color3.fromRGB(0, 0, 0)
	UserLife.BorderSizePixel = 0
	UserLife.Position = UDim2.new(0, 0, 0.024390243, 0)
	UserLife.Size = UDim2.new(1, 0, 0, 18)
	UserLife.Font = Font3
	UserLife.Text = "User Life"
	UserLife.TextColor3 = Theme.Text
	UserLife.TextSize = 12.000
	UserLife.TextXAlignment = Enum.TextXAlignment.Left
	UserLife.TextYAlignment = Enum.TextYAlignment.Bottom

	UIPadding_8.Parent = UserLife
	UIPadding_8.PaddingLeft = UDim.new(0, 7)
	
	Life.Name = "Life"
	Life.Parent = Content
	Life.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Life.BackgroundTransparency = 1.000
	Life.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Life.BorderSizePixel = 0
	Life.Position = UDim2.new(0.0216882322, 0, 0.947472453, 0)
	Life.Size = UDim2.new(1, 0, 0, 18)
	Life.Font = Font2
	Life.Text = "0%"
	Life.TextColor3 = Theme.Text
	Life.TextSize = 11.000
	Life.TextXAlignment = Enum.TextXAlignment.Left
	Life.TextYAlignment = Enum.TextYAlignment.Top

	UIPadding_4.Parent = Life
	UIPadding_4.PaddingLeft = UDim.new(0, 10)
	UIPadding_4.PaddingTop = UDim.new(0, -3)

	local onn = false

	User.InputBegan:Connect(function(input, gpe)
		onn = not onn
		DropShadowHolder.Visible = true
		userConfg:TweenSize(UDim2.new(0, 140, 0, 160), Back, Out, Time2, true)
		wait(0.2)
		DropShadow:TweenSize(UDim2.new(1, 47, 1, 47), Back, Out, Time2, true)
		wait(Time1)
		Content.Visible = true
		Topbar.Visible = true
		if onn == false then
			Content.Visible = false
			Topbar.Visible = false
			DropShadow:TweenSize(UDim2.new(1, 0, 1, 0), Back, Out, Time2, true)
			userConfg:TweenSize(UDim2.new(0, 140, 0, 0), Back, Out, Time2, true)
			wait(Time2)
			DropShadowHolder.Visible = false
		end
	end)
	
	-- Atualiza o texto com a porcentagem de vida
	local function updateHealth()
		local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			local healthPercentage = (humanoid.Health / humanoid.MaxHealth) * 100
			Life.Text = string.format("%.0f%%", healthPercentage)
		end
	end

	-- Conectar eventos de saúde
	if player.Character then
		player.Character:WaitForChild("Humanoid").HealthChanged:Connect(updateHealth)
	end

	-- Atualizar quando o personagem é adicionado
	player.CharacterAdded:Connect(function(character)
		character:WaitForChild("Humanoid").HealthChanged:Connect(updateHealth)
	end)

	-- Atualiza a primeira vez
	updateHealth()
	
	local isCreator = false

	for _, creatorId in ipairs(Criadores) do
		if player.UserId == creatorId then
			isCreator = true
			break
		end
	end

	if isCreator then
		Bla.Text = "Devlog"
		ID_2.Text = "Devlog"
	else
		Bla.Text = "User"
		ID_2.Text = "User"
	end

	
	local function updatePlayerName()
		local playerName = player.Name

		-- Verifica se o nome tem mais de 10 letras
		if #playerName > 10 then
			Name.Text = playerName:sub(1, 10) .. "..."
		else
			Name.Text = playerName
		end
	end

	-- Chama a função para atualizar o nome
	updatePlayerName()
	
	local function loadProfileImage(userId)
		local imageUrl = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=420&height=420&format=png"
		
		User.Image = imageUrl
	end

	
	X.InputBegan:Connect(function(input, gpe)
		Search.Text = ""
	end)
	
	loadProfileImage(userId)
	
	local function op()
		local contentSize = UIListLayout_3.AbsoluteContentSize
		Tabs.CanvasSize = UDim2.new(0, contentSize.X, 0, contentSize.Y + 10)
	end
	
	function Library:EditWindow(options)
		options.Title = options.Title
		options.Opacity = options.Opacity
		options.Theme = options.Theme
		options.Wallpaper = options.Wallpaper
		
		if options.Title then
			Title.Text = options.Title
		end
		if options.Opacity == true then
			Main.BackgroundTransparency = 0.080
		else
			Main.BackgroundTransparency = 0
		end
		if options.Wallpaper then
			Main.Image = Theme.Imagem
		else
			Main.Image = ""
		end
		if options.Theme then
			local newTheme = Themes[options.Theme]
		end
	end
	
	local GUI = {}
	
	local Cam = workspace.CurrentCamera
	local hotkey = true

	_G.Aimbot = true
	_G.AimbotButton = true
	_G.TeamCheck = false
	_G.TeamCheckType = "Enemies" -- Pode ser "All", "Friends" ou "Enemies"
	_G.Part = "Head"

	_G.SafePlayer = nil

	_G.WallCheck = false  -- Ativar/Desativar o WallCheck


	local function lookAt(target, eye)
		Cam.CFrame = CFrame.new(target, eye)
	end

	local function isPlayerVisible(player)
		if not _G.WallCheck then
			return true
		end

		local startPos = Cam.CFrame.p
		local endPos = player.Character[_G.Part].Position
		local direction = (endPos - startPos).unit * (endPos - startPos).magnitude
		local ray = Ray.new(startPos, direction)
		local ignoreList = {game.Players.LocalPlayer.Character}

		local hitPart, hitPos = workspace:FindPartOnRayWithIgnoreList(ray, ignoreList)

		return hitPart == nil or hitPart:IsDescendantOf(player.Character) -- Retorna true se não houver obstruções
	end

	local function getClosestVisiblePlayer(trg_part)
		local nearest = nil
		local last = math.huge
		for _, player in pairs(game.Players:GetPlayers()) do
			if player ~= game.Players.LocalPlayer and player.Name ~= _G.SafePlayer and player.Character and player.Character:FindFirstChild(trg_part) then
				local ePos, vis = workspace.CurrentCamera:WorldToViewportPoint(player.Character[trg_part].Position)
				local AccPos = Vector2.new(ePos.x, ePos.y)
				local mousePos = Vector2.new(workspace.CurrentCamera.ViewportSize.x / 2, workspace.CurrentCamera.ViewportSize.y / 2)
				local distance = (AccPos - mousePos).magnitude
				if distance < last and vis and hotkey and distance < 400 then
					if distance < _G.FovRadius then
						if _G.TeamCheck and player.Team ~= game.Players.LocalPlayer.Team then
							if isPlayerVisible(player) then -- Verifica se o jogador está visível
								last = distance
								nearest = player
							end
						elseif not _G.TeamCheck then
							if isPlayerVisible(player) then -- Verifica se o jogador está visível
								last = distance
								nearest = player
							end
						end
					end
				end
			end
		end
		return nearest
	end

	game:GetService("RunService").RenderStepped:Connect(function()
		local closest = getClosestVisiblePlayer(_G.Part)

		if _G.Aimbot and closest and closest.Character:FindFirstChild(_G.Part) then
			lookAt(Cam.CFrame.p, closest.Character:FindFirstChild(_G.Part).Position)
		end
	end)
	
	function GUI:AddTab(Options)
		Options.Title = Options.Title or "Preview Tab"
		Options.Icon = Options.Icon or "http://www.roblox.com/asset/?id=90991999539475"
		
		local Tab = {
			Hover = false,
			Active = false
		}
		
		local Inactive = Instance.new("TextButton")
		local UICorner_8 = Instance.new("UICorner")
		local UIPadding_10 = Instance.new("UIPadding")
		local Icon_3 = Instance.new("ImageLabel")
		local Title_2 = Instance.new("TextLabel")
		local UIPadding_11 = Instance.new("UIPadding")
		local NormalTab = Instance.new("ScrollingFrame")
		local UIPadding_27 = Instance.new("UIPadding")
		local UIListLayout_5 = Instance.new("UIListLayout")
		
		Inactive.Name = "Inactive"
		Inactive.Parent = Tabs
		Inactive.BackgroundColor3  = Theme.Tabs
		Inactive.BackgroundTransparency = 1.000
		Inactive.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Inactive.BorderSizePixel = 0
		Inactive.Size = UDim2.new(1, 0, 0, 25)
		Inactive.Font = Font1
		Inactive.AutoButtonColor = false
		Inactive.Text = Options.Title
		Inactive.TextColor3 = Theme.Text
		Inactive.TextSize = 12.000
		Inactive.TextXAlignment = Enum.TextXAlignment.Left

		UICorner_8.CornerRadius = UDim.new(0, 5)
		UICorner_8.Parent = Inactive

		UIPadding_10.Parent = Inactive
		UIPadding_10.PaddingLeft = UDim.new(0, 26)
		
		local s =Instance.new("UIStroke")
		s.Parent = Inactive
		s.Color  = Theme.TabsThicknes
		s.Thickness = 0
		s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

		Icon_3.Name = "Icon"
		Icon_3.Parent = Inactive
		Icon_3.AnchorPoint = Vector2.new(0, 0.5)
		Icon_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon_3.BackgroundTransparency = 1.000
		Icon_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Icon_3.BorderSizePixel = 0
		Icon_3.Position = UDim2.new(0, -23, 0.5, 0)
		Icon_3.Size = UDim2.new(0, 18, 0, 18)
		Icon_3.Image = Options.Icon
		Icon_3.ImageColor3 = Theme.Image
		
		Title_2.Name = "Title"
		Title_2.Parent = NamePage
		Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title_2.BackgroundTransparency = 1.000
		Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title_2.BorderSizePixel = 0
		Title_2.Size = UDim2.new(0.5, 0, 1, 0)
		Title_2.Font = Font1
		Title_2.Visible = false
		Title_2.Text = Options.Title
		Title_2.TextColor3 = Theme.Text
		Title_2.TextSize = 12.000
		Title_2.TextXAlignment = Enum.TextXAlignment.Left
		
		NormalTab.Name = "NormalTab"
		NormalTab.Parent = ContainerHolder
		NormalTab.AnchorPoint = Vector2.new(0, 1)
		NormalTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		NormalTab.BackgroundTransparency = 1.000
		NormalTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
		NormalTab.BorderSizePixel = 0
		NormalTab.Position = UDim2.new(0, 0, 1, 0)
		NormalTab.Selectable = false
		NormalTab.SelectionGroup = false
		NormalTab.Visible = false
		NormalTab.Size = UDim2.new(1, 0, 1, -40)
		NormalTab.ScrollBarThickness = 0

		UIPadding_27.Parent = NormalTab
		UIPadding_27.PaddingBottom = UDim.new(0, 8)
		UIPadding_27.PaddingLeft = UDim.new(0, 8)
		UIPadding_27.PaddingRight = UDim.new(0, 8)
		UIPadding_27.PaddingTop = UDim.new(0, 8)

		UIListLayout_5.Parent = NormalTab
		UIListLayout_5.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_5.Padding = UDim.new(0, 5)

		UIPadding_11.Parent = Title_2
		UIPadding_11.PaddingLeft = UDim.new(0, 7)
		
		if uis.TouchEnabled then
			NormalTab.ScrollBarThickness = 5
		else
			NormalTab.ScrollBarThickness = 0
		end
		
		local function UpdateCanvasSize()
			local contentSize = UIListLayout_5.AbsoluteContentSize
			NormalTab.CanvasSize = UDim2.new(0, contentSize.X, 0, contentSize.Y + 10)
		end

		Inactive:GetPropertyChangedSignal("AbsoluteSize"):Connect(op)
		op()

		-- Eventos de hover
		Inactive.MouseEnter:Connect(function()
			Tab.Hover = true
			if not Tab.Active then
				Inactive.BackgroundTransparency = Theme.TabsOpacity
			end
		end)

		Inactive.MouseLeave:Connect(function()
			Tab.Hover = false
			if not Tab.Active then
				Inactive.BackgroundTransparency = 1.000
			end
		end)

		-- Detectar clique com InputBegan
		Inactive.InputBegan:Connect(function(input, gpe)
			if Tab.Hover then
				Tab:Activate()
			end
		end)

		-- Funções para ativar e desativar abas
		function Tab:Activate()
			if not Tab.Active then
				if GUI.CurrentTab ~= nil then
					GUI.CurrentTab:Deactivate()
				end
				Tab.Active = true
				Inactive.BackgroundTransparency = Theme.TabsOpacity
				s.Thickness = 0.8
				NormalTab.Visible = true
				Title_2.Visible = true
				GUI.CurrentTab = Tab
			end
		end

		function Tab:Deactivate()
			if Tab.Active then
				Tab.Active = false
				Tab.Hover = false
				Inactive.BackgroundTransparency = 1.000
				s.Thickness = 0
				NormalTab.Visible = false
				Title_2.Visible = false
			end
		end

		-- Ativar a primeira aba ao ser criada
		if GUI.CurrentTab == nil then
			GUI.CurrentTab = Tab
			Tab:Activate()
		end
		
		function Tab:EditTab(options)
			options.Title = options.Title or Options.Title
			options.Icon = options.Icon or Options.Icon
			
			if options.Title then
				Inactive.Text = options.Title or Options.Title
			end
			if options.Icon then
				Icon_3.Image = options.Icon or Options.Icon
			end
		end
		
		function GUI:AddLine()
			local Line = Instance.new("Frame")
			
			local line = {}
			
			Line.Name = "Line"
			Line.Parent = Tabs
			Line.AnchorPoint = Vector2.new(0, 1)
			Line.BackgroundColor3  = Theme.Lines
			Line.BackgroundTransparency = 0.080
			Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Line.BorderSizePixel = 0
			Line.Position = UDim2.new(0, 0, 1, 0)
			Line.Size = UDim2.new(1, 0, 0, 1)
			
			return line
		end
		
		function Tab:AddButton(Options)
			Options.Title = Options.Title or "Preview Button"
			Options.Callback = Options.Callback or function() end
			
			local Button = {}
			
			local Button_3 = Instance.new("Frame")
			local UICorner_22 = Instance.new("UICorner")
			local UIPadding_28 = Instance.new("UIPadding")
			local Title_8 = Instance.new("TextButton")
			local UIPadding_29 = Instance.new("UIPadding")
			local Icon_8 = Instance.new("ImageLabel")
			
			Button_3.Name = "Button"
			Button_3.Parent = NormalTab
			Button_3.Active = true
			Button_3.BackgroundColor3 = Theme.Options
			Button_3.BackgroundTransparency = 0.400
			Button_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Button_3.BorderSizePixel = 0
			Button_3.Selectable = true
			Button_3.Size = UDim2.new(1, 0, 0, 27)
			
			local s =Instance.new("UIStroke")
			s.Parent = Button_3
			s.Color  = Theme.UiStroke
			s.Thickness = 0.8
			s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

			UICorner_22.CornerRadius = UDim.new(0, 5)
			UICorner_22.Parent = Button_3

			UIPadding_28.Parent = Button_3
			UIPadding_28.PaddingLeft = UDim.new(0, 7)
			UIPadding_28.PaddingRight = UDim.new(0, 7)

			Title_8.Name = "Title"
			Title_8.Parent = Button_3
			Title_8.AnchorPoint = Vector2.new(0, 0.5)
			Title_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title_8.BackgroundTransparency = 1.000
			Title_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title_8.BorderSizePixel = 0
			Title_8.Position = UDim2.new(0, 0, 0.5, 0)
			Title_8.Size = UDim2.new(1, 0, 0, 20)
			Title_8.AutoButtonColor = false
			Title_8.Font = Font1
			Title_8.Text = Options.Title
			Title_8.TextColor3 = Theme.Text
			Title_8.TextSize = 12.000
			Title_8.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding_29.Parent = Title_8
			UIPadding_29.PaddingLeft = UDim.new(0, 3)

			Icon_8.Name = "Icon"
			Icon_8.Parent = Title_8
			Icon_8.AnchorPoint = Vector2.new(1, 0.5)
			Icon_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Icon_8.BackgroundTransparency = 1.000
			Icon_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Icon_8.BorderSizePixel = 0
			Icon_8.Position = UDim2.new(1, 0, 0.5, 0)
			Icon_8.Size = UDim2.new(0, 18, 0, 18)
			Icon_8.Image = "rbxassetid://3944703587"
			Icon_8.ImageColor3 = Theme.Image
			
			Button_3:GetPropertyChangedSignal("AbsoluteSize"):Connect(UpdateCanvasSize)
			UpdateCanvasSize()
			
			Title_8.MouseButton1Click:Connect(function()
				Options.Callback()
			end)
			
			Search:GetPropertyChangedSignal("Text"):Connect(function()
				local searchTerm = Search.Text:lower()

				if searchTerm == "" or string.lower(Options.Title):find(searchTerm) then
					Tab:Activate()
				else
					Tab:Deactivate()
				end
			end)
			
			return Button
		end
		
		function Tab:AddSlider(Options)
			Options.Title = Options.Title or "Preview Slider"
			Options.Placeholder = Options.Placeholder or "Bananas"
			Options.Min = Options.Min or 0
			Options.Max = Options.Max or 100
			Options.Default = Options.Default or 50
			Options.Callback = Options.Callback or function() end
			
			local Slider = {}
			
			local Slider_2 = Instance.new("Frame")
			local UICorner_23 = Instance.new("UICorner")
			local Title_9 = Instance.new("TextLabel")
			local UIPadding_30 = Instance.new("UIPadding")
			local Value_2 = Instance.new("TextBox")
			local UIPadding_31 = Instance.new("UIPadding")
			local UIPadding_32 = Instance.new("UIPadding")
			local BackSlider_2 = Instance.new("TextButton")
			local UICorner_24 = Instance.new("UICorner")
			local Draggable_2 = Instance.new("Frame")
			local UICorner_25 = Instance.new("UICorner")
			local Bananas_2 = Instance.new("TextLabel")
			local UIPadding_33 = Instance.new("UIPadding")
			
			Slider_2.Name = "Slider"
			Slider_2.Parent = NormalTab
			Slider_2.BackgroundColor3 = Theme.Options
			Slider_2.BackgroundTransparency = 0.400
			Slider_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Slider_2.BorderSizePixel = 0
			Slider_2.Size = UDim2.new(1, 0, 0, 60)

			UICorner_23.CornerRadius = UDim.new(0, 5)
			UICorner_23.Parent = Slider_2
			
			local s =Instance.new("UIStroke")
			s.Parent = Slider_2
			s.Color  = Theme.UiStroke
			s.Thickness = 0.8
			s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

			Title_9.Name = "Title"
			Title_9.Parent = Slider_2
			Title_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title_9.BackgroundTransparency = 1.000
			Title_9.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title_9.BorderSizePixel = 0
			Title_9.Size = UDim2.new(0.5, 0, 0, 20)
			Title_9.Font = Font1
			Title_9.Text = Options.Title
			Title_9.TextColor3 = Theme.Text
			Title_9.TextSize = 12.000
			Title_9.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding_30.Parent = Title_9
			UIPadding_30.PaddingLeft = UDim.new(0, 3)

			Value_2.Name = "Value"
			Value_2.Parent = Slider_2
			Value_2.AnchorPoint = Vector2.new(1, 0)
			Value_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Value_2.BackgroundTransparency = 1.000
			Value_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Value_2.BorderSizePixel = 0
			Value_2.Position = UDim2.new(1, 0, 0, 0)
			Value_2.Size = UDim2.new(0.242857143, 0, 0, 20)
			Value_2.Font = Font1
			Value_2.TextWrapped = true
			Value_2.Text = "50"
			Value_2.PlaceholderText = ""
			Value_2.TextColor3 = Theme.Text
			Value_2.TextSize = 12.000
			Value_2.TextXAlignment = Enum.TextXAlignment.Right

			UIPadding_31.Parent = Value_2
			UIPadding_31.PaddingRight = UDim.new(0, 4)

			UIPadding_32.Parent = Slider_2
			UIPadding_32.PaddingLeft = UDim.new(0, 4)
			UIPadding_32.PaddingRight = UDim.new(0, 4)
			UIPadding_32.PaddingTop = UDim.new(0, 4)

			BackSlider_2.Name = "BackSlider"
			BackSlider_2.Parent = Slider_2
			BackSlider_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			BackSlider_2.BackgroundTransparency = 0.080
			BackSlider_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			BackSlider_2.BorderSizePixel = 0
			BackSlider_2.Text = ""
			BackSlider_2.AutoButtonColor = false
			BackSlider_2.Position = UDim2.new(0, 0, 0, 25)
			BackSlider_2.Size = UDim2.new(1, 0, 0, 25)

			UICorner_24.CornerRadius = UDim.new(0, 5)
			UICorner_24.Parent = BackSlider_2

			Draggable_2.Name = "Draggable"
			Draggable_2.Parent = BackSlider_2
			Draggable_2.BackgroundColor3 = Theme.Draggable
			Draggable_2.BackgroundTransparency = 0.080
			Draggable_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Draggable_2.BorderSizePixel = 0
			Draggable_2.Size = UDim2.new(0.5, 0, 0, 25)

			UICorner_25.CornerRadius = UDim.new(0, 5)
			UICorner_25.Parent = Draggable_2

			Bananas_2.Name = "Bananas"
			Bananas_2.Parent = Draggable_2
			Bananas_2.AnchorPoint = Vector2.new(0, 0.5)
			Bananas_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Bananas_2.BackgroundTransparency = 1.000
			Bananas_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Bananas_2.BorderSizePixel = 0
			Bananas_2.Position = UDim2.new(0, 0, 0.5, 0)
			Bananas_2.Size = UDim2.new(0.5, 0, 0, 20)
			Bananas_2.Font = Font1
			Bananas_2.Font = Enum.Font.SourceSansBold
			Bananas_2.Text = Options.Placeholder
			Bananas_2.TextColor3 = Theme.TextBananas
			Bananas_2.TextSize = 15.000
			Bananas_2.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding_33.Parent = Bananas_2
			UIPadding_33.PaddingLeft = UDim.new(0, 3)
			
			Slider_2:GetPropertyChangedSignal("AbsoluteSize"):Connect(UpdateCanvasSize)
			UpdateCanvasSize()
			
			-- Função para atualizar o valor do Slider
			local lastValue = nil

			local function UpdateSliderValue()
				local sliderValue = math.clamp(Draggable_2.Size.X.Scale * (Options.Max - Options.Min) + Options.Min, Options.Min, Options.Max)
				local roundedValue = math.floor(sliderValue)

				-- Verifica se o valor arredondado mudou
				if roundedValue ~= lastValue then
					lastValue = roundedValue
					Value_2.Text = tostring(roundedValue)
					Options.Callback(roundedValue)
				end
			end

			-- Função para ajustar o tamanho do "Draggable"
			local function SetSliderSize(newSize)
				local clampedSize = math.clamp(newSize, 0, 1)
				Draggable_2.Size = UDim2.new(clampedSize, 0, 1, 0)
				UpdateSliderValue()
			end

			-- Variáveis para controle de arrasto
			local dragging = false
			local startDragPosition = 0

			-- Função que lida com o início do arrasto (Clique ou Toque)
			local function startDragging(input)
				dragging = true
				startDragPosition = (input.Position and input.Position.X) or input.Position.X -- Se input.Position estiver disponível (mouse), use, caso contrário, use input.Position.X (toque)
			end

			-- Função que lida com o movimento do arrasto
			local function updateDragging(input)
				if dragging then
					local delta = input.Position.X - startDragPosition
					local newSize = Draggable_2.Size.X.Scale + (delta / BackSlider_2.AbsoluteSize.X)
					SetSliderSize(newSize)
					startDragPosition = input.Position.X
				end
			end

			-- Função que lida com o fim do arrasto
			local function stopDragging(input)
				if dragging then
					dragging = false
				end
			end

			-- Conexões para eventos de entrada (mouse e toque)
			BackSlider_2.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					startDragging(input)
				end
			end)

			-- Atualiza a posição durante o arrasto (mouse ou toque)
			game:GetService("UserInputService").InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					updateDragging(input)
				end
			end)

			-- Finaliza o arrasto quando o botão do mouse ou o toque é liberado
			game:GetService("UserInputService").InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					stopDragging(input)
				end
			end)

			-- Função que é chamada quando o valor do TextBox é alterado
			Value_2.FocusLost:Connect(function(enterPressed)
				if enterPressed then
					local newText = Value_2.Text:gsub("[^%d]", "")
					local numberValue = tonumber(newText)

					if not numberValue then
						numberValue = Options.Min
					else
						if numberValue < Options.Min then
							numberValue = Options.Min
						elseif numberValue > Options.Max then
							numberValue = Options.Max
						end
					end

					Value_2.Text = tostring(numberValue)

					local newSize = (numberValue - Options.Min) / (Options.Max - Options.Min)
					SetSliderSize(newSize)
					UpdateSliderValue()
				end
			end)

			-- Configuração inicial do slider
			local initialSize = (Options.Default - Options.Min) / (Options.Max - Options.Min)
			SetSliderSize(initialSize)
			UpdateSliderValue()
			
			return Slider
		end
		
		function Tab:AddToggle(Options)
			Options.Title = Options.Title or "Preview Toggle"
			Options.Default = Options.Default or false
			Options.Callback = Options.Callback or function() end
			
			local Toggle = {}
			local ToggleActive = Options.Default
			
			local Toggle_2 = Instance.new("Frame")
			local UICorner_26 = Instance.new("UICorner")
			local UIPadding_34 = Instance.new("UIPadding")
			local Holder_2 = Instance.new("Frame")
			local UICorner_27 = Instance.new("UICorner")
			local R_3 = Instance.new("Frame")
			local UICorner_28 = Instance.new("UICorner")
			local Title_10 = Instance.new("TextButton")
			local UIPadding_35 = Instance.new("UIPadding")
			
			Toggle_2.Name = "Toggle"
			Toggle_2.Parent = NormalTab
			Toggle_2.Active = true
			Toggle_2.BackgroundColor3 = Theme.Options
			Toggle_2.BackgroundTransparency = 0.400
			Toggle_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Toggle_2.BorderSizePixel = 0
			Toggle_2.Selectable = true
			Toggle_2.Size = UDim2.new(1, 0, 0, 27)

			UICorner_26.CornerRadius = UDim.new(0, 5)
			UICorner_26.Parent = Toggle_2

			UIPadding_34.Parent = Toggle_2
			UIPadding_34.PaddingLeft = UDim.new(0, 7)
			UIPadding_34.PaddingRight = UDim.new(0, 4)
			
			local s =Instance.new("UIStroke")
			s.Parent = Toggle_2
			s.Color  = Theme.UiStroke
			s.Thickness = 0.8
			s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			
			Holder_2.Name = "Holder"
			Holder_2.Parent = Toggle_2
			Holder_2.AnchorPoint = Vector2.new(1, 0.5)
			Holder_2.BackgroundColor3 = Theme.TogglesActiveHolder
			Holder_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Holder_2.BorderSizePixel = 0
			Holder_2.Position = UDim2.new(1, 0, 0.5, 0)
			Holder_2.Size = UDim2.new(0, 40, 0, 18)

			UICorner_27.CornerRadius = UDim.new(0, 9999)
			UICorner_27.Parent = Holder_2
			
			local s =Instance.new("UIStroke")
			s.Parent = Holder_2
			s.Color  = Theme.UiStroke
			s.Thickness = 0.8
			s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

			R_3.Name = "R"
			R_3.Parent = Holder_2
			R_3.Active = true
			R_3.AnchorPoint = Vector2.new(0, 0.5)
			R_3.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
			R_3.BackgroundTransparency = 0.080
			R_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
			R_3.BorderSizePixel = 0
			R_3.Position = UDim2.new(-0.064000003, 2, 0.5, 0)
			R_3.Size = UDim2.new(0, 17, 0, 16)

			UICorner_28.CornerRadius = UDim.new(0, 15)
			UICorner_28.Parent = R_3

			Title_10.Name = "Title"
			Title_10.Parent = Toggle_2
			Title_10.AnchorPoint = Vector2.new(0, 0.5)
			Title_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title_10.BackgroundTransparency = 1.000
			Title_10.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title_10.BorderSizePixel = 0
			Title_10.Position = UDim2.new(0, 0, 0.5, 0)
			Title_10.Size = UDim2.new(1, -60, 0, 20)
			Title_10.Font = Font1
			Title_10.AutoButtonColor = false
			Title_10.Text = Options.Title
			Title_10.TextColor3 = Theme.Text
			Title_10.TextSize = 12.000
			Title_10.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding_35.Parent = Title_10
			UIPadding_35.PaddingLeft = UDim.new(0, 3)
			
			Toggle_2:GetPropertyChangedSignal("AbsoluteSize"):Connect(UpdateCanvasSize)
			UpdateCanvasSize()
			
			Options.Callback(Options.Default)
			
			if Options.Default == true then
				R_3.Position = UDim2.new(0.511, 2,0.5, 0)
				Holder_2.BackgroundColor3 = Theme.TogglesInactivelder
				R_3.BackgroundColor3 = Theme.TogglesActiveHolder
			else
				R_3.Position = UDim2.new(-0.064, 2, 0.5, 0)
				Holder_2.BackgroundColor3 = Theme.TogglesActiveHolder
				R_3.BackgroundColor3 = Theme.TogglesInactivelder
			end
			
			Title_10.MouseButton1Click:Connect(function()
				ToggleActive = not ToggleActive
				Options.Callback(ToggleActive)
				if ToggleActive == true then
					R_3:TweenPosition(UDim2.new(0.511, 2,0.5, 0), Back, Out, Time2, true)
					wait(0.3)
					Holder_2.BackgroundColor3 = Theme.TogglesInactivelder
					R_3.BackgroundColor3 = Theme.TogglesActiveHolder
				else
					R_3:TweenPosition(UDim2.new(-0.064, 2, 0.5, 0), Back, Out, Time1, true)
					wait(0.2)
					Holder_2.BackgroundColor3 = Theme.TogglesActiveHolder
					R_3.BackgroundColor3 = Theme.TogglesInactivelder
				end
			end)
			
			Search:GetPropertyChangedSignal("Text"):Connect(function()
				local searchTerm = Search.Text:lower()

				if searchTerm == "" or string.lower(Options.Title):find(searchTerm) then
					Tab:Activate()
				else
					Tab:Deactivate()
				end
			end)
			
			function Toggle:EditToggle(options)
				options.Title = options.Title
				options.Default = options.Default

				if options.Title then
					Title_10.Text = options.Title
				end
				if options.Default then
					ToggleActive = options.Default
					Options.Callback(options.Default)
					R_3:TweenPosition(UDim2.new(0.511, 2,0.5, 0), Back, Out, 0.5, true)
					wait(0.3)
					Holder_2.BackgroundColor3 = Theme.TogglesInactivelder
					R_3.BackgroundColor3 = Theme.TogglesActiveHolder
				else
					ToggleActive = options.Default
					Options.Callback(options.Default)
					R_3:TweenPosition(UDim2.new(-0.064, 2, 0.5, 0), Back, Out, 0.5, true)
					wait(0.2)
					Holder_2.BackgroundColor3 = Theme.TogglesActiveHolder
					R_3.BackgroundColor3 = Theme.TogglesInactivelder
				end
			end

			return Toggle
		end
		
		function Tab:AddDropdown(Options)
			Options.Title = Options.Title or "Preview Dropdown"
			Options.Values = Options.Values or {"Option"}
			Options.Default = Options.Default or "Option"
			Options.Callback = Options.Callback or function() end

			local Drop = {}
			local on = false

			local Dropdown = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local Contenholder = Instance.new("Frame")
			local ScrollFrame = Instance.new("ScrollingFrame")
			local Option = Instance.new("TextLabel")
			local UICorner_2 = Instance.new("UICorner")
			local UIPadding = Instance.new("UIPadding")
			local UIListLayout = Instance.new("UIListLayout")
			local UICorner_5 = Instance.new("UICorner")
			local UIPadding_2 = Instance.new("UIPadding")
			local Title = Instance.new("TextButton")
			local UIPadding_3 = Instance.new("UIPadding")
			local Icon = Instance.new("ImageLabel")

			Dropdown.Name = "Dropdown"
			Dropdown.Parent = NormalTab
			Dropdown.Active = true
			Dropdown.BackgroundColor3 = Theme.Options
			Dropdown.BackgroundTransparency = 0.400
			Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Dropdown.BorderSizePixel = 0
			Dropdown.Selectable = true
			Dropdown.Size = UDim2.new(1, 0, 0, 27)

			UICorner.CornerRadius = UDim.new(0, 5)
			UICorner.Parent = Dropdown

			local s =Instance.new("UIStroke")
			s.Parent = Dropdown
			s.Color  = Theme.UiStroke
			s.Thickness = 0.8
			s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

			Contenholder.Name = "Contenholder"
			Contenholder.Parent = Dropdown
			Contenholder.AnchorPoint = Vector2.new(0, 1)
			Contenholder.BackgroundColor3 = Theme.Main
			Contenholder.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Contenholder.BorderSizePixel = 0
			Contenholder.Position = UDim2.new(0, 0, 1, 0)
			Contenholder.Size = UDim2.new(1, 0, 1, -22)
			Contenholder.Visible = false

			local s =Instance.new("UIStroke")
			s.Parent = Contenholder
			s.Color  = Theme.UiStroke
			s.Thickness = 0.8
			s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

			ScrollFrame.Name = "ScrollFrame"
			ScrollFrame.Parent = Contenholder
			ScrollFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ScrollFrame.BackgroundTransparency = 1.000
			ScrollFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ScrollFrame.BorderSizePixel = 0
			ScrollFrame.Selectable = false
			ScrollFrame.Size = UDim2.new(1, 0, 1, 0)
			ScrollFrame.ScrollBarThickness = 0

			UIPadding.Parent = ScrollFrame
			UIPadding.PaddingBottom = UDim.new(0, 7)
			UIPadding.PaddingLeft = UDim.new(0, 7)
			UIPadding.PaddingRight = UDim.new(0, 7)
			UIPadding.PaddingTop = UDim.new(0, 7)

			UIListLayout.Parent = ScrollFrame
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 5)

			UICorner_5.CornerRadius = UDim.new(0, 5)
			UICorner_5.Parent = Contenholder

			UIPadding_2.Parent = Dropdown
			UIPadding_2.PaddingBottom = UDim.new(0, 7)
			UIPadding_2.PaddingLeft = UDim.new(0, 7)
			UIPadding_2.PaddingRight = UDim.new(0, 7)
			UIPadding_2.PaddingTop = UDim.new(0, 7)

			Title.Name = "Title"
			Title.Parent = Dropdown
			Title.Active = false
			Title.AnchorPoint = Vector2.new(0, 0.5)
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title.BorderSizePixel = 0
			Title.Position = UDim2.new(0, 0, 0, 7)
			Title.Selectable = false
			Title.Size = UDim2.new(1, 0, 0, 20)
			Title.Font = Font1
			Title.AutoButtonColor = false
			Title.Text = "Dropdown"
			Title.TextColor3 = Theme.Text
			Title.TextSize = 10.000
			Title.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding_3.Parent = Title
			UIPadding_3.PaddingLeft = UDim.new(0, 3)

			Icon.Name = "Icon"
			Icon.Parent = Dropdown
			Icon.AnchorPoint = Vector2.new(1, 0.5)
			Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Icon.BackgroundTransparency = 1.000
			Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Icon.BorderSizePixel = 0
			Icon.Position = UDim2.new(1, 0, 0, 7)
			Icon.Size = UDim2.new(0, 18, 0, 18)
			Icon.Image = "http://www.roblox.com/asset/?id=86625499622821"
			Icon.ImageColor3 = Theme.Image

			local function upd()
				local contentSize = UIListLayout.AbsoluteContentSize
				ScrollFrame.CanvasSize = UDim2.new(0, contentSize.X, 0, contentSize.Y + 10)
			end
			
			if uis.TouchEnabled then
				ScrollFrame.ScrollBarThickness = 5
			else
				ScrollFrame.ScrollBarThickness = 0
			end

			local function addOptions()
				for _, value in ipairs(Options.Values) do
					local Option = Instance.new("TextButton")
					Option.Name = value
					Option.Parent = ScrollFrame
					Option.BackgroundColor3 = Theme.Options
					Option.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Option.BorderSizePixel = 0
					Option.Size = UDim2.new(1, 0, 0, 20)
					Option.Font = Font1
					Option.Text = value
					Option.AutoButtonColor = false
					Option.TextColor3 = Theme.Text
					Option.TextSize = 11.000
					Option.TextWrapped = true

					UICorner_2.CornerRadius = UDim.new(0, 5)
					UICorner_2.Parent = Option

					local s =Instance.new("UIStroke")
					s.Parent = Option
					s.Color  = Theme.UiStroke
					s.Thickness = 0.8
					s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

					Option.MouseEnter:Connect(function()
						Option.BackgroundColor3 = Theme.OptionsDrop
						Option.TextColor3 = Theme.Text
					end)

					Option.MouseLeave:Connect(function()
						Option.BackgroundColor3 = Theme.Options
						Option.TextColor3 = Theme.Text
					end)

					Option.MouseButton1Click:Connect(function()
						Options.Callback(value)
						Title.Text = value
						on = false
						Dropdown:TweenSize(UDim2.new(1, 0, 0, 27), Back, Out, Time2, true)
						wait(Time1)
						Contenholder.Visible = on
					end)
					Option:GetPropertyChangedSignal("AbsoluteSize"):Connect(upd)
					upd()
				end
			end

			addOptions()

			Dropdown:GetPropertyChangedSignal("AbsoluteSize"):Connect(UpdateCanvasSize)
			UpdateCanvasSize()

			Title.MouseButton1Click:Connect(function()
				on = not on
				Dropdown:TweenSize(UDim2.new(1, 0, 0, 120), Back, Out, Time2, true)
				Contenholder.Visible = true
				if on == false then
					Dropdown:TweenSize(UDim2.new(1, 0, 0, 27), Back, Out, Time2, true)
					wait(Time1)
					Contenholder.Visible = on
				end
			end)


			function Drop:SetEditDropdown(Op)
				Op.Title = Op.Title or Options.Title
				Op.Values = Op.Values or Options.Values
				Op.Default = Op.Default or Options.Default

				if Op.Title then
					Title.Text = Op.Title
					Options.Callback(Op.Default or Options.Default)
				end
				if Op.Values then
					Options.Values = Op.Values

					-- Limpa as opções existentes
					for _, child in ipairs(ScrollFrame:GetChildren()) do
						if child:IsA("TextLabel") then
							child:Destroy()
						end
					end
					addOptions()
				end
			end

			return Drop
		end
		
		function Tab:AddInput(Options)
			Options.Title = Options.Title or "Input"
			Options.AddNumber = Options.AddNumber or 1
			Options.Default = Options.Default or 17
			Options.Callback = Options.Callback or function() end

			local inputBt = {}
			local SomaNumber = Options.AddNumber
			local lastNumber = Options.Default -- Guarda o último número

			local Input = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local UIPadding = Instance.new("UIPadding")
			local Title = Instance.new("TextBox")
			local UIPadding_2 = Instance.new("UIPadding")
			local HolderButtons = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local Down = Instance.new("ImageButton")
			local UIListLayout = Instance.new("UIListLayout")
			local Line = Instance.new("Frame")
			local Up = Instance.new("ImageButton")

			-- Configurações do Frame Input
			Input.Name = "Input"
			Input.Parent = NormalTab
			Input.Active = true
			Input.BackgroundColor3 = Theme.Options
			Input.BackgroundTransparency = 0.400
			Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Input.BorderSizePixel = 0
			Input.Selectable = true
			Input.Size = UDim2.new(1, 0, 0, 27)

			UICorner.CornerRadius = UDim.new(0, 5)
			UICorner.Parent = Input

			UIPadding.Parent = Input
			UIPadding.PaddingLeft = UDim.new(0, 7)
			UIPadding.PaddingRight = UDim.new(0, 7)

			local s = Instance.new("UIStroke")
			s.Parent = Input
			s.Color = Theme.UiStroke
			s.Thickness = 0.8
			s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

			-- Configurações do TextBox Title
			Title.Name = "Title"
			Title.Parent = Input
			Title.Active = true
			Title.AnchorPoint = Vector2.new(0, 0.5)
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title.BorderSizePixel = 0
			Title.Position = UDim2.new(0, 0, 0.5, 0)
			Title.Selectable = true
			Title.Size = UDim2.new(0.5, 0, 0, 20)
			Title.Font = Font1
			Title.TextWrapped = true
			Title.PlaceholderColor3 = Theme.Text
			Title.Text = tostring(Options.Default)
			Title.TextColor3 = Theme.Text
			Title.TextSize = 12.000
			Title.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding_2.Parent = Title
			UIPadding_2.PaddingLeft = UDim.new(0, 3)

			-- Configurações do HolderButtons
			HolderButtons.Name = "HolderButtons"
			HolderButtons.Parent = Input
			HolderButtons.AnchorPoint = Vector2.new(1, 0.5)
			HolderButtons.BackgroundColor3 = Theme.TogglesInactivelder
			HolderButtons.BorderColor3 = Color3.fromRGB(0, 0, 0)
			HolderButtons.BorderSizePixel = 0
			HolderButtons.Position = UDim2.new(1, 0, 0.5, 0)
			HolderButtons.Size = UDim2.new(0, 37, 0, 18)

			UICorner_2.CornerRadius = UDim.new(0, 5)
			UICorner_2.Parent = HolderButtons

			local s = Instance.new("UIStroke")
			s.Parent = HolderButtons
			s.Color = Theme.UiStroke
			s.Thickness = 0.8
			s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

			-- Configurações dos botões Up e Down
			Down.Name = "Down"
			Down.Parent = HolderButtons
			Down.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Down.BackgroundTransparency = 1.000
			Down.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Down.BorderSizePixel = 0
			Down.Size = UDim2.new(0, 18, 0, 18)
			Down.Image = "rbxassetid://7734000129"
			Down.ImageColor3 = Theme.Image

			UIListLayout.Parent = HolderButtons
			UIListLayout.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

			Line.Name = "Line"
			Line.Parent = HolderButtons
			Line.BackgroundColor3 = Theme.Lines
			Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Line.BorderSizePixel = 0
			Line.Size = UDim2.new(0, 1, 1, 0)

			Up.Name = "Up"
			Up.Parent = HolderButtons
			Up.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Up.BackgroundTransparency = 1.000
			Up.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Up.BorderSizePixel = 0
			Up.Size = UDim2.new(0, 18, 0, 18)
			Up.Image = "rbxassetid://7734042071"
			Up.ImageColor3 = Theme.Image

			Input:GetPropertyChangedSignal("AbsoluteSize"):Connect(UpdateCanvasSize)
			UpdateCanvasSize()

			Options.Callback(Options.Default)

			-- Ação para o botão Up
			Up.MouseButton1Click:Connect(function()	
				lastNumber = (tonumber(Title.Text) or lastNumber) + SomaNumber
				Title.Text = tostring(lastNumber)
				Title.PlaceholderText = Options.Title .. " - " .. Title.Text
				Options.Callback(lastNumber)
			end)

			-- Ação para o botão Down
			Down.MouseButton1Click:Connect(function()
				lastNumber = (tonumber(Title.Text) or lastNumber) - SomaNumber
				Title.Text = tostring(lastNumber)
				Title.PlaceholderText = Options.Title .. " - " .. Title.Text
				Options.Callback(lastNumber)
			end)

			-- Ação para pressionar Enter
			Title.FocusLost:Connect(function(enterPressed)
				if enterPressed then
					local text = Title.Text
					if text == "" then
						Title.Text = tostring(lastNumber) -- Preenche com o último número se estiver vazio
					elseif not text:match("^%d*$") then
						Title.Text = tostring(lastNumber) -- Restaura o último número se não for válido
					else
						lastNumber = tonumber(text) -- Atualiza o último número se válido
						Title.PlaceholderText = Options.Title .. " - " .. text
					end
					Options.Callback(lastNumber) -- Chama o callback com o último número
				end
			end)

			return inputBt
		end

		function Tab:AddKeyBind(Options)
			Options.Title = Options.Title or "Preview Keybind"
			Options.Default = Options.Default or "K"
			Options.Callback = Options.Callback or function() end

			local KeyBind = {}

			local Keybind = Instance.new("Frame")
			local UIPadding = Instance.new("UIPadding")
			local Title = Instance.new("TextLabel")
			local UIPadding_2 = Instance.new("UIPadding")
			local Input = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local InputKey = Instance.new("TextBox")
			local UICorner_2 = Instance.new("UICorner")

			Keybind.Name = "Keybind"
			Keybind.Parent = NormalTab
			Keybind.Active = true
			Keybind.BackgroundColor3 = Theme.Options
			Keybind.BackgroundTransparency = 0.400
			Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Keybind.BorderSizePixel = 0
			Keybind.Selectable = true
			Keybind.Size = UDim2.new(1, 0, 0, 27)

			UIPadding.Parent = Keybind
			UIPadding.PaddingLeft = UDim.new(0, 7)
			UIPadding.PaddingRight = UDim.new(0, 7)

			local s = Instance.new("UIStroke")
			s.Parent = Keybind
			s.Color = Theme.UiStroke
			s.Thickness = 0.8
			s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

			Title.Name = "Title"
			Title.Parent = Keybind
			Title.AnchorPoint = Vector2.new(0, 0.5)
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title.BorderSizePixel = 0
			Title.Position = UDim2.new(0, 0, 0.5, 0)
			Title.Size = UDim2.new(1, -60, 0, 20)
			Title.Font = Font1
			Title.Text = Options.Title
			Title.TextColor3 = Theme.Text
			Title.TextSize = 12.000
			Title.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding_2.Parent = Title
			UIPadding_2.PaddingLeft = UDim.new(0, 3)

			Input.Name = "Input"
			Input.Parent = Keybind
			Input.AnchorPoint = Vector2.new(1, 0.5)
			Input.BackgroundColor3 = Theme.Options
			Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Input.BorderSizePixel = 0
			Input.Position = UDim2.new(1, 0, 0.5, 0)
			Input.Size = UDim2.new(0, 40, 0, 20)

			UICorner.CornerRadius = UDim.new(0, 5)
			UICorner.Parent = Input

			local s = Instance.new("UIStroke")
			s.Parent = Input
			s.Color = Theme.UiStroke
			s.Thickness = 0.8
			s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

			InputKey.Name = "InputKey"
			InputKey.Parent = Input
			InputKey.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			InputKey.BackgroundTransparency = 1.000
			InputKey.BorderColor3 = Color3.fromRGB(0, 0, 0)
			InputKey.BorderSizePixel = 0
			InputKey.Size = UDim2.new(1, 0, 1, 0)
			InputKey.Font = Font1
			InputKey.PlaceholderText = "[...]"
			InputKey.Text = Options.Default
			InputKey.PlaceholderColor3 = Theme.TextPlaceHolder
			InputKey.TextColor3 = Theme.Text
			InputKey.TextSize = 14.000
			InputKey.TextWrapped = true

			UICorner_2.CornerRadius = UDim.new(0, 5)
			UICorner_2.Parent = Keybind

			Keybind:GetPropertyChangedSignal("AbsoluteSize"):Connect(UpdateCanvasSize)
			UpdateCanvasSize()

			local lastValue = InputKey.Text -- Armazena o último valor válido

			Options.Callback(Options.Default)

			InputKey.FocusLost:Connect(function(enterPressed)
				if enterPressed then
					if InputKey.Text == "" then
						InputKey.Text = lastValue -- Restaura o último valor válido
						return
					end

					local input = InputKey.Text
					local filtered = input:upper() -- Converte para maiúscula

					-- Permite apenas a primeira letra
					if filtered:len() > 1 then
						filtered = filtered:sub(1, 1)
					end

					-- Verifica se é uma letra
					if not filtered:match("%a") then
						filtered = "" -- Limpa o texto se não for uma letra
					end

					-- Atualiza o TextBox se necessário
					if InputKey.Text ~= filtered then
						InputKey.Text = filtered -- Atualiza o TextBox
						InputKey.CursorPosition = InputKey.Text:len() -- Move o cursor para o final
					end

					-- Chama o callback apenas se o valor mudou
					if lastValue ~= filtered then
						lastValue = filtered
						Options.Callback(filtered)
					end
				end
			end)

			-- Adiciona um evento para o input em tempo real
			InputKey:GetPropertyChangedSignal("Text"):Connect(function()
				local input = InputKey.Text
				local filtered = input:upper():sub(1, 1) -- Permite apenas a primeira letra

				-- Verifica se é uma letra
				if not filtered:match("%a") then
					filtered = "" -- Limpa o texto se não for uma letra
				end

				-- Atualiza o TextBox se necessário
				if InputKey.Text ~= filtered then
					InputKey.Text = filtered -- Atualiza o TextBox
					InputKey.CursorPosition = InputKey.Text:len() -- Move o cursor para o final
				end
			end)


			return KeyBind
		end
		
		function Tab:AddEditText(Options)
			Options.Title = Options.Title or "EditText"
			Options.Default = Options.Default or "AKAIDO"
			Options.Callback = Options.Callback or function() end

			local EditText = {}

			local Keybind = Instance.new("Frame")
			local UIPadding = Instance.new("UIPadding")
			local Title = Instance.new("TextLabel")
			local UIPadding_2 = Instance.new("UIPadding")
			local Input = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local InputKey = Instance.new("TextBox")
			local UICorner_2 = Instance.new("UICorner")

			Keybind.Name = "Keybind"
			Keybind.Parent = NormalTab
			Keybind.Active = true
			Keybind.BackgroundColor3 = Theme.Options
			Keybind.BackgroundTransparency = 0.400
			Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Keybind.BorderSizePixel = 0
			Keybind.Selectable = true
			Keybind.Size = UDim2.new(1, 0, 0, 27)

			UIPadding.Parent = Keybind
			UIPadding.PaddingLeft = UDim.new(0, 7)
			UIPadding.PaddingRight = UDim.new(0, 7)

			local s = Instance.new("UIStroke")
			s.Parent = Keybind
			s.Color = Theme.UiStroke
			s.Thickness = 0.8
			s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

			Title.Name = "Title"
			Title.Parent = Keybind
			Title.AnchorPoint = Vector2.new(0, 0.5)
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title.BorderSizePixel = 0
			Title.Position = UDim2.new(0, 0, 0.5, 0)
			Title.Size = UDim2.new(1, -60, 0, 20)
			Title.Font = Font1
			Title.Text = Options.Title
			Title.TextColor3 = Theme.Text
			Title.TextSize = 11.000
			Title.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding_2.Parent = Title
			UIPadding_2.PaddingLeft = UDim.new(0, 3)

			Input.Name = "Input"
			Input.Parent = Keybind
			Input.AnchorPoint = Vector2.new(1, 0.5)
			Input.BackgroundColor3 = Theme.Options
			Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Input.BorderSizePixel = 0
			Input.Position = UDim2.new(1, 0, 0.5, 0)
			Input.Size = UDim2.new(0, 40, 0, 20)

			UICorner.CornerRadius = UDim.new(0, 5)
			UICorner.Parent = Input

			local s = Instance.new("UIStroke")
			s.Parent = Input
			s.Color = Theme.UiStroke
			s.Thickness = 0.8
			s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

			InputKey.Name = "InputKey"
			InputKey.Parent = Input
			InputKey.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			InputKey.BackgroundTransparency = 1.000
			InputKey.BorderColor3 = Color3.fromRGB(0, 0, 0)
			InputKey.BorderSizePixel = 0
			InputKey.Size = UDim2.new(1, 0, 1, 0)
			InputKey.Font = Font1
			InputKey.PlaceholderText = "[...]"
			InputKey.Text = Options.Default
			InputKey.PlaceholderColor3 = Theme.TextPlaceHolder
			InputKey.TextColor3 = Theme.Text
			InputKey.TextSize = 11.000
			InputKey.TextWrapped = true

			UICorner_2.CornerRadius = UDim.new(0, 5)
			UICorner_2.Parent = Keybind

			Keybind:GetPropertyChangedSignal("AbsoluteSize"):Connect(UpdateCanvasSize)
			UpdateCanvasSize()

			local lastValue = InputKey.Text -- Armazena o último valor válido

			Options.Callback(Options.Default)

			InputKey.FocusLost:Connect(function(enterPressed)
				if enterPressed then
					if InputKey.Text == "" then
						InputKey.Text = lastValue -- Restaura o último valor válido
						return
					end
					Options.Callback(InputKey.Text)
				end
			end)

			InputKey.MouseEnter:Connect(function()
				Input:TweenSize(UDim2.new(0, 70, 0, 20), Back, Out, Time2, true)
				InputKey.TextSize = 14.000
			end)

			InputKey.MouseLeave:Connect(function()
				Input:TweenSize(UDim2.new(0, 40, 0, 20), Back, Out, Time2, true)
				InputKey.TextSize = 11.000
			end)

			return EditText
		end
		
		return Tab
	end
	
	function GUI:AddPage(Options)
		Options.Title = Options.Title or "Preview Page"
		Options.Icon = Options.Icon or "http://www.roblox.com/asset/?id=90991999539475"

		local TAB = {
			Hover = false,
			Active = false
		}

		local Inactive = Instance.new("TextButton")
		local UICorner_8 = Instance.new("UICorner")
		local UIPadding_10 = Instance.new("UIPadding")
		local Icon_3 = Instance.new("ImageLabel")
		local UIPadding_11 = Instance.new("UIPadding")
		local PageHolder = Instance.new("ScrollingFrame")
		local UIPadding_12 = Instance.new("UIPadding")

		Inactive.Name = "Inactive"
		Inactive.Parent = Tabs
		Inactive.BackgroundColor3 = Theme.Tabs
		Inactive.BackgroundTransparency = 1.000
		Inactive.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Inactive.BorderSizePixel = 0
		Inactive.Size = UDim2.new(1, 0, 0, 25)
		Inactive.Font = Font1
		Inactive.AutoButtonColor = false
		Inactive.Text = Options.Title
		Inactive.TextColor3 = Theme.Text
		Inactive.TextSize = 12.000
		Inactive.TextXAlignment = Enum.TextXAlignment.Left

		UICorner_8.CornerRadius = UDim.new(0, 5)
		UICorner_8.Parent = Inactive

		UIPadding_10.Parent = Inactive
		UIPadding_10.PaddingLeft = UDim.new(0, 26)
		
		local s =Instance.new("UIStroke")
		s.Parent = Inactive
		s.Color  = Theme.TabsThicknes
		s.Thickness = 0
		s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

		Icon_3.Name = "Icon"
		Icon_3.Parent = Inactive
		Icon_3.AnchorPoint = Vector2.new(0, 0.5)
		Icon_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon_3.BackgroundTransparency = 1.000
		Icon_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Icon_3.BorderSizePixel = 0
		Icon_3.Position = UDim2.new(0, -23, 0.5, 0)
		Icon_3.Size = UDim2.new(0, 18, 0, 18)
		Icon_3.Image = Options.Icon
		Icon_3.ImageColor3 = Theme.Image

		PageHolder.Name = "PageHolder"
		PageHolder.Parent = ContainerHolder
		PageHolder.AnchorPoint = Vector2.new(0, 1)
		PageHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		PageHolder.BackgroundTransparency = 1.000
		PageHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
		PageHolder.BorderSizePixel = 0
		PageHolder.Position = UDim2.new(0, 0, 1, 0)
		PageHolder.Selectable = false
		PageHolder.Size = UDim2.new(1, 0, 1, -40)
		PageHolder.Visible = false
		PageHolder.ScrollBarThickness = 0

		UIPadding_12.Parent = PageHolder
		UIPadding_12.PaddingBottom = UDim.new(0, 8)
		UIPadding_12.PaddingLeft = UDim.new(0, 8)
		UIPadding_12.PaddingRight = UDim.new(0, 8)
		UIPadding_12.PaddingTop = UDim.new(0, 8)
		
		local Title_2 = Instance.new("TextLabel")

		Title_2.Name = "Title"
		Title_2.Parent = NamePage
		Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title_2.BackgroundTransparency = 1.000
		Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title_2.BorderSizePixel = 0
		Title_2.Size = UDim2.new(0.5, 0, 1, 0)
		Title_2.Font = Font1
		Title_2.Visible = false
		Title_2.Text = Options.Title
		Title_2.TextColor3 = Theme.Text
		Title_2.TextSize = 12.000
		Title_2.TextXAlignment = Enum.TextXAlignment.Left

		UIPadding_11.Parent = Title_2
		UIPadding_11.PaddingLeft = UDim.new(0, 7)

		local UIListLayout = Instance.new("UIListLayout")
		UIListLayout.Parent = PageHolder
		UIListLayout.Wraps = true
		UIListLayout.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 7)
		
		if uis.TouchEnabled then
			PageHolder.ScrollBarThickness = 5
		else
			PageHolder.ScrollBarThickness = 0
		end
		
		-- Update canvas size function
		local function UpdateCanvasSize()
			local contentSize = UIListLayout.AbsoluteContentSize
			PageHolder.CanvasSize = UDim2.new(0, contentSize.X, 0, contentSize.Y + 30) -- Add extra space if needed
		end

		Inactive:GetPropertyChangedSignal("AbsoluteSize"):Connect(op)
		op()

		-- Eventos de hover
		Inactive.MouseEnter:Connect(function()
			TAB.Hover = true
			if not TAB.Active then
				Inactive.BackgroundTransparency = Theme.TabsOpacity
			end
		end)

		Inactive.MouseLeave:Connect(function()
			TAB.Hover = false
			if not TAB.Active then
				Inactive.BackgroundTransparency = 1.000
			end
		end)

		Inactive.MouseButton1Click:Connect(function()
			if TAB.Hover then
				TAB:Activate()
			end
		end)

		-- Funções para ativar e desativar abas
		function TAB:Activate()
			if not TAB.Active then
				if GUI.CurrentTab ~= nil then
					GUI.CurrentTab:Deactivate()
				end
				TAB.Active = true
				Inactive.BackgroundTransparency = Theme.TabsOpacity
				s.Thickness = 0.8
				PageHolder.Visible = true
				Title_2.Visible = true
				GUI.CurrentTab = TAB
			end
		end

		function TAB:Deactivate()
			if TAB.Active then
				TAB.Active = false
				TAB.Hover = false
				Inactive.BackgroundTransparency = 1.000
				s.Thickness = 0
				PageHolder.Visible = false
				Title_2.Visible = false
			end
		end

		-- Ativar a primeira aba ao ser criada
		if GUI.CurrentTab == nil then
			GUI.CurrentTab = TAB
			TAB:Activate()
		end
		
		function TAB:EditTabPage(options)
			options.Title = options.Title or Options.Title
			options.Icon = options.Icon or Options.Icon

			if options.Title then
				Inactive.Text = options.Title or Options.Title
			end
			if options.Icon then
				Icon_3.Image = options.Icon or Options.Icon
			end
		end
		
		function TAB:AddSection(Options)
			Options.Title = Options.Title or "Preview Page"
			Options.Size = Options.Size or 168
			
			local OpenPage = false
			local Section = {}
			
			local SectionPage = Instance.new("Frame")
			local UIGradient = Instance.new("UIGradient")
			local UICorner = Instance.new("UICorner")
			local UICorner_2 = Instance.new("UICorner")
			local Title = Instance.new("TextButton")
			local UIPadding = Instance.new("UIPadding")
			local Close = Instance.new("ImageLabel")
			local Scroll = Instance.new("ScrollingFrame")
			local UIPadding_2 = Instance.new("UIPadding")
			local UIListLayout = Instance.new("UIListLayout")

			--Properties:

			SectionPage.Name = "SectionPage"
			SectionPage.Parent = PageHolder
			SectionPage.BackgroundColor3 = Theme.Section
			SectionPage.BackgroundTransparency = 0.400
			SectionPage.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SectionPage.BorderSizePixel = 0
			SectionPage.Size = UDim2.new(0, 152, 0, 27)
			
			local s =Instance.new("UIStroke")
			s.Parent = SectionPage
			s.Color  = Theme.UiStroke
			s.Thickness = 0.8
			s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

			UICorner_2.CornerRadius = UDim.new(0, 5)
			UICorner_2.Parent = SectionPage

			Title.Name = "Title"
			Title.Parent = SectionPage
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title.BorderSizePixel = 0
			Title.Size = UDim2.new(1, 0, 0, 27)
			Title.Font = Font2
			Title.AutoButtonColor = false
			Title.Text = Options.Title
			Title.TextColor3 = Theme.Text
			Title.TextSize = 12.000
			Title.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding.Parent = Title
			UIPadding.PaddingLeft = UDim.new(0, 7)
			UIPadding.PaddingRight = UDim.new(0, 7)

			Close.Name = "Close"
			Close.Parent = Title
			Close.AnchorPoint = Vector2.new(1, 0.5)
			Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Close.BackgroundTransparency = 1.000
			Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Close.BorderSizePixel = 0
			Close.Position = UDim2.new(1, 0, 0.5, 0)
			Close.Size = UDim2.new(0, 18, 0, 18)
			Close.Image = "rbxassetid://7734042071"
			Close.ImageColor3 = Theme.Image

			Scroll.Name = "Scroll"
			Scroll.Parent = SectionPage
			Scroll.AnchorPoint = Vector2.new(1, 1)
			Scroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Scroll.BackgroundTransparency = 1.000
			Scroll.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Scroll.BorderSizePixel = 0
			Scroll.Position = UDim2.new(1, 0, 1, 0)
			Scroll.Selectable = false
			Scroll.Size = UDim2.new(1, 0, 1, -27)
			Scroll.Visible = false
			Scroll.ScrollBarThickness = 0

			UIPadding_2.Parent = Scroll
			UIPadding_2.PaddingBottom = UDim.new(0, 4)
			UIPadding_2.PaddingLeft = UDim.new(0, 4)
			UIPadding_2.PaddingRight = UDim.new(0, 4)
			UIPadding_2.PaddingTop = UDim.new(0, 4)

			UIListLayout.Parent = Scroll
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 5)
			
			if uis.TouchEnabled then
				Scroll.ScrollBarThickness = 5
			else
				Scroll.ScrollBarThickness = 0
			end
			
			local function up()
				local contentSize = UIListLayout.AbsoluteContentSize
				Scroll.CanvasSize = UDim2.new(0, contentSize.X, 0, contentSize.Y + 30) -- Add extra space if needed
			end
			
			SectionPage:GetPropertyChangedSignal("AbsoluteSize"):Connect(UpdateCanvasSize)
			UpdateCanvasSize()
			
			Title.MouseButton1Click:Connect(function()
				OpenPage = not OpenPage
				SectionPage:TweenSize(UDim2.new(0, 152, 0, Options.Size), Back, Out, Time2, true)
				Close.Image = "rbxassetid://7734000129"
				UpdateCanvasSize()
				Scroll.Visible = true
				if OpenPage == false then
					Close.Image = "rbxassetid://7734042071"
					SectionPage:TweenSize(UDim2.new(0, 152, 0, 27), Back, Out, Time2, true)
					UpdateCanvasSize()
				end
			end)
			
			function Section:AddButton(Options)
				Options.Title = Options.Title or "Preview Button"
				Options.Callback = Options.Callback or function() end

				local Button = {}

				local Button_3 = Instance.new("Frame")
				local UICorner_22 = Instance.new("UICorner")
				local UIPadding_28 = Instance.new("UIPadding")
				local Title_8 = Instance.new("TextButton")
				local UIPadding_29 = Instance.new("UIPadding")
				local Icon_8 = Instance.new("ImageLabel")

				Button_3.Name = "Button"
				Button_3.Parent = Scroll
				Button_3.Active = true
				Button_3.BackgroundColor3 = Theme.Options
				Button_3.BackgroundTransparency = 0.400
				Button_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Button_3.BorderSizePixel = 0
				Button_3.Selectable = true
				Button_3.Size = UDim2.new(1, 0, 0, 27)

				local s =Instance.new("UIStroke")
				s.Parent = Button_3
				s.Color  = Theme.UiStroke
				s.Thickness = 0.8
				s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

				UICorner_22.CornerRadius = UDim.new(0, 5)
				UICorner_22.Parent = Button_3

				UIPadding_28.Parent = Button_3
				UIPadding_28.PaddingLeft = UDim.new(0, 7)
				UIPadding_28.PaddingRight = UDim.new(0, 7)

				Title_8.Name = "Title"
				Title_8.Parent = Button_3
				Title_8.AnchorPoint = Vector2.new(0, 0.5)
				Title_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title_8.BackgroundTransparency = 1.000
				Title_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title_8.BorderSizePixel = 0
				Title_8.Position = UDim2.new(0, 0, 0.5, 0)
				Title_8.Size = UDim2.new(1, 0, 0, 20)
				Title_8.AutoButtonColor = false
				Title_8.Font = Font1
				Title_8.Text = Options.Title
				Title_8.TextColor3 = Theme.Text
				Title_8.TextSize = 12.000
				Title_8.TextXAlignment = Enum.TextXAlignment.Left

				UIPadding_29.Parent = Title_8
				UIPadding_29.PaddingLeft = UDim.new(0, 3)

				Icon_8.Name = "Icon"
				Icon_8.Parent = Title_8
				Icon_8.AnchorPoint = Vector2.new(1, 0.5)
				Icon_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Icon_8.BackgroundTransparency = 1.000
				Icon_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Icon_8.BorderSizePixel = 0
				Icon_8.Position = UDim2.new(1, 0, 0.5, 0)
				Icon_8.Size = UDim2.new(0, 18, 0, 18)
				Icon_8.Image = "rbxassetid://3944703587"
				Icon_8.ImageColor3 = Theme.Image

				Button_3:GetPropertyChangedSignal("AbsoluteSize"):Connect(UpdateCanvasSize)
				UpdateCanvasSize()

				Title_8.MouseButton1Click:Connect(function()
					Options.Callback()
				end)

				return Button
			end
			
			function Section:AddToggle(Options)
				Options.Title = Options.Title or "Preview Toggle"
				Options.Default = Options.Default or false
				Options.Callback = Options.Callback or function() end

				local Toggle = {}
				local ToggleActive = Options.Default

				local Toggle_2 = Instance.new("Frame")
				local UICorner_26 = Instance.new("UICorner")
				local UIPadding_34 = Instance.new("UIPadding")
				local Holder_2 = Instance.new("Frame")
				local UICorner_27 = Instance.new("UICorner")
				local R_3 = Instance.new("Frame")
				local UICorner_28 = Instance.new("UICorner")
				local Title_10 = Instance.new("TextButton")
				local UIPadding_35 = Instance.new("UIPadding")

				Toggle_2.Name = "Toggle"
				Toggle_2.Parent = Scroll
				Toggle_2.Active = true
				Toggle_2.BackgroundColor3 = Theme.Options
				Toggle_2.BackgroundTransparency = 0.400
				Toggle_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Toggle_2.BorderSizePixel = 0
				Toggle_2.Selectable = true
				Toggle_2.Size = UDim2.new(1, 0, 0, 27)

				UICorner_26.CornerRadius = UDim.new(0, 5)
				UICorner_26.Parent = Toggle_2

				UIPadding_34.Parent = Toggle_2
				UIPadding_34.PaddingLeft = UDim.new(0, 7)
				UIPadding_34.PaddingRight = UDim.new(0, 4)

				local s =Instance.new("UIStroke")
				s.Parent = Toggle_2
				s.Color  = Theme.UiStroke
				s.Thickness = 0.8
				s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

				Holder_2.Name = "Holder"
				Holder_2.Parent = Toggle_2
				Holder_2.AnchorPoint = Vector2.new(1, 0.5)
				Holder_2.BackgroundColor3 = Theme.TogglesActiveHolder
				Holder_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Holder_2.BorderSizePixel = 0
				Holder_2.Position = UDim2.new(1, 0, 0.5, 0)
				Holder_2.Size = UDim2.new(0, 40, 0, 18)

				UICorner_27.CornerRadius = UDim.new(0, 9999)
				UICorner_27.Parent = Holder_2

				local s =Instance.new("UIStroke")
				s.Parent = Holder_2
				s.Color  = Theme.UiStroke
				s.Thickness = 0.8
				s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

				R_3.Name = "R"
				R_3.Parent = Holder_2
				R_3.Active = true
				R_3.AnchorPoint = Vector2.new(0, 0.5)
				R_3.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
				R_3.BackgroundTransparency = 0.080
				R_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
				R_3.BorderSizePixel = 0
				R_3.Position = UDim2.new(-0.064000003, 2, 0.5, 0)
				R_3.Size = UDim2.new(0, 17, 0, 16)

				UICorner_28.CornerRadius = UDim.new(0, 15)
				UICorner_28.Parent = R_3

				Title_10.Name = "Title"
				Title_10.Parent = Toggle_2
				Title_10.AnchorPoint = Vector2.new(0, 0.5)
				Title_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title_10.BackgroundTransparency = 1.000
				Title_10.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title_10.BorderSizePixel = 0
				Title_10.Position = UDim2.new(0, 0, 0.5, 0)
				Title_10.Size = UDim2.new(1, -60, 0, 20)
				Title_10.Font = Font1
				Title_10.AutoButtonColor = false
				Title_10.Text = Options.Title
				Title_10.TextColor3 = Theme.Text
				Title_10.TextSize = 12.000
				Title_10.TextXAlignment = Enum.TextXAlignment.Left

				UIPadding_35.Parent = Title_10
				UIPadding_35.PaddingLeft = UDim.new(0, 3)
				
				Toggle_2:GetPropertyChangedSignal("AbsoluteSize"):Connect(up)
				up()

				Options.Callback(Options.Default)

				if Options.Default == true then
					R_3.Position = UDim2.new(0.511, 2,0.5, 0)
					Holder_2.BackgroundColor3 = Theme.TogglesInactivelder
					R_3.BackgroundColor3 = Theme.TogglesActiveHolder
				else
					R_3.Position = UDim2.new(-0.064, 2, 0.5, 0)
					Holder_2.BackgroundColor3 = Theme.TogglesActiveHolder
					R_3.BackgroundColor3 = Theme.TogglesInactivelder
				end

				Title_10.MouseButton1Click:Connect(function()
					ToggleActive = not ToggleActive
					Options.Callback(ToggleActive)
					if ToggleActive == true then
						R_3:TweenPosition(UDim2.new(0.511, 2,0.5, 0), Back, Out, Time2, true)
						wait(0.3)
						Holder_2.BackgroundColor3 = Theme.TogglesInactivelder
						R_3.BackgroundColor3 = Theme.TogglesActiveHolder
					else
						R_3:TweenPosition(UDim2.new(-0.064, 2, 0.5, 0), Back, Out, Time1, true)
						wait(0.2)
						Holder_2.BackgroundColor3 = Theme.TogglesActiveHolder
						R_3.BackgroundColor3 = Theme.TogglesInactivelder
					end
				end)

				function Toggle:EditToggle(options)
					options.Title = options.Title
					options.Default = options.Default

					if options.Title then
						Title_10.Text = options.Title
					end
					if options.Default then
						ToggleActive = options.Default
						Options.Callback(options.Default)
						R_3:TweenPosition(UDim2.new(0.511, 2,0.5, 0), Back, Out, 0.5, true)
						wait(0.3)
						Holder_2.BackgroundColor3 = Theme.TogglesInactivelder
						R_3.BackgroundColor3 = Theme.TogglesActiveHolder
					else
						ToggleActive = options.Default
						Options.Callback(options.Default)
						R_3:TweenPosition(UDim2.new(-0.064, 2, 0.5, 0), Back, Out, 0.5, true)
						wait(0.2)
						Holder_2.BackgroundColor3 = Theme.TogglesActiveHolder
						R_3.BackgroundColor3 = Theme.TogglesInactivelder
					end
				end

				return Toggle
			end
			
			function Section:AddSlider(Options)
				Options.Title = Options.Title or "Preview Slider"
				Options.Placeholder = Options.Placeholder or "Bananas"
				Options.Min = Options.Min or 0
				Options.Max = Options.Max or 100
				Options.Default = Options.Default or 50
				Options.Callback = Options.Callback or function() end

				local Slider = {}

				local Slider_2 = Instance.new("Frame")
				local UICorner_23 = Instance.new("UICorner")
				local Title_9 = Instance.new("TextLabel")
				local UIPadding_30 = Instance.new("UIPadding")
				local Value_2 = Instance.new("TextBox")
				local UIPadding_31 = Instance.new("UIPadding")
				local UIPadding_32 = Instance.new("UIPadding")
				local BackSlider_2 = Instance.new("TextButton")
				local UICorner_24 = Instance.new("UICorner")
				local Draggable_2 = Instance.new("Frame")
				local UICorner_25 = Instance.new("UICorner")
				local Bananas_2 = Instance.new("TextLabel")
				local UIPadding_33 = Instance.new("UIPadding")

				Slider_2.Name = "Slider"
				Slider_2.Parent = Scroll
				Slider_2.BackgroundColor3 = Theme.Options
				Slider_2.BackgroundTransparency = 0.400
				Slider_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Slider_2.BorderSizePixel = 0
				Slider_2.Size = UDim2.new(1, 0, 0, 60)

				UICorner_23.CornerRadius = UDim.new(0, 5)
				UICorner_23.Parent = Slider_2

				local s =Instance.new("UIStroke")
				s.Parent = Slider_2
				s.Color  = Theme.UiStroke
				s.Thickness = 0.8
				s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

				Title_9.Name = "Title"
				Title_9.Parent = Slider_2
				Title_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title_9.BackgroundTransparency = 1.000
				Title_9.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title_9.BorderSizePixel = 0
				Title_9.Size = UDim2.new(0.5, 0, 0, 20)
				Title_9.Font = Font1
				Title_9.Text = Options.Title
				Title_9.TextColor3 = Theme.Text
				Title_9.TextSize = 12.000
				Title_9.TextXAlignment = Enum.TextXAlignment.Left

				UIPadding_30.Parent = Title_9
				UIPadding_30.PaddingLeft = UDim.new(0, 3)

				Value_2.Name = "Value"
				Value_2.Parent = Slider_2
				Value_2.AnchorPoint = Vector2.new(1, 0)
				Value_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Value_2.BackgroundTransparency = 1.000
				Value_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Value_2.BorderSizePixel = 0
				Value_2.Position = UDim2.new(1, 0, 0, 0)
				Value_2.Size = UDim2.new(0.242857143, 0, 0, 20)
				Value_2.Font = Font1
				Value_2.TextWrapped = true
				Value_2.Text = "50"
				Value_2.PlaceholderText = ""
				Value_2.TextColor3 = Theme.Text
				Value_2.TextSize = 12.000
				Value_2.TextXAlignment = Enum.TextXAlignment.Right

				UIPadding_31.Parent = Value_2
				UIPadding_31.PaddingRight = UDim.new(0, 4)

				UIPadding_32.Parent = Slider_2
				UIPadding_32.PaddingLeft = UDim.new(0, 4)
				UIPadding_32.PaddingRight = UDim.new(0, 4)
				UIPadding_32.PaddingTop = UDim.new(0, 4)

				BackSlider_2.Name = "BackSlider"
				BackSlider_2.Parent = Slider_2
				BackSlider_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
				BackSlider_2.BackgroundTransparency = 0.080
				BackSlider_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				BackSlider_2.BorderSizePixel = 0
				BackSlider_2.Text = ""
				BackSlider_2.AutoButtonColor = false
				BackSlider_2.Position = UDim2.new(0, 0, 0, 25)
				BackSlider_2.Size = UDim2.new(1, 0, 0, 25)

				UICorner_24.CornerRadius = UDim.new(0, 5)
				UICorner_24.Parent = BackSlider_2

				Draggable_2.Name = "Draggable"
				Draggable_2.Parent = BackSlider_2
				Draggable_2.BackgroundColor3 = Theme.Draggable
				Draggable_2.BackgroundTransparency = 0.080
				Draggable_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Draggable_2.BorderSizePixel = 0
				Draggable_2.Size = UDim2.new(0.5, 0, 0, 25)

				UICorner_25.CornerRadius = UDim.new(0, 5)
				UICorner_25.Parent = Draggable_2

				Bananas_2.Name = "Bananas"
				Bananas_2.Parent = Draggable_2
				Bananas_2.AnchorPoint = Vector2.new(0, 0.5)
				Bananas_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Bananas_2.BackgroundTransparency = 1.000
				Bananas_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Bananas_2.BorderSizePixel = 0
				Bananas_2.Position = UDim2.new(0, 0, 0.5, 0)
				Bananas_2.Size = UDim2.new(0.5, 0, 0, 20)
				Bananas_2.Font = Font1
				Bananas_2.Font = Enum.Font.SourceSansBold
				Bananas_2.Text = Options.Placeholder
				Bananas_2.TextColor3 = Theme.TextBananas
				Bananas_2.TextSize = 15.000
				Bananas_2.TextXAlignment = Enum.TextXAlignment.Left

				UIPadding_33.Parent = Bananas_2
				UIPadding_33.PaddingLeft = UDim.new(0, 3)

				Slider_2:GetPropertyChangedSignal("AbsoluteSize"):Connect(up)
				up()

				-- Função para atualizar o valor do Slider
				local lastValue = nil

				local function UpdateSliderValue()
					local sliderValue = math.clamp(Draggable_2.Size.X.Scale * (Options.Max - Options.Min) + Options.Min, Options.Min, Options.Max)
					local roundedValue = math.floor(sliderValue)

					-- Verifica se o valor arredondado mudou
					if roundedValue ~= lastValue then
						lastValue = roundedValue
						Value_2.Text = tostring(roundedValue)
						Options.Callback(roundedValue)
					end
				end

				-- Função para ajustar o tamanho do "Draggable"
				local function SetSliderSize(newSize)
					local clampedSize = math.clamp(newSize, 0, 1)
					Draggable_2.Size = UDim2.new(clampedSize, 0, 1, 0)
					UpdateSliderValue()
				end

				-- Variáveis para controle de arrasto
				local dragging = false
				local startDragPosition = 0

				-- Função que lida com o início do arrasto (Clique ou Toque)
				local function startDragging(input)
					dragging = true
					startDragPosition = (input.Position and input.Position.X) or input.Position.X -- Se input.Position estiver disponível (mouse), use, caso contrário, use input.Position.X (toque)
				end

				-- Função que lida com o movimento do arrasto
				local function updateDragging(input)
					if dragging then
						local delta = input.Position.X - startDragPosition
						local newSize = Draggable_2.Size.X.Scale + (delta / BackSlider_2.AbsoluteSize.X)
						SetSliderSize(newSize)
						startDragPosition = input.Position.X
					end
				end

				-- Função que lida com o fim do arrasto
				local function stopDragging(input)
					if dragging then
						dragging = false
					end
				end

				-- Conexões para eventos de entrada (mouse e toque)
				BackSlider_2.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						startDragging(input)
					end
				end)

				-- Atualiza a posição durante o arrasto (mouse ou toque)
				game:GetService("UserInputService").InputChanged:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
						updateDragging(input)
					end
				end)

				-- Finaliza o arrasto quando o botão do mouse ou o toque é liberado
				game:GetService("UserInputService").InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						stopDragging(input)
					end
				end)

				-- Função que é chamada quando o valor do TextBox é alterado
				Value_2.FocusLost:Connect(function(enterPressed)
					if enterPressed then
						local newText = Value_2.Text:gsub("[^%d]", "")
						local numberValue = tonumber(newText)

						if not numberValue then
							numberValue = Options.Min
						else
							if numberValue < Options.Min then
								numberValue = Options.Min
							elseif numberValue > Options.Max then
								numberValue = Options.Max
							end
						end

						Value_2.Text = tostring(numberValue)

						local newSize = (numberValue - Options.Min) / (Options.Max - Options.Min)
						SetSliderSize(newSize)
						UpdateSliderValue()
					end
				end)

				-- Configuração inicial do slider
				local initialSize = (Options.Default - Options.Min) / (Options.Max - Options.Min)
				SetSliderSize(initialSize)
				UpdateSliderValue()

				return Slider
			end
			
			function Section:AddDropdown(Options)
				Options.Title = Options.Title or "Preview Dropdown"
				Options.Values = Options.Values or {"Option"}
				Options.Default = Options.Default or "Option"
				Options.Callback = Options.Callback or function() end

				local Drop = {}
				local on = false

				local Dropdown = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local Contenholder = Instance.new("Frame")
				local ScrollFrame = Instance.new("ScrollingFrame")
				local Option = Instance.new("TextLabel")
				local UICorner_2 = Instance.new("UICorner")
				local UIPadding = Instance.new("UIPadding")
				local UIListLayout = Instance.new("UIListLayout")
				local UICorner_5 = Instance.new("UICorner")
				local UIPadding_2 = Instance.new("UIPadding")
				local Title = Instance.new("TextButton")
				local UIPadding_3 = Instance.new("UIPadding")
				local Icon = Instance.new("ImageLabel")

				Dropdown.Name = "Dropdown"
				Dropdown.Parent = Scroll
				Dropdown.Active = true
				Dropdown.BackgroundColor3 = Theme.Options
				Dropdown.BackgroundTransparency = 0.400
				Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Dropdown.BorderSizePixel = 0
				Dropdown.Selectable = true
				Dropdown.Size = UDim2.new(1, 0, 0, 27)

				UICorner.CornerRadius = UDim.new(0, 5)
				UICorner.Parent = Dropdown
				
				local s =Instance.new("UIStroke")
				s.Parent = Dropdown
				s.Color  = Theme.UiStroke
				s.Thickness = 0.8
				s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

				Contenholder.Name = "Contenholder"
				Contenholder.Parent = Dropdown
				Contenholder.AnchorPoint = Vector2.new(0, 1)
				Contenholder.BackgroundColor3 = Theme.Main
				Contenholder.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Contenholder.BorderSizePixel = 0
				Contenholder.Position = UDim2.new(0, 0, 1, 0)
				Contenholder.Size = UDim2.new(1, 0, 1, -22)
				Contenholder.Visible = false
				
				local s =Instance.new("UIStroke")
				s.Parent = Contenholder
				s.Color  = Theme.UiStroke
				s.Thickness = 0.8
				s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

				ScrollFrame.Name = "ScrollFrame"
				ScrollFrame.Parent = Contenholder
				ScrollFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ScrollFrame.BackgroundTransparency = 1.000
				ScrollFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ScrollFrame.BorderSizePixel = 0
				ScrollFrame.Selectable = false
				ScrollFrame.Size = UDim2.new(1, 0, 1, 0)
				ScrollFrame.ScrollBarThickness = 0

				UIPadding.Parent = ScrollFrame
				UIPadding.PaddingBottom = UDim.new(0, 7)
				UIPadding.PaddingLeft = UDim.new(0, 7)
				UIPadding.PaddingRight = UDim.new(0, 7)
				UIPadding.PaddingTop = UDim.new(0, 7)

				UIListLayout.Parent = ScrollFrame
				UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.Padding = UDim.new(0, 5)

				UICorner_5.CornerRadius = UDim.new(0, 5)
				UICorner_5.Parent = Contenholder

				UIPadding_2.Parent = Dropdown
				UIPadding_2.PaddingBottom = UDim.new(0, 7)
				UIPadding_2.PaddingLeft = UDim.new(0, 7)
				UIPadding_2.PaddingRight = UDim.new(0, 7)
				UIPadding_2.PaddingTop = UDim.new(0, 7)

				Title.Name = "Title"
				Title.Parent = Dropdown
				Title.Active = false
				Title.AnchorPoint = Vector2.new(0, 0.5)
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title.BorderSizePixel = 0
				Title.Position = UDim2.new(0, 0, 0, 7)
				Title.Selectable = false
				Title.Size = UDim2.new(1, 0, 0, 20)
				Title.Font = Font1
				Title.AutoButtonColor = false
				Title.Text = "Dropdown"
				Title.TextColor3 = Theme.Text
				Title.TextSize = 10.000
				Title.TextXAlignment = Enum.TextXAlignment.Left

				UIPadding_3.Parent = Title
				UIPadding_3.PaddingLeft = UDim.new(0, 3)

				Icon.Name = "Icon"
				Icon.Parent = Dropdown
				Icon.AnchorPoint = Vector2.new(1, 0.5)
				Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Icon.BackgroundTransparency = 1.000
				Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Icon.BorderSizePixel = 0
				Icon.Position = UDim2.new(1, 0, 0, 7)
				Icon.Size = UDim2.new(0, 18, 0, 18)
				Icon.Image = "http://www.roblox.com/asset/?id=86625499622821"
				Icon.ImageColor3 = Theme.Image
				
				if uis.TouchEnabled then
					ScrollFrame.ScrollBarThickness = 5
				else
					ScrollFrame.ScrollBarThickness = 0
				end
				
				local function upd()
					local contentSize = UIListLayout.AbsoluteContentSize
					ScrollFrame.CanvasSize = UDim2.new(0, contentSize.X, 0, contentSize.Y + 10)
				end

				local function addOptions()
					for _, value in ipairs(Options.Values) do
						local Option = Instance.new("TextButton")
						Option.Name = value
						Option.Parent = ScrollFrame
						Option.BackgroundColor3 = Theme.Options
						Option.BorderColor3 = Color3.fromRGB(0, 0, 0)
						Option.BorderSizePixel = 0
						Option.Size = UDim2.new(1, 0, 0, 20)
						Option.Font = Font1
						Option.Text = value
						Option.AutoButtonColor = false
						Option.TextColor3 = Theme.Text
						Option.TextSize = 11.000
						Option.TextWrapped = true

						UICorner_2.CornerRadius = UDim.new(0, 5)
						UICorner_2.Parent = Option

						local s =Instance.new("UIStroke")
						s.Parent = Option
						s.Color  = Theme.UiStroke
						s.Thickness = 0.8
						s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

						Option.MouseEnter:Connect(function()
							Option.BackgroundColor3 = Theme.OptionsDrop
							Option.TextColor3 = Theme.Text
						end)

						Option.MouseLeave:Connect(function()
							Option.BackgroundColor3 = Theme.Options
							Option.TextColor3 = Theme.Text
						end)

						Option.MouseButton1Click:Connect(function()
							Options.Callback(value)
							Title.Text = value
							on = false
							Dropdown:TweenSize(UDim2.new(1, 0, 0, 27), Back, Out, Time2, true)
							wait(Time1)
							Contenholder.Visible = on
						end)
						Option:GetPropertyChangedSignal("AbsoluteSize"):Connect(upd)
						upd()
					end
				end

				addOptions()

				Dropdown:GetPropertyChangedSignal("AbsoluteSize"):Connect(up)
				up()

				Title.MouseButton1Click:Connect(function()
					on = not on
					Dropdown:TweenSize(UDim2.new(1, 0, 0, 120), Back, Out, Time2, true)
					Contenholder.Visible = true
					if on == false then
						Dropdown:TweenSize(UDim2.new(1, 0, 0, 27), Back, Out, Time2, true)
						wait(Time1)
						Contenholder.Visible = on
					end
				end)


				function Drop:SetEditDropdown(Op)
					Op.Title = Op.Title or Options.Title
					Op.Values = Op.Values or Options.Values
					Op.Default = Op.Default or Options.Default

					if Op.Title then
						Title.Text = Op.Title
						Options.Callback(Op.Default or Options.Default)
					end
					if Op.Values then
						Options.Values = Op.Values

						-- Limpa as opções existentes
						for _, child in ipairs(ScrollFrame:GetChildren()) do
							if child:IsA("TextLabel") then
								child:Destroy()
							end
						end
						addOptions()
					end
				end

				return Drop
			end
			
			function Section:AddInput(Options)
				Options.Title = Options.Title or "Input"
				Options.AddNumber = Options.AddNumber or 1
				Options.Default = Options.Default or 17
				Options.Callback = Options.Callback or function() end

				local inputBt = {}
				local SomaNumber = Options.AddNumber
				local lastNumber = Options.Default -- Guarda o último número

				local Input = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local UIPadding = Instance.new("UIPadding")
				local Title = Instance.new("TextBox")
				local UIPadding_2 = Instance.new("UIPadding")
				local HolderButtons = Instance.new("Frame")
				local UICorner_2 = Instance.new("UICorner")
				local Down = Instance.new("ImageButton")
				local UIListLayout = Instance.new("UIListLayout")
				local Line = Instance.new("Frame")
				local Up = Instance.new("ImageButton")

				-- Configurações do Frame Input
				Input.Name = "Input"
				Input.Parent = Scroll
				Input.Active = true
				Input.BackgroundColor3 = Theme.Options
				Input.BackgroundTransparency = 0.400
				Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Input.BorderSizePixel = 0
				Input.Selectable = true
				Input.Size = UDim2.new(1, 0, 0, 27)

				UICorner.CornerRadius = UDim.new(0, 5)
				UICorner.Parent = Input

				UIPadding.Parent = Input
				UIPadding.PaddingLeft = UDim.new(0, 7)
				UIPadding.PaddingRight = UDim.new(0, 7)

				local s = Instance.new("UIStroke")
				s.Parent = Input
				s.Color = Theme.UiStroke
				s.Thickness = 0.8
				s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

				-- Configurações do TextBox Title
				Title.Name = "Title"
				Title.Parent = Input
				Title.Active = true
				Title.AnchorPoint = Vector2.new(0, 0.5)
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title.BorderSizePixel = 0
				Title.Position = UDim2.new(0, 0, 0.5, 0)
				Title.Selectable = true
				Title.Size = UDim2.new(0.5, 0, 0, 20)
				Title.Font = Font1
				Title.TextWrapped = true
				Title.PlaceholderColor3 = Theme.Text
				Title.Text = tostring(Options.Default)
				Title.TextColor3 = Theme.Text
				Title.TextSize = 12.000
				Title.TextXAlignment = Enum.TextXAlignment.Left

				UIPadding_2.Parent = Title
				UIPadding_2.PaddingLeft = UDim.new(0, 3)

				-- Configurações do HolderButtons
				HolderButtons.Name = "HolderButtons"
				HolderButtons.Parent = Input
				HolderButtons.AnchorPoint = Vector2.new(1, 0.5)
				HolderButtons.BackgroundColor3 = Theme.TogglesInactivelder
				HolderButtons.BorderColor3 = Color3.fromRGB(0, 0, 0)
				HolderButtons.BorderSizePixel = 0
				HolderButtons.Position = UDim2.new(1, 0, 0.5, 0)
				HolderButtons.Size = UDim2.new(0, 37, 0, 18)

				UICorner_2.CornerRadius = UDim.new(0, 5)
				UICorner_2.Parent = HolderButtons

				local s = Instance.new("UIStroke")
				s.Parent = HolderButtons
				s.Color = Theme.UiStroke
				s.Thickness = 0.8
				s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

				-- Configurações dos botões Up e Down
				Down.Name = "Down"
				Down.Parent = HolderButtons
				Down.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Down.BackgroundTransparency = 1.000
				Down.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Down.BorderSizePixel = 0
				Down.Size = UDim2.new(0, 18, 0, 18)
				Down.Image = "rbxassetid://7734000129"
				Down.ImageColor3 = Theme.Image

				UIListLayout.Parent = HolderButtons
				UIListLayout.FillDirection = Enum.FillDirection.Horizontal
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

				Line.Name = "Line"
				Line.Parent = HolderButtons
				Line.BackgroundColor3 = Theme.Lines
				Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Line.BorderSizePixel = 0
				Line.Size = UDim2.new(0, 1, 1, 0)

				Up.Name = "Up"
				Up.Parent = HolderButtons
				Up.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Up.BackgroundTransparency = 1.000
				Up.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Up.BorderSizePixel = 0
				Up.Size = UDim2.new(0, 18, 0, 18)
				Up.Image = "rbxassetid://7734042071"
				Up.ImageColor3 = Theme.Image
				
				Input:GetPropertyChangedSignal("AbsoluteSize"):Connect(up)
				up()

				Options.Callback(Options.Default)

				-- Ação para o botão Up
				Up.MouseButton1Click:Connect(function()
					lastNumber = (tonumber(Title.Text) or lastNumber) + SomaNumber
					Title.Text = tostring(lastNumber)
					Title.PlaceholderText = Options.Title .. " - " .. Title.Text
					Options.Callback(lastNumber)
				end)

				-- Ação para o botão Down
				Down.MouseButton1Click:Connect(function()
					lastNumber = (tonumber(Title.Text) or lastNumber) - SomaNumber
					Title.Text = tostring(lastNumber)
					Title.PlaceholderText = Options.Title .. " - " .. Title.Text
					Options.Callback(lastNumber)
				end)

				-- Ação para pressionar Enter
				Title.FocusLost:Connect(function(enterPressed)
					if enterPressed then
						local text = Title.Text
						if text == "" then
							Title.Text = tostring(lastNumber) -- Preenche com o último número se estiver vazio
						elseif not text:match("^%d*$") then
							Title.Text = tostring(lastNumber) -- Restaura o último número se não for válido
						else
							lastNumber = tonumber(text) -- Atualiza o último número se válido
							Title.PlaceholderText = Options.Title .. " - " .. text
						end
						Options.Callback(lastNumber) -- Chama o callback com o último número
					end
				end)

				return inputBt
			end

			function Section:AddKeyBind(Options)
				Options.Title = Options.Title or "Preview Keybind"
				Options.Default = Options.Default or "K"
				Options.Callback = Options.Callback or function() end
				
				local KeyBind = {}

				local Keybind = Instance.new("Frame")
				local UIPadding = Instance.new("UIPadding")
				local Title = Instance.new("TextLabel")
				local UIPadding_2 = Instance.new("UIPadding")
				local Input = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local InputKey = Instance.new("TextBox")
				local UICorner_2 = Instance.new("UICorner")

				Keybind.Name = "Keybind"
				Keybind.Parent = Scroll
				Keybind.Active = true
				Keybind.BackgroundColor3 = Theme.Options
				Keybind.BackgroundTransparency = 0.400
				Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Keybind.BorderSizePixel = 0
				Keybind.Selectable = true
				Keybind.Size = UDim2.new(1, 0, 0, 27)

				UIPadding.Parent = Keybind
				UIPadding.PaddingLeft = UDim.new(0, 7)
				UIPadding.PaddingRight = UDim.new(0, 7)
				
				local s = Instance.new("UIStroke")
				s.Parent = Keybind
				s.Color = Theme.UiStroke
				s.Thickness = 0.8
				s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

				Title.Name = "Title"
				Title.Parent = Keybind
				Title.AnchorPoint = Vector2.new(0, 0.5)
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title.BorderSizePixel = 0
				Title.Position = UDim2.new(0, 0, 0.5, 0)
				Title.Size = UDim2.new(1, -60, 0, 20)
				Title.Font = Font1
				Title.Text = Options.Title
				Title.TextColor3 = Theme.Text
				Title.TextSize = 12.000
				Title.TextXAlignment = Enum.TextXAlignment.Left

				UIPadding_2.Parent = Title
				UIPadding_2.PaddingLeft = UDim.new(0, 3)

				Input.Name = "Input"
				Input.Parent = Keybind
				Input.AnchorPoint = Vector2.new(1, 0.5)
				Input.BackgroundColor3 = Theme.Options
				Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Input.BorderSizePixel = 0
				Input.Position = UDim2.new(1, 0, 0.5, 0)
				Input.Size = UDim2.new(0, 40, 0, 20)

				UICorner.CornerRadius = UDim.new(0, 5)
				UICorner.Parent = Input
				
				local s = Instance.new("UIStroke")
				s.Parent = Input
				s.Color = Theme.UiStroke
				s.Thickness = 0.8
				s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

				InputKey.Name = "InputKey"
				InputKey.Parent = Input
				InputKey.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				InputKey.BackgroundTransparency = 1.000
				InputKey.BorderColor3 = Color3.fromRGB(0, 0, 0)
				InputKey.BorderSizePixel = 0
				InputKey.Size = UDim2.new(1, 0, 1, 0)
				InputKey.Font = Font1
				InputKey.PlaceholderText = "[...]"
				InputKey.Text = Options.Default
				InputKey.PlaceholderColor3 = Theme.TextPlaceHolder
				InputKey.TextColor3 = Theme.Text
				InputKey.TextSize = 14.000
				InputKey.TextWrapped = true

				UICorner_2.CornerRadius = UDim.new(0, 5)
				UICorner_2.Parent = Keybind
				
				Keybind:GetPropertyChangedSignal("AbsoluteSize"):Connect(up)
				up()

				local lastValue = InputKey.Text -- Armazena o último valor válido

				Options.Callback(Options.Default)

				InputKey.FocusLost:Connect(function(enterPressed)
					if enterPressed then
						if InputKey.Text == "" then
							InputKey.Text = lastValue -- Restaura o último valor válido
							return
						end

						local input = InputKey.Text
						local filtered = input:upper() -- Converte para maiúscula

						-- Permite apenas a primeira letra
						if filtered:len() > 1 then
							filtered = filtered:sub(1, 1)
						end

						-- Verifica se é uma letra
						if not filtered:match("%a") then
							filtered = "" -- Limpa o texto se não for uma letra
						end

						-- Atualiza o TextBox se necessário
						if InputKey.Text ~= filtered then
							InputKey.Text = filtered -- Atualiza o TextBox
							InputKey.CursorPosition = InputKey.Text:len() -- Move o cursor para o final
						end

						-- Chama o callback apenas se o valor mudou
						if lastValue ~= filtered then
							lastValue = filtered
							Options.Callback(filtered)
						end
					end
				end)

				-- Adiciona um evento para o input em tempo real
				InputKey:GetPropertyChangedSignal("Text"):Connect(function()
					local input = InputKey.Text
					local filtered = input:upper():sub(1, 1) -- Permite apenas a primeira letra

					-- Verifica se é uma letra
					if not filtered:match("%a") then
						filtered = "" -- Limpa o texto se não for uma letra
					end

					-- Atualiza o TextBox se necessário
					if InputKey.Text ~= filtered then
						InputKey.Text = filtered -- Atualiza o TextBox
						InputKey.CursorPosition = InputKey.Text:len() -- Move o cursor para o final
					end
				end)

				
				return KeyBind
			end
			
			function Section:AddEditText(Options)
				Options.Title = Options.Title or "EditText"
				Options.Default = Options.Default or "AKAIDO"
				Options.Callback = Options.Callback or function() end

				local EditText = {}

				local Keybind = Instance.new("Frame")
				local UIPadding = Instance.new("UIPadding")
				local Title = Instance.new("TextLabel")
				local UIPadding_2 = Instance.new("UIPadding")
				local Input = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local InputKey = Instance.new("TextBox")
				local UICorner_2 = Instance.new("UICorner")

				Keybind.Name = "Keybind"
				Keybind.Parent = Scroll
				Keybind.Active = true
				Keybind.BackgroundColor3 = Theme.Options
				Keybind.BackgroundTransparency = 0.400
				Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Keybind.BorderSizePixel = 0
				Keybind.Selectable = true
				Keybind.Size = UDim2.new(1, 0, 0, 27)

				UIPadding.Parent = Keybind
				UIPadding.PaddingLeft = UDim.new(0, 7)
				UIPadding.PaddingRight = UDim.new(0, 7)

				local s = Instance.new("UIStroke")
				s.Parent = Keybind
				s.Color = Theme.UiStroke
				s.Thickness = 0.8
				s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

				Title.Name = "Title"
				Title.Parent = Keybind
				Title.AnchorPoint = Vector2.new(0, 0.5)
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title.BorderSizePixel = 0
				Title.Position = UDim2.new(0, 0, 0.5, 0)
				Title.Size = UDim2.new(1, -60, 0, 20)
				Title.Font = Font1
				Title.Text = Options.Title
				Title.TextColor3 = Theme.Text
				Title.TextSize = 11.000
				Title.TextXAlignment = Enum.TextXAlignment.Left

				UIPadding_2.Parent = Title
				UIPadding_2.PaddingLeft = UDim.new(0, 3)

				Input.Name = "Input"
				Input.Parent = Keybind
				Input.AnchorPoint = Vector2.new(1, 0.5)
				Input.BackgroundColor3 = Theme.Options
				Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Input.BorderSizePixel = 0
				Input.Position = UDim2.new(1, 0, 0.5, 0)
				Input.Size = UDim2.new(0, 40, 0, 20)

				UICorner.CornerRadius = UDim.new(0, 5)
				UICorner.Parent = Input

				local s = Instance.new("UIStroke")
				s.Parent = Input
				s.Color = Theme.UiStroke
				s.Thickness = 0.8
				s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

				InputKey.Name = "InputKey"
				InputKey.Parent = Input
				InputKey.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				InputKey.BackgroundTransparency = 1.000
				InputKey.BorderColor3 = Color3.fromRGB(0, 0, 0)
				InputKey.BorderSizePixel = 0
				InputKey.Size = UDim2.new(1, 0, 1, 0)
				InputKey.Font = Font1
				InputKey.PlaceholderText = "[...]"
				InputKey.Text = Options.Default
				InputKey.PlaceholderColor3 = Theme.TextPlaceHolder
				InputKey.TextColor3 = Theme.Text
				InputKey.TextSize = 11.000
				InputKey.TextWrapped = true

				UICorner_2.CornerRadius = UDim.new(0, 5)
				UICorner_2.Parent = Keybind

				Keybind:GetPropertyChangedSignal("AbsoluteSize"):Connect(up)
				up()

				local lastValue = InputKey.Text -- Armazena o último valor válido

				Options.Callback(Options.Default)

				InputKey.FocusLost:Connect(function(enterPressed)
					if enterPressed then
						if InputKey.Text == "" then
							InputKey.Text = lastValue -- Restaura o último valor válido
							return
						end
						Options.Callback(InputKey.Text)
					end
				end)

				InputKey.MouseEnter:Connect(function()
					Input:TweenSize(UDim2.new(0, 70, 0, 20), Back, Out, Time2, true)
					InputKey.TextSize = 14.000
				end)

				InputKey.MouseLeave:Connect(function()
					Input:TweenSize(UDim2.new(0, 40, 0, 20), Back, Out, Time2, true)
					InputKey.TextSize = 11.000
				end)

				return EditText
			end
			
			return Section
		end
		
		return TAB
	end
	
	return GUI
end

local Main = Library:CreateWindow({
	Title = "AKAIDO|LIB",
	Theme = "AKAIDO",
	Mobile = true,
	Animation = true,
	Opacity = false,
	WallPaper = true
})

local Page = Main:AddPage({})

local tab = Main:AddTab({})

local tst = Page:AddSection({
	Title = "Test Page",
})

tst:AddToggle({})
tst:AddButton({})
tst:AddSlider({})
tst:AddDropdown({})
tst:AddKeyBind({})
tst:AddInput({})
tst:AddEditText({})

tab:AddToggle({})
tab:AddButton({})
tab:AddSlider({})
tab:AddDropdown({})
tab:AddKeyBind({})
tab:AddInput({})
tab:AddEditText()

return Library
