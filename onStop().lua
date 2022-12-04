unit.stopTimer("loop")

if (EngineStatus.verticalBoosters) then
    DataBank.setIntValue("EnableVert",1)
else
    DataBank.setIntValue("EnableVert",0)   
end
if (EngineStatus.EnableHovers) then
    DataBank.setIntValue("EnableHovers",1) 
else
    DataBank.setIntValue("EnableHovers",0) 
end

if (EngineStatus.spaceXL) then
    DataBank.setIntValue("AuxSpaceEngine1",1) 
else
    DataBank.setIntValue("AuxSpaceEngine1",0) 
end

if (EngineStatus.spaceL) then
    DataBank.setIntValue("AuxSpaceEngine2",1)
else
    DataBank.setIntValue("AuxSpaceEngine2",0) 
end

if (EngineStatus.atmoEngines) then
    DataBank.setIntValue("AuxAtmoEngine",1)
else
    DataBank.setIntValue("AuxAtmoEngine",0) 
end