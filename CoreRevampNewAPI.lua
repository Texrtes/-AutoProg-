--!strict
--==============================================================================
-- CoreRevampNewAPI.lua
-- Neo-Glassmorphism Adaptive UI Framework with Extended Component Suite
-- - Ultra-clean translucent frosted glass aesthetic (Glassmorphism & Acrylic)
-- - Specular border highlights with animated luminous gradient sweep
-- - Fully adaptive device scaling (Phone, Tablet, Desktop, Console)
-- - Dynamic auto-expanding text cards (zero clipping on multi-line text)
-- - Strictly deterministic LayoutOrder preventing mobile menu shuffling
-- - Responsive scrollable dropdowns with real-time Search filtering
-- - Precision step & custom suffix Slider controls
-- - Extended API: Keybind, Colorpicker, ProgressBar, Divider, Spacer,
--   Banner/Callout, MetricGrid/StatCard, LogConsole, and Dialog/Prompt modal
-- - 100% backward-compatible with NovaGlass / GlassHubUI / UICore API
--==============================================================================

local Library = {}
Library.__index = Library

Library.Assets = {
    Shadow          = "rbxassetid://1316045217",
    Minimize        = "rbxassetid://13857987062",
    Hide            = "rbxassetid://99432006374500",
    Scale           = "rbxassetid://99432006374500",
    Close           = "rbxassetid://15082305656",
    Resize          = "rbxassetid://15082210525",
    Chevron         = "rbxassetid://14937709869",
    Arrow           = "rbxassetid://14923748517",
    Button          = "rbxassetid://84269270119683",
    ButtonIcon      = "rbxassetid://84269270119683",
    Search          = "rbxassetid://13847222481",
    Textbox         = "rbxassetid://13868675087",
    GlowDot         = "rbxassetid://105506802034513",
    ImageLogo       = "rbxassetid://92516147636241",
    Logo            = "rbxassetid://92516147636241",
    FloatingToggle  = "rbxassetid://84269270119683",
    FloatingBadge   = "rbxassetid://84269270119683",
    Discord         = "rbxassetid://119690296342461",
    Theme           = "rbxassetid://10734950309",
    Home            = "rbxassetid://80559668453788",
    Overview        = "rbxassetid://80559668453788",
    User            = "rbxassetid://10747373176",
    Key             = "rbxassetid://10709790644",
    Clock           = "rbxassetid://131119301589529",
    Trials          = "rbxassetid://131119301589529",
    AutoTrials      = "rbxassetid://131119301589529",
    Check           = "rbxassetid://10709790644",
    Globe           = "rbxassetid://10734887376",
    Chat            = "rbxassetid://10734887852",
    Gear            = "rbxassetid://10734950309",
    Sliders         = "rbxassetid://10734950020",
    Terminal        = "rbxassetid://10734951847",
    Console         = "rbxassetid://10734951847",
    AutoGold        = "rbxassetid://114765145536264",
    Gold            = "rbxassetid://114765145536264",
    Coins           = "rbxassetid://114765145536264",
    Package         = "rbxassetid://114765145536264",
    Zap             = "rbxassetid://128427580522535",
    AutoEvo         = "rbxassetid://128427580522535",
    Evo             = "rbxassetid://128427580522535",
    Background      = "rbxassetid://82941526973068",
    AutoHubBg       = "rbxassetid://82941526973068",
    AutoHubIcon     = "autohub_icon.png",
}

-- Refined Glass Theme Palette
Library.Themes = {
    CyberNeon = {
        Background    = Color3.fromRGB(22, 22, 25),
        Sidebar       = Color3.fromRGB(18, 18, 20),
        Surface       = Color3.fromRGB(28, 28, 31),
        SurfaceHover  = Color3.fromRGB(36, 36, 40),
        Stroke        = Color3.fromRGB(68, 214, 44),
        StrokeSoft    = Color3.fromRGB(40, 40, 46),
        Text          = Color3.fromRGB(255, 255, 255),
        Muted         = Color3.fromRGB(140, 140, 150),
        Accent        = Color3.fromRGB(68, 214, 44),
        AccentHover   = Color3.fromRGB(82, 230, 56),
        AccentSoft    = Color3.fromRGB(30, 45, 26),
        Success       = Color3.fromRGB(68, 214, 44),
        Warning       = Color3.fromRGB(245, 158, 11),
        Danger        = Color3.fromRGB(239, 68, 68),
    },
    SkyBlue = {
        Background    = Color3.fromRGB(22, 22, 25),
        Sidebar       = Color3.fromRGB(18, 18, 20),
        Surface       = Color3.fromRGB(28, 28, 31),
        SurfaceHover  = Color3.fromRGB(36, 36, 40),
        Stroke        = Color3.fromRGB(68, 214, 44),
        StrokeSoft    = Color3.fromRGB(40, 40, 46),
        Text          = Color3.fromRGB(255, 255, 255),
        Muted         = Color3.fromRGB(140, 140, 150),
        Accent        = Color3.fromRGB(68, 214, 44),
        AccentHover   = Color3.fromRGB(82, 230, 56),
        AccentSoft    = Color3.fromRGB(30, 45, 26),
        Success       = Color3.fromRGB(68, 214, 44),
        Warning       = Color3.fromRGB(245, 158, 11),
        Danger        = Color3.fromRGB(239, 68, 68),
    },
    DeepAzure = {
        Background    = Color3.fromRGB(22, 22, 25),
        Sidebar       = Color3.fromRGB(18, 18, 20),
        Surface       = Color3.fromRGB(28, 28, 31),
        SurfaceHover  = Color3.fromRGB(36, 36, 40),
        Stroke        = Color3.fromRGB(68, 214, 44),
        StrokeSoft    = Color3.fromRGB(40, 40, 46),
        Text          = Color3.fromRGB(255, 255, 255),
        Muted         = Color3.fromRGB(140, 140, 150),
        Accent        = Color3.fromRGB(68, 214, 44),
        AccentHover   = Color3.fromRGB(82, 230, 56),
        AccentSoft    = Color3.fromRGB(30, 45, 26),
        Success       = Color3.fromRGB(68, 214, 44),
        Warning       = Color3.fromRGB(245, 158, 11),
        Danger        = Color3.fromRGB(239, 68, 68),
    },
    MidnightEmerald = {
        Background    = Color3.fromRGB(8, 18, 16),
        Sidebar       = Color3.fromRGB(6, 14, 12),
        Surface       = Color3.fromRGB(12, 28, 24),
        SurfaceHover  = Color3.fromRGB(18, 38, 32),
        Stroke        = Color3.fromRGB(16, 185, 129),
        StrokeSoft    = Color3.fromRGB(30, 62, 52),
        Text          = Color3.fromRGB(236, 253, 245),
        Muted         = Color3.fromRGB(134, 172, 158),
        Accent        = Color3.fromRGB(16, 185, 129),
        AccentHover   = Color3.fromRGB(52, 211, 153),
        AccentSoft    = Color3.fromRGB(14, 46, 38),
        Success       = Color3.fromRGB(16, 185, 129),
        Warning       = Color3.fromRGB(245, 158, 11),
        Danger        = Color3.fromRGB(239, 68, 68),
    },
    CrimsonEclipse = {
        Background    = Color3.fromRGB(18, 10, 14),
        Sidebar       = Color3.fromRGB(13, 7, 10),
        Surface       = Color3.fromRGB(26, 15, 20),
        SurfaceHover  = Color3.fromRGB(36, 20, 28),
        Stroke        = Color3.fromRGB(244, 63, 94),
        StrokeSoft    = Color3.fromRGB(58, 28, 38),
        Text          = Color3.fromRGB(255, 241, 242),
        Muted         = Color3.fromRGB(185, 142, 152),
        Accent        = Color3.fromRGB(244, 63, 94),
        AccentHover   = Color3.fromRGB(251, 113, 133),
        AccentSoft    = Color3.fromRGB(48, 16, 26),
        Success       = Color3.fromRGB(34, 197, 94),
        Warning       = Color3.fromRGB(245, 158, 11),
        Danger        = Color3.fromRGB(239, 68, 68),
    },
    SolarAmber = {
        Background    = Color3.fromRGB(18, 15, 10),
        Sidebar       = Color3.fromRGB(13, 11, 7),
        Surface       = Color3.fromRGB(27, 22, 14),
        SurfaceHover  = Color3.fromRGB(37, 30, 19),
        Stroke        = Color3.fromRGB(245, 158, 11),
        StrokeSoft    = Color3.fromRGB(60, 48, 26),
        Text          = Color3.fromRGB(254, 252, 232),
        Muted         = Color3.fromRGB(185, 165, 130),
        Accent        = Color3.fromRGB(245, 158, 11),
        AccentHover   = Color3.fromRGB(251, 191, 36),
        AccentSoft    = Color3.fromRGB(50, 34, 14),
        Success       = Color3.fromRGB(34, 197, 94),
        Warning       = Color3.fromRGB(245, 158, 11),
        Danger        = Color3.fromRGB(239, 68, 68),
    }
}

local THEME_ORDER = { "CyberNeon", "MidnightEmerald", "CrimsonEclipse", "SolarAmber" }

local function resolveTheme(themeInput: any): { [string]: Color3 }
    local base = Library.Themes.CyberNeon
    local resolved = {}
    for k, v in pairs(base) do
        resolved[k] = v
    end

    if type(themeInput) == "string" and Library.Themes[themeInput] and themeInput ~= "SkyBlue" and themeInput ~= "DeepAzure" then
        for k, v in pairs(Library.Themes[themeInput]) do
            resolved[k] = v
        end
    elseif type(themeInput) == "table" then
        for k, v in pairs(themeInput) do
            resolved[k] = v
        end
    end

    return resolved
end

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

local function getTopInset(): number
    local topInset = 36
    pcall(function()
        topInset = GuiService:GetGuiInset().Y
    end)
    return math.max(topInset, 0)
end

-- Device Type Detection
local function detectDeviceType(): string
    if GuiService:IsTenFootInterface() then
        return "Console"
    end
    local camera = workspace.CurrentCamera
    local vp = (camera and camera.ViewportSize) or Vector2.new(1920, 1080)
    local minDim = math.min(vp.X, vp.Y)
    local maxDim = math.max(vp.X, vp.Y)
    local isTouch = UserInputService.TouchEnabled

    if isTouch and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
        if minDim >= 580 and maxDim >= 880 then
            return "Tablet"
        else
            return "Phone"
        end
    elseif isTouch then
        if minDim < 520 then
            return "Phone"
        elseif minDim < 720 then
            return "Tablet"
        else
            return "Desktop"
        end
    else
        return "Desktop"
    end
end

-- Device-Specific Scale Calculation
local function calculateDeviceScale(deviceType: string, vp: Vector2, topInset: number): number
    local availableHeight = math.max(vp.Y - topInset - 24, 200)
    local availableWidth = math.max(vp.X - 32, 300)
    
    local baseW = 800
    local baseH = 540

    if deviceType == "Phone" then
        local fitX = availableWidth / (baseW * 1.05)
        local fitY = availableHeight / (baseH * 1.05)
        return math.clamp(math.min(fitX, fitY), 0.50, 0.76)
    elseif deviceType == "Tablet" then
        local fitX = availableWidth / (baseW * 1.1)
        local fitY = availableHeight / (baseH * 1.1)
        return math.clamp(math.min(fitX, fitY), 0.72, 0.95)
    elseif deviceType == "Console" then
        return 1.20
    else
        if vp.Y >= 1440 then
            return math.clamp(vp.Y / 1200, 1.0, 1.30)
        elseif vp.Y <= 720 or vp.X <= 1280 then
            local fitX = availableWidth / (baseW * 1.08)
            local fitY = availableHeight / (baseH * 1.08)
            return math.clamp(math.min(fitX, fitY), 0.75, 1.0)
        else
            return 1.0
        end
    end
end

local function tween(object: Instance, time: number, goal: { [string]: any }, style: Enum.EasingStyle?, direction: Enum.EasingDirection?)
    local info = TweenInfo.new(time, style or Enum.EasingStyle.Quart, direction or Enum.EasingDirection.Out)
    local anim = TweenService:Create(object, info, goal)
    anim:Play()
    return anim
end

local function make(className: string, props: { [string]: any }?, children: { Instance }?): any
    local object = Instance.new(className)
    if props then
        for key, value in pairs(props) do
            (object :: any)[key] = value
        end
    end
    if children then
        for _, child in ipairs(children) do
            child.Parent = object
        end
    end
    return object
end

local function corner(parent: Instance, radius: number)
    return make("UICorner", {
        CornerRadius = UDim.new(0, radius),
        Parent = parent,
    })
end

local function stroke(parent: Instance, color: Color3, thickness: number?, transparency: number?)
    return make("UIStroke", {
        Color = color,
        Thickness = thickness or 1,
        Transparency = transparency or 0.65,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Parent = parent,
    })
end

local function padding(parent: Instance, left: number, top: number, right: number, bottom: number)
    return make("UIPadding", {
        PaddingLeft = UDim.new(0, left),
        PaddingTop = UDim.new(0, top),
        PaddingRight = UDim.new(0, right),
        PaddingBottom = UDim.new(0, bottom),
        Parent = parent,
    })
end

local function list(parent: Instance, paddingSize: number, direction: Enum.FillDirection?)
    return make("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, paddingSize),
        FillDirection = direction or Enum.FillDirection.Vertical,
        Parent = parent,
    })
end

local function normalizeAsset(image: any): string
    if type(image) == "number" then
        return "rbxassetid://" .. tostring(image)
    end
    if type(image) == "string" then
        if image == "" then return "" end
        if image:find("rbxassetid://") or image:find("rbxthumb://") or image:find("http") then
            return image
        end
        if Library.Assets[image] then
            return Library.Assets[image]
        end
        local getCustom = (typeof(getcustomasset) == "function" and getcustomasset)
            or (typeof(getsynasset) == "function" and getsynasset)
        if getCustom then
            local isFileFn = (typeof(isfile) == "function" and isfile)
            if (isFileFn and isFileFn(image)) or image:find("%.png$") or image:find("%.jpg$") or image:find("%.jpeg$") then
                local ok, asset = pcall(getCustom, image)
                if ok and asset and asset ~= "" then return asset end
            end
        end
        if tonumber(image) then
            return "rbxassetid://" .. image
        end
        if image:find("%.png$") or image:find("%.jpg$") then
            return Library.Assets.ImageLogo or "rbxassetid://111362591084511"
        end
        return image
    end
    return ""
end

local function createDefaultBorderSequence(theme: { [string]: Color3 }): ColorSequence
    return ColorSequence.new({
        ColorSequenceKeypoint.new(0.00, theme.Accent),
        ColorSequenceKeypoint.new(0.20, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(0.45, theme.AccentHover),
        ColorSequenceKeypoint.new(0.70, theme.StrokeSoft),
        ColorSequenceKeypoint.new(1.00, theme.Accent),
    })
end

local function getParentGui()
    if gethui then
        local ok, h = pcall(gethui)
        if ok and h then return h end
    end
    local ok, parent = pcall(function() return CoreGui end)
    if ok and parent then return parent end
    return LocalPlayer:WaitForChild("PlayerGui")
end

local function addRipple(button: GuiButton, color: Color3)
    button.ClipsDescendants = true
    button.MouseButton1Down:Connect(function(x, y)
        local ripple = make("Frame", {
            Name = "Ripple",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromOffset(x - button.AbsolutePosition.X, y - button.AbsolutePosition.Y),
            Size = UDim2.fromOffset(0, 0),
            BackgroundColor3 = color,
            BackgroundTransparency = 0.65,
            BorderSizePixel = 0,
            ZIndex = button.ZIndex + 2,
            Parent = button,
        })
        corner(ripple, 100)
        local size = math.max(button.AbsoluteSize.X, button.AbsoluteSize.Y) * 2.2
        tween(ripple, 0.45, {
            Size = UDim2.fromOffset(size, size),
            BackgroundTransparency = 1,
        }, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        task.delay(0.48, function()
            if ripple then ripple:Destroy() end
        end)
    end)
end

-- Strict Clamping prevents window from going off-screen or under the top notch
local function clampWindowPosition(target: GuiObject, uiScale: UIScale?)
    local camera = workspace.CurrentCamera
    local vp = (camera and camera.ViewportSize) or Vector2.new(1920, 1080)
    local scale = uiScale and uiScale.Scale or 1
    local topInset = getTopInset()

    local halfH = (target.AbsoluteSize.Y * scale) / 2
    local halfW = (target.AbsoluteSize.X * scale) / 2

    local minOffsetY = (topInset + halfH - (vp.Y * 0.5)) / scale
    local maxOffsetY = ((vp.Y * 0.5) - halfH) / scale
    if minOffsetY > maxOffsetY then
        maxOffsetY = minOffsetY
    end

    local minOffsetX = (halfW - (vp.X * 0.5)) / scale
    local maxOffsetX = ((vp.X * 0.5) - halfW) / scale
    if minOffsetX > maxOffsetX then
        minOffsetX = 0
        maxOffsetX = 0
    end

    local currentOffsetY = target.Position.Y.Offset
    local currentOffsetX = target.Position.X.Offset

    local clampedY = math.clamp(currentOffsetY, minOffsetY, maxOffsetY)
    local clampedX = math.clamp(currentOffsetX, minOffsetX, maxOffsetX)

    target.Position = UDim2.new(0.5, clampedX, 0.5, clampedY)
end

local function bindDrag(handle: GuiObject, target: GuiObject, uiScale: UIScale?)
    local dragging = false
    local dragInput: InputObject? = nil
    local dragStart: Vector3? = nil
    local startPosition: UDim2? = nil

    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPosition = target.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    handle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input == dragInput and dragStart and startPosition then
            local delta = input.Position - dragStart
            local scale = (uiScale and uiScale.Scale) or 1
            local camera = workspace.CurrentCamera
            local vp = (camera and camera.ViewportSize) or Vector2.new(1920, 1080)
            local topInset = getTopInset()

            local rawOffsetX = startPosition.X.Offset + (delta.X / scale)
            local rawOffsetY = startPosition.Y.Offset + (delta.Y / scale)

            local halfH = (target.AbsoluteSize.Y * scale) / 2
            local minOffsetY = (topInset + halfH - (vp.Y * 0.5)) / scale
            local maxOffsetY = ((vp.Y * 0.5) - halfH) / scale
            if minOffsetY > maxOffsetY then
                maxOffsetY = minOffsetY
            end

            local clampedY = math.clamp(rawOffsetY, minOffsetY, maxOffsetY)

            target.Position = UDim2.new(
                startPosition.X.Scale,
                rawOffsetX,
                startPosition.Y.Scale,
                clampedY
            )
        end
    end)
end

local function bindResize(handle: GuiObject, target: GuiObject, minSize: Vector2, uiScale: UIScale?)
    local resizing = false
    local resizeInput: InputObject? = nil
    local startPos: Vector2? = nil
    local startSize: UDim2? = nil

    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            resizing = true
            startPos = Vector2.new(input.Position.X, input.Position.Y)
            startSize = target.Size
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    resizing = false
                end
            end)
        end
    end)

    handle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            resizeInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if resizing and input == resizeInput and startPos and startSize then
            local scale = (uiScale and uiScale.Scale) or 1
            local currentPos = Vector2.new(input.Position.X, input.Position.Y)
            local delta = (currentPos - startPos) / scale
            local newX = math.max(minSize.X, startSize.X.Offset + delta.X)
            local newY = math.max(minSize.Y, startSize.Y.Offset + delta.Y)
            target.Size = UDim2.fromOffset(newX, newY)
            clampWindowPosition(target, uiScale)
        end
    end)
end

local function createIcon(parent: Instance, image: any, size: number, color: Color3, transparency: number?)
    local asset = normalizeAsset(image)
    return make("ImageLabel", {
        Name = "Icon",
        Size = UDim2.fromOffset(size, size),
        BackgroundTransparency = 1,
        Image = asset,
        ImageColor3 = color,
        ImageTransparency = transparency or 0,
        ScaleType = Enum.ScaleType.Fit,
        Visible = asset ~= "",
        Parent = parent,
    })
end

local function createText(parent: Instance, name: string, text: string, size: number, color: Color3, bold: boolean?, order: number?)
    return make("TextLabel", {
        Name = name,
        Text = text,
        Font = bold and Enum.Font.GothamBold or Enum.Font.GothamMedium,
        TextSize = size,
        TextColor3 = color,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        TextWrapped = true,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = order or 1,
        Parent = parent,
    })
end

-- Translucent Acrylic Card Row with Auto-Expanding Multi-Line Text
local function createCoreRow(self: any, parent: Instance, title: string, desc: string?, image: any?, height: number?, rightReservedWidth: number?, layoutOrder: number?, autoHeight: boolean?)
    local iconAsset = normalizeAsset(image or "")
    local hasIcon = iconAsset ~= ""
    local leftInset = hasIcon and 50 or 16
    local reservedRight = rightReservedWidth or 130
    local hasDesc = (desc and desc ~= "") or (autoHeight == true)
    local minHeight = height or (hasDesc and 68 or 52)

    local row = make("TextButton", {
        Name = "CoreRow",
        Text = "",
        AutoButtonColor = false,
        Size = autoHeight and UDim2.new(1, 0, 0, 0) or UDim2.new(1, 0, 0, minHeight),
        AutomaticSize = autoHeight and Enum.AutomaticSize.Y or Enum.AutomaticSize.None,
        BackgroundColor3 = self.Theme.Surface,
        BackgroundTransparency = 0.35, -- Sleek translucent acrylic card matching Gatlify
        BorderSizePixel = 0,
        LayoutOrder = layoutOrder or 10,
        Parent = parent,
    })
    row.ClipsDescendants = not autoHeight
    corner(row, 8)
    local rowStroke = stroke(row, self.Theme.StrokeSoft, 1, 0.65)

    if autoHeight then
        make("UISizeConstraint", {
            MinSize = Vector2.new(0, minHeight),
            Parent = row,
        })
        padding(row, 0, 10, 0, 10)
    end

    local iconWrap = nil
    local iconWrapStroke = nil
    if hasIcon then
        iconWrap = make("Frame", {
            Name = "IconWrap",
            AnchorPoint = autoHeight and Vector2.new(0, 0) or Vector2.new(0, 0.5),
            Position = autoHeight and UDim2.new(0, 10, 0, 4) or UDim2.new(0, 10, 0.5, 0),
            Size = UDim2.fromOffset(30, 30),
            BackgroundColor3 = self.Theme.Sidebar,
            BackgroundTransparency = 0.4,
            BorderSizePixel = 0,
            Parent = row,
        })
        corner(iconWrap, 6)
        iconWrapStroke = stroke(iconWrap, self.Theme.StrokeSoft, 1, 0.8)

        local icon = createIcon(iconWrap, iconAsset, 18, self.Theme.Accent, 0)
        icon.AnchorPoint = Vector2.new(0.5, 0.5)
        icon.Position = UDim2.fromScale(0.5, 0.5)
    end

    local textWrap = make("Frame", {
        Name = "TextWrap",
        AnchorPoint = autoHeight and Vector2.new(0, 0) or Vector2.new(0, 0.5),
        Position = autoHeight and UDim2.new(0, leftInset, 0, 0) or UDim2.new(0, leftInset, 0.5, 0),
        Size = autoHeight and UDim2.new(1, -leftInset - reservedRight, 0, 0) or UDim2.new(1, -leftInset - reservedRight, 1, -8),
        AutomaticSize = autoHeight and Enum.AutomaticSize.Y or Enum.AutomaticSize.None,
        BackgroundTransparency = 1,
        ClipsDescendants = not autoHeight,
        Parent = row,
    })
    local tLayout = list(textWrap, 3)
    if not autoHeight then
        tLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    end

    make("TextLabel", {
        Name = "Title",
        Text = title,
        Font = Enum.Font.GothamBold,
        TextSize = 15,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = autoHeight and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center,
        TextTruncate = autoHeight and Enum.TextTruncate.None or Enum.TextTruncate.AtEnd,
        TextWrapped = autoHeight,
        BackgroundTransparency = 1,
        Size = autoHeight and UDim2.new(1, 0, 0, 0) or UDim2.new(1, 0, 0, 20),
        AutomaticSize = autoHeight and Enum.AutomaticSize.Y or Enum.AutomaticSize.None,
        LayoutOrder = 1,
        Parent = textWrap,
    })

    if hasDesc then
        make("TextLabel", {
            Name = "Desc",
            Text = tostring(desc or ""),
            Font = Enum.Font.GothamMedium,
            TextSize = 13,
            TextColor3 = Color3.fromRGB(165, 165, 175),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
            TextTruncate = autoHeight and Enum.TextTruncate.None or Enum.TextTruncate.AtEnd,
            TextWrapped = true,
            BackgroundTransparency = 1,
            Size = autoHeight and UDim2.new(1, 0, 0, 0) or UDim2.new(1, 0, 0, 26),
            AutomaticSize = autoHeight and Enum.AutomaticSize.Y or Enum.AutomaticSize.None,
            Visible = (desc and desc ~= "") or (autoHeight == true),
            LayoutOrder = 2,
            Parent = textWrap,
        })
    end

    row.MouseEnter:Connect(function()
        tween(row, 0.15, { BackgroundColor3 = self.Theme.SurfaceHover, BackgroundTransparency = 0.20 })
        tween(rowStroke, 0.15, { Color = self.Theme.StrokeSoft, Transparency = 0.35 })
        if hasIcon and iconWrapStroke then
            tween(iconWrapStroke, 0.15, { Color = self.Theme.Accent, Transparency = 0.4 })
        end
    end)
    row.MouseLeave:Connect(function()
        tween(row, 0.15, { BackgroundColor3 = self.Theme.Surface, BackgroundTransparency = 0.35 })
        tween(rowStroke, 0.15, { Color = self.Theme.StrokeSoft, Transparency = 0.65 })
        if hasIcon and iconWrapStroke then
            tween(iconWrapStroke, 0.15, { Color = self.Theme.StrokeSoft, Transparency = 0.8 })
        end
    end)

    return row
end

-- Page Component API Builder
local function createPageApi(window: any, scroll: ScrollingFrame)
    local api = {}
    local itemCounter = 0
    local function nextOrder(explicit: any): number
        itemCounter = itemCounter + 1
        return tonumber(explicit) or itemCounter
    end

    local function checkPremium(props: { [string]: any }?): boolean
        if props and props.IsPrem == false then
            window:Notify({
                Title = "Premium Required",
                Desc = "Please activate VIP / Premium",
                Duration = 3,
            })
            return false
        end
        return true
    end

    function api:Section(props: { [string]: any })
        props = props or {}
        local section = make("Frame", {
            Name = "Section",
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = nextOrder(props.Order),
            Parent = scroll,
        })
        list(section, 8)

        local headerWrap = make("Frame", {
            Name = "SectionHeaderWrap",
            Size = UDim2.new(1, 0, 0, 32),
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Parent = section,
        })
        padding(headerWrap, 8, 4, 0, 0)

        make("TextLabel", {
            Name = "SectionTitle",
            Text = tostring(props.Title or "Section"),
            Font = Enum.Font.GothamBold,
            TextSize = 17,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 1, 0),
            Parent = headerWrap,
        })

        local sectionApi = createPageApi(window, section :: any)
        sectionApi.Root = section
        return sectionApi
    end

    function api:Label(props: { [string]: any })
        props = props or {}
        local autoHeight = props.AutoHeight ~= false
        local row = createCoreRow(window, scroll, tostring(props.Title or "Label"), props.Desc or "", props.Image or "", props.Height or 56, 20, nextOrder(props.Order), autoHeight)
        local item = {}
        function item:SetTitle(value: string)
            local titleLabel = row:FindFirstChild("Title", true)
            if titleLabel and titleLabel:IsA("TextLabel") then titleLabel.Text = value end
        end
        function item:SetDesc(value: string)
            local descLabel = row:FindFirstChild("Desc", true)
            if descLabel and descLabel:IsA("TextLabel") then
                descLabel.Text = tostring(value or "")
                descLabel.Visible = (tostring(value or "") ~= "")
            end
        end
        function item:SetVisible(value: boolean) row.Visible = value end
        return item
    end

    function api:Button(props: { [string]: any })
        props = props or {}
        local callback = props.Callback or function() end
        local row = createCoreRow(window, scroll, tostring(props.Title or "Button"), props.Desc or "", props.Image or "Button", props.Height or 58, 50, nextOrder(props.Order))
        addRipple(row, window.Theme.Accent)

        local actionPill = make("Frame", {
            Name = "ActionPill",
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, -14, 0.5, 0),
            Size = UDim2.fromOffset(32, 32),
            BackgroundColor3 = window.Theme.Sidebar,
            BackgroundTransparency = 0.35,
            BorderSizePixel = 0,
            Parent = row,
        })
        corner(actionPill, 8)
        stroke(actionPill, window.Theme.StrokeSoft, 1, 0.75)

        local glyph = createIcon(actionPill, props.RightIcon or "Button", 16, window.Theme.Muted, 0)
        glyph.AnchorPoint = Vector2.new(0.5, 0.5)
        glyph.Position = UDim2.fromScale(0.5, 0.5)

        row.MouseEnter:Connect(function()
            tween(glyph, 0.15, { ImageColor3 = window.Theme.Accent })
            tween(actionPill, 0.15, { BackgroundColor3 = window.Theme.AccentSoft, BackgroundTransparency = 0.1 })
        end)
        row.MouseLeave:Connect(function()
            tween(glyph, 0.15, { ImageColor3 = window.Theme.Muted })
            tween(actionPill, 0.15, { BackgroundColor3 = window.Theme.Sidebar, BackgroundTransparency = 0.35 })
        end)

        row.MouseButton1Click:Connect(function()
            if not checkPremium(props) then return end
            tween(row, 0.08, { Size = UDim2.new(1, 0, 0, (props.Height or 58) - 3) })
            task.delay(0.08, function()
                tween(row, 0.12, { Size = UDim2.new(1, 0, 0, props.Height or 58) })
            end)
            task.spawn(callback)
        end)

        local item = {}
        function item:SetTitle(value: string)
            local titleLabel = row:FindFirstChild("Title", true)
            if titleLabel and titleLabel:IsA("TextLabel") then titleLabel.Text = value end
        end
        function item:SetVisible(value: boolean) row.Visible = value end
        return item
    end

    function api:Toggle(props: { [string]: any })
        props = props or {}
        local value = (props.Value == true) or (props.Default == true)
        local callback = props.Callback or function() end
        local row = createCoreRow(window, scroll, tostring(props.Title or "Toggle"), props.Desc or "", props.Image or "", props.Height or (props.Desc and 68 or 52), 68, nextOrder(props.Order))
        addRipple(row, window.Theme.Accent)

        local switch = make("Frame", {
            Name = "Switch",
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, -16, 0.5, 0),
            Size = UDim2.fromOffset(48, 26),
            BackgroundColor3 = value and window.Theme.Accent or Color3.fromRGB(38, 38, 42),
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            Parent = row,
        })
        corner(switch, 13)
        local switchStroke = stroke(switch, value and window.Theme.Accent or Color3.fromRGB(52, 52, 60), 1, value and 0.4 or 0.7)

        local knob = make("Frame", {
            Name = "Knob",
            AnchorPoint = Vector2.new(0, 0.5),
            Size = UDim2.fromOffset(20, 20),
            Position = value and UDim2.new(1, -23, 0.5, 0) or UDim2.new(0, 3, 0.5, 0),
            BackgroundColor3 = value and Color3.fromRGB(15, 15, 15) or Color3.fromRGB(70, 70, 80),
            BorderSizePixel = 0,
            Parent = switch,
        })
        corner(knob, 10)

        local function setValue(nextValue: boolean, fire: boolean?)
            value = nextValue == true
            local targetSwitchBg = value and window.Theme.Accent or Color3.fromRGB(38, 38, 42)
            local targetSwitchStroke = value and window.Theme.Accent or Color3.fromRGB(52, 52, 60)
            local targetKnobBg = value and Color3.fromRGB(15, 15, 15) or Color3.fromRGB(70, 70, 80)
            local targetKnobPos = value and UDim2.new(1, -23, 0.5, 0) or UDim2.new(0, 3, 0.5, 0)

            tween(switch, 0.18, {
                BackgroundColor3 = targetSwitchBg,
            }, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
            tween(switchStroke, 0.18, {
                Color = targetSwitchStroke,
                Transparency = value and 0.4 or 0.7,
            })
            tween(knob, 0.18, {
                Position = targetKnobPos,
                BackgroundColor3 = targetKnobBg,
            }, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
            if fire then
                task.spawn(function() callback(value) end)
            end
        end

        row.MouseButton1Click:Connect(function()
            if not checkPremium(props) then return end
            setValue(not value, true)
        end)

        local item = {}
        function item:SetValue(nextVal: boolean) setValue(nextVal, false) end
        function item:GetValue() return value end
        function item:SetVisible(nextVal: boolean) row.Visible = nextVal end
        function item:SetTitle(newTitle: string)
            local titleLbl = row:FindFirstChild("TextWrap") and row.TextWrap:FindFirstChild("Title")
            if titleLbl and titleLbl:IsA("TextLabel") then
                titleLbl.Text = tostring(newTitle)
            end
        end
        function item:SetDesc(newDesc: string)
            local descLbl = row:FindFirstChild("TextWrap") and row.TextWrap:FindFirstChild("Desc")
            if descLbl and descLbl:IsA("TextLabel") then
                descLbl.Text = tostring(newDesc)
            end
        end
        return item
    end

    function api:Dropdown(props: { [string]: any })
        props = props or {}
        local options = props.List or props.Options or {}
        local multi = props.Multi == true
        local title = tostring(props.Title or "Dropdown")
        local desc = tostring(props.Desc or "")
        local callback = props.Callback or function() end
        local selected = props.Value
        if selected == nil and not multi then
            selected = options[1]
        elseif selected == nil and multi then
            selected = {}
        end
        local searchable = props.Searchable == true or (props.Searchable == nil and #options > 8)

        local container = make("Frame", {
            Name = "DropdownContainer",
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = nextOrder(props.Order),
            Parent = scroll,
        })
        list(container, 6)

        local pillWidth = props.ValueWidth or 160
        local row = createCoreRow(window, container, title, desc, props.Image or "", props.Height or 58, pillWidth + 24, 1)
        addRipple(row, window.Theme.Accent)

        local pillWrap = make("Frame", {
            Name = "ValuePill",
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, -14, 0.5, 0),
            Size = UDim2.fromOffset(pillWidth, 36),
            BackgroundColor3 = window.Theme.Sidebar,
            BackgroundTransparency = 0.35,
            BorderSizePixel = 0,
            Parent = row,
        })
        corner(pillWrap, 8)
        local pillStroke = stroke(pillWrap, window.Theme.StrokeSoft, 1, 0.75)
        padding(pillWrap, 12, 0, 12, 0)

        local valueLabel = make("TextLabel", {
            Name = "Value",
            Text = multi and table.concat(selected, ", ") or tostring(selected or "Select"),
            Font = Enum.Font.GothamBold,
            TextSize = 14,
            TextColor3 = window.Theme.Accent,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, -24, 1, 0),
            Parent = pillWrap,
        })

        local chevron = createIcon(pillWrap, "Chevron", 16, window.Theme.Muted, 0)
        chevron.AnchorPoint = Vector2.new(1, 0.5)
        chevron.Position = UDim2.new(1, 0, 0.5, 0)

        -- Scrollable Glass Dropdown List
        local listFrame = make("ScrollingFrame", {
            Name = "DropdownList",
            Size = UDim2.new(1, 0, 0, 0),
            BackgroundColor3 = window.Theme.Sidebar,
            BackgroundTransparency = 0.20,
            BorderSizePixel = 0,
            ClipsDescendants = true,
            Visible = false,
            LayoutOrder = 2,
            ScrollingDirection = Enum.ScrollingDirection.Y,
            ScrollBarThickness = 4,
            ScrollBarImageColor3 = window.Theme.Accent,
            ScrollBarImageTransparency = 0.25,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            ElasticBehavior = Enum.ElasticBehavior.Always,
            Active = true,
            Parent = container,
        })
        corner(listFrame, 10)
        stroke(listFrame, window.Theme.StrokeSoft, 1, 0.6)
        padding(listFrame, 6, 6, 6, 8)
        local optionLayout = list(listFrame, 4)

        local open = false
        local buttons = {}
        local searchBox = nil

        local function getDropdownHeight()
            local contentHeight = optionLayout.AbsoluteContentSize.Y + 14
            if contentHeight <= 14 then
                local count = 0
                for _, entry in pairs(buttons) do
                    if type(entry) == "table" and entry.Button and entry.Button.Visible then
                        count = count + 1
                    end
                end
                contentHeight = (count * 40) + (searchable and 44 or 12)
            end
            local maxHeight = (window.DeviceType == "Phone" and 150) or (window.DeviceType == "Tablet" and 180) or 220
            return math.min(contentHeight, maxHeight)
        end

        local function filterOptions(query: string)
            local q = string.lower(tostring(query or ""))
            for opt, entry in pairs(buttons) do
                if type(entry) == "table" and entry.Button then
                    if q == "" or string.find(string.lower(tostring(opt)), q, 1, true) then
                        entry.Button.Visible = true
                    else
                        entry.Button.Visible = false
                    end
                end
            end
            task.defer(function()
                if open and listFrame.Parent then
                    tween(listFrame, 0.12, { Size = UDim2.new(1, 0, 0, getDropdownHeight()) })
                end
            end)
        end

        if searchable then
            local searchWrap = make("Frame", {
                Name = "DropdownSearchWrap",
                Size = UDim2.new(1, 0, 0, 32),
                BackgroundColor3 = window.Theme.Surface,
                BackgroundTransparency = 0.50,
                BorderSizePixel = 0,
                LayoutOrder = 0,
                Parent = listFrame,
            })
            corner(searchWrap, 6)
            stroke(searchWrap, window.Theme.StrokeSoft, 1, 0.75)
            padding(searchWrap, 8, 0, 8, 0)

            local sIcon = createIcon(searchWrap, "Search", 14, window.Theme.Muted, 0)
            sIcon.AnchorPoint = Vector2.new(0, 0.5)
            sIcon.Position = UDim2.new(0, 0, 0.5, 0)

            searchBox = make("TextBox", {
                Name = "SearchInput",
                Position = UDim2.new(0, 22, 0, 0),
                Size = UDim2.new(1, -22, 1, 0),
                Text = "",
                PlaceholderText = "Search...",
                Font = Enum.Font.GothamMedium,
                TextSize = 12,
                TextColor3 = window.Theme.Text,
                PlaceholderColor3 = window.Theme.Muted,
                TextXAlignment = Enum.TextXAlignment.Left,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ClearTextOnFocus = false,
                Parent = searchWrap,
            })

            searchBox:GetPropertyChangedSignal("Text"):Connect(function()
                filterOptions(searchBox.Text)
            end)
        end

        local function closeDropdown()
            open = false
            tween(listFrame, 0.18, { Size = UDim2.new(1, 0, 0, 0) }, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
            tween(chevron, 0.18, { Rotation = 0 })
            task.delay(0.2, function()
                if not open and listFrame.Parent then
                    listFrame.Visible = false
                    if searchBox then
                        searchBox.Text = ""
                        for _, entry in pairs(buttons) do
                            if type(entry) == "table" and entry.Button then
                                entry.Button.Visible = true
                            end
                        end
                    end
                end
            end)
        end

        local function openDropdown()
            open = true
            listFrame.Visible = true
            listFrame.CanvasPosition = Vector2.new(0, 0)
            if searchBox then
                searchBox.Text = ""
                for _, entry in pairs(buttons) do
                    if type(entry) == "table" and entry.Button then
                        entry.Button.Visible = true
                    end
                end
            end
            local targetH = getDropdownHeight()
            listFrame.Size = UDim2.new(1, 0, 0, 0)
            tween(listFrame, 0.22, { Size = UDim2.new(1, 0, 0, targetH) }, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
            tween(chevron, 0.22, { Rotation = 180 })
        end

        local function selectedContains(val: any)
            if not multi or type(selected) ~= "table" then return selected == val end
            return table.find(selected, val) ~= nil
        end

        local function refreshValue()
            valueLabel.Text = multi and table.concat(selected, ", ") or tostring(selected or "Select")
            if valueLabel.Text == "" then valueLabel.Text = "Select" end
            for opt, entry in pairs(buttons) do
                local active = selectedContains(opt)
                if type(entry) == "table" and entry.Label then
                    entry.Label.TextColor3 = active and window.Theme.Accent or window.Theme.Text
                    entry.Button.BackgroundColor3 = active and window.Theme.AccentSoft or window.Theme.Surface
                    entry.Button.BackgroundTransparency = active and 0.20 or 0.75
                    entry.Dot.BackgroundTransparency = active and 0 or 1
                end
            end
        end

        local function addOption(opt: any, index: number?)
            local active = selectedContains(opt)
            local btn = make("TextButton", {
                Name = "Option_" .. tostring(opt),
                Text = "",
                AutoButtonColor = false,
                BackgroundColor3 = active and window.Theme.AccentSoft or window.Theme.Surface,
                BackgroundTransparency = active and 0.20 or 0.75,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 36),
                LayoutOrder = (index or 1) + 1,
                Parent = listFrame,
            })
            corner(btn, 6)
            addRipple(btn, window.Theme.Accent)

            local optDot = make("Frame", {
                Name = "IndicatorDot",
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.new(0, 10, 0.5, 0),
                Size = UDim2.fromOffset(6, 6),
                BackgroundColor3 = window.Theme.Accent,
                BackgroundTransparency = active and 0 or 1,
                BorderSizePixel = 0,
                Parent = btn,
            })
            corner(optDot, 3)

            local optLabel = make("TextLabel", {
                Name = "OptionText",
                Text = tostring(opt),
                Font = Enum.Font.GothamMedium,
                TextSize = 14,
                TextColor3 = active and window.Theme.Accent or window.Theme.Text,
                TextXAlignment = Enum.TextXAlignment.Left,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 24, 0, 0),
                Size = UDim2.new(1, -28, 1, 0),
                Parent = btn,
            })

            btn.MouseEnter:Connect(function()
                if not selectedContains(opt) then
                    tween(btn, 0.15, { BackgroundTransparency = 0.40, BackgroundColor3 = window.Theme.SurfaceHover })
                    tween(optLabel, 0.15, { TextColor3 = Color3.fromRGB(255, 255, 255) })
                end
            end)
            btn.MouseLeave:Connect(function()
                if not selectedContains(opt) then
                    tween(btn, 0.15, { BackgroundTransparency = 0.75, BackgroundColor3 = window.Theme.Surface })
                    tween(optLabel, 0.15, { TextColor3 = window.Theme.Text })
                end
            end)

            buttons[opt] = { Button = btn, Dot = optDot, Label = optLabel }

            btn.MouseButton1Click:Connect(function()
                if multi then
                    local pos = table.find(selected, opt)
                    if pos then table.remove(selected, pos) else table.insert(selected, opt) end
                else
                    selected = opt
                    closeDropdown()
                end
                refreshValue()
                callback(selected)
            end)
        end

        for i, opt in ipairs(options) do
            addOption(opt, i)
        end

        row.MouseButton1Click:Connect(function()
            if not checkPremium(props) then return end
            if open then closeDropdown() else openDropdown() end
        end)

        local item = {}
        function item:SetValue(v: any) selected = v; refreshValue() end
        function item:GetValue() return selected end
        function item:SetVisible(v: boolean) container.Visible = v end
        function item:SetOptions(newOptions: { any })
            options = newOptions or {}
            for _, entry in pairs(buttons) do
                if type(entry) == "table" and entry.Button then
                    entry.Button:Destroy()
                elseif typeof(entry) == "Instance" then
                    entry:Destroy()
                end
            end
            table.clear(buttons)
            for i, opt in ipairs(options) do
                addOption(opt, i)
            end
            refreshValue()
            if searchBox then searchBox.Text = "" end
            if open then
                listFrame.Size = UDim2.new(1, 0, 0, getDropdownHeight())
            end
        end
        item.Refresh = item.SetOptions
        item.SetValues = item.SetOptions
        return item
    end

    function api:Segmented(props: { [string]: any })
        props = props or {}
        local options = props.Options or props.List or { "Option 1", "Option 2" }
        local selected = props.Value or options[1]
        local callback = props.Callback or function() end

        local row = make("Frame", {
            Name = "SegmentedContainer",
            Size = UDim2.new(1, 0, 0, 50),
            BackgroundColor3 = window.Theme.Surface,
            BackgroundTransparency = 0.40,
            BorderSizePixel = 0,
            LayoutOrder = nextOrder(props.Order),
            Parent = scroll,
        })
        corner(row, 10)
        stroke(row, window.Theme.StrokeSoft, 1, 0.75)
        padding(row, 5, 5, 5, 5)
        local segLayout = list(row, 6, Enum.FillDirection.Horizontal)
        segLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        segLayout.VerticalAlignment = Enum.VerticalAlignment.Center

        local buttons = {}
        local btnWidth = 1 / #options

        local function refreshSegmented()
            for opt, btn in pairs(buttons) do
                local active = opt == selected
                tween(btn, 0.2, {
                    BackgroundColor3 = active and window.Theme.Accent or window.Theme.Sidebar,
                    BackgroundTransparency = active and 0.15 or 0.6,
                }, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                btn.TextColor3 = active and Color3.fromRGB(255, 255, 255) or window.Theme.Muted
            end
        end

        for _, opt in ipairs(options) do
            local btn = make("TextButton", {
                Name = "Segment_" .. tostring(opt),
                Text = tostring(opt),
                Font = Enum.Font.GothamBold,
                TextSize = 14,
                TextColor3 = opt == selected and Color3.fromRGB(255, 255, 255) or window.Theme.Muted,
                AutoButtonColor = false,
                BackgroundColor3 = opt == selected and window.Theme.Accent or window.Theme.Sidebar,
                BackgroundTransparency = opt == selected and 0.15 or 0.6,
                BorderSizePixel = 0,
                Size = UDim2.new(btnWidth, -4, 1, 0),
                Parent = row,
            })
            corner(btn, 8)
            addRipple(btn, Color3.fromRGB(255, 255, 255))
            buttons[opt] = btn

            btn.MouseButton1Click:Connect(function()
                if not checkPremium(props) then return end
                selected = opt
                refreshSegmented()
                task.spawn(function() callback(selected) end)
            end)
        end

        local item = {}
        function item:SetValue(v: any) selected = v; refreshSegmented() end
        function item:GetValue() return selected end
        function item:SetVisible(v: boolean) row.Visible = v end
        return item
    end

    function api:SelectionBox(props: { [string]: any })
        props = props or {}
        local selections = props.Selections or { "Free", "Premium" }
        local descriptions = props.Descriptions or {}
        local checklist = props.Checklist or {}
        local buttonTexts = props.ButtonTexts or {}
        local callbacks = props.Callbacks or {}
        
        local selected = props.Value or selections[1]

        local container = make("Frame", {
            Name = "SelectionBoxContainer",
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = nextOrder(props.Order),
            Parent = scroll,
        })
        list(container, 10)

        local segRow = make("Frame", {
            Name = "SegmentedContainer",
            Size = UDim2.new(1, 0, 0, 50),
            BackgroundColor3 = window.Theme.Surface,
            BackgroundTransparency = 0.40,
            BorderSizePixel = 0,
            Parent = container,
        })
        corner(segRow, 10)
        stroke(segRow, window.Theme.StrokeSoft, 1, 0.75)
        padding(segRow, 6, 6, 6, 6)
        local segLayout = list(segRow, 6, Enum.FillDirection.Horizontal)
        segLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        segLayout.VerticalAlignment = Enum.VerticalAlignment.Center

        local segButtons = {}
        local btnWidth = 1 / #selections

        local card = make("Frame", {
            Name = "SelectionCardBody",
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = window.Theme.Surface,
            BackgroundTransparency = 0.35,
            BorderSizePixel = 0,
            Parent = container,
        })
        corner(card, 12)
        stroke(card, window.Theme.StrokeSoft, 1, 0.65)
        padding(card, 18, 16, 18, 16)
        list(card, 14)

        local headerRow = make("Frame", {
            Name = "HeaderRow",
            Size = UDim2.new(1, 0, 0, 32),
            BackgroundTransparency = 1,
            Parent = card,
        })
        local cardTitleLabel = createText(headerRow, "CardTitle", "", 16, window.Theme.Text, true)

        local badgePill = make("Frame", {
            Name = "BadgePill",
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, 0, 0.5, 0),
            Size = UDim2.fromOffset(0, 26),
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = window.Theme.AccentSoft,
            BorderSizePixel = 0,
            Parent = headerRow,
        })
        corner(badgePill, 6)
        padding(badgePill, 10, 0, 10, 0)
        stroke(badgePill, window.Theme.Accent, 1, 0.5)

        local badgeText = make("TextLabel", {
            Name = "BadgeText",
            Text = "",
            Font = Enum.Font.GothamBold,
            TextSize = 11,
            TextColor3 = window.Theme.Accent,
            BackgroundTransparency = 1,
            Size = UDim2.fromOffset(0, 26),
            AutomaticSize = Enum.AutomaticSize.X,
            Parent = badgePill,
        })

        local checklistContainer = make("Frame", {
            Name = "ChecklistContainer",
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            Parent = card,
        })
        list(checklistContainer, 10)

        local actionBtn = make("TextButton", {
            Name = "ActionButton",
            Text = "",
            Font = Enum.Font.GothamBold,
            TextSize = 15,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AutoButtonColor = false,
            BackgroundColor3 = window.Theme.Accent,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 46),
            Parent = card,
        })
        corner(actionBtn, 8)
        addRipple(actionBtn, Color3.fromRGB(255, 255, 255))

        actionBtn.MouseEnter:Connect(function()
            tween(actionBtn, 0.16, { BackgroundColor3 = window.Theme.AccentHover })
        end)
        actionBtn.MouseLeave:Connect(function()
            tween(actionBtn, 0.16, { BackgroundColor3 = window.Theme.Accent })
        end)

        local function updateSelectionView(targetOption: any)
            selected = targetOption

            for opt, btn in pairs(segButtons) do
                local active = opt == targetOption
                tween(btn, 0.2, {
                    BackgroundColor3 = active and window.Theme.Accent or window.Theme.Sidebar,
                    BackgroundTransparency = active and 0.15 or 0.6,
                }, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                btn.TextColor3 = active and Color3.fromRGB(255, 255, 255) or window.Theme.Muted
            end

            cardTitleLabel.Text = tostring(targetOption)
            local descVal = descriptions[targetOption] or descriptions[tostring(targetOption)] or ""
            badgeText.Text = string.upper(tostring(descVal))
            badgePill.Visible = (descVal ~= "")

            for _, child in ipairs(checklistContainer:GetChildren()) do
                if child:IsA("Frame") then child:Destroy() end
            end

            local matchedKey = targetOption
            if not checklist[matchedKey] then
                for k, v in pairs(checklist) do
                    if tostring(k):lower() == tostring(targetOption):lower() then
                        matchedKey = k
                        break
                    end
                end
            end

            local items = checklist[matchedKey] or {}
            for _, it in ipairs(items) do
                local itemRow = make("Frame", {
                    Name = "ItemRow",
                    Size = UDim2.new(1, 0, 0, 24),
                    BackgroundTransparency = 1,
                    Parent = checklistContainer,
                })
                local hLayout = list(itemRow, 10, Enum.FillDirection.Horizontal)
                hLayout.VerticalAlignment = Enum.VerticalAlignment.Center

                local checkDot = make("Frame", {
                    Name = "CheckDot",
                    Size = UDim2.fromOffset(20, 20),
                    BackgroundColor3 = window.Theme.Success,
                    BackgroundTransparency = 0.85,
                    BorderSizePixel = 0,
                    Parent = itemRow,
                })
                corner(checkDot, 10)
                stroke(checkDot, window.Theme.Success, 1, 0.5)

                make("TextLabel", {
                    Name = "Checkmark",
                    Text = "✓",
                    Font = Enum.Font.GothamBold,
                    TextSize = 12,
                    TextColor3 = window.Theme.Success,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 1),
                    Parent = checkDot,
                })

                make("TextLabel", {
                    Name = "ItemText",
                    Text = tostring(it),
                    Font = Enum.Font.GothamMedium,
                    TextSize = 13,
                    TextColor3 = window.Theme.Text,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, -34, 1, 0),
                    Parent = itemRow,
                })
            end

            local matchedBtnKey = targetOption
            if not buttonTexts[matchedBtnKey] then
                for k, v in pairs(buttonTexts) do
                    if tostring(k):lower() == tostring(targetOption):lower() then
                        matchedBtnKey = k
                        break
                    end
                end
            end
            actionBtn.Text = tostring(buttonTexts[matchedBtnKey] or ("Select " .. tostring(targetOption)))

            actionBtn.MouseButton1Click:Connect(function()
                if not checkPremium(props) then return end
                local matchedCbKey = targetOption
                if not callbacks[matchedCbKey] then
                    for k, v in pairs(callbacks) do
                        if tostring(k):lower() == tostring(targetOption):lower() then
                            matchedCbKey = k
                            break
                        end
                    end
                end
                local cb = callbacks[matchedCbKey]
                if type(cb) == "function" then
                    task.spawn(cb)
                end
            end)
        end

        for _, opt in ipairs(selections) do
            local btn = make("TextButton", {
                Name = "Segment_" .. tostring(opt),
                Text = tostring(opt),
                Font = Enum.Font.GothamBold,
                TextSize = 14,
                TextColor3 = opt == selected and Color3.fromRGB(255, 255, 255) or window.Theme.Muted,
                AutoButtonColor = false,
                BackgroundColor3 = opt == selected and window.Theme.Accent or window.Theme.Sidebar,
                BackgroundTransparency = opt == selected and 0.15 or 0.6,
                BorderSizePixel = 0,
                Size = UDim2.new(btnWidth, -4, 1, 0),
                Parent = segRow,
            })
            corner(btn, 8)
            addRipple(btn, Color3.fromRGB(255, 255, 255))
            segButtons[opt] = btn

            btn.MouseButton1Click:Connect(function()
                updateSelectionView(opt)
            end)
        end

        updateSelectionView(selected)

        local apiItem = {}
        function apiItem:SetValue(v: any) updateSelectionView(v) end
        function apiItem:GetValue() return selected end
        function apiItem:SetVisible(v: boolean) container.Visible = v end
        return apiItem
    end

    function api:FeatureCard(props: { [string]: any })
        props = props or {}
        local title = tostring(props.Title or "Feature Card")
        local badge = tostring(props.Badge or "")
        local items = props.Items or {}
        local buttonText = tostring(props.ButtonText or "Action")
        local callback = props.Callback or function() end

        local card = make("Frame", {
            Name = "FeatureCard",
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = window.Theme.Surface,
            BackgroundTransparency = 0.35,
            BorderSizePixel = 0,
            LayoutOrder = nextOrder(props.Order),
            Parent = scroll,
        })
        corner(card, 12)
        stroke(card, window.Theme.StrokeSoft, 1, 0.65)
        padding(card, 18, 16, 18, 16)
        list(card, 14)

        local headerRow = make("Frame", {
            Name = "HeaderRow",
            Size = UDim2.new(1, 0, 0, 32),
            BackgroundTransparency = 1,
            Parent = card,
        })
        createText(headerRow, "CardTitle", title, 16, window.Theme.Text, true)

        if badge ~= "" then
            local badgePill = make("Frame", {
                Name = "BadgePill",
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(1, 0, 0.5, 0),
                Size = UDim2.fromOffset(0, 26),
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundColor3 = window.Theme.AccentSoft,
                BorderSizePixel = 0,
                Parent = headerRow,
            })
            corner(badgePill, 6)
            padding(badgePill, 10, 0, 10, 0)
            stroke(badgePill, window.Theme.Accent, 1, 0.5)

            make("TextLabel", {
                Name = "BadgeText",
                Text = badge,
                Font = Enum.Font.GothamBold,
                TextSize = 11,
                TextColor3 = window.Theme.Accent,
                BackgroundTransparency = 1,
                Size = UDim2.fromOffset(0, 26),
                AutomaticSize = Enum.AutomaticSize.X,
                Parent = badgePill,
            })
        end

        for _, it in ipairs(items) do
            local itemRow = make("Frame", {
                Name = "ItemRow",
                Size = UDim2.new(1, 0, 0, 24),
                BackgroundTransparency = 1,
                Parent = card,
            })
            local hLayout = list(itemRow, 10, Enum.FillDirection.Horizontal)
            hLayout.VerticalAlignment = Enum.VerticalAlignment.Center

            local checkDot = make("Frame", {
                Name = "CheckDot",
                Size = UDim2.fromOffset(20, 20),
                BackgroundColor3 = window.Theme.Success,
                BackgroundTransparency = 0.85,
                BorderSizePixel = 0,
                Parent = itemRow,
            })
            corner(checkDot, 10)
            stroke(checkDot, window.Theme.Success, 1, 0.5)

            make("TextLabel", {
                Name = "Checkmark",
                Text = "✓",
                Font = Enum.Font.GothamBold,
                TextSize = 12,
                TextColor3 = window.Theme.Success,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                Parent = checkDot,
            })

            make("TextLabel", {
                Name = "ItemText",
                Text = tostring(it),
                Font = Enum.Font.GothamMedium,
                TextSize = 13,
                TextColor3 = window.Theme.Text,
                TextXAlignment = Enum.TextXAlignment.Left,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, -34, 1, 0),
                Parent = itemRow,
            })
        end

        if buttonText ~= "" then
            local actionBtn = make("TextButton", {
                Name = "ActionButton",
                Text = buttonText,
                Font = Enum.Font.GothamBold,
                TextSize = 15,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                AutoButtonColor = false,
                BackgroundColor3 = window.Theme.Accent,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 46),
                Parent = card,
            })
            corner(actionBtn, 8)
            addRipple(actionBtn, Color3.fromRGB(255, 255, 255))

            actionBtn.MouseEnter:Connect(function()
                tween(actionBtn, 0.16, { BackgroundColor3 = window.Theme.AccentHover })
            end)
            actionBtn.MouseLeave:Connect(function()
                tween(actionBtn, 0.16, { BackgroundColor3 = window.Theme.Accent })
            end)
            actionBtn.MouseButton1Click:Connect(function()
                if not checkPremium(props) then return end
                task.spawn(callback)
            end)
        end

        local item = {}
        function item:SetVisible(v: boolean) card.Visible = v end
        return item
    end

    function api:Search(props: { [string]: any })
        props = props or {}
        local placeholder = tostring(props.Placeholder or "Search components...")
        local callback = props.Callback or function() end

        local container = make("Frame", {
            Name = "SearchContainer",
            Size = UDim2.new(1, 0, 0, 46),
            BackgroundColor3 = window.Theme.Surface,
            BackgroundTransparency = 0.35,
            BorderSizePixel = 0,
            LayoutOrder = nextOrder(props.Order),
            Parent = scroll,
        })
        corner(container, 10)
        local searchStroke = stroke(container, window.Theme.StrokeSoft, 1, 0.7)

        local searchIcon = createIcon(container, "Search", 18, window.Theme.Muted, 0)
        searchIcon.AnchorPoint = Vector2.new(0, 0.5)
        searchIcon.Position = UDim2.new(0, 14, 0.5, 0)

        local textBox = make("TextBox", {
            Name = "SearchInput",
            Text = "",
            PlaceholderText = placeholder,
            Font = Enum.Font.GothamMedium,
            TextSize = 14,
            TextColor3 = window.Theme.Text,
            PlaceholderColor3 = window.Theme.Muted,
            TextXAlignment = Enum.TextXAlignment.Left,
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(42, 0),
            Size = UDim2.new(1, -56, 1, 0),
            Parent = container,
        })

        textBox.Focused:Connect(function()
            if not checkPremium(props) then
                textBox:ReleaseFocus()
                return
            end
            tween(searchStroke, 0.15, { Color = window.Theme.Accent, Transparency = 0.3 })
            tween(searchIcon, 0.15, { ImageColor3 = window.Theme.Accent })
        end)

        textBox.FocusLost:Connect(function()
            tween(searchStroke, 0.15, { Color = window.Theme.StrokeSoft, Transparency = 0.7 })
            tween(searchIcon, 0.15, { ImageColor3 = window.Theme.Muted })
        end)

        textBox:GetPropertyChangedSignal("Text"):Connect(function()
            if props.IsPrem == false then return end
            local query = textBox.Text:lower()
            task.spawn(function() callback(query) end)
        end)

        local item = {}
        function item:SetVisible(v: boolean) container.Visible = v end
        return item
    end

    function api:Slider(props: { [string]: any })
        props = props or {}
        local min = tonumber(props.Min) or 0
        local max = tonumber(props.Max) or 100
        local step = tonumber(props.Step) or 1
        local suffix = tostring(props.Suffix or "")
        local precision = tonumber(props.Precision)
        if not precision then
            local sStr = tostring(step)
            local dot = string.find(sStr, "%.")
            if dot then
                precision = #sStr - dot
            else
                precision = 0
            end
        end

        local value = tonumber(props.Value) or tonumber(props.Default) or min
        local callback = props.Callback or function() end
        local sliderWidth = props.Width or (suffix ~= "" and 180 or 165)

        local row = createCoreRow(window, scroll, tostring(props.Title or "Slider"), props.Desc or "", props.Image or "", props.Height or (props.Desc and 68 or 52), sliderWidth + 24, nextOrder(props.Order))

        local sliderWrap = make("Frame", {
            Name = "SliderWrap",
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, -16, 0.5, 0),
            Size = UDim2.fromOffset(sliderWidth, 26),
            BackgroundTransparency = 1,
            Parent = row,
        })

        local function formatVal(v: number): string
            if precision > 0 then
                return string.format("%." .. tostring(precision) .. "f", v) .. suffix
            else
                return tostring(math.floor(v + 0.5)) .. suffix
            end
        end

        local maxFormatted = formatVal(max)
        local numWidth = math.max(36, #maxFormatted * 9 + 8)

        local numberLabel = make("TextLabel", {
            Name = "Number",
            Text = formatVal(value),
            Font = Enum.Font.GothamBold,
            TextSize = 14,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Right,
            TextYAlignment = Enum.TextYAlignment.Center,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 0, 0, 0),
            Size = UDim2.fromOffset(numWidth, 26),
            Parent = sliderWrap,
        })

        local bar = make("Frame", {
            Name = "Bar",
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, 0, 0.5, 0),
            Size = UDim2.new(1, -numWidth - 10, 0, 6),
            BackgroundColor3 = Color3.fromRGB(44, 44, 50),
            BorderSizePixel = 0,
            Parent = sliderWrap,
        })
        corner(bar, 3)

        local fill = make("Frame", {
            Name = "Fill",
            Size = UDim2.fromScale(0, 1),
            BackgroundColor3 = window.Theme.Accent,
            BorderSizePixel = 0,
            Parent = bar,
        })
        corner(fill, 3)

        local knob = make("Frame", {
            Name = "Knob",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(1, 0, 0.5, 0),
            Size = UDim2.fromOffset(13, 13),
            BackgroundColor3 = window.Theme.Accent,
            BorderSizePixel = 0,
            Parent = fill,
        })
        corner(knob, 7)

        local dragging = false
        local function setValueFromAlpha(alpha: number, fire: boolean?)
            alpha = math.clamp(alpha, 0, 1)
            local raw = min + ((max - min) * alpha)
            if step > 0 then
                value = math.floor(((raw - min) / step) + 0.5) * step + min
            else
                value = raw
            end
            value = math.clamp(value, min, max)
            local fillRatio = (value - min) / math.max(max - min, 0.0001)
            fill.Size = UDim2.fromScale(math.clamp(fillRatio, 0, 1), 1)
            numberLabel.Text = formatVal(value)
            if fire then callback(value) end
        end

        local function fromX(x: number)
            setValueFromAlpha((x - bar.AbsolutePosition.X) / math.max(bar.AbsoluteSize.X, 1), true)
        end

        local dragConn = nil
        local endConn = nil
        bar.InputBegan:Connect(function(input)
            if not checkPremium(props) then return end
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                fromX(input.Position.X)
                if not dragConn then
                    dragConn = UserInputService.InputChanged:Connect(function(moveInput)
                        if dragging and (moveInput.UserInputType == Enum.UserInputType.MouseMovement or moveInput.UserInputType == Enum.UserInputType.Touch) then
                            fromX(moveInput.Position.X)
                        end
                    end)
                end
                if not endConn then
                    endConn = UserInputService.InputEnded:Connect(function(endInput)
                        if endInput.UserInputType == Enum.UserInputType.MouseButton1 or endInput.UserInputType == Enum.UserInputType.Touch then
                            dragging = false
                            if dragConn then dragConn:Disconnect(); dragConn = nil end
                            if endConn then endConn:Disconnect(); endConn = nil end
                        end
                    end)
                end
            end
        end)

        setValueFromAlpha((value - min) / math.max(max - min, 0.0001), false)

        local item = {}
        function item:SetValue(v: number)
            if step > 0 then
                value = math.floor(((v - min) / step) + 0.5) * step + min
            else
                value = v
            end
            value = math.clamp(value, min, max)
            setValueFromAlpha((value - min) / math.max(max - min, 0.0001), false)
        end
        function item:GetValue() return value end
        function item:SetVisible(v: boolean) row.Visible = v end
        return item
    end

    function api:Textbox(props: { [string]: any })
        props = props or {}
        local callback = props.Callback or function() end
        local boxWidth = props.Width or (window.DeviceType == "Phone" and 140 or 160)
        local row = createCoreRow(window, scroll, tostring(props.Title or "Textbox"), props.Desc or "", props.Image or "Textbox", props.Height or (props.Desc and 64 or 52), boxWidth + 18, nextOrder(props.Order))

        local boxWrap = make("Frame", {
            Name = "InputWrap",
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, -14, 0.5, 0),
            Size = UDim2.fromOffset(boxWidth, 36),
            BackgroundColor3 = window.Theme.Sidebar,
            BackgroundTransparency = 0.50,
            BorderSizePixel = 0,
            ClipsDescendants = true,
            Parent = row,
        })
        corner(boxWrap, 8)
        local boxStroke = stroke(boxWrap, window.Theme.StrokeSoft, 1, 0.75)
        padding(boxWrap, 10, 0, 10, 0)

        local box = make("TextBox", {
            Name = "Input",
            Text = tostring(props.Value or props.Default or ""),
            PlaceholderText = tostring(props.Placeholder or "Enter text"),
            Font = Enum.Font.GothamMedium,
            TextSize = 14,
            TextColor3 = window.Theme.Text,
            PlaceholderColor3 = window.Theme.Muted,
            TextXAlignment = Enum.TextXAlignment.Left,
            ClearTextOnFocus = props.ClearTextOnFocus == true or props.ClearText == true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ClipsDescendants = true,
            Size = UDim2.new(1, 0, 1, 0),
            Parent = boxWrap,
        })

        box.Focused:Connect(function()
            if not checkPremium(props) then
                box:ReleaseFocus()
                return
            end
            tween(boxStroke, 0.16, { Color = window.Theme.Accent, Transparency = 0.3 })
            tween(boxWrap, 0.16, { BackgroundTransparency = 0.35 })
        end)
        box.FocusLost:Connect(function(enterPressed)
            tween(boxStroke, 0.16, { Color = window.Theme.StrokeSoft, Transparency = 0.75 })
            tween(boxWrap, 0.16, { BackgroundTransparency = 0.50 })
            if props.IsPrem ~= false then
                callback(box.Text, enterPressed)
            end
        end)

        local item = {}
        function item:SetValue(v: string) box.Text = v end
        function item:GetValue() return box.Text end
        function item:SetPlaceholderText(v: string) box.PlaceholderText = v end
        function item:SetVisible(v: boolean) row.Visible = v end
        return item
    end

    function api:Keybind(props: { [string]: any })
        props = props or {}
        local title = tostring(props.Title or "Keybind")
        local desc = tostring(props.Desc or "")
        local callback = props.Callback or function() end
        local currentKey = props.Value or props.Default or Enum.KeyCode.Unknown
        if typeof(currentKey) == "string" then
            local resolvedKey = Enum.KeyCode[currentKey]
            if resolvedKey then currentKey = resolvedKey end
        end
        local pillWidth = props.Width or (window.DeviceType == "Phone" and 90 or 100)
        local row = createCoreRow(window, scroll, title, desc, props.Image or "Key", props.Height or (desc ~= "" and 62 or 52), pillWidth + 24, nextOrder(props.Order))
        addRipple(row, window.Theme.Accent)

        local pillWrap = make("Frame", {
            Name = "KeybindPill",
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, -14, 0.5, 0),
            Size = UDim2.fromOffset(pillWidth, 34),
            BackgroundColor3 = window.Theme.Sidebar,
            BackgroundTransparency = 0.35,
            BorderSizePixel = 0,
            Parent = row,
        })
        corner(pillWrap, 8)
        local pillStroke = stroke(pillWrap, window.Theme.StrokeSoft, 1, 0.75)
        padding(pillWrap, 8, 0, 8, 0)

        local function getKeyName(kc: any): string
            if typeof(kc) == "EnumItem" then
                return kc.Name
            elseif type(kc) == "string" then
                return kc
            end
            return "None"
        end

        local keyLabel = make("TextLabel", {
            Name = "KeyName",
            Text = "[ " .. getKeyName(currentKey) .. " ]",
            Font = Enum.Font.GothamBold,
            TextSize = 14,
            TextColor3 = window.Theme.Accent,
            TextXAlignment = Enum.TextXAlignment.Center,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            Parent = pillWrap,
        })

        local listening = false
        local connection = nil

        local function stopListening()
            listening = false
            if connection then
                connection:Disconnect()
                connection = nil
            end
            keyLabel.Text = "[ " .. getKeyName(currentKey) .. " ]"
            tween(pillStroke, 0.18, { Color = window.Theme.StrokeSoft, Transparency = 0.75 })
            tween(pillWrap, 0.18, { BackgroundColor3 = window.Theme.Sidebar })
        end

        local function startListening()
            if not checkPremium(props) then return end
            listening = true
            keyLabel.Text = "[ ... ]"
            tween(pillStroke, 0.18, { Color = window.Theme.Accent, Transparency = 0.1 })
            tween(pillWrap, 0.18, { BackgroundColor3 = window.Theme.AccentSoft })

            if connection then connection:Disconnect() end
            connection = UserInputService.InputBegan:Connect(function(input)
                if not listening then return end
                if input.UserInputType == Enum.UserInputType.Keyboard then
                    local chosenKey = input.KeyCode
                    if chosenKey == Enum.KeyCode.Escape then
                        currentKey = Enum.KeyCode.Unknown
                    else
                        currentKey = chosenKey
                    end
                    stopListening()
                    callback(currentKey, getKeyName(currentKey))
                elseif input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    stopListening()
                end
            end)
        end

        row.MouseButton1Click:Connect(function()
            if listening then
                stopListening()
            else
                startListening()
            end
        end)

        local item = {}
        function item:SetValue(kc: any)
            if typeof(kc) == "string" and Enum.KeyCode[kc] then
                currentKey = Enum.KeyCode[kc]
            else
                currentKey = kc
            end
            keyLabel.Text = "[ " .. getKeyName(currentKey) .. " ]"
        end
        function item:GetValue() return currentKey end
        function item:SetVisible(v: boolean) row.Visible = v end
        return item
    end

    function api:Colorpicker(props: { [string]: any })
        props = props or {}
        local title = tostring(props.Title or "Color Picker")
        local desc = tostring(props.Desc or "")
        local currentColor = props.Value or props.Default or Color3.fromRGB(255, 255, 255)
        local callback = props.Callback or function() end

        local container = make("Frame", {
            Name = "ColorpickerContainer",
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = nextOrder(props.Order),
            Parent = scroll,
        })
        list(container, 6)

        local row = createCoreRow(window, container, title, desc, props.Image or "Theme", props.Height or (desc ~= "" and 62 or 52), 92, 1)
        addRipple(row, window.Theme.Accent)

        local swatchWrap = make("Frame", {
            Name = "SwatchWrap",
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, -14, 0.5, 0),
            Size = UDim2.fromOffset(88, 30),
            BackgroundColor3 = window.Theme.Sidebar,
            BackgroundTransparency = 0.35,
            BorderSizePixel = 0,
            Parent = row,
        })
        corner(swatchWrap, 6)
        stroke(swatchWrap, window.Theme.StrokeSoft, 1, 0.75)

        local swatch = make("Frame", {
            Name = "ColorSwatch",
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.new(0, 6, 0.5, 0),
            Size = UDim2.fromOffset(24, 18),
            BackgroundColor3 = currentColor,
            BorderSizePixel = 0,
            Parent = swatchWrap,
        })
        corner(swatch, 4)
        stroke(swatch, Color3.fromRGB(255, 255, 255), 1, 0.5)

        local hexLabel = make("TextLabel", {
            Name = "HexLabel",
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, -4, 0.5, 0),
            Size = UDim2.new(1, -34, 1, 0),
            Text = "#" .. currentColor:ToHex():upper():sub(1, 6),
            Font = Enum.Font.GothamBold,
            TextSize = 12,
            TextColor3 = window.Theme.Muted,
            TextXAlignment = Enum.TextXAlignment.Center,
            BackgroundTransparency = 1,
            Parent = swatchWrap,
        })

        local tray = make("Frame", {
            Name = "ColorTray",
            Size = UDim2.new(1, 0, 0, 0),
            BackgroundColor3 = window.Theme.Sidebar,
            BackgroundTransparency = 0.25,
            BorderSizePixel = 0,
            ClipsDescendants = true,
            Visible = false,
            LayoutOrder = 2,
            Parent = container,
        })
        corner(tray, 10)
        stroke(tray, window.Theme.StrokeSoft, 1, 0.6)
        padding(tray, 12, 10, 12, 10)
        list(tray, 8)

        local presetRow = make("Frame", {
            Name = "Presets",
            Size = UDim2.new(1, 0, 0, 24),
            BackgroundTransparency = 1,
            Parent = tray,
        })
        list(presetRow, 8, Enum.FillDirection.Horizontal)

        local presets = {
            Color3.fromRGB(239, 68, 68),
            Color3.fromRGB(245, 158, 11),
            Color3.fromRGB(34, 197, 94),
            Color3.fromRGB(14, 165, 233),
            Color3.fromRGB(59, 130, 246),
            Color3.fromRGB(168, 85, 247),
            Color3.fromRGB(244, 63, 94),
            Color3.fromRGB(255, 255, 255),
        }

        local rVal = math.floor(currentColor.R * 255 + 0.5)
        local gVal = math.floor(currentColor.G * 255 + 0.5)
        local bVal = math.floor(currentColor.B * 255 + 0.5)
        local updateColor

        for _, pc in ipairs(presets) do
            local pBtn = make("TextButton", {
                Name = "Preset",
                Text = "",
                Size = UDim2.fromOffset(24, 24),
                BackgroundColor3 = pc,
                BorderSizePixel = 0,
                Parent = presetRow,
            })
            corner(pBtn, 6)
            stroke(pBtn, Color3.fromRGB(255, 255, 255), 1, 0.6)
            pBtn.MouseButton1Click:Connect(function()
                updateColor(pc)
            end)
        end

        local function makeChannelSlider(label: string, initial: number, channelColor: Color3, onChanChange: (number) -> ())
            local chanWrap = make("Frame", {
                Name = label .. "Channel",
                Size = UDim2.new(1, 0, 0, 22),
                BackgroundTransparency = 1,
                Parent = tray,
            })

            local chanLabel = make("TextLabel", {
                Name = "ChanTag",
                Size = UDim2.fromOffset(20, 22),
                Text = label,
                Font = Enum.Font.GothamBold,
                TextSize = 11,
                TextColor3 = channelColor,
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = chanWrap,
            })

            local chanBar = make("Frame", {
                Name = "Bar",
                Position = UDim2.new(0, 24, 0.5, -3),
                Size = UDim2.new(1, -70, 0, 6),
                BackgroundColor3 = window.Theme.Surface,
                BorderSizePixel = 0,
                Parent = chanWrap,
            })
            corner(chanBar, 3)

            local chanFill = make("Frame", {
                Name = "Fill",
                Size = UDim2.fromScale(initial / 255, 1),
                BackgroundColor3 = channelColor,
                BorderSizePixel = 0,
                Parent = chanBar,
            })
            corner(chanFill, 3)

            local valText = make("TextLabel", {
                Name = "ValText",
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(1, 0, 0.5, 0),
                Size = UDim2.fromOffset(40, 20),
                Text = tostring(initial),
                Font = Enum.Font.GothamMedium,
                TextSize = 11,
                TextColor3 = window.Theme.Text,
                TextXAlignment = Enum.TextXAlignment.Right,
                BackgroundTransparency = 1,
                Parent = chanWrap,
            })

            local dragging = false
            local function updateFromX(x: number)
                local alpha = math.clamp((x - chanBar.AbsolutePosition.X) / math.max(chanBar.AbsoluteSize.X, 1), 0, 1)
                local v = math.floor(alpha * 255 + 0.5)
                chanFill.Size = UDim2.fromScale(alpha, 1)
                valText.Text = tostring(v)
                onChanChange(v)
            end

            chanBar.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                    updateFromX(input.Position.X)
                end
            end)
            chanBar.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = false
                end
            end)
            UserInputService.InputChanged:Connect(function(input)
                if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    updateFromX(input.Position.X)
                end
            end)

            return {
                Set = function(v: number)
                    v = math.clamp(v, 0, 255)
                    chanFill.Size = UDim2.fromScale(v / 255, 1)
                    valText.Text = tostring(v)
                end
            }
        end

        local rSlider, gSlider, bSlider
        updateColor = function(c: Color3)
            currentColor = c
            rVal = math.floor(c.R * 255 + 0.5)
            gVal = math.floor(c.G * 255 + 0.5)
            bVal = math.floor(c.B * 255 + 0.5)
            swatch.BackgroundColor3 = c
            hexLabel.Text = "#" .. c:ToHex():upper():sub(1, 6)
            if rSlider then rSlider.Set(rVal) end
            if gSlider then gSlider.Set(gVal) end
            if bSlider then bSlider.Set(bVal) end
            callback(c)
        end

        rSlider = makeChannelSlider("R", rVal, Color3.fromRGB(244, 63, 94), function(v)
            rVal = v
            local c = Color3.fromRGB(rVal, gVal, bVal)
            currentColor = c
            swatch.BackgroundColor3 = c
            hexLabel.Text = "#" .. c:ToHex():upper():sub(1, 6)
            callback(c)
        end)
        gSlider = makeChannelSlider("G", gVal, Color3.fromRGB(34, 197, 94), function(v)
            gVal = v
            local c = Color3.fromRGB(rVal, gVal, bVal)
            currentColor = c
            swatch.BackgroundColor3 = c
            hexLabel.Text = "#" .. c:ToHex():upper():sub(1, 6)
            callback(c)
        end)
        bSlider = makeChannelSlider("B", bVal, Color3.fromRGB(59, 130, 246), function(v)
            bVal = v
            local c = Color3.fromRGB(rVal, gVal, bVal)
            currentColor = c
            swatch.BackgroundColor3 = c
            hexLabel.Text = "#" .. c:ToHex():upper():sub(1, 6)
            callback(c)
        end)

        local open = false
        local function toggleTray()
            if not checkPremium(props) then return end
            open = not open
            if open then
                tray.Visible = true
                tray.Size = UDim2.new(1, 0, 0, 0)
                tween(tray, 0.20, { Size = UDim2.new(1, 0, 0, 132) })
            else
                tween(tray, 0.18, { Size = UDim2.new(1, 0, 0, 0) })
                task.delay(0.2, function()
                    if not open and tray.Parent then tray.Visible = false end
                end)
            end
        end

        row.MouseButton1Click:Connect(toggleTray)

        local item = {}
        function item:SetValue(c: Color3) updateColor(c) end
        function item:GetValue() return currentColor end
        function item:SetVisible(v: boolean) container.Visible = v end
        return item
    end

    function api:ProgressBar(props: { [string]: any })
        props = props or {}
        local title = tostring(props.Title or "Progress")
        local status = tostring(props.Status or props.Desc or "")
        local rawProgress = tonumber(props.Progress) or tonumber(props.Value) or 0
        if rawProgress > 1 then rawProgress = rawProgress / 100 end
        local progress = math.clamp(rawProgress, 0, 1)
        local barColor = props.Color or window.Theme.Accent

        local row = make("Frame", {
            Name = "ProgressBarRow",
            Size = UDim2.new(1, 0, 0, 74),
            BackgroundColor3 = window.Theme.Surface,
            BackgroundTransparency = 0.35,
            BorderSizePixel = 0,
            LayoutOrder = nextOrder(props.Order),
            Parent = scroll,
        })
        corner(row, 10)
        stroke(row, window.Theme.StrokeSoft, 1, 0.75)
        padding(row, 14, 10, 14, 10)

        local topWrap = make("Frame", {
            Name = "TopWrap",
            Size = UDim2.new(1, 0, 0, 22),
            BackgroundTransparency = 1,
            Parent = row,
        })

        local titleLabel = make("TextLabel", {
            Name = "Title",
            Text = title,
            Font = Enum.Font.GothamBold,
            TextSize = 15,
            TextColor3 = window.Theme.Text,
            TextXAlignment = Enum.TextXAlignment.Left,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, -60, 1, 0),
            Parent = topWrap,
        })

        local percentLabel = make("TextLabel", {
            Name = "Percent",
            Text = tostring(math.floor(progress * 100 + 0.5)) .. "%",
            Font = Enum.Font.GothamBold,
            TextSize = 14,
            TextColor3 = barColor,
            TextXAlignment = Enum.TextXAlignment.Right,
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.new(1, 0, 0, 0),
            Size = UDim2.fromOffset(50, 22),
            Parent = topWrap,
        })

        local statusLabel = make("TextLabel", {
            Name = "Status",
            Text = status,
            Font = Enum.Font.GothamMedium,
            TextSize = 13,
            TextColor3 = Color3.fromRGB(165, 165, 175),
            TextXAlignment = Enum.TextXAlignment.Left,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 0, 0, 25),
            Size = UDim2.new(1, 0, 0, 18),
            Parent = row,
        })

        local track = make("Frame", {
            Name = "Track",
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.new(0, 0, 1, 0),
            Size = UDim2.new(1, 0, 0, 8),
            BackgroundColor3 = window.Theme.Sidebar,
            BackgroundTransparency = 0.35,
            BorderSizePixel = 0,
            Parent = row,
        })
        corner(track, 4)

        local fill = make("Frame", {
            Name = "Fill",
            Size = UDim2.fromScale(progress, 1),
            BackgroundColor3 = barColor,
            BorderSizePixel = 0,
            Parent = track,
        })
        corner(fill, 4)

        local item = {}
        function item:SetProgress(val: number, newStatus: string?)
            if val > 1 then val = val / 100 end
            progress = math.clamp(val, 0, 1)
            tween(fill, 0.25, { Size = UDim2.fromScale(progress, 1) }, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            percentLabel.Text = tostring(math.floor(progress * 100 + 0.5)) .. "%"
            if newStatus then
                statusLabel.Text = tostring(newStatus)
            end
        end
        function item:SetStatus(newStatus: string)
            statusLabel.Text = tostring(newStatus)
        end
        function item:SetTitle(newTitle: string)
            titleLabel.Text = tostring(newTitle)
        end
        function item:GetProgress() return progress end
        function item:SetVisible(v: boolean) row.Visible = v end
        return item
    end

    function api:Divider(props: { [string]: any })
        props = props or {}
        local divWrap = make("Frame", {
            Name = "Divider",
            Size = UDim2.new(1, 0, 0, tonumber(props.Height) or 12),
            BackgroundTransparency = 1,
            LayoutOrder = nextOrder(props.Order),
            Parent = scroll,
        })
        local line = make("Frame", {
            Name = "Line",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, -8, 0, 1),
            BackgroundColor3 = props.Color or Color3.fromRGB(255, 255, 255),
            BorderSizePixel = 0,
            Parent = divWrap,
        })
        make("UIGradient", {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, window.Theme.StrokeSoft),
                ColorSequenceKeypoint.new(0.50, window.Theme.Accent),
                ColorSequenceKeypoint.new(1.00, window.Theme.StrokeSoft),
            }),
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0.00, 0.8),
                NumberSequenceKeypoint.new(0.50, 0.3),
                NumberSequenceKeypoint.new(1.00, 0.8),
            }),
            Parent = line,
        })
        local item = {}
        function item:SetVisible(v: boolean) divWrap.Visible = v end
        return item
    end

    function api:Spacer(props: { [string]: any })
        props = props or {}
        local space = make("Frame", {
            Name = "Spacer",
            Size = UDim2.new(1, 0, 0, tonumber(props.Size or props.Height) or 10),
            BackgroundTransparency = 1,
            LayoutOrder = nextOrder(props.Order),
            Parent = scroll,
        })
        local item = {}
        function item:SetSize(h: number) space.Size = UDim2.new(1, 0, 0, h) end
        function item:SetVisible(v: boolean) space.Visible = v end
        return item
    end

    function api:Banner(props: { [string]: any })
        props = props or {}
        local bType = tostring(props.Type or "Info")
        local title = tostring(props.Title or "Notice")
        local desc = tostring(props.Desc or props.Text or "")

        local typeColors = {
            Info = window.Theme.Accent,
            Success = window.Theme.Success,
            Warning = window.Theme.Warning,
            Danger = window.Theme.Danger,
        }
        local accentColor = typeColors[bType] or window.Theme.Accent

        local card = make("Frame", {
            Name = "BannerCard",
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = window.Theme.Surface,
            BackgroundTransparency = 0.35,
            BorderSizePixel = 0,
            LayoutOrder = nextOrder(props.Order),
            Parent = scroll,
        })
        corner(card, 10)
        stroke(card, accentColor, 1, 0.70)
        padding(card, 16, 12, 14, 12)

        local stripe = make("Frame", {
            Name = "Stripe",
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.new(0, -16, 0.5, 0),
            Size = UDim2.new(0, 4, 1, -12),
            BackgroundColor3 = accentColor,
            BorderSizePixel = 0,
            Parent = card,
        })
        corner(stripe, 2)

        local contentWrap = make("Frame", {
            Name = "ContentWrap",
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            Parent = card,
        })
        list(contentWrap, 4)

        local titleLabel = make("TextLabel", {
            Name = "Title",
            Text = title,
            Font = Enum.Font.GothamBold,
            TextSize = 15,
            TextColor3 = accentColor,
            TextXAlignment = Enum.TextXAlignment.Left,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 20),
            Parent = contentWrap,
        })

        local descLabel = make("TextLabel", {
            Name = "Desc",
            Text = desc,
            Font = Enum.Font.GothamMedium,
            TextSize = 13,
            TextColor3 = window.Theme.Text,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
            TextWrapped = true,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            Parent = contentWrap,
        })

        local item = {}
        function item:SetTitle(t: string) titleLabel.Text = tostring(t) end
        function item:SetText(d: string) descLabel.Text = tostring(d) end
        function item:SetType(newType: string)
            local col = typeColors[newType] or window.Theme.Accent
            titleLabel.TextColor3 = col
            stripe.BackgroundColor3 = col
        end
        function item:SetVisible(v: boolean) card.Visible = v end
        return item
    end
    api.Callout = api.Banner

    function api:MetricGrid(props: { [string]: any })
        props = props or {}
        local cols = math.clamp(tonumber(props.Cols) or 3, 1, 4)
        local items = props.Items or {}

        local gridWrap = make("Frame", {
            Name = "MetricGrid",
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = nextOrder(props.Order),
            Parent = scroll,
        })
        make("UIGridLayout", {
            CellPadding = UDim2.fromOffset(8, 8),
            CellSize = UDim2.new(1 / cols, -math.floor((8 * (cols - 1)) / cols), 0, 78),
            SortOrder = Enum.SortOrder.LayoutOrder,
            Parent = gridWrap,
        })

        local statCards = {}

        local function addStatCard(data: { [string]: any }, index: number)
            local card = make("Frame", {
                Name = "StatCard_" .. tostring(index),
                BackgroundColor3 = window.Theme.Surface,
                BackgroundTransparency = 0.35,
                BorderSizePixel = 0,
                LayoutOrder = index,
                Parent = gridWrap,
            })
            corner(card, 10)
            stroke(card, window.Theme.StrokeSoft, 1, 0.75)
            padding(card, 12, 10, 12, 10)

            local cardTitle = make("TextLabel", {
                Name = "StatTitle",
                Text = string.upper(tostring(data.Title or "STAT")),
                Font = Enum.Font.GothamBold,
                TextSize = 12,
                TextColor3 = window.Theme.Muted,
                TextXAlignment = Enum.TextXAlignment.Left,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 16),
                Parent = card,
            })

            local cardValue = make("TextLabel", {
                Name = "StatValue",
                Text = tostring(data.Value or "0"),
                Font = Enum.Font.GothamBold,
                TextSize = 20,
                TextColor3 = data.Color or window.Theme.Accent,
                TextXAlignment = Enum.TextXAlignment.Left,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 0, 0, 18),
                Size = UDim2.new(1, 0, 0, 24),
                Parent = card,
            })

            local cardSub = make("TextLabel", {
                Name = "StatSub",
                Text = tostring(data.Sub or data.Trend or ""),
                Font = Enum.Font.GothamMedium,
                TextSize = 12,
                TextColor3 = data.Trend and window.Theme.Success or window.Theme.Muted,
                TextXAlignment = Enum.TextXAlignment.Left,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 0, 0, 44),
                Size = UDim2.new(1, 0, 0, 16),
                Parent = card,
            })

            statCards[index] = { Card = card, Title = cardTitle, Value = cardValue, Sub = cardSub }
        end

        for i, it in ipairs(items) do
            addStatCard(it, i)
        end

        local item = {}
        function item:UpdateItem(index: number, val: any, sub: string?)
            local entry = statCards[index]
            if entry then
                entry.Value.Text = tostring(val)
                if sub ~= nil then entry.Sub.Text = tostring(sub) end
            end
        end
        function item:SetVisible(v: boolean) gridWrap.Visible = v end
        return item
    end
    api.StatCard = api.MetricGrid

    function api:LogConsole(props: { [string]: any })
        props = props or {}
        local title = tostring(props.Title or "Console Log")
        local consoleH = tonumber(props.Height) or 160
        local maxLines = tonumber(props.MaxLines) or 120
        local autoScroll = props.AutoScroll ~= false

        local consoleWrap = make("Frame", {
            Name = "LogConsole",
            Size = UDim2.new(1, 0, 0, consoleH + 34),
            BackgroundColor3 = window.Theme.Sidebar,
            BackgroundTransparency = 0.35,
            BorderSizePixel = 0,
            LayoutOrder = nextOrder(props.Order),
            Parent = scroll,
        })
        corner(consoleWrap, 10)
        stroke(consoleWrap, window.Theme.StrokeSoft, 1, 0.6)

        local header = make("Frame", {
            Name = "Header",
            Size = UDim2.new(1, 0, 0, 30),
            BackgroundColor3 = window.Theme.Surface,
            BackgroundTransparency = 0.50,
            BorderSizePixel = 0,
            Parent = consoleWrap,
        })
        corner(header, 10)
        padding(header, 10, 0, 8, 0)
        local hLayout = list(header, 8, Enum.FillDirection.Horizontal)
        hLayout.VerticalAlignment = Enum.VerticalAlignment.Center

        local dot1 = make("Frame", { Size = UDim2.fromOffset(8, 8), BackgroundColor3 = window.Theme.Danger, Parent = header })
        corner(dot1, 4)
        local dot2 = make("Frame", { Size = UDim2.fromOffset(8, 8), BackgroundColor3 = window.Theme.Warning, Parent = header })
        corner(dot2, 4)
        local dot3 = make("Frame", { Size = UDim2.fromOffset(8, 8), BackgroundColor3 = window.Theme.Success, Parent = header })
        corner(dot3, 4)

        make("TextLabel", {
            Name = "Title",
            Text = string.upper(title),
            Font = Enum.Font.GothamBold,
            TextSize = 13,
            TextColor3 = window.Theme.Accent,
            TextXAlignment = Enum.TextXAlignment.Left,
            BackgroundTransparency = 1,
            Size = UDim2.new(0.6, 0, 1, 0),
            Parent = header,
        })

        local clearBtn = make("TextButton", {
            Name = "ClearBtn",
            Text = "CLEAR",
            Font = Enum.Font.GothamBold,
            TextSize = 11,
            TextColor3 = window.Theme.Muted,
            BackgroundColor3 = window.Theme.SurfaceHover,
            BackgroundTransparency = 0.5,
            Size = UDim2.fromOffset(50, 20),
            AnchorPoint = Vector2.new(1, 0.5),
            Parent = header,
        })
        corner(clearBtn, 4)

        local logScroll = make("ScrollingFrame", {
            Name = "LogScroll",
            Position = UDim2.new(0, 0, 0, 32),
            Size = UDim2.new(1, 0, 1, -34),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollingDirection = Enum.ScrollingDirection.Y,
            ScrollBarThickness = 3,
            ScrollBarImageColor3 = window.Theme.Accent,
            ScrollBarImageTransparency = 0.4,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            Parent = consoleWrap,
        })
        padding(logScroll, 8, 6, 8, 6)
        list(logScroll, 3)

        local lines = {}

        local function addLogLine(msg: string, col: Color3)
            local timeStr = os.date("%X")
            local lineText = string.format("[%s] %s", timeStr, tostring(msg))

            local lineLabel = make("TextLabel", {
                Name = "LogLine",
                Text = lineText,
                Font = Enum.Font.Code,
                TextSize = 12,
                TextColor3 = col or window.Theme.Text,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
                TextWrapped = true,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                Parent = logScroll,
            })
            table.insert(lines, lineLabel)

            if #lines > maxLines then
                local old = table.remove(lines, 1)
                if old then old:Destroy() end
            end

            if autoScroll then
                task.defer(function()
                    if logScroll and logScroll.Parent then
                        logScroll.CanvasPosition = Vector2.new(0, 999999)
                    end
                end)
            end
        end

        clearBtn.MouseButton1Click:Connect(function()
            for _, l in ipairs(lines) do
                if l and l.Parent then l:Destroy() end
            end
            table.clear(lines)
        end)

        local item = {}
        function item:Log(msg: any) addLogLine(tostring(msg), window.Theme.Text) end
        function item:Info(msg: any) addLogLine(tostring(msg), window.Theme.Accent) end
        function item:Warn(msg: any) addLogLine(tostring(msg), window.Theme.Warning) end
        function item:Error(msg: any) addLogLine(tostring(msg), window.Theme.Danger) end
        function item:Success(msg: any) addLogLine(tostring(msg), window.Theme.Success) end
        function item:Clear()
            for _, l in ipairs(lines) do
                if l and l.Parent then l:Destroy() end
            end
            table.clear(lines)
        end
        function item:SetVisible(v: boolean) consoleWrap.Visible = v end
        return item
    end

    api.Root = scroll
    return api
end

-- Main Window Constructor
function Library:Window(props: { [string]: any })
    props = props or {}
    local self = setmetatable({}, Library)
    self.ThemeName = (type(props.Theme) == "string" and props.Theme) or "CyberNeon"
    self.Theme = resolveTheme(props.Theme or "CyberNeon")
    self.Tabs = {}
    self.SelectedTab = nil
    self.Keybind = (props.Config and props.Config.Keybind) or props.Keybind or Enum.KeyCode.RightControl
    self.ManualScale = nil
    self.DeviceType = detectDeviceType()
    self.TabCount = 0

    local appTitle = tostring(props.Title or "CYBERFLOW // v2.0")
    local guiName = props.Name or "CyberNeon_Window"
    local existing = getParentGui():FindFirstChild(guiName)
    if existing then existing:Destroy() end

    local screenGui = make("ScreenGui", {
        Name = guiName,
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        DisplayOrder = props.DisplayOrder or 999,
        IgnoreGuiInset = true, -- Never displace or jerk on mobile menu toggle
        Parent = getParentGui(),
    })
    if typeof(protectgui) == "function" then
        pcall(protectgui, screenGui)
    elseif typeof(syn) == "table" and typeof((syn :: any).protect_gui) == "function" then
        pcall((syn :: any).protect_gui, screenGui)
    end
    self.ScreenGui = screenGui

    -- Screen-Level Left-Corner Notification Container
    local notifContainer = screenGui:FindFirstChild("ScreenNotifContainer")
    if not notifContainer then
        notifContainer = make("Frame", {
            Name = "ScreenNotifContainer",
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.new(0, 24, 1, -24),
            Size = UDim2.new(0, 320, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 500,
            Parent = screenGui,
        })
        local notifLayout = list(notifContainer, 8, Enum.FillDirection.Vertical)
        notifLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
        notifLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    end
    self.NotificationContainer = notifContainer

    local isAlive = true
    local stopAnimation = function() end

    pcall(function()
        screenGui.Destroying:Connect(function()
            isAlive = false
            stopAnimation()
        end)
    end)
    pcall(function()
        screenGui.AncestryChanged:Connect(function(_, parent)
            if not parent then
                isAlive = false
                stopAnimation()
            end
        end)
    end)

    local shadow = make("ImageLabel", {
        Name = "Shadow",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = props.Position or UDim2.fromScale(0.5, 0.5),
        Size = (props.Config and props.Config.Size) or props.Size or UDim2.fromOffset(640, 440),
        BackgroundTransparency = 1,
        Image = Library.Assets.Shadow,
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        ImageTransparency = 0.35,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(10, 10, 118, 118),
        Parent = screenGui,
    })
    self.Shadow = shadow

    local uiScale = make("UIScale", {
        Scale = 1,
        Parent = shadow,
    })
    self.UIScale = uiScale

    local function updateDeviceScale()
        pcall(function()
            local setidentity = setthreadidentity or set_thread_identity or (syn and syn.set_thread_identity)
            if setidentity then pcall(setidentity, 8) end
            local camera = workspace.CurrentCamera
            if not camera then return end
            local vp = camera.ViewportSize
            local topInset = getTopInset()
            self.DeviceType = detectDeviceType()

            local finalScale = self.ManualScale or calculateDeviceScale(self.DeviceType, vp, topInset)
            uiScale.Scale = finalScale
            clampWindowPosition(shadow, uiScale)
        end)
    end

    local camera = workspace.CurrentCamera
    if camera then
        camera:GetPropertyChangedSignal("ViewportSize"):Connect(updateDeviceScale)
        task.spawn(updateDeviceScale)
    end

    function self:SetScale(newScale: number?)
        self.ManualScale = newScale
        updateDeviceScale()
    end

    function self:GetDeviceType(): string
        return self.DeviceType
    end

    -- Translucent Frosted Acrylic Window Body
    local root = make("Frame", {
        Name = "WindowRoot",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, -16, 1, -16),
        BackgroundColor3 = Color3.fromRGB(18, 18, 22),
        BackgroundTransparency = 0.16, -- Translucent acrylic glass finish matching Gatlify template
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Parent = shadow,
    })
    corner(root, 10)

    -- Window Border Stroke
    local rootStroke = stroke(root, self.Theme.StrokeSoft, 1, 0.4)
    rootStroke.Name = "BorderStroke"
    local borderGradient = make("UIGradient", {
        Name = "BorderGradient",
        Color = props.BorderGradient or createDefaultBorderSequence(self.Theme),
        Rotation = 0,
        Enabled = (props.BorderAnimation == true),
        Parent = rootStroke,
    })
    self.BorderGradient = borderGradient
    self.BorderStroke = rootStroke
    self.CustomBorderGradient = props.BorderGradient ~= nil

    -- Frosted Glass Layer with Ambient Glow (Disabled by default for clean dark matte Gatlify aesthetic)
    local bgLayer = make("Frame", {
        Name = "BackgroundLayer",
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = self.Theme.Background,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 1,
        ClipsDescendants = true,
        Visible = (props.BackgroundAnimation == true),
        Parent = root,
    })
    corner(bgLayer, 10)

    local bgGradient = make("UIGradient", {
        Name = "AnimatedBgGradient",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0.00, self.Theme.Background),
            ColorSequenceKeypoint.new(0.40, self.Theme.Sidebar),
            ColorSequenceKeypoint.new(0.75, Color3.fromRGB(16, 20, 34)),
            ColorSequenceKeypoint.new(1.00, self.Theme.Background),
        }),
        Rotation = 45,
        Parent = bgLayer,
    })
    self.BgGradient = bgGradient

    local bgImage = make("ImageLabel", {
        Name = "BackgroundImage",
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        ScaleType = Enum.ScaleType.Crop,
        Image = normalizeAsset(props.BackgroundImage or props.Image or ""),
        ImageTransparency = props.BackgroundImageTransparency or props.ImageTransparency or 0.90,
        ImageColor3 = props.BackgroundImageColor or Color3.fromRGB(255, 255, 255),
        Visible = (props.BackgroundImage ~= nil and props.BackgroundImage ~= ""),
        ZIndex = 1,
        Parent = bgLayer,
    })
    self.BackgroundImage = bgImage

    local imgGradient = make("UIGradient", {
        Name = "MovingImageGradient",
        Color = props.BackgroundImageGradient or ColorSequence.new({
            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(120, 140, 185)),
            ColorSequenceKeypoint.new(0.35, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.65, self.Theme.Accent),
            ColorSequenceKeypoint.new(0.85, Color3.fromRGB(168, 85, 247)),
            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(120, 140, 185)),
        }),
        Rotation = 35,
        Offset = Vector2.new(-1, 0),
        Parent = bgImage,
    })
    self.ImageGradient = imgGradient

    local ambientGlow = make("ImageLabel", {
        Name = "AmbientGlow",
        AnchorPoint = Vector2.new(0.5, 0.2),
        Position = UDim2.fromScale(0.5, 0.2),
        Size = UDim2.fromScale(1.4, 0.8),
        BackgroundTransparency = 1,
        Image = Library.Assets.Shadow,
        ImageColor3 = self.Theme.Accent,
        ImageTransparency = 1,
        Visible = false,
        ScaleType = Enum.ScaleType.Fit,
        ZIndex = 1,
        Parent = bgLayer,
    })
    self.AmbientGlow = ambientGlow

    -- Animated Border & Background Engine (Optimized & Capability-Safe)
    local borderAnimationActive = (props.BorderAnimation == true)
    local backgroundAnimationActive = (props.BackgroundAnimation == true)
    local borderSpeed = props.BorderSpeed or 60
    local bgTime = 0

    local animConn: RBXScriptConnection? = nil

    stopAnimation = function()
        if animConn then
            pcall(function() animConn:Disconnect() end)
            animConn = nil
        end
    end

    local function startAnimation()
        if animConn or not isAlive then return end
        if not borderAnimationActive and not backgroundAnimationActive then return end

        animConn = RunService.RenderStepped:Connect(function(dt)
            if not isAlive then
                stopAnimation()
                return
            end

            local setidentity = setthreadidentity or set_thread_identity or (syn and syn.set_thread_identity)
            if setidentity then
                pcall(setidentity, 8)
            end

            local parentCheckOk, hasParent = pcall(function()
                return screenGui and screenGui.Parent ~= nil
            end)
            if parentCheckOk and not hasParent then
                isAlive = false
                stopAnimation()
                return
            end

            if not borderAnimationActive and not backgroundAnimationActive then
                return
            end

            pcall(function()
                if borderAnimationActive and borderGradient and borderGradient.Parent then
                    borderGradient.Rotation = (borderGradient.Rotation + dt * borderSpeed) % 360
                end

                if backgroundAnimationActive then
                    bgTime = bgTime + dt
                    if imgGradient and imgGradient.Parent then
                        local waveOffset = -1 + ((bgTime * 0.35) % 2)
                        imgGradient.Offset = Vector2.new(waveOffset, math.sin(bgTime * 0.6) * 0.12)
                        imgGradient.Rotation = 35 + math.sin(bgTime * 0.4) * 12
                    end

                    if bgGradient and bgGradient.Parent then
                        bgGradient.Rotation = (bgGradient.Rotation + dt * 16) % 360
                        bgGradient.Offset = Vector2.new(math.sin(bgTime * 0.5) * 0.16, math.cos(bgTime * 0.4) * 0.16)
                    end
                    if ambientGlow and ambientGlow.Parent then
                        ambientGlow.ImageTransparency = 0.84 + (math.sin(bgTime * 1.3) * 0.05)
                    end
                end
            end)
        end)
        self.AnimConnection = animConn
    end

    if borderAnimationActive or backgroundAnimationActive then
        startAnimation()
    end

    function self:SetBorderAnimation(enabled: boolean, speed: number?)
        borderAnimationActive = enabled
        if speed then borderSpeed = speed end
        if borderAnimationActive or backgroundAnimationActive then
            startAnimation()
        else
            stopAnimation()
        end
    end

    function self:SetBorderGradient(seq: ColorSequence?)
        if seq then
            self.CustomBorderGradient = true
            borderGradient.Color = seq
        else
            self.CustomBorderGradient = false
            borderGradient.Color = createDefaultBorderSequence(self.Theme)
        end
    end

    function self:SetBackgroundImage(asset: string, transparency: number?)
        bgImage.Image = normalizeAsset(asset)
        if transparency then
            bgImage.ImageTransparency = transparency
        end
        bgImage.Visible = (asset ~= "")
    end

    function self:SetBackgroundAnimation(enabled: boolean)
        backgroundAnimationActive = enabled
        if borderAnimationActive or backgroundAnimationActive then
            startAnimation()
        else
            stopAnimation()
        end
    end

    self.Root = root

    -- Subtle Top Edge Glass Reflection
    local topGlow = make("Frame", {
        Name = "TopGlow",
        Position = UDim2.new(0, 0, 0, 0),
        Size = UDim2.new(1, 0, 0, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
        Parent = root,
    })
    make("UIGradient", {
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0.00, 1.0),
            NumberSequenceKeypoint.new(0.30, 0.4),
            NumberSequenceKeypoint.new(0.50, 0.2),
            NumberSequenceKeypoint.new(0.70, 0.4),
            NumberSequenceKeypoint.new(1.00, 1.0),
        }),
        Parent = topGlow,
    })

    -- Floating Glass Orb Restore Button
    local floatingOpenBtn = make("ImageButton", {
        Name = "FloatingOpenButton",
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 24, 0.5, 0),
        Size = UDim2.fromOffset(54, 54),
        BackgroundColor3 = self.Theme.Surface,
        BackgroundTransparency = 0.25,
        BorderSizePixel = 0,
        Image = normalizeAsset(props.FloatingIcon or Library.Assets.FloatingToggle or "84269270119683"),
        ImageColor3 = (tostring(props.Icon or "autohub_icon.png"):find("%.png") or tostring(props.Icon or "autohub_icon.png"):find("%.jpg")) and Color3.fromRGB(255, 255, 255) or self.Theme.Accent,
        Visible = false,
        ZIndex = 200,
        Parent = screenGui,
    })
    corner(floatingOpenBtn, 27)
    stroke(floatingOpenBtn, self.Theme.Accent, 1, 0.4)
    addRipple(floatingOpenBtn, self.Theme.Accent)
    bindDrag(floatingOpenBtn, floatingOpenBtn, nil)

    -- Confirmation Modal for Exit
    local confirmOverlay = make("Frame", {
        Name = "ConfirmOverlay",
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.60,
        Visible = false,
        ZIndex = 300,
        Parent = root,
    })

    local confirmModal = make("Frame", {
        Name = "ConfirmModal",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(320, 160),
        BackgroundColor3 = self.Theme.Sidebar,
        BackgroundTransparency = 0.15,
        BorderSizePixel = 0,
        ZIndex = 301,
        Parent = confirmOverlay,
    })
    corner(confirmModal, 12)
    stroke(confirmModal, self.Theme.StrokeSoft, 1, 0.5)
    padding(confirmModal, 20, 20, 20, 20)
    list(confirmModal, 12)

    createText(confirmModal, "ModalTitle", "Confirm Exit", 17, self.Theme.Text, true, 1)
    createText(confirmModal, "ModalDesc", "Are you sure you want to close this UI?", 14, self.Theme.Muted, false, 2)

    local modalBtnRow = make("Frame", {
        Name = "ModalBtnRow",
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundTransparency = 1,
        LayoutOrder = 3,
        Parent = confirmModal,
    })
    list(modalBtnRow, 12, Enum.FillDirection.Horizontal)

    local cancelBtn = make("TextButton", {
        Name = "CancelBtn",
        Text = "Cancel",
        Font = Enum.Font.GothamBold,
        TextSize = 14,
        TextColor3 = self.Theme.Text,
        AutoButtonColor = false,
        BackgroundColor3 = self.Theme.Surface,
        BackgroundTransparency = 0.35,
        BorderSizePixel = 0,
        Size = UDim2.new(0.5, -6, 1, 0),
        Parent = modalBtnRow,
    })
    corner(cancelBtn, 8)
    stroke(cancelBtn, self.Theme.StrokeSoft, 1, 0.7)
    addRipple(cancelBtn, self.Theme.Muted)

    local confirmBtn = make("TextButton", {
        Name = "ConfirmBtn",
        Text = "Exit",
        Font = Enum.Font.GothamBold,
        TextSize = 14,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AutoButtonColor = false,
        BackgroundColor3 = self.Theme.Danger,
        BorderSizePixel = 0,
        Size = UDim2.new(0.5, -6, 1, 0),
        Parent = modalBtnRow,
    })
    corner(confirmBtn, 8)
    addRipple(confirmBtn, Color3.fromRGB(255, 255, 255))

    cancelBtn.MouseButton1Click:Connect(function()
        tween(confirmOverlay, 0.15, { BackgroundTransparency = 1 })
        local t = tween(confirmModal, 0.15, { Size = UDim2.fromOffset(250, 125) }, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
        t.Completed:Connect(function()
            confirmOverlay.Visible = false
        end)
    end)

    confirmBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    local isWindowVisible = true
    local isTransitioning = false

    local function getBaseScale(): number
        local camera = workspace.CurrentCamera
        local vp = (camera and camera.ViewportSize) or Vector2.new(1920, 1080)
        return self.ManualScale or calculateDeviceScale(self.DeviceType, vp, getTopInset())
    end

    local function animateOpen()
        if isTransitioning then return end
        if shadow.Visible and isWindowVisible then return end
        isTransitioning = true
        isWindowVisible = true

        if floatingOpenBtn.Visible then
            local hideBtnTween = tween(floatingOpenBtn, 0.16, { Size = UDim2.fromOffset(0, 0) }, Enum.EasingStyle.Back, Enum.EasingDirection.In)
            hideBtnTween.Completed:Connect(function()
                floatingOpenBtn.Visible = false
            end)
        end

        local targetScale = getBaseScale()
        clampWindowPosition(shadow, uiScale)

        shadow.Visible = true
        uiScale.Scale = targetScale * 0.88
        local basePos = shadow.Position
        shadow.Position = UDim2.new(basePos.X.Scale, basePos.X.Offset, basePos.Y.Scale, basePos.Y.Offset + 16)

        local scaleAnim = tween(uiScale, 0.28, { Scale = targetScale }, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        local posAnim = tween(shadow, 0.28, { Position = basePos }, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

        scaleAnim.Completed:Connect(function()
            uiScale.Scale = targetScale
            shadow.Position = basePos
            clampWindowPosition(shadow, uiScale)
            isTransitioning = false
        end)
    end

    local function animateClose(showFloating: boolean?)
        if isTransitioning then return end
        if not shadow.Visible and not isWindowVisible then return end
        isTransitioning = true
        isWindowVisible = false

        local targetScale = getBaseScale()
        local basePos = shadow.Position
        local targetPos = UDim2.new(basePos.X.Scale, basePos.X.Offset, basePos.Y.Scale, basePos.Y.Offset + 16)

        local scaleAnim = tween(uiScale, 0.20, { Scale = targetScale * 0.85 }, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
        local posAnim = tween(shadow, 0.20, { Position = targetPos }, Enum.EasingStyle.Quart, Enum.EasingDirection.In)

        scaleAnim.Completed:Connect(function()
            shadow.Visible = false
            shadow.Position = basePos
            uiScale.Scale = targetScale
            isTransitioning = false

            if showFloating ~= false then
                floatingOpenBtn.Visible = true
                floatingOpenBtn.Size = UDim2.fromOffset(0, 0)
                tween(floatingOpenBtn, 0.25, { Size = UDim2.fromOffset(54, 54) }, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
            end
        end)
    end

    local function toggleVisibility()
        if isWindowVisible then
            animateClose(true)
        else
            animateOpen()
        end
    end

    local resizeHandle = make("ImageButton", {
        Name = "ResizeHandle",
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.new(1, -6, 1, -6),
        Size = UDim2.fromOffset(20, 20),
        BackgroundTransparency = 1,
        Image = Library.Assets.Resize,
        ImageColor3 = self.Theme.Muted,
        ImageTransparency = 0.5,
        ZIndex = 100,
        Parent = shadow,
    })
    bindResize(resizeHandle, shadow, Vector2.new(620, 420), uiScale)

    resizeHandle.MouseEnter:Connect(function()
        tween(resizeHandle, 0.15, { ImageTransparency = 0.1, ImageColor3 = self.Theme.Accent })
    end)
    resizeHandle.MouseLeave:Connect(function()
        tween(resizeHandle, 0.15, { ImageTransparency = 0.5, ImageColor3 = self.Theme.Muted })
    end)

    -- TopBar with Title & Controls
    local topBar = make("Frame", {
        Name = "TopBar",
        Position = UDim2.new(0, 0, 0, 0),
        Size = UDim2.new(1, 0, 0, 42),
        BackgroundTransparency = 1,
        Parent = root,
    })
    bindDrag(topBar, shadow, uiScale)

    local topDivider = make("Frame", {
        Name = "TopDivider",
        Position = UDim2.new(0, 0, 1, -1),
        Size = UDim2.new(1, 0, 0, 1),
        BackgroundColor3 = self.Theme.StrokeSoft,
        BackgroundTransparency = 0.6,
        BorderSizePixel = 0,
        Parent = topBar,
    })

    local appTitleLabel = make("TextLabel", {
        Name = "AppTitle",
        Text = appTitle,
        Font = Enum.Font.GothamBold,
        TextSize = 15,
        TextColor3 = Color3.fromRGB(220, 220, 225),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 16, 0, 0),
        Size = UDim2.new(0.6, 0, 1, 0),
        Parent = topBar,
    })

    local isCollapsed = false
    local savedFullHeight = math.max(shadow.Size.Y.Offset, 420)
    local isMaximized = false
    local normalSize = shadow.Size

    -- Unminimize Overlay button on TopBar:
    -- When collapsed, covers the title bar so clicking anywhere unminimizes immediately!
    local unminimizeOverlay = make("TextButton", {
        Name = "UnminimizeOverlay",
        Text = "",
        AutoButtonColor = false,
        Position = UDim2.new(0, 0, 0, 0),
        Size = UDim2.new(1, -85, 1, 0),
        BackgroundTransparency = 1,
        Visible = false,
        ZIndex = 45,
        Parent = topBar,
    })

    local controls = make("Frame", {
        Name = "Controls",
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -8, 0.5, 0),
        Size = UDim2.fromOffset(82, 24),
        BackgroundTransparency = 1,
        ZIndex = 50,
        Parent = topBar,
    })
    list(controls, 3, Enum.FillDirection.Horizontal)

    -- Forward declarations of collapse / expand
    local collapseWindow, expandWindow, toggleCollapse

    -- 1. Minimize Button (Dash '—')
    local minBtn = make("TextButton", {
        Name = "MinimizeBtn",
        Text = "",
        AutoButtonColor = false,
        Size = UDim2.fromOffset(24, 22),
        BackgroundColor3 = Color3.fromRGB(36, 36, 40),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 51,
        Parent = controls,
    })
    corner(minBtn, 4)

    local minGlyph = make("Frame", {
        Name = "Glyph",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(10, 2),
        BackgroundColor3 = Color3.fromRGB(180, 180, 190),
        BorderSizePixel = 0,
        ZIndex = 52,
        Parent = minBtn,
    })

    local minGlyphV = make("Frame", {
        Name = "GlyphV",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(2, 10),
        BackgroundColor3 = Color3.fromRGB(180, 180, 190),
        BorderSizePixel = 0,
        Visible = false,
        ZIndex = 52,
        Parent = minBtn,
    })

    minBtn.MouseEnter:Connect(function()
        tween(minBtn, 0.15, { BackgroundTransparency = 0.25 })
        tween(minGlyph, 0.15, { BackgroundColor3 = Color3.fromRGB(255, 255, 255) })
        tween(minGlyphV, 0.15, { BackgroundColor3 = Color3.fromRGB(255, 255, 255) })
    end)
    minBtn.MouseLeave:Connect(function()
        tween(minBtn, 0.15, { BackgroundTransparency = 1 })
        tween(minGlyph, 0.15, { BackgroundColor3 = Color3.fromRGB(180, 180, 190) })
        tween(minGlyphV, 0.15, { BackgroundColor3 = Color3.fromRGB(180, 180, 190) })
    end)
    minBtn.MouseButton1Click:Connect(function()
        toggleCollapse()
    end)

    -- 2. Maximize / Window Size Button (Square Outline '▢')
    local maxBtn = make("TextButton", {
        Name = "MaxBtn",
        Text = "",
        AutoButtonColor = false,
        Size = UDim2.fromOffset(24, 22),
        BackgroundColor3 = Color3.fromRGB(36, 36, 40),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 51,
        Parent = controls,
    })
    corner(maxBtn, 4)

    local maxOutline = make("Frame", {
        Name = "Outline",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(10, 10),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 52,
        Parent = maxBtn,
    })
    local maxStroke = stroke(maxOutline, Color3.fromRGB(180, 180, 190), 1.2, 0)
    corner(maxOutline, 2)

    maxBtn.MouseEnter:Connect(function()
        tween(maxBtn, 0.15, { BackgroundTransparency = 0.25 })
        tween(maxStroke, 0.15, { Color = Color3.fromRGB(255, 255, 255) })
    end)
    maxBtn.MouseLeave:Connect(function()
        tween(maxBtn, 0.15, { BackgroundTransparency = 1 })
        tween(maxStroke, 0.15, { Color = Color3.fromRGB(180, 180, 190) })
    end)
    maxBtn.MouseButton1Click:Connect(function()
        if isCollapsed then
            expandWindow()
            return
        end
        isMaximized = not isMaximized
        if isMaximized then
            normalSize = shadow.Size
            tween(shadow, 0.2, { Size = UDim2.fromOffset(800, 520) }, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        else
            tween(shadow, 0.2, { Size = normalSize or UDim2.fromOffset(640, 440) }, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        end
    end)

    -- 3. Close Button ('✕')
    local closeBtn = make("TextButton", {
        Name = "CloseBtn",
        Text = "",
        AutoButtonColor = false,
        Size = UDim2.fromOffset(24, 22),
        BackgroundColor3 = Color3.fromRGB(220, 38, 38),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 51,
        Parent = controls,
    })
    corner(closeBtn, 4)

    local closeLabel = make("TextLabel", {
        Name = "Glyph",
        Text = "✕",
        Font = Enum.Font.GothamMedium,
        TextSize = 12,
        TextColor3 = Color3.fromRGB(180, 180, 190),
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        ZIndex = 52,
        Parent = closeBtn,
    })

    closeBtn.MouseEnter:Connect(function()
        tween(closeBtn, 0.15, { BackgroundTransparency = 0 })
        tween(closeLabel, 0.15, { TextColor3 = Color3.fromRGB(255, 255, 255) })
    end)
    closeBtn.MouseLeave:Connect(function()
        tween(closeBtn, 0.15, { BackgroundTransparency = 1 })
        tween(closeLabel, 0.15, { TextColor3 = Color3.fromRGB(180, 180, 190) })
    end)
    closeBtn.MouseButton1Click:Connect(function()
        confirmOverlay.BackgroundTransparency = 1
        confirmOverlay.Visible = true
        confirmModal.Size = UDim2.fromOffset(250, 125)
        tween(confirmOverlay, 0.20, { BackgroundTransparency = 0.60 })
        tween(confirmModal, 0.25, { Size = UDim2.fromOffset(320, 160) }, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    end)

    -- Left Sidebar (Compact 140px width matching Gatlify)
    local sidebarWidth = 140
    local sidebar = make("Frame", {
        Name = "Sidebar",
        Position = UDim2.new(0, 0, 0, 42),
        Size = UDim2.new(0, sidebarWidth, 1, -42),
        BackgroundColor3 = Color3.fromRGB(14, 14, 18),
        BackgroundTransparency = 0.24, -- Frosted acrylic sidebar
        BorderSizePixel = 0,
        ClipsDescendants = true,
        ZIndex = 5,
        Parent = root,
    })
    self.Sidebar = sidebar

    local sideDivider = make("Frame", {
        Name = "SideDivider",
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, 0, 0, 0),
        Size = UDim2.new(0, 1, 1, 0),
        BackgroundColor3 = self.Theme.StrokeSoft,
        BackgroundTransparency = 0.6,
        BorderSizePixel = 0,
        Parent = sidebar,
    })

    local tabContainer = make("ScrollingFrame", {
        Name = "TabContainer",
        Position = UDim2.fromOffset(0, 6),
        Size = UDim2.new(1, 0, 1, -12),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = self.Theme.Accent,
        ScrollBarImageTransparency = 0.6,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        ElasticBehavior = Enum.ElasticBehavior.Always,
        ScrollingEnabled = true,
        Active = true,
        Parent = sidebar,
    })
    padding(tabContainer, 8, 8, 8, 8)
    list(tabContainer, 4)

    function self:UserProfile(userProps: { [string]: any })
        return {
            SetUsername = function(_, name: string) end,
            SetBadge    = function(_, badge: string) end,
            SetTimeLeft = function(_, timeStr: string) end,
            SetAvatar   = function(_, id: number) end,
        }
    end

    -- Right Content Area
    local contentArea = make("Frame", {
        Name = "ContentArea",
        Position = UDim2.new(0, sidebarWidth, 0, 42),
        Size = UDim2.new(1, -sidebarWidth, 1, -42),
        BackgroundTransparency = 1,
        Parent = root,
    })

    local tabHeaderTitle = make("TextLabel", {
        Name = "TabHeaderTitle",
        Position = UDim2.new(0, 20, 0, 10),
        Size = UDim2.new(1, -40, 0, 32),
        Text = "Overview",
        Font = Enum.Font.GothamBold,
        TextSize = 24,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        BackgroundTransparency = 1,
        Parent = contentArea,
    })

    -- Collapse / Expand Implementation
    collapseWindow = function()
        if isCollapsed then return end
        isCollapsed = true
        if shadow.Size.Y.Offset > 100 then
            savedFullHeight = shadow.Size.Y.Offset
        end
        if minGlyphV then minGlyphV.Visible = true end
        resizeHandle.Visible = false
        contentArea.Visible = false
        sidebar.Visible = false
        topDivider.Visible = false
        unminimizeOverlay.Visible = true
        appTitleLabel.Text = appTitle .. "  •  Click to Unminimize"
        -- Setting shadow height to 58 ensures root height (shadow - 16) is exactly 42px matching topBar!
        tween(shadow, 0.2, { Size = UDim2.fromOffset(shadow.Size.X.Offset, 58) }, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    end

    expandWindow = function()
        if not isCollapsed then return end
        isCollapsed = false
        if minGlyphV then minGlyphV.Visible = false end
        unminimizeOverlay.Visible = false
        appTitleLabel.Text = appTitle
        local targetH = math.max(savedFullHeight, 400)
        local t = tween(shadow, 0.2, { Size = UDim2.fromOffset(shadow.Size.X.Offset, targetH) }, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        contentArea.Visible = true
        sidebar.Visible = true
        topDivider.Visible = true
        t.Completed:Connect(function()
            if not isCollapsed then
                resizeHandle.Visible = true
            end
        end)
    end

    toggleCollapse = function()
        if isCollapsed then
            expandWindow()
        else
            collapseWindow()
        end
    end

    unminimizeOverlay.MouseButton1Click:Connect(function()
        if isCollapsed then
            expandWindow()
        end
    end)

    local dragClickStart = nil
    topBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragClickStart = Vector2.new(input.Position.X, input.Position.Y)
        end
    end)
    topBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if isCollapsed and dragClickStart then
                local currentPos = Vector2.new(input.Position.X, input.Position.Y)
                local dist = (currentPos - dragClickStart).Magnitude
                if dist < 8 then
                    expandWindow()
                end
            end
            dragClickStart = nil
        end
    end)

    floatingOpenBtn.MouseButton1Click:Connect(function()
        animateOpen()
    end)

    local pages = make("Frame", {
        Name = "Pages",
        Position = UDim2.new(0, 20, 0, 44),
        Size = UDim2.new(1, -40, 1, -52),
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Parent = contentArea,
    })

    function self:SetTitle(newTitle: string)
        appTitle = newTitle
        if appTitleLabel then
            appTitleLabel.Text = newTitle
        end
    end

    function self:SetSubtitle(newSub: string) end
    self.SetSub = self.SetSubtitle

    function self:SetTheme(themeNameOrTable: any)
        self.Theme = resolveTheme(themeNameOrTable)
        if type(themeNameOrTable) == "string" then
            self.ThemeName = themeNameOrTable
        end

        root.BackgroundColor3 = self.Theme.Background
        sidebar.BackgroundColor3 = self.Theme.Sidebar
        if floatingOpenBtn then
            floatingOpenBtn.ImageColor3 = self.Theme.Accent
            local fStroke = floatingOpenBtn:FindFirstChild("UIStroke")
            if fStroke then
                fStroke.Color = self.Theme.Accent
            end
        end

        if self.SelectedTab then
            self:SelectTab(self.SelectedTab)
        end
    end

    function self:SelectTab(name: string)
        if tabHeaderTitle then
            tabHeaderTitle.Text = name
        end
        for tabName, tab in pairs(self.Tabs) do
            local selected = tabName == name
            
            if selected then
                tab.Page.Visible = true
                tab.Page.Position = UDim2.new(0, 6, 0, 0)
                tab.Page.BackgroundTransparency = 1
                tween(tab.Page, 0.18, { Position = UDim2.fromScale(0, 0) }, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
            else
                tab.Page.Visible = false
            end

            tween(tab.Button, 0.18, {
                BackgroundColor3 = selected and Color3.fromRGB(36, 36, 42) or self.Theme.Sidebar,
                BackgroundTransparency = selected and 0.25 or 1,
            })
            if tab.Indicator then
                tab.Indicator.Visible = selected
                tween(tab.Indicator, 0.18, {
                    BackgroundTransparency = selected and 0 or 1,
                    Size = selected and UDim2.fromOffset(3, 18) or UDim2.fromOffset(3, 0),
                    BackgroundColor3 = self.Theme.Accent,
                })
            end
            if tab.TitleLabel then
                tab.TitleLabel.Font = selected and Enum.Font.GothamBold or Enum.Font.GothamMedium
                tab.TitleLabel.TextColor3 = selected and Color3.fromRGB(255, 255, 255) or self.Theme.Muted
            end
            if tab.Icon then
                tab.Icon.ImageColor3 = selected and Color3.fromRGB(255, 255, 255) or self.Theme.Muted
            end
        end
        self.SelectedTab = name
    end

    function self:Tab(tabProps: { [string]: any })
        tabProps = tabProps or {}
        self.TabCount = (self.TabCount or 0) + 1
        local currentTabOrder = self.TabCount

        local name = tostring(tabProps.Title or ("Tab " .. tostring(currentTabOrder)))
        local tabIconAsset = normalizeAsset(tabProps.Icon or "Home")
        local hasTabIcon = tabIconAsset ~= ""

        local tabHeight = 36

        local tabButton = make("TextButton", {
            Name = "Tab_" .. name,
            Text = "",
            AutoButtonColor = false,
            Size = UDim2.new(1, 0, 0, tabHeight),
            BackgroundColor3 = self.Theme.Sidebar,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = currentTabOrder,
            Parent = tabContainer,
        })
        corner(tabButton, 6)

        local tabIndicator = make("Frame", {
            Name = "ActiveIndicator",
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.new(0, 4, 0.5, 0),
            Size = UDim2.fromOffset(3, 18),
            BackgroundColor3 = self.Theme.Accent,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Visible = false,
            Parent = tabButton,
        })
        corner(tabIndicator, 2)

        local tabIcon = createIcon(tabButton, tabIconAsset, 18, self.Theme.Muted, 0)
        tabIcon.AnchorPoint = Vector2.new(0, 0.5)
        tabIcon.Position = UDim2.new(0, 12, 0.5, 0)

        local titleLabel = make("TextLabel", {
            Name = "Title",
            Text = name,
            Font = Enum.Font.GothamMedium,
            TextSize = 14,
            TextColor3 = self.Theme.Muted,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
            TextTruncate = Enum.TextTruncate.AtEnd,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, hasTabIcon and 36 or 12, 0, 0),
            Size = UDim2.new(1, -(hasTabIcon and 40 or 16), 1, 0),
            Parent = tabButton,
        })

        local page = make("ScrollingFrame", {
            Name = "Page_" .. name,
            Size = UDim2.new(1, 0, 1, 0),
            Position = UDim2.fromOffset(0, 0),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            ScrollingDirection = Enum.ScrollingDirection.Y,
            ScrollBarThickness = 3,
            ScrollBarImageColor3 = self.Theme.Accent,
            ScrollBarImageTransparency = 0.5,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            ElasticBehavior = Enum.ElasticBehavior.Always,
            Visible = false,
            Active = true,
            Parent = pages,
        })
        padding(page, 4, 0, 20, 4)
        list(page, 8)

        local pageApi = createPageApi(self, page)
        pageApi.Name = name

        self.Tabs[name] = {
            Button      = tabButton,
            Indicator   = tabIndicator,
            TitleLabel  = titleLabel,
            Icon        = tabIcon,
            Page        = page,
            Api         = pageApi,
        }

        tabButton.MouseEnter:Connect(function()
            if self.SelectedTab ~= name then
                tween(tabButton, 0.15, {
                    BackgroundColor3 = Color3.fromRGB(28, 28, 32),
                    BackgroundTransparency = 0,
                })
                tween(tabIcon, 0.15, { ImageColor3 = Color3.fromRGB(200, 200, 210) })
                tween(titleLabel, 0.15, { TextColor3 = Color3.fromRGB(200, 200, 210) })
            end
        end)
        tabButton.MouseLeave:Connect(function()
            if self.SelectedTab ~= name then
                tween(tabButton, 0.15, {
                    BackgroundColor3 = self.Theme.Sidebar,
                    BackgroundTransparency = 1,
                })
                tween(tabIcon, 0.15, { ImageColor3 = self.Theme.Muted })
                tween(titleLabel, 0.15, { TextColor3 = self.Theme.Muted })
            end
        end)

        tabButton.MouseButton1Click:Connect(function()
            self:SelectTab(name)
        end)

        if not self.SelectedTab then
            self:SelectTab(name)
        end

        return pageApi
    end

    -- Screen-Level Left-Corner Glass Notification Toast (Outside Window)
    function self:Notify(toastProps: { [string]: any })
        toastProps = toastProps or {}
        local duration = tonumber(toastProps.Duration) or 3
        local notifTarget = self.NotificationContainer or self.ScreenGui

        local toastWrap = make("Frame", {
            Name = "ToastWrap",
            Size = UDim2.new(0, 310, 0, 72),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ClipsDescendants = false,
            Parent = notifTarget,
        })

        local toast = make("Frame", {
            Name = "ToastCard",
            Position = UDim2.new(0, -340, 0, 0),
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundColor3 = Color3.fromRGB(20, 20, 24),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ClipsDescendants = true,
            ZIndex = 502,
            Parent = toastWrap,
        })
        corner(toast, 10)
        stroke(toast, self.Theme.StrokeSoft, 1, 0.6)
        padding(toast, 14, 10, 14, 10)

        local accentLine = make("Frame", {
            Name = "AccentLine",
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.new(0, -10, 0.5, 0),
            Size = UDim2.new(0, 3, 0.65, 0),
            BackgroundColor3 = toastProps.Color or self.Theme.Accent,
            BorderSizePixel = 0,
            Parent = toast,
        })
        corner(accentLine, 2)

        local toastContent = make("Frame", {
            Name = "ToastContent",
            Size = UDim2.new(1, 0, 1, -6),
            BackgroundTransparency = 1,
            Parent = toast,
        })
        list(toastContent, 3)

        createText(toastContent, "ToastTitle", tostring(toastProps.Title or "Notification"), 15, toastProps.Color or self.Theme.Text, true, 1)
        createText(toastContent, "ToastDesc", tostring(toastProps.Desc or toastProps.Message or toastProps.Content or ""), 13, self.Theme.Muted, false, 2)

        local progBar = make("Frame", {
            Name = "ProgressBar",
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.new(0, -14, 1, 10),
            Size = UDim2.new(1, 28, 0, 2),
            BackgroundColor3 = toastProps.Color or self.Theme.Accent,
            BackgroundTransparency = 0.3,
            BorderSizePixel = 0,
            Parent = toast,
        })
        tween(progBar, duration, { Size = UDim2.new(0, 0, 0, 2) }, Enum.EasingStyle.Linear)

        -- Smooth slide-in entrance from left edge of screen
        tween(toast, 0.28, {
            Position = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 0.16,
        }, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

        task.delay(duration, function()
            if toast and toast.Parent then
                local outTween = tween(toast, 0.22, {
                    Position = UDim2.new(0, -340, 0, 0),
                    BackgroundTransparency = 1,
                }, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
                outTween.Completed:Connect(function()
                    if toastWrap and toastWrap.Parent then
                        toastWrap:Destroy()
                    end
                end)
            end
        end)
        return toastWrap
    end

    -- Modern Frosted Glass Modal Dialog / Confirmation Prompt
    function self:Dialog(props: { [string]: any })
        props = props or {}
        local title = tostring(props.Title or "Confirm Action")
        local content = tostring(props.Content or props.Desc or props.Text or "Are you sure you want to proceed?")
        local confirmText = tostring(props.ConfirmText or props.Confirm or "Confirm")
        local cancelText = tostring(props.CancelText or props.Cancel or "Cancel")
        local onConfirm = props.OnConfirm or function() end
        local onCancel = props.OnCancel or function() end
        local isDanger = props.Danger == true

        local overlay = make("TextButton", {
            Name = "DialogOverlay",
            Text = "",
            AutoButtonColor = false,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            ZIndex = 400,
            Active = true,
            Parent = root,
        })

        local cardWidth = math.min(380, math.max(root.AbsoluteSize.X - 32, 280))
        local card = make("Frame", {
            Name = "DialogCard",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(cardWidth, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = self.Theme.Surface,
            BackgroundTransparency = 0.12,
            BorderSizePixel = 0,
            ZIndex = 401,
            ClipsDescendants = true,
            Parent = overlay,
        })
        corner(card, 14)
        stroke(card, isDanger and self.Theme.Danger or self.Theme.Stroke, 1.5, 0.4)
        padding(card, 20, 18, 20, 18)
        list(card, 14)

        local headerWrap = make("Frame", {
            Name = "Header",
            Size = UDim2.new(1, 0, 0, 24),
            BackgroundTransparency = 1,
            ZIndex = 402,
            Parent = card,
        })
        local hList = list(headerWrap, 8, Enum.FillDirection.Horizontal)
        hList.VerticalAlignment = Enum.VerticalAlignment.Center

        local accentBar = make("Frame", {
            Name = "Bar",
            Size = UDim2.fromOffset(4, 18),
            BackgroundColor3 = isDanger and self.Theme.Danger or self.Theme.Accent,
            BorderSizePixel = 0,
            ZIndex = 402,
            Parent = headerWrap,
        })
        corner(accentBar, 2)

        make("TextLabel", {
            Name = "Title",
            Text = title,
            Font = Enum.Font.GothamBold,
            TextSize = 16,
            TextColor3 = isDanger and self.Theme.Danger or self.Theme.Accent,
            TextXAlignment = Enum.TextXAlignment.Left,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, -20, 1, 0),
            ZIndex = 402,
            Parent = headerWrap,
        })

        make("TextLabel", {
            Name = "Content",
            Text = content,
            Font = Enum.Font.GothamMedium,
            TextSize = 14,
            TextColor3 = self.Theme.Text,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
            TextWrapped = true,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            ZIndex = 402,
            Parent = card,
        })

        local actionsRow = make("Frame", {
            Name = "ActionsRow",
            Size = UDim2.new(1, 0, 0, 36),
            BackgroundTransparency = 1,
            ZIndex = 402,
            Parent = card,
        })
        local aList = list(actionsRow, 10, Enum.FillDirection.Horizontal)
        aList.HorizontalAlignment = Enum.HorizontalAlignment.Right

        local cancelBtn = make("TextButton", {
            Name = "CancelBtn",
            Text = cancelText,
            Font = Enum.Font.GothamBold,
            TextSize = 13,
            TextColor3 = self.Theme.Muted,
            AutoButtonColor = false,
            BackgroundColor3 = self.Theme.Sidebar,
            BackgroundTransparency = 0.35,
            BorderSizePixel = 0,
            Size = UDim2.fromOffset(100, 34),
            ZIndex = 403,
            Parent = actionsRow,
        })
        corner(cancelBtn, 8)
        stroke(cancelBtn, self.Theme.StrokeSoft, 1, 0.75)
        addRipple(cancelBtn, self.Theme.Text)

        local confirmBtn = make("TextButton", {
            Name = "ConfirmBtn",
            Text = confirmText,
            Font = Enum.Font.GothamBold,
            TextSize = 13,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AutoButtonColor = false,
            BackgroundColor3 = isDanger and self.Theme.Danger or self.Theme.Accent,
            BackgroundTransparency = 0.15,
            BorderSizePixel = 0,
            Size = UDim2.fromOffset(110, 34),
            ZIndex = 403,
            Parent = actionsRow,
        })
        corner(confirmBtn, 8)
        addRipple(confirmBtn, Color3.fromRGB(255, 255, 255))

        local closed = false
        local function dismiss(confirmed: boolean)
            if closed then return end
            closed = true
            tween(card, 0.18, { Position = UDim2.fromScale(0.5, 0.52), BackgroundTransparency = 1 }, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
            tween(overlay, 0.18, { BackgroundTransparency = 1 }, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
            task.delay(0.2, function()
                if overlay and overlay.Parent then overlay:Destroy() end
            end)
            if confirmed then
                task.spawn(onConfirm)
            else
                task.spawn(onCancel)
            end
        end

        confirmBtn.MouseButton1Click:Connect(function() dismiss(true) end)
        cancelBtn.MouseButton1Click:Connect(function() dismiss(false) end)

        card.Position = UDim2.fromScale(0.5, 0.48)
        tween(overlay, 0.22, { BackgroundTransparency = 0.55 }, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        tween(card, 0.22, { Position = UDim2.fromScale(0.5, 0.5) }, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

        local item = {}
        function item:Close() dismiss(false) end
        return item
    end
    self.Prompt = self.Dialog

    function self:SetVisible(val: boolean)
        if val then
            animateOpen()
        else
            animateClose(false)
        end
    end

    function self:Destroy()
        isAlive = false
        stopAnimation()
        pcall(function()
            screenGui:Destroy()
        end)
    end

    UserInputService.InputBegan:Connect(function(input, processed)
        if processed then return end
        if input.KeyCode == self.Keybind then
            toggleVisibility()
        end
    end)

    clampWindowPosition(shadow, uiScale)

    -- Smooth entrance animation on startup
    task.spawn(function()
        animateOpen()
        task.wait(0.05)
        if tabContainer and tabContainer.Parent then
            tabContainer.CanvasPosition = Vector2.new(0, 0)
        end
    end)

    return self
end

Library.CreateWindow = Library.Window

return Library
