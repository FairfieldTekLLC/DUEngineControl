local json = require('dkjson')
screen.activate()


EngineStatus = {}
function EngineStatus:new ()
    data.verticalBoosters = false
    data.hoverEngines = false
    data.spaceXL = false
    data.spaceL = false
    data.atmoEngines = false
    end

function UpdateUI()
    screen.setScriptInput(nil)
    local payload = {
        v=EngineStatus.verticalBoosters,
        h=EngineStatus.hoverEngines,
        sx=EngineStatus.spaceXL,
        sl=EngineStatus.spaceL,
        a=EngineStatus.atmoEngines
        }

    
    local status, payload = pcall(json.encode, payload)
    if status then
        system.print(payload)
        screen.setScriptInput(payload)
    else
        system.print(status)
    end
    
end

handlers = {}
handlers['hov on'] = function() EngineStatus.hoverEngines = true end
handlers['hov off'] = function() EngineStatus.hoverEngines = false end
handlers['vert on'] = function() EngineStatus.verticalBoosters = true end
handlers['vert off'] = function() EngineStatus.verticalBoosters = false end
handlers['atmo on'] = function() EngineStatus.atmoEngines = true end
handlers['atmo off'] = function() EngineStatus.atmoEngines = false end
handlers['spcl on'] = function() EngineStatus.spaceL = true end
handlers['spcl off'] = function() EngineStatus.spaceL = false end
handlers['spcxl on'] = function() EngineStatus.spaceXL = true end
handlers['spcxl off'] = function() EngineStatus.spaceXL = false end



if (DataBank.getIntValue("EnableVert") == 0) then
    EngineStatus.verticalBoosters = false
else
    EngineStatus.verticalBoosters = true
end
if (DataBank.getIntValue("EnableHovers") == 0) then
    EngineStatus.hoverEngines = false
else
    EngineStatus.hoverEngines = true
end
if (DataBank.getIntValue("AuxSpaceEngine1") == 0) then
    EngineStatus.spaceXL = false
else
    EngineStatus.spaceXL = true
end
if (DataBank.getIntValue("AuxSpaceEngine2") == 0) then
    EngineStatus.spaceL = false
else
    EngineStatus.spaceL = true
end
if (DataBank.getIntValue("AuxAtmoEngine") == 0) then
    EngineStatus.atmoEngines = false
else
    EngineStatus.atmoEngines = true
end


UpdateUI()

unit.setTimer("loop", 1)



