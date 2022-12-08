local output = screen.getScriptOutput()

if #output > 0 then
    screen.clearScriptOutput()
    if handlers[output] then
        handlers[output]()
    end
end 

if (player.isSeated() == 1) then
    if (EngineStatus.verticalBoosters) then
        newtons = SampleVertEngine.getThrust()
        unit.setEngineThrust("AuxVertEngine", newtons)
        DataBank.setIntValue("EnableVert",1)
    else
        unit.setEngineThrust("AuxVertEngine", 0)
        DataBank.setIntValue("EnableVert",0)   
    end

    if (EngineStatus.hoverEngines) then
        newtons = SampleHoverEngine.getThrust()
        unit.setEngineThrust("AuxHov", newtons)
        DataBank.setIntValue("EnableHovers",1) 
    else
        unit.setEngineThrust("AuxHov", 0)
        DataBank.setIntValue("EnableHovers",0) 
    end

    if (EngineStatus.spaceXL) then
        newtons = SampleSpaceEngine.getThrust();
        unit.setEngineThrust("AuxSpaceEngine1", newtons);
        DataBank.setIntValue("AuxSpaceEngine1",1) 
    else
        unit.setEngineThrust("AuxSpaceEngine1", 0)
        DataBank.setIntValue("AuxSpaceEngine1", 0) 
    end


    if (EngineStatus.spaceL) then
        newtons = SampleSpaceEngine.getThrust();
        unit.setEngineThrust("AuxSpaceEngine2", newtons);
        DataBank.setIntValue("AuxSpaceEngine2",1)
    else
        unit.setEngineThrust("AuxSpaceEngine2", 0)
        DataBank.setIntValue("AuxSpaceEngine2", 0)
    end

    if (EngineStatus.atmoEngines) then
        newtons = SampleAtmoEngine.getThrust()
        unit.setEngineThrust("AuxAtmoEngine", newtons)
        DataBank.setIntValue("AuxAtmoEngine", 1)
    else
        unit.setEngineThrust("AuxAtmoEngine", 0)
        DataBank.setIntValue("AuxAtmoEngine", 0)
    end
end

