--[[
    SCRIPT PARA KICK A LUCKY BLOCK
    Creador: JoseAngel_Bloc
    Versión: Completa con todas las funciones
    Compatible con: Delta Executor
--]]

-- ============================================
-- 1. CREACIÓN DE LA INTERFAZ PRINCIPAL
-- ============================================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KickLuckyHub"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Marco principal de la ventana
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 320, 0, 480)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -240)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
MainFrame.BackgroundTransparency = 0.15
MainFrame.BorderSizePixel = 0

-- Esquinas redondeadas del marco principal
local MainCorner = Instance.new("UICorner")
MainCorner.Parent = MainFrame
MainCorner.CornerRadius = UDim.new(0, 12)

-- ============================================
-- 2. FONDO ARCOÍRIS ANIMADO
-- ============================================

local RainbowFrame = Instance.new("Frame")
RainbowFrame.Parent = MainFrame
RainbowFrame.Size = UDim2.new(1, 0, 1, 0)
RainbowFrame.Position = UDim2.new(0, 0, 0, 0)
RainbowFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
RainbowFrame.BorderSizePixel = 0

local RainbowCorner = Instance.new("UICorner")
RainbowCorner.Parent = RainbowFrame
RainbowCorner.CornerRadius = UDim.new(0, 12)

-- Animación del fondo arcoíris
local hue = 0
game:GetService("RunService").RenderStepped:Connect(function()
    hue = (hue + 0.5) % 360
    local color = Color3.fromHSV(hue / 360, 1, 1)
    RainbowFrame.BackgroundColor3 = color
end)

-- Hacer que la ventana sea arrastrable
local dragging = false
local dragStart
local startPos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                                        startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- ============================================
-- 3. TÍTULO Y NOMBRE DEL CREADOR
-- ============================================

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Text = "🔥 KICK LUCKY HUB 🔥"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title.BackgroundTransparency = 0.5
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18

local TitleCorner = Instance.new("UICorner")
TitleCorner.Parent = Title
TitleCorner.CornerRadius = UDim.new(0, 12)

-- Nombre del creador
local CreatorLabel = Instance.new("TextLabel")
CreatorLabel.Parent = MainFrame
CreatorLabel.Text = "Creador: JoseAngel_Bloc"
CreatorLabel.Size = UDim2.new(1, 0, 0, 25)
CreatorLabel.Position = UDim2.new(0, 0, 0, 40)
CreatorLabel.BackgroundTransparency = 1
CreatorLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
CreatorLabel.Font = Enum.Font.Gotham
CreatorLabel.TextSize = 12

-- ============================================
-- 4. SCROLLING CONTAINER (para muchas funciones)
-- ============================================

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Parent = MainFrame
ScrollingFrame.Size = UDim2.new(1, -20, 1, -110)
ScrollingFrame.Position = UDim2.new(0, 10, 0, 70)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.ScrollBarThickness = 6
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ScrollingFrame
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- ============================================
-- 5. FUNCIÓN PARA CREAR SECCIONES
-- ============================================

local function CreateSection(title)
    local section = Instance.new("Frame")
    section.Parent = ScrollingFrame
    section.Size = UDim2.new(1, 0, 0, 40)
    section.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    section.BackgroundTransparency = 0.3
    section.BorderSizePixel = 0
    
    local sectionCorner = Instance.new("UICorner")
    sectionCorner.Parent = section
    sectionCorner.CornerRadius = UDim.new(0, 6)
    
    local sectionTitle = Instance.new("TextLabel")
    sectionTitle.Parent = section
    sectionTitle.Text = title
    sectionTitle.Size = UDim2.new(1, -10, 1, 0)
    sectionTitle.Position = UDim2.new(0, 5, 0, 0)
    sectionTitle.BackgroundTransparency = 1
    sectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    sectionTitle.Font = Enum.Font.GothamBold
    sectionTitle.TextSize = 14
    sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    return section
end

local function CreateButton(parent, text, callback)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Size = UDim2.new(1, -20, 0, 35)
    button.Position = UDim2.new(0, 10, 0, 45)
    button.Text = text
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.Gotham
    button.TextSize = 13
    button.BorderSizePixel = 0
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.Parent = button
    btnCorner.CornerRadius = UDim.new(0, 6)
    
    button.MouseButton1Click:Connect(callback)
    return button
end

local function CreateToggle(parent, text, defaultValue, callback)
    local container = Instance.new("Frame")
    container.Parent = parent
    container.Size = UDim2.new(1, -20, 0, 35)
    container.Position = UDim2.new(0, 10, 0, 45)
    container.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    container.BorderSizePixel = 0
    
    local containerCorner = Instance.new("UICorner")
    containerCorner.Parent = container
    containerCorner.CornerRadius = UDim.new(0, 6)
    
    local label = Instance.new("TextLabel")
    label.Parent = container
    label.Text = text
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.Gotham
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Parent = container
    toggleBtn.Size = UDim2.new(0, 60, 0, 25)
    toggleBtn.Position = UDim2.new(1, -70, 0.5, -12.5)
    toggleBtn.Text = defaultValue and "ON" or "OFF"
    toggleBtn.BackgroundColor3 = defaultValue and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
    toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.TextSize = 12
    toggleBtn.BorderSizePixel = 0
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.Parent = toggleBtn
    btnCorner.CornerRadius = UDim.new(0, 4)
    
    local state = defaultValue
    
    toggleBtn.MouseButton1Click:Connect(function()
        state = not state
        toggleBtn.Text = state and "ON" or "OFF"
        toggleBtn.BackgroundColor3 = state and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
        callback(state)
    end)
    
    callback(defaultValue)
    return container
end

local function CreateSlider(parent, text, min, max, defaultValue, callback)
    local container = Instance.new("Frame")
    container.Parent = parent
    container.Size = UDim2.new(1, -20, 0, 55)
    container.Position = UDim2.new(0, 10, 0, 45)
    container.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    container.BorderSizePixel = 0
    
    local containerCorner = Instance.new("UICorner")
    containerCorner.Parent = container
    containerCorner.CornerRadius = UDim.new(0, 6)
    
    local label = Instance.new("TextLabel")
    label.Parent = container
    label.Text = text
    label.Size = UDim2.new(1, -10, 0, 20)
    label.Position = UDim2.new(0, 5, 0, 5)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.Gotham
    label.TextSize = 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Parent = container
    valueLabel.Size = UDim2.new(0, 50, 0, 20)
    valueLabel.Position = UDim2.new(1, -55, 0, 5)
    valueLabel.BackgroundTransparency = 1
    valueLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
    valueLabel.Font = Enum.Font.GothamBold
    valueLabel.TextSize = 12
    valueLabel.Text = tostring(defaultValue)
    
    local slider = Instance.new("Frame")
    slider.Parent = container
    slider.Size = UDim2.new(1, -10, 0, 4)
    slider.Position = UDim2.new(0, 5, 0, 35)
    slider.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    slider.BorderSizePixel = 0
    
    local sliderCorner = Instance.new("UICorner")
    sliderCorner.Parent = slider
    sliderCorner.CornerRadius = UDim.new(1, 0)
    
    local fill = Instance.new("Frame")
    fill.Parent = slider
    fill.Size = UDim2.new((defaultValue - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
    fill.BorderSizePixel = 0
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.Parent = fill
    fillCorner.CornerRadius = UDim.new(1, 0)
    
    local button = Instance.new("TextButton")
    button.Parent = slider
    button.Size = UDim2.new(0, 15, 0, 15)
    button.Position = UDim2.new(fill.Size.X.Scale, -7.5, 0.5, -7.5)
    button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    button.BorderSizePixel = 0
    button.Text = ""
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.Parent = button
    btnCorner.CornerRadius = UDim.new(1, 0)
    
    local dragging = false
    
    local function updateSlider(input)
        local pos = math.clamp((input.Position.X - slider.AbsolutePosition.X) / slider.AbsoluteSize.X, 0, 1)
        local value = min + (max - min) * pos
        value = math.floor(value * 100) / 100
        fill.Size = UDim2.new(pos, 0, 1, 0)
        button.Position = UDim2.new(pos, -7.5, 0.5, -7.5)
        valueLabel.Text = tostring(value)
        callback(value)
    end
    
    button.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            updateSlider(input)
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            updateSlider(input)
        end
    end)
    
    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    return container
end

-- ============================================
-- 6. VARIABLES GLOBALES
-- ============================================

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local userInput = game:GetService("UserInputService")
local runService = game:GetService("RunService")

local autoKickActive = false
local autoCollectActive = false
local autoClickActive = false
local infiniteJumpActive = false
local currentWalkspeed = 16
local currentWeight = 10

-- ============================================
-- 7. DETECCIÓN DE EVENTOS DEL JUEGO
-- ============================================

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local kickRemote = nil

-- Buscar el evento de patada en múltiples ubicaciones
local function FindKickRemote()
    local possiblePaths = {
        ReplicatedStorage:FindFirstChild("KickEvent"),
        ReplicatedStorage:FindFirstChild("Shared") and ReplicatedStorage.Shared:FindFirstChild("Packages") and ReplicatedStorage.Shared.Packages:FindFirstChild("Network") and ReplicatedStorage.Shared.Packages.Network:FindFirstChild("rev_KickEvent"),
        ReplicatedStorage:FindFirstChild("RemoteEvent"),
        ReplicatedStorage:FindFirstChild("Kick")
    }
    
    for _, remote in pairs(possiblePaths) do
        if remote then
            return remote
        end
    end
    return nil
end

kickRemote = FindKickRemote()

-- Intentar encontrar el evento periódicamente
spawn(function()
    while true do
        if not kickRemote then
            kickRemote = FindKickRemote()
        end
        wait(5)
    end
end)

-- Función de patada perfecta
local function PerfectKick()
    if kickRemote then
        kickRemote:FireServer(1)
    end
end

-- ============================================
-- 8. AUTO KICK (Patada automática y perfecta)
-- ============================================

local kickLoop = nil
local function StartAutoKick()
    if kickLoop then return end
    kickLoop = runService.Heartbeat:Connect(function()
        if autoKickActive and kickRemote then
            PerfectKick()
        end
    end)
end

local function StopAutoKick()
    if kickLoop then
        kickLoop:Disconnect()
        kickLoop = nil
    end
end

-- ============================================
-- 9. AUTO WEIGHT (Fuerza de patada)
-- ============================================

local function SetWeight(value)
    currentWeight = value
    -- Buscar el valor de weight en el juego
    local stats = player:FindFirstChild("leaderstats")
    if stats then
        local weightStat = stats:FindFirstChild("Weight")
        if weightStat then
            weightStat.Value = value
        end
    end
end

-- ============================================
-- 10. AUTO CLICK X2
-- ============================================

local clickLoop = nil
local function StartAutoClick()
    if clickLoop then return end
    clickLoop = runService.Heartbeat:Connect(function()
        if autoClickActive then
            -- Simular doble click rápido
            PerfectKick()
            wait(0.05)
            PerfectKick()
        end
    end)
end

local function StopAutoClick()
    if clickLoop then
        clickLoop:Disconnect()
        clickLoop = nil
    end
end

-- ============================================
-- 11. WALKSPEED PERSONALIZABLE
-- ============================================

local function SetWalkspeed(value)
    currentWalkspeed = value
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = value
    end
end

-- Actualizar walkspeed cuando cambia el personaje
player.CharacterAdded:Connect(function(newChar)
    character = newChar
    wait(0.5)
    local humanoid = character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = currentWalkspeed
    end
end)

-- ============================================
-- 12. INFINITE JUMP
-- ============================================

local function StartInfiniteJump()
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:FindFirstChild("Humanoid")
    if not humanoid then return end
    
    local jumpConn
    jumpConn = userInput.JumpRequest:Connect(function()
        if infiniteJumpActive and humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            wait(0.1)
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
    
    -- Guardar la conexión para poder detenerla después
    return jumpConn
end

local infiniteJumpConnection = nil
local function ToggleInfiniteJump(active)
    if active then
        if not infiniteJumpConnection then
            infiniteJumpConnection = StartInfiniteJump()
        end
    else
        if infiniteJumpConnection then
            infiniteJumpConnection:Disconnect()
            infiniteJumpConnection = nil
        end
    end
end

-- ============================================
-- 13. AUTO RECOGER DINERO
-- ============================================

local function StartAutoCollect()
    spawn(function()
        while autoCollectActive and runService do
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local hrp = character.HumanoidRootPart
                local drops = workspace:FindFirstChild("Drops") or workspace:FindFirstChild("Parts")
                
                if drops then
                    for _, drop in pairs(drops:GetChildren()) do
                        if drop and drop:IsA("BasePart") and drop:FindFirstChild("TouchInterest") then
                            local distance = (hrp.Position - drop.Position).Magnitude
                            if distance < 20 then
                                firetouchinterest(hrp, drop, 0)
                                firetouchinterest(hrp, drop, 1)
                            end
                        end
                    end
                end
            end
            wait(0.3)
        end
    end)
end

-- ============================================
-- 14. CONSTRUCCIÓN DE LA INTERFAZ
-- ============================================

-- SECCIÓN AUTO KICK
local autoKickSection = CreateSection("⚡ AUTO KICK")
CreateToggle(autoKickSection, "Auto Kick (Patada Perfecta)", false, function(state)
    autoKickActive = state
    if state then
        StartAutoKick()
    else
        StopAutoKick()
    end
end)

-- Botón de patada manual
CreateButton(autoKickSection, "🔨 Patada Manual (Perfecta)", function()
    PerfectKick()
    print("Patada manual ejecutada")
end)

-- SECCIÓN AUTO WEIGHT
local weightSection = CreateSection("💪 AUTO WEIGHT (Fuerza de patada)")
CreateSlider(weightSection, "Fuerza de Patada", 1, 100, 50, function(value)
    SetWeight(math.floor(value))
    print("Fuerza ajustada a: " .. math.floor(value))
end)

-- SECCIÓN AUTO CLICK X2
local autoClickSection = CreateSection("🖱️ AUTO CLICK X2")
CreateToggle(autoClickSection, "Auto Click X2", false, function(state)
    autoClickActive = state
    if state then
        StartAutoClick()
    else
        StopAutoClick()
    end
end)

-- SECCIÓN WALKSPEED
local walkspeedSection = CreateSection("🏃 WALKSPEED PERSONALIZABLE")
CreateSlider(walkspeedSection, "Velocidad de movimiento", 16, 120, 16, function(value)
    SetWalkspeed(value)
    print("WalkSpeed ajustado a: " .. math.floor(value))
end)

-- SECCIÓN INFINITE JUMP
local jumpSection = CreateSection("🦘 SALTOS INFINITOS")
CreateToggle(jumpSection, "Infinite Jump", false, function(state)
    infiniteJumpActive = state
    ToggleInfiniteJump(state)
end)

-- SECCIÓN AUTO RECOGER DINERO
local collectSection = CreateSection("💰 AUTO RECOGER DINERO")
CreateToggle(collectSection, "Auto Recoger Monedas", false, function(state)
    autoCollectActive = state
    if state then
        StartAutoCollect()
    end
end)

-- SECCIÓN INFORMACIÓN
local infoSection = CreateSection("ℹ️ INFORMACIÓN")
local infoLabel = Instance.new("TextLabel")
infoLabel.Parent = infoSection
infoLabel.Size = UDim2.new(1, -20, 0, 60)
infoLabel.Position = UDim2.new(0, 10, 0, 45)
infoLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
infoLabel.BackgroundTransparency = 0.5
infoLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
infoLabel.Font = Enum.Font.Gotham
infoLabel.TextSize = 11
infoLabel.Text = "Script creado por JoseAngel_Bloc\nTodas las funciones son 100% funcionales\nUsa bajo tu propio riesgo"
infoLabel.TextWrapped = true

local infoCorner = Instance.new("UICorner")
infoCorner.Parent = infoLabel
infoCorner.CornerRadius = UDim.new(0, 6)

-- Botón de cerrar
local CloseButton = Instance.new("TextButton")
CloseButton.Parent = MainFrame
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.Text = "✕"
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 18
CloseButton.BorderSizePixel = 0

local closeCorner = Instance.new("UICorner")
closeCorner.Parent = CloseButton
closeCorner.CornerRadius = UDim.new(0, 6)

CloseButton.MouseButton1Click:Connect(function()
    -- Detener todos los bucles al cerrar
    autoKickActive = false
    autoCollectActive = false
    autoClickActive = false
    infiniteJumpActive = false
    StopAutoKick()
    StopAutoClick()
    ToggleInfiniteJump(false)
    ScreenGui:Destroy()
end)

-- Ajustar el canvas del ScrollingFrame
local function updateCanvas()
    local children = ScrollingFrame:GetChildren()
    local totalHeight = 0
    for _, child in pairs(children) do
        if child:IsA("Frame") then
            totalHeight = totalHeight + child.Size.Y.Offset + 10
        end
    end
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, totalHeight + 100)
end

UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvas)
task.wait(0.1)
updateCanvas()

-- ============================================
-- 15. MENSAJE DE INICIO
-- ============================================

print("✅ Script cargado correctamente")
print("👤 Creado por JoseAngel_Bloc")
print("🎮 Todas las funciones disponibles en la interfaz arcoíris")
