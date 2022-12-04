------------------------------------
-- Toggle widget example
-- Usage:
--     Creates a toggle button style widget with a true or false state.
--
-- Init:
--     widget = Toggle(x, y, width, height, defaultState, label, font, onClick) -- onClick can be a function that is executed when the button is clicked.
-- Draw the slider:
--     widget:draw(layer)
-- Return the value of slider:
--     widget:getState()
--   or
--     widget.state
-- Set the state of the toggle:
--     widget:setState(boolean)
-- Switch the state of the toggle:
--     widget:switch() -- Also returns the new state of the widget
------------------------------------
local json = require('dkjson')
if not Toggle then
    -- Object definition: Lets start by creating a meta table with some properties
    local toggle = {}
    toggle.__index = toggle
    function Toggle(x, y, width, height, defaultState, label, font, tag, onClick)
        self = {}
        self.initialized = false
        self.tag = tag or ""
        self.x = x or 0
        self.y = y or 0
        self.h = height or 20
        self.w = width or 20
        self.state = defaultState or false
        self.label = label or ""
        self.onClick = onClick
        self.stateChange = false
        self.font = font or function() return loadFont("Montserrat", self.h * 4.5) end
        return setmetatable(self, toggle)
    end

    -- create a function that creates a new font if required, otherwise returns the font identifier from the properties
    local function getFont()
        local font = self.font
        if type(font) == "function" then
            font = self.font()
        end
        return font
    end

    -- draw method that draws the toggle on the screen unit
    function toggle:draw(layer)
        -- Collect cursor coordinates
        local cx, cy = getCursor()

        function handleToggle(tag, state)
            -- if (state) then
            --     logMessage(tag .. " On")
            -- else
            --     logMessage(tag .. " Off")
            -- end

            if (tag == self.tag) then
                self.state = state
            end
        end

        -- if (self.initializaed) then
        --     logMessage("initialized")
        -- else
        --     logMessage("Not Initialized")
        -- end
        
        if (not self.initializaed) then

            local input = getInput()
            if (#input == 0) then
            else
                local EngineStatus = json.decode(input)
                -- logMessage(input)
                handleToggle("hov", EngineStatus.h)
                handleToggle("vert", EngineStatus.v)
                handleToggle("atmo", EngineStatus.a)
                handleToggle("spcl", EngineStatus.sl)
                handleToggle("spcxl", EngineStatus.sx)
                self.initializaed = true
                logMessage("initialized")
            end
        end
        -- check if the mouse is over the button
        if cx >= self.x and cx <= self.x + self.w and cy >= self.y and cy <= self.y + self.h then

            -- handle the click action
            if getCursorReleased() then
                self.state = not self.state
                if (self.state) then
                    setOutput(self.tag .. " on")
                else
                    setOutput(self.tag .. " off")
                end
                if self.onClick ~= nil then
                    self.onClick()
                end
            end
            -- set the mouseover colors
  if self.state and getCursorDown() then
                setNextFillColor(layer, 1, 0.6, 0.8, 1)
            elseif getCursorDown() then
                setNextFillColor(layer, 0.6, 1, 0.8, 1)
            elseif self.state then
                setNextFillColor(layer, 1, 0.2, 0.2, 1)
            else
                setNextFillColor(layer, 0.2, 0.8, 0.2, 1)
            end

        elseif self.state then
            -- set color if toggle is true
            setNextFillColor(layer, 0, 1, 0, 1)
        else
            -- set color if toggle is false
            setNextFillColor(layer, 1, 0, 0, 1)
        end
        -- draw the button toggle
        local w, h = self:getBounds()
        addBox(layer, self.x, self.y + (h / 2 - self.h / 2), self.w, self.h)
        setNextTextAlign(layer, AlignH_Left, AlignV_Middle)
        addText(layer, getFont(), self.label, self.x + self.w + (self.w / 5), self.y + (h / 2))
    end

    -- simple example helper method that returns the current state of the toggle
    function toggle:getState()
        return self.state
    end

    -- simple example helper method that sets the state of the toggle
    function toggle:setState(newState)
        if type(newState) == "boolean" then
            self.state = newState
        end
    end

    -- simple example helper method that changes and returns the new state of the toggle
    function toggle:switch()
        self.state = not self.state
        --self.stateChange = true;
        return self.state
    end

    -- helper method that returns the width and height of toggle
    function toggle:getBounds()
        local tx, ty = getTextBounds(getFont(), self.label)
        return self.x + self.w + (self.w / 5) + tx, math.max(self.h, ty)
    end
end


----------------------------------------------------
-- Display
----------------------------------------------------

-- Collect the screen resolution for positioning
local rx, ry = getResolution()

-- Create a layer to draw the toggles
local exampleLayer = createLayer()

-- Create a font for all the toggles
local font = loadFont("Montserrat", 50)

-- Run this portion only once on screen startup, this creates the toggle objects
if not init then
    init     = true
    auxAtmo  = Toggle(rx / 7, ry / 6 - rx / 40, rx / 20, rx / 20, false, "Auxillary Atmospheric Engines", font, "atmo")
    auxHov   = Toggle(rx / 7, ry / 6 * 2 - rx / 40, rx / 20, rx / 20, false, "Auxillary Hover Engines", font, "hov")
    auxVert  = Toggle(rx / 7, ry / 6 * 3 - rx / 40, rx / 20, rx / 20, false, "Auxillary Vertical Engines", font, "vert")
    auxSpcL  = Toggle(rx / 7, ry / 6 * 4 - rx / 40, rx / 20, rx / 20, false, "Auxillary Space Engine L", font, "spcl")
    auxSpcXL = Toggle(rx / 7, ry / 6 * 5 - rx / 40, rx / 20, rx / 20, false, "Auxillary Space Engine XL", font, "spcxl")
end

-- for toggle, make the toggle next to it always the opposite and then draw the toggle
auxAtmo:draw(exampleLayer)
auxHov:draw(exampleLayer)
auxVert:draw(exampleLayer)
auxSpcL:draw(exampleLayer)
auxSpcXL:draw(exampleLayer)

-- render cost profiler
if false then
    local layer = createLayer()
    local font = loadFont('Play-Bold', 14)
    setNextFillColor(layer, 1, 1, 1, 1)
    addText(layer, font, string.format('render cost : %d / %d', getRenderCost(), getRenderCostMax()), 8, 16)

end

-- Refresh the screen
requestAnimationFrame(1)

