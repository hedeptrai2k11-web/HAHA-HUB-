-- HAHA HUB MOBILE - UI STARTER
-- For Roblox Studio, in a game you own.
-- Place this LocalScript in StarterPlayer > StarterPlayerScripts.
-- UI only: no Blox Fruits automation or executor-specific APIs.

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local oldGui = playerGui:FindFirstChild("HAHA_HUB")
if oldGui then oldGui:Destroy() end

local C = {
    bg = Color3.fromRGB(13, 11, 20),
    panel = Color3.fromRGB(24, 19, 36),
    panel2 = Color3.fromRGB(33, 25, 48),
    cyan = Color3.fromRGB(67, 220, 255),
    purple = Color3.fromRGB(158, 90, 255),
    white = Color3.fromRGB(240, 238, 255),
    muted = Color3.fromRGB(172, 166, 193),
    red = Color3.fromRGB(190, 38, 67),
    green = Color3.fromRGB(75, 210, 145),
}

local function make(className, props, parent)
    local obj = Instance.new(className)
    for k, v in pairs(props) do obj[k] = v end
    obj.Parent = parent
    return obj
end

local gui = make("ScreenGui", {
    Name = "HAHA_HUB",
    ResetOnSpawn = false,
    IgnoreGuiInset = false,
    DisplayOrder = 100,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
}, playerGui)

local panel = make("Frame", {
    Name = "MainPanel",
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.new(0.88, 0, 0.68, 0),
    BackgroundColor3 = C.bg,
    BackgroundTransparency = 0.08,
    BorderSizePixel = 0,
}, gui)
make("UICorner", {CornerRadius = UDim.new(0, 12)}, panel)
make("UIStroke", {Color = C.purple, Thickness = 1.5}, panel)
make("UISizeConstraint", {
    MinSize = Vector2.new(280, 320),
    MaxSize = Vector2.new(500, 600),
}, panel)

local header = make("Frame", {
    Name = "Header",
    Size = UDim2.new(1, 0, 0, 44),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, panel)
make("UICorner", {CornerRadius = UDim.new(0, 12)}, header)

make("TextLabel", {
    Name = "Title",
    Position = UDim2.new(0, 12, 0, 0),
    Size = UDim2.new(1, -110, 1, 0),
    BackgroundTransparency = 1,
    Text = "⚡ HAHA HUB",
    Font = Enum.Font.GothamBold,
    TextSize = 18,
    TextXAlignment = Enum.TextXAlignment.Left,
    TextColor3 = C.cyan,
}, header)

local minimize = make("TextButton", {
    Name = "Minimize",
    AnchorPoint = Vector2.new(1, 0.5),
    Position = UDim2.new(1, -8, 0.5, 0),
    Size = UDim2.fromOffset(34, 30),
    BackgroundColor3 = C.panel2,
    BorderSizePixel = 0,
    Text = "−",
    Font = Enum.Font.GothamBold,
    TextSize = 23,
    TextColor3 = C.white,
}, header)
make("UICorner", {CornerRadius = UDim.new(0, 7)}, minimize)

local stopButton = make("TextButton", {
    Name = "StopButton",
    Position = UDim2.new(0, 9, 0, 52),
    Size = UDim2.new(1, -18, 0, 37),
    BackgroundColor3 = C.red,
    BorderSizePixel = 0,
    Text = "■  STOP NGAY",
    Font = Enum.Font.GothamBold,
    TextSize = 14,
    TextColor3 = C.white,
}, panel)
make("UICorner", {CornerRadius = UDim.new(0, 8)}, stopButton)

local tabNames = {
    "Trang chủ", "Kiếm", "Súng", "Võ",
    "Farm & Quest", "Boss Auto", "Sea Event",
    "Islands & Items", "Hop Server",
    "Movement Guard", "Performance",
}

local tabList = make("ScrollingFrame", {
    Name = "TabList",
    Position = UDim2.new(0, 9, 0, 98),
    Size = UDim2.new(0.41, -6, 1, -108),
    BackgroundColor3 = C.panel,
    BackgroundTransparency = 0.1,
    BorderSizePixel = 0,
    ScrollBarThickness = 3,
    ScrollBarImageColor3 = C.cyan,
    CanvasSize = UDim2.new(0, 0, 0, #tabNames * 39),
}, panel)
make("UICorner", {CornerRadius = UDim.new(0, 8)}, tabList)
make("UIPadding", {
    PaddingTop = UDim.new(0, 5),
    PaddingLeft = UDim.new(0, 4),
    PaddingRight = UDim.new(0, 4),
}, tabList)
make("UIListLayout", {
    Padding = UDim.new(0, 4),
    SortOrder = Enum.SortOrder.LayoutOrder,
}, tabList)

local content = make("ScrollingFrame", {
    Name = "Content",
    Position = UDim2.new(0.41, 6, 0, 98),
    Size = UDim2.new(0.59, -15, 1, -108),
    BackgroundColor3 = C.panel,
    BackgroundTransparency = 0.1,
    BorderSizePixel = 0,
    ScrollBarThickness = 3,
    ScrollBarImageColor3 = C.purple,
    CanvasSize = UDim2.new(0, 0, 0, 250),
}, panel)
make("UICorner", {CornerRadius = UDim.new(0, 8)} , content)
make("UIPadding", {
    PaddingTop = UDim.new(0, 7),
    PaddingLeft = UDim.new(0, 7),
    PaddingRight = UDim.new(0, 7),
    PaddingBottom = UDim.new(0, 7),
}, content)
local contentLayout = make("UIListLayout", {
    Padding = UDim.new(0, 7),
    SortOrder = Enum.SortOrder.LayoutOrder,
}, content)

local status = make("TextLabel", {
    Name = "Status",
    Size = UDim2.new(1, 0, 0, 48),
    BackgroundTransparency = 1,
    Text = "Trạng thái: Sẵn sàng",
    TextWrapped = true,
    Font = Enum.Font.Gotham,
    TextSize = 12,
    TextColor3 = C.muted,
    LayoutOrder = 0,
}, content)

local description = make("TextLabel", {
    Name = "Description",
    Size = UDim2.new(1, 0, 0, 92),
    BackgroundColor3 = C.panel2,
    BackgroundTransparency = 0.1,
    BorderSizePixel = 0,
    Text = "Chọn một tab ở bên trái.\n\nĐây là giao diện theo dõi; chưa kết nối tác vụ tự động.",
    TextWrapped = true,
    Font = Enum.Font.Gotham,
    TextSize = 12,
    TextColor3 = C.white,
    LayoutOrder = 1,
}, content)
make("UICorner", {CornerRadius = UDim.new(0, 8)}, description)

local tabDescriptions = {
    ["Trang chủ"] = "Trạng thái hub\nChọn tab để xem chức năng và tiến độ.",
    ["Kiếm"] = "CDK, TTK, Yama, Tushita, Shark Anchor và các kiếm khác.\nTracker điều kiện và nguyên liệu.",
    ["Súng"] = "Soul Guitar, Dragonstorm, Serpent Bow và các súng khác.\nTracker điều kiện và mastery.",
    ["Võ"] = "Godhuman, Sanguine Art, Dragon Talon, Electric Claw và các võ khác.",
    ["Farm & Quest"] = "Theo dõi level, quest, mastery, nguyên liệu, Dojo, Draco, Race và Raid.",
    ["Boss Auto"] = "Theo dõi điều kiện triệu hồi, trạng thái boss và kết quả nhiệm vụ.",
    ["Sea Event"] = "Theo dõi Sea Beast, Terrorshark, Leviathan và các sự kiện biển.",
    ["Islands & Items"] = "Theo dõi Mirage, Kitsune, Prehistoric Island, Blue Gear và vật phẩm hiếm.",
    ["Hop Server"] = "Giao diện chọn Sea 1 / Sea 2 / Sea 3 và ghi chú server.",
    ["Movement Guard"] = "Không có mục tiêu thì không di chuyển.\nMất mục tiêu hoặc lỗi đường đi: dừng và báo trạng thái.",
    ["Performance"] = "Giao diện tối giản, hạn chế hiệu ứng trang trí để giảm tải.",
}

local function clearStatusExtra()
    for _, child in ipairs(content:GetChildren()) do
        if child:IsA("TextButton") and child.Name == "OptionButton" then
            child:Destroy()
        end
    end
end

local function addOption(text, order)
    local b = make("TextButton", {
        Name = "OptionButton",
        Size = UDim2.new(1, 0, 0, 36),
        BackgroundColor3 = C.panel2,
        BorderSizePixel = 0,
        Text = text,
        TextWrapped = true,
        Font = Enum.Font.GothamSemibold,
        TextSize = 11,
        TextColor3 = C.white,
        LayoutOrder = order,
    }, content)
    make("UICorner", {CornerRadius = UDim.new(0, 7)}, b)
    b.Activated:Connect(function()
        status.Text = "Đã chọn: " .. text
    end)
end

local function showTab(tabName)
    clearStatusExtra()
    status.Text = "HAHA HUB  •  " .. tabName
    description.Text = tabDescriptions[tabName] or "Theo dõi trạng thái và tiến độ."
    if tabName == "Movement Guard" then
        addOption("Chỉ đi đến mục tiêu đã chọn", 2)
        addOption("Dừng khi hoàn thành / mất mục tiêu", 3)
        addOption("Kiểm tra đường đi và vật cản", 4)
        addOption("Giữ nguyên vũ khí đã chọn", 5)
    elseif tabName == "Boss Auto" then
        addOption("Katakuri / Dough King — tracker", 2)
        addOption("Rip_indra — tracker", 3)
        addOption("Soul Reaper — tracker", 4)
        addOption("Darkbeard / Greybeard — tracker", 5)
    elseif tabName == "Hop Server" then
        addOption("Chọn Sea 1", 2)
        addOption("Chọn Sea 2", 3)
        addOption("Chọn Sea 3", 4)
        addOption("Không quay lại server cũ — thiết lập UI", 5)
    end
    task.defer(function()
        content.CanvasSize = UDim2.new(0, 0, 0, contentLayout.AbsoluteContentSize.Y + 14)
    end)
end

for i, name in ipairs(tabNames) do
    local b = make("TextButton", {
        Name = "Tab" .. i,
        Size = UDim2.new(1, 0, 0, 35),
        BackgroundColor3 = C.panel2,
        BorderSizePixel = 0,
        Text = name,
        TextWrapped = true,
        Font = Enum.Font.GothamSemibold,
        TextSize = 11,
        TextColor3 = C.white,
        LayoutOrder = i,
    }, tabList)
    make("UICorner", {CornerRadius = UDim.new(0, 7)}, b)
    b.Activated:Connect(function()
        showTab(name)
    end)
end

local mini = make("TextButton", {
    Name = "HAHA_Mini",
    AnchorPoint = Vector2.new(0, 0.5),
    Position = UDim2.new(0, 12, 0.42, 0),
    Size = UDim2.fromOffset(54, 54),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    Text = "HAHA",
    Font = Enum.Font.GothamBold,
    TextSize = 12,
    TextColor3 = C.cyan,
    Visible = false,
    Active = true,
    Draggable = false,
}, gui)
make("UICorner", {CornerRadius = UDim.new(1, 0)}, mini)
make("UIStroke", {Color = C.purple, Thickness = 2}, mini)

-- Drag the floating button with touch or mouse.
local dragging = false
local dragStart, startPos
mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mini.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - dragStart
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

minimize.Activated:Connect(function()
    panel.Visible = false
    mini.Visible = true
end)

mini.Activated:Connect(function()
    panel.Visible = true
    mini.Visible = false
end)

local stopped = false
stopButton.Activated:Connect(function()
    stopped = true
    status.Text = "TRẠNG THÁI: ĐÃ DỪNG"
    description.Text = "Không có tác vụ tự động nào được kết nối trong bản UI này."
end)

showTab("Trang chủ")
