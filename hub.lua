-- LocalScript inside StarterPlayerScripts
-- Name: Script Hub
 
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
 
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local localUsername = player.Name -- Automatically gets your username!
 
-- ==========================================
-- 1. BLUR & LOADING SCREEN CREATION
-- ==========================================
 
local blurEffect = Instance.new("BlurEffect")
blurEffect.Name = "HubLoadingBlur"
blurEffect.Size = 24
blurEffect.Parent = Lighting
 
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ScriptHubGui"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui
 
local loadingBackground = Instance.new("Frame")
loadingBackground.Name = "LoadingBackground"
loadingBackground.Size = UDim2.new(1, 0, 1, 0)
loadingBackground.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
loadingBackground.BackgroundTransparency = 0.4
loadingBackground.Parent = screenGui
 
local loadingCard = Instance.new("Frame")
loadingCard.Name = "LoadingCard"
loadingCard.Size = UDim2.new(0, 500, 0, 320)
loadingCard.Position = UDim2.new(0.5, -250, 0.5, -160)
loadingCard.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
loadingCard.BorderSizePixel = 0
loadingCard.Parent = loadingBackground
 
local cardCorner = Instance.new("UICorner")
cardCorner.CornerRadius = UDim.new(0, 35)
cardCorner.Parent = loadingCard
 
local cardStroke = Instance.new("UIStroke")
cardStroke.Color = Color3.fromRGB(0, 120, 0)
cardStroke.Thickness = 8
cardStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
cardStroke.Parent = loadingCard
 
local topLabel = Instance.new("TextLabel")
topLabel.Size = UDim2.new(1, -60, 0, 80)
topLabel.Position = UDim2.new(0, 30, 0, 20)
topLabel.BackgroundTransparency = 1
topLabel.Text = "Bambi's Script hub / Lua Executor\nis loading!"
topLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
topLabel.TextSize = 28
topLabel.Font = Enum.Font.GothamBold
topLabel.TextXAlignment = Enum.TextXAlignment.Left
topLabel.TextYAlignment = Enum.TextYAlignment.Top
topLabel.Parent = loadingCard
 
local progressLabel = Instance.new("TextLabel")
progressLabel.Size = UDim2.new(1, 0, 0, 80)
progressLabel.Position = UDim2.new(0, 0, 0.5, -40)
progressLabel.BackgroundTransparency = 1
progressLabel.Text = "LOADING 0%"
progressLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
progressLabel.TextSize = 55
progressLabel.Font = Enum.Font.GothamBold
progressLabel.Parent = loadingCard
 
local bottomLabel = Instance.new("TextLabel")
bottomLabel.Size = UDim2.new(1, -60, 0, 40)
bottomLabel.Position = UDim2.new(0, 30, 1, -60)
bottomLabel.BackgroundTransparency = 1
bottomLabel.Text = "this may take few seconds..."
bottomLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
bottomLabel.TextSize = 22
bottomLabel.Font = Enum.Font.Gotham
bottomLabel.TextXAlignment = Enum.TextXAlignment.Right
bottomLabel.Parent = loadingCard
 
 
-- ==========================================
-- 2. CORN-THEMED MAIN FRAME CONFIGURATION
-- ==========================================
 
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 500, 0, 340)
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -170)
mainFrame.BackgroundColor3 = Color3.fromRGB(244, 196, 48)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Visible = false
mainFrame.Parent = screenGui
 
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 10)
mainCorner.Parent = mainFrame
 
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 42)
titleBar.BackgroundColor3 = Color3.fromRGB(34, 76, 40)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame
 
local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 10)
titleCorner.Parent = titleBar
 
local titleFix = Instance.new("Frame")
titleFix.Size = UDim2.new(1, 0, 0.5, 0)
titleFix.Position = UDim2.new(0, 0, 0.5, 0)
titleFix.BackgroundColor3 = Color3.fromRGB(34, 76, 40)
titleFix.BorderSizePixel = 0
titleFix.ZIndex = 0
titleFix.Parent = titleBar
 
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, -90, 1, 0)
titleLabel.Position = UDim2.new(0, 15, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "🌽 Bambi's Script Hub / Lua Executor"
titleLabel.TextColor3 = Color3.fromRGB(255, 248, 220)
titleLabel.TextSize = 18
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = titleBar
 
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 6)
closeButton.BackgroundColor3 = Color3.fromRGB(50, 96, 55)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 120, 120)
closeButton.TextSize = 14
closeButton.Font = Enum.Font.GothamBold
closeButton.AutoButtonColor = false
closeButton.Parent = titleBar
 
local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeButton
 
local miniButton = Instance.new("TextButton")
miniButton.Name = "MinimizeButton"
miniButton.Size = UDim2.new(0, 30, 0, 30)
miniButton.Position = UDim2.new(1, -70, 0, 6)
miniButton.BackgroundColor3 = Color3.fromRGB(50, 96, 55)
miniButton.Text = "-"
miniButton.TextColor3 = Color3.fromRGB(244, 196, 48)
miniButton.TextSize = 14
miniButton.Font = Enum.Font.GothamBold
miniButton.AutoButtonColor = false
miniButton.Parent = titleBar
 
local miniCorner = Instance.new("UICorner")
miniCorner.CornerRadius = UDim.new(0, 6)
miniCorner.Parent = miniButton
 
 
-- ==========================================
-- 2B. THREE-TAB NAVIGATION SYSTEM BAR
-- ==========================================
 
local tabSystemBar = Instance.new("Frame")
tabSystemBar.Name = "TabSystemBar"
tabSystemBar.Size = UDim2.new(1, -20, 0, 32)
tabSystemBar.Position = UDim2.new(0, 10, 0, 48)
tabSystemBar.BackgroundTransparency = 1
tabSystemBar.Parent = mainFrame
 
-- Hub Tab Button
local hubTabBtn = Instance.new("TextButton")
hubTabBtn.Name = "HubTabButton"
hubTabBtn.Size = UDim2.new(0.333, -4, 1, 0)
hubTabBtn.Position = UDim2.new(0, 0, 0, 0)
hubTabBtn.BackgroundColor3 = Color3.fromRGB(34, 76, 40)
hubTabBtn.Text = "Script Hub"
hubTabBtn.TextColor3 = Color3.fromRGB(255, 250, 225)
hubTabBtn.TextSize = 12
hubTabBtn.Font = Enum.Font.GothamBold
hubTabBtn.AutoButtonColor = false
hubTabBtn.Parent = tabSystemBar
 
local hubTabCorner = Instance.new("UICorner")
hubTabCorner.CornerRadius = UDim.new(0, 6)
hubTabCorner.Parent = hubTabBtn
 
-- Executor Tab Button
local execTabBtn = Instance.new("TextButton")
execTabBtn.Name = "ExecutorTabButton"
execTabBtn.Size = UDim2.new(0.333, -4, 1, 0)
execTabBtn.Position = UDim2.new(0.333, 2, 0, 0)
execTabBtn.BackgroundColor3 = Color3.fromRGB(220, 185, 50)
execTabBtn.Text = "Lua Executor"
execTabBtn.TextColor3 = Color3.fromRGB(60, 50, 20)
execTabBtn.TextSize = 12
execTabBtn.Font = Enum.Font.GothamBold
execTabBtn.AutoButtonColor = false
execTabBtn.Parent = tabSystemBar
 
local execTabCorner = Instance.new("UICorner")
execTabCorner.CornerRadius = UDim.new(0, 6)
execTabCorner.Parent = execTabBtn
 
-- Credits Tab Button
local credTabBtn = Instance.new("TextButton")
credTabBtn.Name = "CreditsTabButton"
credTabBtn.Size = UDim2.new(0.333, -4, 1, 0)
credTabBtn.Position = UDim2.new(0.666, 4, 0, 0)
credTabBtn.BackgroundColor3 = Color3.fromRGB(220, 185, 50)
credTabBtn.Text = "Credits"
credTabBtn.TextColor3 = Color3.fromRGB(60, 50, 20)
credTabBtn.TextSize = 12
credTabBtn.Font = Enum.Font.GothamBold
credTabBtn.AutoButtonColor = false
credTabBtn.Parent = tabSystemBar
 
local credTabCorner = Instance.new("UICorner")
credTabCorner.CornerRadius = UDim.new(0, 6)
credTabCorner.Parent = credTabBtn
 
 
-- ==========================================
-- 3. TAB 1: SCRIPT HUB PANEL (SCROLLING)
-- ==========================================
 
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Name = "ScrollingContent"
scrollingFrame.Size = UDim2.new(1, -20, 1, -92)
scrollingFrame.Position = UDim2.new(0, 10, 0, 84)
scrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 250, 225)
scrollingFrame.BorderSizePixel = 0
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.ScrollBarThickness = 6
scrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(180, 140, 40)
scrollingFrame.Visible = true
scrollingFrame.Parent = mainFrame
 
local scrollingCorner = Instance.new("UICorner")
scrollingCorner.CornerRadius = UDim.new(0, 8)
scrollingCorner.Parent = scrollingFrame
 
local uiPadding = Instance.new("UIPadding")
uiPadding.PaddingTop = UDim.new(0, 8)
uiPadding.PaddingBottom = UDim.new(0, 8)
uiPadding.PaddingLeft = UDim.new(0, 10)
uiPadding.PaddingRight = UDim.new(0, 10)
uiPadding.Parent = scrollingFrame
 
local uiListLayout = Instance.new("UIListLayout")
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Padding = UDim.new(0, 6)
uiListLayout.Parent = scrollingFrame
 
uiListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, uiListLayout.AbsoluteContentSize.Y + 16)
end)
 
 
-- ==========================================
-- 3B. TAB 2: LUA EXECUTOR PANEL
-- ==========================================
 
local executorFrame = Instance.new("Frame")
executorFrame.Name = "ExecutorContent"
executorFrame.Size = UDim2.new(1, -20, 1, -92)
executorFrame.Position = UDim2.new(0, 10, 0, 84)
executorFrame.BackgroundColor3 = Color3.fromRGB(255, 250, 225)
executorFrame.BorderSizePixel = 0
executorFrame.Visible = false
executorFrame.Parent = mainFrame
 
local execCorner = Instance.new("UICorner")
execCorner.CornerRadius = UDim.new(0, 8)
execCorner.Parent = executorFrame
 
local codeTextBox = Instance.new("TextBox")
codeTextBox.Name = "CodeTextBox"
codeTextBox.Size = UDim2.new(1, -16, 1, -52)
codeTextBox.Position = UDim2.new(0, 8, 0, 8)
codeTextBox.BackgroundColor3 = Color3.fromRGB(35, 32, 24)
codeTextBox.BorderSizePixel = 0
codeTextBox.ClearTextOnFocus = false
codeTextBox.MultiLine = true
codeTextBox.Text = "-- paste or type your lua script engine here..."
codeTextBox.TextColor3 = Color3.fromRGB(245, 222, 179)
codeTextBox.TextSize = 13
codeTextBox.Font = Enum.Font.Code
codeTextBox.TextXAlignment = Enum.TextXAlignment.Left
codeTextBox.TextYAlignment = Enum.TextYAlignment.Top
codeTextBox.Parent = executorFrame
 
local codeBoxCorner = Instance.new("UICorner")
codeBoxCorner.CornerRadius = UDim.new(0, 6)
codeBoxCorner.Parent = codeTextBox
 
local execButton = Instance.new("TextButton")
execButton.Name = "ExecuteButton"
execButton.Size = UDim2.new(0.5, -12, 0, 32)
execButton.Position = UDim2.new(0, 8, 1, -40)
execButton.BackgroundColor3 = Color3.fromRGB(34, 76, 40)
execButton.Text = "Execute"
execButton.TextColor3 = Color3.fromRGB(255, 250, 225)
execButton.TextSize = 13
execButton.Font = Enum.Font.GothamBold
execButton.AutoButtonColor = false
execButton.Parent = executorFrame
 
local execBtnCorner = Instance.new("UICorner")
execBtnCorner.CornerRadius = UDim.new(0, 6)
execBtnCorner.Parent = execButton
 
local clearButton = Instance.new("TextButton")
clearButton.Name = "ClearButton"
clearButton.Size = UDim2.new(0.5, -12, 0, 32)
clearButton.Position = UDim2.new(0.5, 4, 1, -40)
clearButton.BackgroundColor3 = Color3.fromRGB(210, 105, 30)
clearButton.Text = "Clear Text"
clearButton.TextColor3 = Color3.fromRGB(255, 250, 225)
clearButton.TextSize = 13
clearButton.Font = Enum.Font.GothamBold
clearButton.AutoButtonColor = false
clearButton.Parent = executorFrame
 
local clearBtnCorner = Instance.new("UICorner")
clearBtnCorner.CornerRadius = UDim.new(0, 6)
clearBtnCorner.Parent = clearButton
 
 
-- ==========================================
-- 3C. TAB 3: CREDITS PANEL
-- ==========================================
 
local creditsFrame = Instance.new("Frame")
creditsFrame.Name = "CreditsContent"
creditsFrame.Size = UDim2.new(1, -20, 1, -92)
creditsFrame.Position = UDim2.new(0, 10, 0, 84)
creditsFrame.BackgroundColor3 = Color3.fromRGB(255, 250, 225)
creditsFrame.BorderSizePixel = 0
creditsFrame.Visible = false
creditsFrame.Parent = mainFrame
 
local creditsCorner = Instance.new("UICorner")
creditsCorner.CornerRadius = UDim.new(0, 8)
creditsCorner.Parent = creditsFrame
 
local creditsListLabel = Instance.new("TextLabel")
creditsListLabel.Name = "CreditsListLabel"
creditsListLabel.Size = UDim2.new(1, -30, 1, -60)
creditsListLabel.Position = UDim2.new(0, 15, 0, 20)
creditsListLabel.BackgroundTransparency = 1
creditsListLabel.Text = "1. AI - Creator\n\n2. Bambi - idea & suggestion\n\n3. " .. localUsername .. " - trying our script\n\nREFERENCE EXECUTOR : JJsploit"
creditsListLabel.TextColor3 = Color3.fromRGB(60, 50, 20)
creditsListLabel.TextSize = 16
creditsListLabel.Font = Enum.Font.GothamBold
creditsListLabel.TextXAlignment = Enum.TextXAlignment.Left
creditsListLabel.TextYAlignment = Enum.TextYAlignment.Top
creditsListLabel.Parent = creditsFrame
 
local thanksLabel = Instance.new("TextLabel")
thanksLabel.Name = "ThanksLabel"
thanksLabel.Size = UDim2.new(1, 0, 0, 30)
thanksLabel.Position = UDim2.new(0, 0, 1, -40)
thanksLabel.BackgroundTransparency = 1
thanksLabel.Text = "Thank you for using the script!"
thanksLabel.TextColor3 = Color3.fromRGB(34, 76, 40)
thanksLabel.TextSize = 15
thanksLabel.Font = Enum.Font.GothamBlack
thanksLabel.TextXAlignment = Enum.TextXAlignment.Center
thanksLabel.Parent = creditsFrame
 
 
-- ==========================================
-- 4. BUTTON GENERATOR LOGIC
-- ==========================================
 
local tweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local totalCreatedButtons = 0
 
function CreateScriptButton(scriptName, callback)
	totalCreatedButtons = totalCreatedButtons + 1
 
	local scriptButton = Instance.new("TextButton")
	scriptButton.Name = "ScriptBtn_" .. scriptName
	scriptButton.Size = UDim2.new(1, 0, 0, 38)
	scriptButton.BackgroundColor3 = Color3.fromRGB(244, 210, 90)
	scriptButton.BorderSizePixel = 0
	scriptButton.Text = "  " .. scriptName
	scriptButton.TextColor3 = Color3.fromRGB(60, 50, 20)
	scriptButton.TextSize = 14
	scriptButton.Font = Enum.Font.GothamBold
	scriptButton.TextXAlignment = Enum.TextXAlignment.Left
	scriptButton.AutoButtonColor = false
	scriptButton.LayoutOrder = totalCreatedButtons
	scriptButton.Parent = scrollingFrame
 
	local btnCorner = Instance.new("UICorner")
	btnCorner.CornerRadius = UDim.new(0, 6)
	btnCorner.Parent = scriptButton
 
	local btnStroke = Instance.new("UIStroke")
	btnStroke.Color = Color3.fromRGB(220, 180, 60)
	btnStroke.Thickness = 1
	btnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	btnStroke.Parent = scriptButton
 
	scriptButton.MouseEnter:Connect(function()
		TweenService:Create(scriptButton, tweenInfo, {BackgroundColor3 = Color3.fromRGB(230, 195, 80)}):Play()
	end)
	scriptButton.MouseLeave:Connect(function()
		TweenService:Create(scriptButton, tweenInfo, {BackgroundColor3 = Color3.fromRGB(244, 210, 90)}):Play()
	end)
 
	scriptButton.MouseButton1Click:Connect(function()
		local originalSize = scriptButton.Size
		scriptButton.Size = UDim2.new(1, -4, 0, 36)
		task.wait(0.05)
		scriptButton.Size = originalSize
		task.spawn(callback)
	end)
end
 
 
-- ==========================================
-- 4B. MULTI-TAB SWITCHING SYSTEM
-- ==========================================
 
local tabs = {
	{Button = hubTabBtn, Panel = scrollingFrame},
	{Button = execTabBtn, Panel = executorFrame},
	{Button = credTabBtn, Panel = creditsFrame}
}
 
local function switchTab(targetTab)
	for _, tab in ipairs(tabs) do
		if tab == targetTab then
			tab.Panel.Visible = true
			TweenService:Create(tab.Button, tweenInfo, {BackgroundColor3 = Color3.fromRGB(34, 76, 40), TextColor3 = Color3.fromRGB(255, 250, 225)}):Play()
		else
			tab.Panel.Visible = false
			TweenService:Create(tab.Button, tweenInfo, {BackgroundColor3 = Color3.fromRGB(220, 185, 50), TextColor3 = Color3.fromRGB(60, 50, 20)}):Play()
		end
	end
end
 
for _, tab in ipairs(tabs) do
	tab.Button.MouseButton1Click:Connect(function()
		switchTab(tab)
	end)
end
 
execButton.MouseButton1Click:Connect(function()
	local compiledFunc, compileError = loadstring(codeTextBox.Text)
	if compiledFunc then
		task.spawn(compiledFunc)
	else
		warn("Execution compilation error: " .. tostring(compileError))
	end
end)
 
clearButton.MouseButton1Click:Connect(function()
	codeTextBox.Text = ""
end)
 
 
-- ==========================================
-- 5. LOADING SEQUENCE & UNBLUR LOGIC
-- ==========================================
 
task.spawn(function()
	local currentPercent = 0
	local randomGen = Random.new()
 
	while currentPercent < 100 do
		task.wait(randomGen:NextNumber(0.05, 0.15))
		currentPercent = math.min(currentPercent + randomGen:NextInteger(3, 11), 100)
		progressLabel.Text = "LOADING " .. currentPercent .. "%"
	end
 
	task.wait(0.4)
 
	local fadeInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
 
	local blurTween = TweenService:Create(blurEffect, fadeInfo, {Size = 0})
	local bgTween = TweenService:Create(loadingBackground, fadeInfo, {BackgroundTransparency = 1})
	local cardTween = TweenService:Create(loadingCard, fadeInfo, {BackgroundTransparency = 1})
	local strokeTween = TweenService:Create(cardStroke, fadeInfo, {Transparency = 1})
	TweenService:Create(topLabel, fadeInfo, {TextTransparency = 1}):Play()
	TweenService:Create(progressLabel, fadeInfo, {TextTransparency = 1}):Play()
	TweenService:Create(bottomLabel, fadeInfo, {TextTransparency = 1}):Play()
 
	blurTween:Play()
	bgTween:Play()
	cardTween:Play()
	strokeTween:Play()
 
	task.wait(0.2)
	mainFrame.Visible = true
	mainFrame.GroupTransparency = 1
 
	local frameGroup = Instance.new("CanvasGroup")
	mainFrame.Parent = frameGroup
	frameGroup.Size = mainFrame.Size
	frameGroup.Position = mainFrame.Position
	frameGroup.BackgroundTransparency = 1
	frameGroup.Parent = screenGui
	mainFrame.Position = UDim2.new(0,0,0,0)
 
	TweenService:Create(frameGroup, fadeInfo, {GroupTransparency = 0}):Play()
 
	bgTween.Completed:Connect(function()
		loadingBackground:Destroy()
		blurEffect:Destroy()
		mainFrame.Parent = screenGui
		mainFrame.Position = UDim2.new(0.5, -250, 0.5, -170)
		frameGroup:Destroy()
	end)
end)
 
 
-- ==========================================
-- 6. WINDOW ACTIONS & DRAG HANDLING
-- ==========================================
 
local function hookBarButtons(button, hoverBg, hoverText)
	local originalBg = button.BackgroundColor3
	local originalText = button.TextColor3
	button.MouseEnter:Connect(function() TweenService:Create(button, tweenInfo, {BackgroundColor3 = hoverBg, TextColor3 = hoverText}):Play() end)
	button.MouseLeave:Connect(function() TweenService:Create(button, tweenInfo, {BackgroundColor3 = originalBg, TextColor3 = originalText}):Play() end)
end
hookBarButtons(closeButton, Color3.fromRGB(220, 60, 60), Color3.fromRGB(255, 255, 255))
hookBarButtons(miniButton, Color3.fromRGB(25, 56, 30), Color3.fromRGB(244, 196, 48))
hookBarButtons(execButton, Color3.fromRGB(25, 56, 30), Color3.fromRGB(255, 255, 255))
hookBarButtons(clearButton, Color3.fromRGB(170, 80, 15), Color3.fromRGB(255, 255, 255))
 
closeButton.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)
 
local isMinimized = false
local normalSize = mainFrame.Size
local resizeTweenInfo = TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
 
miniButton.MouseButton1Click:Connect(function()
	isMinimized = not isMinimized
	local targetSize = isMinimized and UDim2.new(normalSize.X.Scale, normalSize.X.Offset, 0, 42) or normalSize
	local sizeTween = TweenService:Create(mainFrame, resizeTweenInfo, {Size = targetSize})
 
	miniButton.Text = isMinimized and "+" or "—"
 
	if not isMinimized then
		tabSystemBar.Visible = true
		if h
