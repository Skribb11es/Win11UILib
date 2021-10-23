local Win11Lib = {}
Win11Lib.tabs = {}
Win11Lib.tabs.funcs = {}
Win11Lib.flags = {}
Win11Lib.flags.toggles = {}
Win11Lib.flags.dropdownToggles = {}

local mouse = game.Players.LocalPlayer:GetMouse()
local uis = game:GetService("UserInputService")

Win11Lib.createMenu = function(name, bind, menuButtons, sizeX, sizeY, usericonId, userIconText, userIconSubText)
  if sizeX < 800 then
    sizeX = 800
  end
  if sizeY < 500 then
    sizeY = 500
  end

  local menu = {}

  menu.Drag = function(frame, hold)
    if not hold then hold = frame end
    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    hold.InputBegan:Connect(function(input)
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
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
  end


  local container = Instance.new("ScreenGui")
  local mainOutline = Instance.new("ImageLabel")
  local main = Instance.new("ImageLabel")
  local mainUIAccessories = Instance.new("Folder")
  local windowName = Instance.new("TextLabel")
  local sideBarContainer = Instance.new("ScrollingFrame")
  local settingContainers = Instance.new("Folder")
  local UIListLayout_2 = Instance.new("UIListLayout")
  local topBar = Instance.new("Frame")
  local menuName = Instance.new("TextLabel")

  container.Name = "container"
  container.Parent = game.CoreGui

  topBar.Name = "topBar"
  topBar.Parent = container
  topBar.AnchorPoint = Vector2.new(0, 0)
  topBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  topBar.BackgroundTransparency = 1.000
  topBar.BorderSizePixel = 0
  topBar.Position = UDim2.new(0.2, 0, 0.2, 0)
  topBar.Size = UDim2.new(0, sizeX, 0, 27)

  mainOutline.Name = "mainOutline"
  mainOutline.Parent = topBar
  mainOutline.AnchorPoint = Vector2.new(0, 0)
  mainOutline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  mainOutline.BackgroundTransparency = 1.000
  mainOutline.Position = UDim2.new(0, 0, 0, 0)
  mainOutline.Size = UDim2.new(1, 0, 0, sizeY)
  mainOutline.ZIndex = 0
  mainOutline.Image = "rbxassetid://3570695787"
  mainOutline.ImageColor3 = Color3.fromRGB(49, 48, 51)
  mainOutline.ScaleType = Enum.ScaleType.Slice
  mainOutline.SliceCenter = Rect.new(100, 100, 100, 100)
  mainOutline.SliceScale = 0.080

  main.Name = "main"
  main.Parent = mainOutline
  main.AnchorPoint = Vector2.new(0.5, 0.5)
  main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  main.BackgroundTransparency = 1.000
  main.BorderSizePixel = 0
  main.ClipsDescendants = true
  main.Position = UDim2.new(0.5, 0, 0.5, 0)
  main.Size = UDim2.new(1, -2, 1, -2)
  main.Image = "rbxassetid://3570695787"
  main.ImageColor3 = Color3.fromRGB(32, 32, 32)
  main.ScaleType = Enum.ScaleType.Slice
  main.SliceCenter = Rect.new(100, 100, 100, 100)
  main.SliceScale = 0.080

  mainUIAccessories.Name = "mainUIAccessories"
  mainUIAccessories.Parent = main

  windowName.Name = "windowName"
  windowName.Parent = mainUIAccessories
  windowName.AnchorPoint = Vector2.new(0, 0.5)
  windowName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  windowName.BackgroundTransparency = 1.000
  windowName.Position = UDim2.new(0.200000003, 1, 0.0500000007, 0)
  windowName.Size = UDim2.new(0, 200, 0, 50)
  windowName.Font = Enum.Font.SourceSansSemibold
  windowName.Text = ""
  windowName.TextColor3 = Color3.fromRGB(255, 255, 255)
  windowName.TextSize = 24.000
  windowName.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
  windowName.TextXAlignment = Enum.TextXAlignment.Left

  sideBarContainer.Name = "sideBarContainer"
  sideBarContainer.Parent = main
  sideBarContainer.Active = true
  sideBarContainer.AnchorPoint = Vector2.new(0, 1)
  sideBarContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  sideBarContainer.BackgroundTransparency = 1.000
  sideBarContainer.BorderSizePixel = 0
  sideBarContainer.Position = UDim2.new(0, 0, 1, 0)
  sideBarContainer.Size = UDim2.new(0.2, 0, 0.775, 0)
  sideBarContainer.BottomImage = ""
  sideBarContainer.CanvasSize = UDim2.new(0.2, 0, 0.775, 0)
  sideBarContainer.MidImage = ""
  sideBarContainer.TopImage = ""

  settingContainers.Name = "settingContainers"
  settingContainers.Parent = main

  UIListLayout_2.Parent = sideBarContainer
  UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
  UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
  UIListLayout_2.Padding = UDim.new(0, 4)

  menuName.Name = "menuName"
  menuName.Parent = mainUIAccessories
  menuName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  menuName.BackgroundTransparency = 1.000
  menuName.Position = UDim2.new(0, 16, 0, 0)
  menuName.Size = UDim2.new(0, 200, 0, 50)
  menuName.Font = Enum.Font.SourceSans
  menuName.Text = name
  menuName.TextColor3 = Color3.fromRGB(255, 255, 255)
  menuName.TextSize = 14.000
  menuName.TextXAlignment = Enum.TextXAlignment.Left

  menu.Drag(topBar)

  local UIS = game:GetService("UserInputService")
  UIS.InputBegan:Connect(function(key, gp)
    if key.KeyCode == bind then
      mainOutline.Visible = not mainOutline.Visible
    end
  end)

  -- menu button shit
  if menuButtons == true then
    local buttonClose = Instance.new("ImageButton")
    local bottomCover = Instance.new("Frame")
    local sideCover = Instance.new("Frame")
    local buttonFullScreen = Instance.new("TextButton")
    local square = Instance.new("Frame")
    local buttonMinimize = Instance.new("TextButton")
    local line = Instance.new("Frame")
    local X = Instance.new("TextLabel")

    buttonClose.Name = "buttonClose"
    buttonClose.Parent = mainUIAccessories
    buttonClose.Active = false
    buttonClose.AnchorPoint = Vector2.new(1, 0)
    buttonClose.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    buttonClose.BackgroundTransparency = 1.000
    buttonClose.BorderSizePixel = 0
    buttonClose.Position = UDim2.new(1, 0, 0, 0)
    buttonClose.Size = UDim2.new(0, 46, 0, 27)
    buttonClose.Image = "rbxassetid://3570695787"
    buttonClose.ImageColor3 = Color3.fromRGB(32, 32, 32)
    buttonClose.ScaleType = Enum.ScaleType.Slice
    buttonClose.SliceCenter = Rect.new(100, 100, 100, 100)
    buttonClose.SliceScale = 0.080

    bottomCover.Name = "bottomCover"
    bottomCover.Parent = buttonClose
    bottomCover.AnchorPoint = Vector2.new(0, 1)
    bottomCover.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    bottomCover.BorderSizePixel = 0
    bottomCover.Position = UDim2.new(0, 0, 1, 0)
    bottomCover.Size = UDim2.new(1, 0, 0.5, 0)

    sideCover.Name = "sideCover"
    sideCover.Parent = buttonClose
    sideCover.AnchorPoint = Vector2.new(0, 1)
    sideCover.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    sideCover.BorderSizePixel = 0
    sideCover.Position = UDim2.new(0, 0, 1, 0)
    sideCover.Size = UDim2.new(0.5, 0, 1, 0)

    buttonFullScreen.Name = "buttonFullScreen"
    buttonFullScreen.Parent = buttonClose
    buttonFullScreen.AnchorPoint = Vector2.new(1, 0)
    buttonFullScreen.BackgroundColor3 = Color3.fromRGB(32,32,32)
    buttonFullScreen.BorderSizePixel = 0
    buttonFullScreen.Size = UDim2.new(0, 46, 0, 27)
    buttonFullScreen.Font = Enum.Font.SourceSans
    buttonFullScreen.Text = ""
    buttonFullScreen.TextColor3 = Color3.fromRGB(0, 0, 0)
    buttonFullScreen.TextSize = 14.000
    buttonFullScreen.AutoButtonColor = false

    square.Name = "square"
    square.Parent = buttonFullScreen
    square.AnchorPoint = Vector2.new(0.5, 0.5)
    square.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    square.BorderColor3 = Color3.fromRGB(105, 105, 105)
    square.Position = UDim2.new(0.5, 0, 0.5, 0)
    square.Size = UDim2.new(0, 9, 0, 9)

    buttonMinimize.Name = "buttonMinimize"
    buttonMinimize.Parent = buttonClose
    buttonMinimize.AnchorPoint = Vector2.new(1, 0)
    buttonMinimize.BackgroundColor3 = Color3.fromRGB(32,32,32)
    buttonMinimize.BorderSizePixel = 0
    buttonMinimize.Position = UDim2.new(-1, 0, 0, 0)
    buttonMinimize.Size = UDim2.new(0, 46, 0, 27)
    buttonMinimize.Font = Enum.Font.SourceSans
    buttonMinimize.Text = ""
    buttonMinimize.TextColor3 = Color3.fromRGB(0, 0, 0)
    buttonMinimize.TextSize = 14.000
    buttonMinimize.AutoButtonColor = false

    line.Name = "line"
    line.Parent = buttonMinimize
    line.AnchorPoint = Vector2.new(0.5, 0.5)
    line.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
    line.BorderColor3 = Color3.fromRGB(105, 105, 105)
    line.BorderSizePixel = 0
    line.Position = UDim2.new(0.5, 0, 0.5, 0)
    line.Size = UDim2.new(0, 10, 0, 1)

    X.Name = "X"
    X.Parent = buttonClose
    X.AnchorPoint = Vector2.new(0.5, 0.5)
    X.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    X.BackgroundTransparency = 1.000
    X.Position = UDim2.new(0.5, 0, 0.5, -2)
    X.Size = UDim2.new(0, 22, 0, 22)
    X.Font = Enum.Font.SciFi
    X.Text = "x"
    X.TextColor3 = Color3.fromRGB(105, 105, 105)
    X.TextScaled = true
    X.TextSize = 50.000
    X.TextWrapped = true

    --close button shit
    buttonClose.MouseEnter:Connect(function()
      bottomCover.BackgroundColor3 = Color3.fromRGB(255,0,0)
      sideCover.BackgroundColor3 = Color3.fromRGB(255,0,0)
      buttonClose.ImageColor3 = Color3.fromRGB(255,0,0)
      X.TextColor3 = Color3.fromRGB(255,255,255)
    end)
    buttonClose.MouseLeave:Connect(function()
      bottomCover.BackgroundColor3 = Color3.fromRGB(32,32,32)
      sideCover.BackgroundColor3 = Color3.fromRGB(32,32,32)
      buttonClose.ImageColor3 = Color3.fromRGB(32,32,32)
      X.TextColor3 = Color3.fromRGB(105,105,105)
    end)
    buttonClose.MouseButton1Down:Connect(function()
      bottomCover.BackgroundColor3 = Color3.fromRGB(255,175,175)
      sideCover.BackgroundColor3 = Color3.fromRGB(255,175,175)
      buttonClose.ImageColor3 = Color3.fromRGB(255,175,175)
    end)
    buttonClose.MouseButton1Click:Connect(function()
      container.Parent = nil
    end)

    --fullscreen button shit
    buttonFullScreen.MouseEnter:Connect(function()
      buttonFullScreen.BackgroundColor3 = Color3.fromRGB(40,40,40)
      square.BackgroundColor3 = Color3.fromRGB(40,40,40)
      square.BorderColor3 = Color3.fromRGB(255,255,255)
    end)
    buttonFullScreen.MouseLeave:Connect(function()
      buttonFullScreen.BackgroundColor3 = Color3.fromRGB(32,32,32)
      square.BackgroundColor3 = Color3.fromRGB(32,32,32)
      square.BorderColor3 = Color3.fromRGB(105,105,105)
    end)
    buttonFullScreen.MouseButton1Down:Connect(function()
      buttonFullScreen.BackgroundColor3 = Color3.fromRGB(48,48,48)
      square.BackgroundColor3 = Color3.fromRGB(48,48,48)
    end)
    buttonFullScreen.MouseButton1Click :Connect(function()
      if topBar.Size.X.Offset ~= game:GetService("Workspace").CurrentCamera.ViewportSize.X then
        topBar.Position = UDim2.new(0,0,0,0)
        topBar.Size = UDim2.new(0,game:GetService("Workspace").CurrentCamera.ViewportSize.X,0,27)
        mainOutline.Size = UDim2.new(1,0,0,game:GetService("Workspace").CurrentCamera.ViewportSize.Y)
      else
        topBar.Size = UDim2.new(0,1202,0,27)
        mainOutline.Size = UDim2.new(1,0,0,602)
      end
    end)

    --minimize shit button shit
    buttonMinimize.MouseEnter:Connect(function()
      buttonMinimize.BackgroundColor3 = Color3.fromRGB(40,40,40)
      line.BackgroundColor3 = Color3.fromRGB(40,40,40)
      line.BackgroundColor3 = Color3.fromRGB(255,255,255)
    end)
    buttonMinimize.MouseLeave:Connect(function()
      buttonMinimize.BackgroundColor3 = Color3.fromRGB(32,32,32)
      line.BackgroundColor3 = Color3.fromRGB(32,32,32)
      line.BackgroundColor3 = Color3.fromRGB(105,105,105)
    end)
    buttonMinimize.MouseButton1Down:Connect(function()
      buttonMinimize.BackgroundColor3 = Color3.fromRGB(48,48,48)
      line.BackgroundColor3 = Color3.fromRGB(48,48,48)
    end)
    buttonMinimize.MouseButton1Click:Connect(function()
      mainOutline.Visible = false
    end)
  end

  local resizeButton = Instance.new("ImageButton")
  local imgButtonCut = Instance.new("ImageButton")

  --used for the resize option in the bottom right
  resizeButton.Name = "resizeButton"
  resizeButton.Parent = mainUIAccessories
  resizeButton.AnchorPoint = Vector2.new(1, 1)
  resizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  resizeButton.BackgroundTransparency = 1.000
  resizeButton.Position = UDim2.new(1, -8, 1, -8)
  resizeButton.Size = UDim2.new(0, 15, 0, 15)
  resizeButton.ZIndex = 2
  resizeButton.Image = "rbxassetid://3570695787"
  resizeButton.ScaleType = Enum.ScaleType.Slice
  resizeButton.SliceCenter = Rect.new(100, 100, 100, 100)
  resizeButton.SliceScale = 0.020
  resizeButton.ClipsDescendants = true


  imgButtonCut.Parent = resizeButton
  imgButtonCut.AutoButtonColor = false
  imgButtonCut.AnchorPoint = Vector2.new(0.5, 1)
  imgButtonCut.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
  imgButtonCut.BorderSizePixel = 0
  imgButtonCut.Position = UDim2.new(0, 0, 1.25, 0)
  imgButtonCut.Rotation = 45.000
  imgButtonCut.Size = UDim2.new(1, 0, 2, 0)
  imgButtonCut.ZIndex = 3
  imgButtonCut.ImageTransparency = 1.000

  local isResize = false

  resizeButton.MouseButton1Down:Connect(function()
    if (mouse.X - topBar.AbsolutePosition.X) < 800 then

      topBar.Size = UDim2.new(0,800, 0, 27)
    else
      topBar.Size = UDim2.new(0,(mouse.X - topBar.AbsolutePosition.X)+9, 0, 27)
    end
    if (mouse.Y - topBar.AbsolutePosition.Y) < 500 then
      mainOutline.Size = UDim2.new(1,0,0,500)
    else
      mainOutline.Size = UDim2.new(1,0,0,(mouse.Y - topBar.AbsolutePosition.Y)+9)
    end
    isResize = true
  end)

  uis.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 and isResize == true then
      isResize = false
    end
  end)

  mouse.Move:Connect(function()
    if isResize then
      if (mouse.X - topBar.AbsolutePosition.X) < 800 then
        topBar.Size = UDim2.new(0,800, 0, 27)
      else
        topBar.Size = UDim2.new(0,(mouse.X - topBar.AbsolutePosition.X)+9, 0, 27)
      end
      if (mouse.Y - topBar.AbsolutePosition.Y) < 500 then
        mainOutline.Size = UDim2.new(1,0,0,500)
      else
        mainOutline.Size = UDim2.new(1,0,0,(mouse.Y - topBar.AbsolutePosition.Y)+9)
      end
      if (mouse.X - topBar.AbsolutePosition.X) >= 800 and (mouse.Y - topBar.AbsolutePosition.Y) >= 500 then
        topBar.Size = UDim2.new(0,(mouse.X - topBar.AbsolutePosition.X)+9, 0, 27)
        mainOutline.Size = UDim2.new(1,0,0,(mouse.Y - topBar.AbsolutePosition.Y)+9)
      end
    end
  end)


  --used for displaying the usericon
  local userIconCover = Instance.new("ImageLabel")
  local icon = Instance.new("ImageLabel")
  local name = Instance.new("TextLabel")
  local underName = Instance.new("TextLabel")

  userIconCover.Name = "userIconCover"
  userIconCover.Parent = mainUIAccessories
  userIconCover.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  userIconCover.BackgroundTransparency = 1.000
  userIconCover.BorderSizePixel = 0
  userIconCover.Position = UDim2.new(0, 13, 0, 54)
  userIconCover.Size = UDim2.new(0.055, 0, 0, 66)
  userIconCover.ZIndex = 2
  userIconCover.Image = "http://www.roblox.com/asset/?id=6835969515"
  userIconCover.ImageColor3 = Color3.fromRGB(32, 32, 32)

  icon.Parent = userIconCover
  icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  icon.BackgroundTransparency = 1.000
  icon.Size = UDim2.new(1, 0, 1, 0)
  icon.AnchorPoint = Vector2.new(0.5,0.5)
  icon.Position = UDim2.new(0.5,0,0.5,0)
  icon.Image = game.Players:GetUserThumbnailAsync(game.Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)

  name.Name = "name"
  name.Parent = userIconCover
  name.AnchorPoint = Vector2.new(0,0.5)
  name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  name.BackgroundTransparency = 1.000
  name.Position = UDim2.new(1, 6, .375, 0)
  name.Size = UDim2.new(0, 200, 0, 50)
  name.Font = Enum.Font.SourceSansSemibold
  name.Text = ""
  name.TextColor3 = Color3.fromRGB(255, 255, 255)
  name.TextSize = 24.000
  name.TextXAlignment = Enum.TextXAlignment.Left

  underName.Name = "gameName"
  underName.Parent = userIconCover
  underName.AnchorPoint = Vector2.new(0, 0.5)
  underName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  underName.BackgroundTransparency = 1.000
  underName.Position = UDim2.new(1, 6, 0.625, 0)
  underName.Size = UDim2.new(0, 200, 0, 50)
  underName.Font = Enum.Font.SourceSans
  underName.Text = ""
  underName.TextColor3 = Color3.fromRGB(170, 170, 170)
  underName.TextSize = 16.000
  underName.TextXAlignment = Enum.TextXAlignment.Left

  userIconCover.Changed:Connect(function(value)
    if value == "AbsoluteSize" then
      userIconCover.Size = UDim2.new(0.055, 0, 0, userIconCover.AbsoluteSize.X)
    end
  end)

  mouse.Move:Connect(function()
    underName.TextSize = topBar.Size.X.Offset / 100
    name.TextSize = (topBar.Size.X.Offset / 100) * 2
    sideBarContainer.Size = UDim2.new(0.2, 0, .9, -(userIconCover.AbsoluteSize.Y + 4))
  end)

  local menu = {}

  menu.destroyUI = function()
    container.Parent = nil
  end

  menu.addTab = function(text, flag, enabled, iconId)
    local tabButton = Instance.new("ImageButton")
    local tabSelected = Instance.new("ImageLabel")
    local tabName = Instance.new("TextLabel")
    local tabLabel = Instance.new("ImageLabel")
    local settingContainer = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    local defaultTab = true

    for i,v in pairs(Win11Lib.tabs) do
      if v == true then
        defaultTab = false
        break
      end
    end

    if defaultTab then Win11Lib.tabs[flag] = enabled else Win11Lib.tabs[flag] = false end
    if Win11Lib.tabs[flag] == true then windowName.Text = text end

    Win11Lib.tabs.funcs[flag] = function()
      settingContainer.Visible =  Win11Lib.tabs[flag]
      tabSelected.Visible = Win11Lib.tabs[flag]
      tabButton.ImageTransparency = 1
    end

    --makes new tab option on left side
    tabButton.Name = "tabButton"
    tabButton.Parent = sideBarContainer
    tabButton.AnchorPoint = Vector2.new(0, 1)
    tabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tabButton.BackgroundTransparency = 1.000
    tabButton.Position = UDim2.new(0, 16, 0.075000003, 0)
    tabButton.Size = UDim2.new(.9, 0, 0, 36)
    tabButton.Image = "rbxassetid://3570695787"
    tabButton.ImageColor3 = Color3.fromRGB(45, 45, 45)
    tabButton.ScaleType = Enum.ScaleType.Slice
    tabButton.SliceCenter = Rect.new(100, 100, 100, 100)
    tabButton.SliceScale = 0.060

    if Win11Lib.tabs[flag] == false then
      tabButton.ImageTransparency = 1
    end

    tabSelected.Name = "tabSelected"
    tabSelected.Parent = tabButton
    tabSelected.AnchorPoint = Vector2.new(0, 0.5)
    tabSelected.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tabSelected.BackgroundTransparency = 1.000
    tabSelected.Position = UDim2.new(0, 0, 0.5, 0)
    tabSelected.Size = UDim2.new(0, 3, 0, 16)
    tabSelected.ZIndex = 2
    tabSelected.Image = "rbxassetid://3570695787"
    tabSelected.ImageColor3 = Color3.fromRGB(243, 128, 100)
    tabSelected.ScaleType = Enum.ScaleType.Slice
    tabSelected.SliceCenter = Rect.new(100, 100, 100, 100)
    tabSelected.SliceScale = 0.040
    tabSelected.Visible = Win11Lib.tabs[flag]

    tabName.Name = "tabName"
    tabName.Parent = tabButton
    tabName.AnchorPoint = Vector2.new(0, 0.5)
    tabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tabName.BackgroundTransparency = 1.000
    tabName.Position = UDim2.new(0, 42, 0.5, 0)
    tabName.Size = UDim2.new(1, 0, 1, 0)
    tabName.Font = Enum.Font.SourceSans
    tabName.Text = text
    tabName.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabName.TextSize = 18.000
    tabName.TextXAlignment = Enum.TextXAlignment.Left

    tabLabel.Name = "tabLabel"
    tabLabel.Parent = tabButton
    tabLabel.AnchorPoint = Vector2.new(0, 0.5)
    tabLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tabLabel.BackgroundTransparency = 1.000
    tabLabel.Position = UDim2.new(0.0500000007, 0, 0.5, 0)
    tabLabel.Size = UDim2.new(0, 16, 0, 16)
    tabLabel.Image = ("rbxthumb://type=Asset&id=" .. tostring(iconId) .. "&w=420&h=420")

    --Makes new container for options
    settingContainer.Name = "settingContainer"
    settingContainer.ElasticBehavior = Enum.ElasticBehavior.Never
    settingContainer.Parent = settingContainers
    settingContainer.Active = true
    settingContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    settingContainer.BackgroundTransparency = 1.000
    settingContainer.BorderColor3 = Color3.fromRGB(27, 42, 53)
    settingContainer.BorderSizePixel = 0
    settingContainer.ClipsDescendants = true
    settingContainer.Position = UDim2.new(0.2, 0, 0.1, 0)
    settingContainer.Size = UDim2.new(0.785, 0, 0.9, 0)
    settingContainer.BottomImage = ""
    settingContainer.CanvasSize = UDim2.new(0, 0, 0, 7)
    settingContainer.MidImage = ""
    settingContainer.TopImage = ""
    settingContainer.ScrollBarThickness = 0
    settingContainer.Visible =  Win11Lib.tabs[flag]

    UIListLayout.Parent = settingContainer
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 3)

    tabButton.MouseButton1Click:Connect(function()
      for i,tabValue in pairs(Win11Lib.tabs) do
        if tabValue == true then
          Win11Lib.tabs[i] = false
          Win11Lib.tabs[flag] = true
          windowName.Text = text
          Win11Lib.tabs.funcs[i]()
          tabButton.ImageTransparency = 0
          settingContainer.Visible =  Win11Lib.tabs[flag]
          tabSelected.Visible = Win11Lib.tabs[flag]
          break
        end
      end
    end)

    local options = {}

    options.addButton = function(text, descText, func)
      local button = Instance.new("ImageLabel")
      local outline_3 = Instance.new("ImageLabel")
      local TextLabel_3 = Instance.new("TextLabel")
      local button_2 = Instance.new("ImageButton")
      local Frame = Instance.new("ImageLabel")
      local TextLabel_4 = Instance.new("TextLabel")

      settingContainer.CanvasSize += UDim2.new(0, 0, 0, 71)

      button.Name = "button"
      button.Parent = settingContainer
      button.AnchorPoint = Vector2.new(0.5, 0.5)
      button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      button.BackgroundTransparency = 1.000
      button.BorderSizePixel = 0
      button.Position = UDim2.new(0, 1, 0.075000003, 0)
      button.Size = UDim2.new(1, -2, 0, 68)
      button.ZIndex = 3
      button.Image = "rbxassetid://3570695787"
      button.ImageColor3 = Color3.fromRGB(45, 45, 45)
      button.ScaleType = Enum.ScaleType.Slice
      button.SliceCenter = Rect.new(100, 100, 100, 100)
      button.SliceScale = 0.040

      outline_3.Name = "outline"
      outline_3.Parent = button
      outline_3.AnchorPoint = Vector2.new(0.5, 0.5)
      outline_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      outline_3.BackgroundTransparency = 1.000
      outline_3.Position = UDim2.new(0.5, 0, 0.5, 0)
      outline_3.Size = UDim2.new(1, 2, 1, 2)
      outline_3.ZIndex = 2
      outline_3.Image = "rbxassetid://3570695787"
      outline_3.ImageColor3 = Color3.fromRGB(29, 29, 29)
      outline_3.ScaleType = Enum.ScaleType.Slice
      outline_3.SliceCenter = Rect.new(100, 100, 100, 100)
      outline_3.SliceScale = 0.040

      TextLabel_3.Parent = button
      TextLabel_3.AnchorPoint = Vector2.new(0, 0.5)
      TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      TextLabel_3.BackgroundTransparency = 1.000
      TextLabel_3.BorderSizePixel = 0
      TextLabel_3.Position = UDim2.new(0, 17, 0.5, 0)
      TextLabel_3.Size = UDim2.new(0, 200, 0, 50)
      TextLabel_3.ZIndex = 3
      TextLabel_3.Font = Enum.Font.SourceSans
      TextLabel_3.Text = text
      TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
      TextLabel_3.TextSize = 18.000
      TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

      button_2.Name = "button"
      button_2.Parent = button
      button_2.AnchorPoint = Vector2.new(1, 0.5)
      button_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      button_2.BackgroundTransparency = 1.000
      button_2.BorderSizePixel = 0
      button_2.Position = UDim2.new(0.975, 0, 0.5, 0)
      button_2.Size = UDim2.new(0, 130, 0, 32)
      button_2.ZIndex = 3
      button_2.Image = "rbxassetid://3570695787"
      button_2.ImageColor3 = Color3.fromRGB(63, 63, 63)
      button_2.ScaleType = Enum.ScaleType.Slice
      button_2.SliceCenter = Rect.new(100, 100, 100, 100)
      button_2.SliceScale = 0.040

      Frame.Name = "Frame"
      Frame.Parent = button_2
      Frame.AnchorPoint = Vector2.new(0.5, 0.5)
      Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      Frame.BackgroundTransparency = 1.000
      Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
      Frame.Size = UDim2.new(0, 128, 0, 30)
      Frame.ZIndex = 3
      Frame.Image = "rbxassetid://3570695787"
      Frame.ImageColor3 = Color3.fromRGB(55, 55, 55)
      Frame.ScaleType = Enum.ScaleType.Slice
      Frame.SliceCenter = Rect.new(100, 100, 100, 100)
      Frame.SliceScale = 0.040

      TextLabel_4.Parent = button_2
      TextLabel_4.AnchorPoint = Vector2.new(0.5, 0.5)
      TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      TextLabel_4.BackgroundTransparency = 1.000
      TextLabel_4.Position = UDim2.new(0.5, 0, 0.5, 0)
      TextLabel_4.Size = UDim2.new(0, 1, 0, 1)
      TextLabel_4.ZIndex = 3
      TextLabel_4.Font = Enum.Font.SourceSans
      TextLabel_4.Text = text
      TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
      TextLabel_4.TextSize = 18.000

      --option description shit
      local description = Instance.new("TextLabel")
      description.Name = "description"
      description.Parent = button
      description.AnchorPoint = Vector2.new(0, 0.5)
      description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      description.BackgroundTransparency = 1.000
      description.BorderSizePixel = 0
      description.Position = UDim2.new(0, 17, 0.625, 0)
      description.Size = UDim2.new(0, 200, 0, 50)
      description.ZIndex = 3
      description.Font = Enum.Font.SourceSans
      description.TextColor3 = Color3.fromRGB(170, 170, 170)
      description.TextSize = 14.000
      description.TextXAlignment = Enum.TextXAlignment.Left
      description.Visible = false

      if descText and descText ~= "" then
        description.Text = descText
        description.Visible = true
        TextLabel_3.Position = UDim2.new(0, 17, 0.375, 0)
      end

    	button_2.MouseEnter:Connect(function()
    		button_2.Frame.ImageColor3 = Color3.fromRGB(63,63,63)
    	end)

    	button_2.MouseLeave:Connect(function()
    		button_2.Frame.ImageColor3 = Color3.fromRGB(55,55,55)
    	end)

    	button_2.MouseButton1Down:Connect(function()
    		button_2.Frame.ImageColor3 = Color3.fromRGB(73,73,73)
    	end)

    	button_2.MouseButton1Up:Connect(function()
    		button_2.Frame.ImageColor3 = Color3.fromRGB(63,63,63)
    	end)

    	button_2.MouseButton1Click:Connect(func)
    end

    options.addSlider = function(text, flag, min, max, defaultValue, precise, descText, iconId, func)
      local slider = Instance.new("ImageLabel")
      local outline = Instance.new("ImageLabel")
      local TextLabel = Instance.new("TextLabel")
      local slider_2 = Instance.new("ImageButton")
      local bar = Instance.new("ImageLabel")
      local circle = Instance.new("ImageButton")
      local inner = Instance.new("ImageLabel")
      local percentLabel = Instance.new("TextLabel")
      local icon = Instance.new("ImageLabel")
      settingContainer.CanvasSize += UDim2.new(0, 0, 0, 71)

      slider.Name = "slider"
      slider.Parent = settingContainer
      slider.AnchorPoint = Vector2.new(0.5, 0.5)
      slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      slider.BackgroundTransparency = 1.000
      slider.BorderSizePixel = 0
      slider.Position = UDim2.new(0, 1, 0.075000003, 0)
      slider.Size = UDim2.new(1, -2, 0, 68)
      slider.ZIndex = 3
      slider.Image = "rbxassetid://3570695787"
      slider.ImageColor3 = Color3.fromRGB(45, 45, 45)
      slider.ScaleType = Enum.ScaleType.Slice
      slider.SliceCenter = Rect.new(100, 100, 100, 100)
      slider.SliceScale = 0.040

      outline.Name = "outline"
      outline.Parent = slider
      outline.AnchorPoint = Vector2.new(0.5, 0.5)
      outline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      outline.BackgroundTransparency = 1.000
      outline.Position = UDim2.new(0.5, 0, 0.5, 0)
      outline.Size = UDim2.new(1, 2, 1, 2)
      outline.ZIndex = 2
      outline.Image = "rbxassetid://3570695787"
      outline.ImageColor3 = Color3.fromRGB(29, 29, 29)
      outline.ScaleType = Enum.ScaleType.Slice
      outline.SliceCenter = Rect.new(100, 100, 100, 100)
      outline.SliceScale = 0.040

      TextLabel.Parent = slider
      TextLabel.AnchorPoint = Vector2.new(0, 0.5)
      TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      TextLabel.BackgroundTransparency = 1.000
      TextLabel.BorderSizePixel = 0
      TextLabel.Position = UDim2.new(0, 17, 0.5, 0)
      TextLabel.Size = UDim2.new(0, 200, 0, 50)
      TextLabel.ZIndex = 3
      TextLabel.Font = Enum.Font.SourceSans
      TextLabel.Text = text
      TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
      TextLabel.TextSize = 18.000
      TextLabel.TextXAlignment = Enum.TextXAlignment.Left

      slider_2.Name = "slider"
      slider_2.Parent = slider
      slider_2.AnchorPoint = Vector2.new(1, 0.5)
      slider_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      slider_2.BackgroundTransparency = 1.000
      slider_2.BorderSizePixel = 0
      slider_2.Position = UDim2.new(0.975000024, 0, 0.5, 0)
      slider_2.Size = UDim2.new(0, 200, 0, 4)
      slider_2.ZIndex = 3
      slider_2.Image = "rbxassetid://3570695787"
      slider_2.ImageColor3 = Color3.fromRGB(159, 159, 159)
      slider_2.ScaleType = Enum.ScaleType.Slice
      slider_2.SliceCenter = Rect.new(100, 100, 100, 100)
      slider_2.SliceScale = 0.120

      bar.Name = "bar"
      bar.Parent = slider_2
      bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      bar.BackgroundTransparency = 1.000
      bar.Size = UDim2.new(0, 0, 1, 0)
      bar.ZIndex = 3
      bar.Image = "rbxassetid://3570695787"
      bar.ImageColor3 = Color3.fromRGB(243, 128, 100)
      bar.ScaleType = Enum.ScaleType.Slice
      bar.SliceCenter = Rect.new(100, 100, 100, 100)
      bar.SliceScale = 0.120

      circle.Name = "circle"
      circle.Parent = bar
      circle.AnchorPoint = Vector2.new(0.5, 0.5)
      circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      circle.BackgroundTransparency = 1.000
      circle.BorderSizePixel = 0
      circle.Position = UDim2.new(1, 0, 0.5, 0)
      circle.Size = UDim2.new(0, 22, 0, 22)
      circle.ZIndex = 3
      circle.Image = "rbxassetid://3570695787"
      circle.ImageColor3 = Color3.fromRGB(69, 69, 69)
      circle.ScaleType = Enum.ScaleType.Crop

      inner.Name = "inner"
      inner.Parent = circle
      inner.AnchorPoint = Vector2.new(0.5, 0.5)
      inner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      inner.BackgroundTransparency = 1.000
      inner.Position = UDim2.new(0.5, 0, 0.5, 0)
      inner.Size = UDim2.new(0, 12, 0, 12)
      inner.ZIndex = 3
      inner.Image = "rbxassetid://3570695787"
      inner.ImageColor3 = Color3.fromRGB(243, 128, 100)
      inner.ScaleType = Enum.ScaleType.Crop
      inner.SliceCenter = Rect.new(100, 100, 100, 100)
      inner.SliceScale = 0.120

      percentLabel.Name = "percentLabel"
      percentLabel.Parent = slider_2
      percentLabel.AnchorPoint = Vector2.new(0.5, 0.5)
      percentLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      percentLabel.BackgroundTransparency = 1.000
      percentLabel.BorderSizePixel = 0
      percentLabel.Position = UDim2.new(0, -20, 0.5, 0)
      percentLabel.Size = UDim2.new(0, 1, 0, 1)
      percentLabel.ZIndex = 3
      percentLabel.Font = Enum.Font.SourceSans
      percentLabel.Text = min
      percentLabel.TextColor3 = Color3.fromRGB(206, 206, 206)
      percentLabel.TextSize = 18.000

      icon.Name = "icon"
      icon.Parent = slider_2
      icon.AnchorPoint = Vector2.new(1, 0.5)
      icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      icon.BackgroundTransparency = 1.000
      icon.BorderSizePixel = 0
      icon.Position = UDim2.new(0, -42, 0.5, 0)
      icon.Size = UDim2.new(0, 24, 0, 24)
      icon.ZIndex = 3
      icon.Image = ("rbxthumb://type=Asset&id=" .. tostring(iconId) .. "&w=420&h=420")

      --option description shit
      local description = Instance.new("TextLabel")
      description.Name = "description"
      description.Parent = slider
      description.AnchorPoint = Vector2.new(0, 0.5)
      description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      description.BackgroundTransparency = 1.000
      description.BorderSizePixel = 0
      description.Position = UDim2.new(0, 17, 0.625, 0)
      description.Size = UDim2.new(0, 200, 0, 50)
      description.ZIndex = 3
      description.Font = Enum.Font.SourceSans
      description.TextColor3 = Color3.fromRGB(170, 170, 170)
      description.TextSize = 14.000
      description.TextXAlignment = Enum.TextXAlignment.Left
      description.Visible = false

      if descText and descText ~= "" then
        description.Text = descText
        description.Visible = true
        TextLabel.Position = UDim2.new(0, 17, 0.375, 0)
      end

    	local isDown = false
      local range = (max - min)
      local value

    	slider_2.MouseButton1Down:Connect(function()
    		slider_2.bar.Size = UDim2.new(0,(mouse.X - slider_2.AbsolutePosition.X), 1, 0)
    		isDown = true
    	end)

    	slider_2.bar.circle.MouseButton1Down:Connect(function()
    		slider_2.bar.Size = UDim2.new(0,(mouse.X - slider_2.AbsolutePosition.X), 1, 0)
    		isDown = true
    	end)

    	uis.InputEnded:Connect(function(input)
    		if input.UserInputType == Enum.UserInputType.MouseButton1 and isDown == true then
    			isDown = false
          func(value)
    		end
    	end)

    	mouse.Move:Connect(function()
        if precise then
          value = (slider_2.bar.Size.X.Offset / slider_2.AbsoluteSize.X) * range + min
        else
          value = math.floor((slider_2.bar.Size.X.Offset / slider_2.AbsoluteSize.X) * range) + min
        end
    		if isDown then
    			if mouse.X < slider_2.AbsolutePosition.X then
    				slider_2.bar.Size = UDim2.new(0,0,1,0)
    			elseif mouse.X > (slider_2.AbsolutePosition.X + slider_2.AbsoluteSize.X) then
    				slider_2.bar.Size = UDim2.new(0,slider_2.AbsoluteSize.x,1,0)
    			else
    				slider_2.bar.Size = UDim2.new(0,(mouse.X - slider_2.AbsolutePosition.X),1,0)
    			end
          slider_2.percentLabel.Text = value
    		end
    	end)
      slider_2.percentLabel.Text = defaultValue
      slider_2.bar.Size = UDim2.new(0,((defaultValue / range) * slider_2.AbsoluteSize.X),1,0)
      func(defaultValue)
    end

    options.addDropdown = function(text, descText)
      local dropdown = Instance.new("ImageLabel")
      local dropdownBody = Instance.new("ImageButton")
      local sectionContainer = Instance.new("Frame")
      local UIListLayout_2 = Instance.new("UIListLayout")
      local chevron = Instance.new("ImageLabel")
      local TextLabel_7 = Instance.new("TextLabel")
      settingContainer.CanvasSize += UDim2.new(0, 0, 0, 71)

      dropdown.Name = "dropdown"
      dropdown.Parent = settingContainer
      dropdown.AnchorPoint = Vector2.new(0.5, 0.5)
      dropdown.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
      dropdown.BackgroundTransparency = 1.000
      dropdown.BorderSizePixel = 45
      dropdown.Position = UDim2.new(0.5, -1, 0.5, 0)
      dropdown.Size = UDim2.new(1, 0, 0, 70)
      dropdown.ZIndex = 2
      dropdown.Image = "rbxassetid://3570695787"
      dropdown.ImageColor3 = Color3.fromRGB(29, 29, 29)
      dropdown.ScaleType = Enum.ScaleType.Slice
      dropdown.SliceCenter = Rect.new(100, 100, 100, 100)
      dropdown.SliceScale = 0.040

      dropdownBody.Name = "dropdownBody"
      dropdownBody.Parent = dropdown
      dropdownBody.AnchorPoint = Vector2.new(0.5, 0.5)
      dropdownBody.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      dropdownBody.BackgroundTransparency = 1.000
      dropdownBody.BorderSizePixel = 0
      dropdownBody.ClipsDescendants = true
      dropdownBody.Position = UDim2.new(0.5, 0, 0.5, 0)
      dropdownBody.Size = UDim2.new(1, -2, 1, -2)
      dropdownBody.ZIndex = 3
      dropdownBody.Image = "rbxassetid://3570695787"
      dropdownBody.ImageColor3 = Color3.fromRGB(45, 45, 45)
      dropdownBody.ScaleType = Enum.ScaleType.Slice
      dropdownBody.SliceCenter = Rect.new(100, 100, 100, 100)
      dropdownBody.SliceScale = 0.040

      sectionContainer.Name = "sectionContainer"
      sectionContainer.Parent = dropdownBody
      sectionContainer.AnchorPoint = Vector2.new(0, 1)
      sectionContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      sectionContainer.BackgroundTransparency = 1.000
      sectionContainer.BorderSizePixel = 0
      sectionContainer.Position = UDim2.new(0, 0, 1, 0)
      sectionContainer.Size = UDim2.new(1, 0, 1, -68)

      UIListLayout_2.Parent = sectionContainer
      UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

      chevron.Name = "chevron"
      chevron.Parent = dropdownBody
      chevron.AnchorPoint = Vector2.new(1, 0)
      chevron.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      chevron.BackgroundTransparency = 1.000
      chevron.BorderSizePixel = 0
      chevron.Position = UDim2.new(1, -18, 0, 19)
      chevron.Size = UDim2.new(0, 24, 0, 28)
      chevron.ZIndex = 3
      chevron.Image = "http://www.roblox.com/asset/?id=2418686949"

      TextLabel_7.Parent = dropdownBody
      TextLabel_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      TextLabel_7.BackgroundTransparency = 1.000
      TextLabel_7.BorderSizePixel = 0
      TextLabel_7.Position = UDim2.new(0, 17, 0, 8)
      TextLabel_7.Size = UDim2.new(0, 200, 0, 50)
      TextLabel_7.ZIndex = 3
      TextLabel_7.Font = Enum.Font.SourceSans
      TextLabel_7.Text = text
      TextLabel_7.TextColor3 = Color3.fromRGB(255, 255, 255)
      TextLabel_7.TextSize = 18.000
      TextLabel_7.TextXAlignment = Enum.TextXAlignment.Left

      --option description shit
      local description = Instance.new("TextLabel")
      description.Name = "description"
      description.Parent = dropdown
      description.AnchorPoint = Vector2.new(0, 0.5)
      description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      description.BackgroundTransparency = 1.000
      description.BorderSizePixel = 0
      description.Position = UDim2.new(0, 17, 0, 43)
      description.Size = UDim2.new(0, 200, 0, 50)
      description.ZIndex = 3
      description.Font = Enum.Font.SourceSans
      description.TextColor3 = Color3.fromRGB(170, 170, 170)
      description.TextSize = 14.000
      description.TextXAlignment = Enum.TextXAlignment.Left
      description.Visible = false

      if descText and descText ~= "" then
        description.Text = descText
        description.Visible = true
        TextLabel_7.Position = UDim2.new(0, 17, 0, 0)
      end

    	local toggle = false

    	dropdownBody.MouseButton1Click:Connect(function()
        toggle = not toggle
        if toggle and (#dropdownBody.sectionContainer:GetChildren() - 1) > -1 then
          dropdownBody.chevron.Rotation = 90
          dropdown.Size = UDim2.new(1,0,0,((#dropdownBody.sectionContainer:GetChildren() - 1) * 57) + 80)
          settingContainer.CanvasSize = UDim2.new(0,0,0,((settingContainer.CanvasSize.Y.Offset + dropdown.Size.Y.Offset)-69))
        else
          dropdownBody.chevron.Rotation = 0
          settingContainer.CanvasSize = UDim2.new(0,0,0,(settingContainer.CanvasSize.Y.Offset - dropdown.Size.Y.Offset)+69)
          dropdown.Size = UDim2.new(1,0,0,70)
        end
      end)

      local dropdownOptions = {}

      dropdownOptions.addOption = function(name, flag, defaultValue, func)
        Win11Lib.flags.dropdownToggles[flag] = false
        local callFunctionToggle = false
        if func then
          callFunctionToggle = true
        end

        local optionContainer = Instance.new("TextButton")
        local disabledCircle = Instance.new("ImageLabel")
        local innerCircle = Instance.new("ImageLabel")
        local TextLabel_5 = Instance.new("TextLabel")

        optionContainer.Name = "optionContainer"
        optionContainer.Parent = sectionContainer
        optionContainer.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        optionContainer.BorderColor3 = Color3.fromRGB(29, 29, 29)
        optionContainer.Size = UDim2.new(1, 0, 0, 57)
        optionContainer.ZIndex = 3
        optionContainer.AutoButtonColor = false
        optionContainer.Font = Enum.Font.SourceSans
        optionContainer.Text = ""
        optionContainer.TextColor3 = Color3.fromRGB(0, 0, 0)
        optionContainer.TextSize = 14.000

        disabledCircle.Name = "disabledCircle"
        disabledCircle.Parent = optionContainer
        disabledCircle.AnchorPoint = Vector2.new(0.5, 0.5)
        disabledCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        disabledCircle.BackgroundTransparency = 1.000
        disabledCircle.Position = UDim2.new(0, 58, 0.5, 0)
        disabledCircle.Size = UDim2.new(0, 20, 0, 20)
        disabledCircle.ZIndex = 3
        disabledCircle.Image = "rbxassetid://3570695787"
        disabledCircle.ImageColor3 = Color3.fromRGB(158, 158, 158)

        innerCircle.Name = "innerCircle"
        innerCircle.Parent = disabledCircle
        innerCircle.AnchorPoint = Vector2.new(0.5, 0.5)
        innerCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        innerCircle.BackgroundTransparency = 1.000
        innerCircle.Position = UDim2.new(0.5, 0, 0.5, 0)
        innerCircle.Size = UDim2.new(1, -2, 1, -2)
        innerCircle.ZIndex = 3
        innerCircle.Image = "rbxassetid://3570695787"
        innerCircle.ImageColor3 = Color3.fromRGB(39, 39, 39)

        TextLabel_5.Parent = optionContainer
        TextLabel_5.AnchorPoint = Vector2.new(0, 0.5)
        TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_5.BackgroundTransparency = 1.000
        TextLabel_5.Position = UDim2.new(0, 87, 0.5, 0)
        TextLabel_5.Size = UDim2.new(0, 200, 0, 50)
        TextLabel_5.ZIndex = 3
        TextLabel_5.Font = Enum.Font.SourceSans
        TextLabel_5.Text = name
        TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_5.TextSize = 18.000
        TextLabel_5.TextXAlignment = Enum.TextXAlignment.Left

        local function updateValue()
          Win11Lib.flags.dropdownToggles[flag] = not Win11Lib.flags.dropdownToggles[flag]
          if callFunctionToggle then func(Win11Lib.flags.dropdownToggles[flag]) end
      		if Win11Lib.flags.dropdownToggles[flag] then
      			optionContainer.disabledCircle.ImageColor3 = Color3.fromRGB(243, 128, 100)
      			optionContainer.disabledCircle.innerCircle.ImageColor3 = Color3.fromRGB(0, 0, 0)
      			optionContainer.disabledCircle.innerCircle.Size = UDim2.new(0,12,0,12)
      		else
      			optionContainer.disabledCircle.ImageColor3 = Color3.fromRGB(158, 158, 158)
      			optionContainer.disabledCircle.innerCircle.ImageColor3 = Color3.fromRGB(39, 39, 39)
      			optionContainer.disabledCircle.innerCircle.Size = UDim2.new(1,-2,1,-2)
      		end
        end

        if defaultValue == true then
          updateValue()
        else
          func(Win11Lib.flags.dropdownToggles[flag])
        end
        optionContainer.MouseButton1Click:Connect(updateValue)
      end

      dropdownOptions.clear = function()
        for i,v in pairs(sectionContainer:GetChildren()) do
          if v:IsA("TextButton") then
            v.Parent = nil
          end
        end
        for i=1, #Win11Lib.flags.dropdownToggles do
          table.remove(Win11Lib.flags.dropdownToggles, i)
        end
        if toggle and (#dropdownBody.sectionContainer:GetChildren() - 1) > -1 then
    			dropdownBody.chevron.Rotation = 90
    			dropdown.Size = UDim2.new(1,0,0,((#dropdownBody.sectionContainer:GetChildren() - 1) * 57) + 80)
    			settingContainer.CanvasSize = UDim2.new(0,0,0,((settingContainer.CanvasSize.Y.Offset + dropdown.Size.Y.Offset)-69))
    		else
    			dropdownBody.chevron.Rotation = 0
    			settingContainer.CanvasSize = UDim2.new(0,0,0,(settingContainer.CanvasSize.Y.Offset - dropdown.Size.Y.Offset)+69)
    			dropdown.Size = UDim2.new(1,0,0,70)
    		end
      end

      dropdownOptions.remove = function(flag)
        local physicalOption
        local flagIndex = 0
        for i,v in pairs(Win11Lib.flags.dropdownToggles) do
          flagIndex += 1
          if i == flag then
            break
          end
        end

        if #sectionContainer:GetChildren() == 2 then
          flagIndex += 1
        end

        for k,l in pairs(sectionContainer:GetChildren()) do
          if k == flagIndex then
            l.Parent = nil
            if toggle and (#dropdownBody.sectionContainer:GetChildren() - 1) > -1 then
        			dropdownBody.chevron.Rotation = 90
        			dropdown.Size = UDim2.new(1,0,0,((#dropdownBody.sectionContainer:GetChildren() - 1) * 57) + 80)
        			settingContainer.CanvasSize = UDim2.new(0,0,0,((settingContainer.CanvasSize.Y.Offset + dropdown.Size.Y.Offset)-69))
        		else
        			dropdownBody.chevron.Rotation = 0
        			settingContainer.CanvasSize = UDim2.new(0,0,0,(settingContainer.CanvasSize.Y.Offset - dropdown.Size.Y.Offset)+69)
        			dropdown.Size = UDim2.new(1,0,0,70)
        		end
          end
        end
      end
      return dropdownOptions
    end

    options.addToggle = function(text, flag, descText, defaultValue, func)
      Win11Lib.flags.toggles[flag] = false
      local callFunctionToggle = false
      if func then
        callFunctionToggle = true
      end
      local toggle = Instance.new("ImageLabel")
      local outline_2 = Instance.new("ImageLabel")
      local TextLabel_2 = Instance.new("TextLabel")
      local toggle_2 = Instance.new("ImageButton")
      local inner_2 = Instance.new("ImageLabel")
      local circle_2 = Instance.new("ImageLabel")
      settingContainer.CanvasSize += UDim2.new(0, 0, 0, 71)

      toggle.Name = "toggle"
      toggle.Parent = settingContainer
      toggle.AnchorPoint = Vector2.new(0.5, 0.5)
      toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      toggle.BackgroundTransparency = 1.000
      toggle.BorderSizePixel = 0
      toggle.Position = UDim2.new(0, 1, 0.075000003, 0)
      toggle.Size = UDim2.new(1, -2, 0, 68)
      toggle.ZIndex = 3
      toggle.Image = "rbxassetid://3570695787"
      toggle.ImageColor3 = Color3.fromRGB(45, 45, 45)
      toggle.ScaleType = Enum.ScaleType.Slice
      toggle.SliceCenter = Rect.new(100, 100, 100, 100)
      toggle.SliceScale = 0.040

      outline_2.Name = "outline"
      outline_2.Parent = toggle
      outline_2.AnchorPoint = Vector2.new(0.5, 0.5)
      outline_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      outline_2.BackgroundTransparency = 1.000
      outline_2.Position = UDim2.new(0.5, 0, 0.5, 0)
      outline_2.Size = UDim2.new(1, 2, 1, 2)
      outline_2.ZIndex = 2
      outline_2.Image = "rbxassetid://3570695787"
      outline_2.ImageColor3 = Color3.fromRGB(29, 29, 29)
      outline_2.ScaleType = Enum.ScaleType.Slice
      outline_2.SliceCenter = Rect.new(100, 100, 100, 100)
      outline_2.SliceScale = 0.040

      TextLabel_2.Parent = toggle
      TextLabel_2.AnchorPoint = Vector2.new(0, 0.5)
      TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      TextLabel_2.BackgroundTransparency = 1.000
      TextLabel_2.BorderSizePixel = 0
      TextLabel_2.Position = UDim2.new(0, 17, 0.5, 0)
      TextLabel_2.Size = UDim2.new(0, 200, 0, 50)
      TextLabel_2.ZIndex = 3
      TextLabel_2.Font = Enum.Font.SourceSans
      TextLabel_2.Text = text
      TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
      TextLabel_2.TextSize = 18.000
      TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

      toggle_2.Name = "toggle"
      toggle_2.Parent = toggle
      toggle_2.AnchorPoint = Vector2.new(1, 0.5)
      toggle_2.BackgroundColor3 = Color3.fromRGB(158, 158, 158)
      toggle_2.BackgroundTransparency = 1.000
      toggle_2.BorderSizePixel = 0
      toggle_2.Position = UDim2.new(0.975000024, 0, 0.5, 0)
      toggle_2.Size = UDim2.new(0, 40, 0, 20)
      toggle_2.ZIndex = 3
      toggle_2.Image = "rbxassetid://3570695787"
      toggle_2.ImageColor3 = Color3.fromRGB(158, 158, 158)
      toggle_2.ScaleType = Enum.ScaleType.Slice
      toggle_2.SliceCenter = Rect.new(100, 100, 100, 100)

      inner_2.Name = "inner"
      inner_2.Parent = toggle_2
      inner_2.AnchorPoint = Vector2.new(0.5, 0.5)
      inner_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      inner_2.BackgroundTransparency = 1.000
      inner_2.BorderSizePixel = 0
      inner_2.Position = UDim2.new(0.5, 0, 0.5, 0)
      inner_2.Size = UDim2.new(0, 38, 0, 18)
      inner_2.ZIndex = 3
      inner_2.Image = "rbxassetid://3570695787"
      inner_2.ImageColor3 = Color3.fromRGB(43, 43, 43)
      inner_2.ScaleType = Enum.ScaleType.Slice
      inner_2.SliceCenter = Rect.new(100, 100, 100, 100)

      circle_2.Name = "circle"
      circle_2.Parent = toggle_2
      circle_2.AnchorPoint = Vector2.new(0, 0.5)
      circle_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      circle_2.BackgroundTransparency = 1.000
      circle_2.BorderSizePixel = 0
      circle_2.Position = UDim2.new(0, 4, 0.5, 0)
      circle_2.Size = UDim2.new(0, 12, 0, 12)
      circle_2.ZIndex = 3
      circle_2.Image = "rbxassetid://3570695787"
      circle_2.ImageColor3 = Color3.fromRGB(206, 206, 206)

      --option description shit
      local description = Instance.new("TextLabel")
      description.Name = "description"
      description.Parent = toggle
      description.AnchorPoint = Vector2.new(0, 0.5)
      description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      description.BackgroundTransparency = 1.000
      description.BorderSizePixel = 0
      description.Position = UDim2.new(0, 17, 0.625, 0)
      description.Size = UDim2.new(0, 200, 0, 50)
      description.ZIndex = 3
      description.Font = Enum.Font.SourceSans
      description.TextColor3 = Color3.fromRGB(170, 170, 170)
      description.TextSize = 14.000
      description.TextXAlignment = Enum.TextXAlignment.Left
      description.Visible = false

      if descText and descText ~= "" then
        description.Text = descText
        description.Visible = true
        TextLabel_2.Position = UDim2.new(0, 17, 0.375, 0)
      end

      local function toggleF()
        Win11Lib.flags.toggles[flag] = not Win11Lib.flags.toggles[flag]
        if callFunctionToggle then func(Win11Lib.flags.toggles[flag]) end

        local parent = toggle_2
      	local circle = parent.circle
      	local accentColor = Color3.new(243, 128, 100)

        if Win11Lib.flags.toggles[flag] then
          circle.Position = UDim2.new(0,24,0.5,0)
          parent.ImageColor3 = Color3.fromRGB((accentColor.R - 48), (accentColor.G - 48), (accentColor.B - 48))
          circle.ImageColor3 = Color3.fromRGB(accentColor.R,accentColor.G,accentColor.B)
        else
          circle.Position = UDim2.new(0,4,0.5,0)
          parent.ImageColor3 = Color3.fromRGB(158,158,158)
          circle.ImageColor3 = Color3.fromRGB(206,206,206)
        end
      end
      if defaultValue == true then
        toggleF()
      else
        func(Win11Lib.flags.toggles[flag])
      end
      toggle_2.MouseButton1Click:Connect(toggleF)
    end

    return options
  end

  if usericonId ~= "" then
    icon.Image = ("rbxthumb://type=Asset&id=" .. tostring(usericonId) .. "&w=420&h=420")
  end
  name.Text = userIconText
  underName.Text = userIconSubText

  sideBarContainer.Size = UDim2.new(0.2, 0, .9, -(userIconCover.AbsoluteSize.Y + 4))

  return menu
end
return Win11Lib
