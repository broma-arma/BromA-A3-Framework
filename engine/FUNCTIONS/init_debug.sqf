// =============================================================================
//          Inits a couple of variables for single player testing.             |
// =============================================================================
if ((isServer)&&(!isMultiplayer)) then {
    DAC_Com_Values = [0,0,0];
    DAC_AI_Level = 4; publicVariable "DAC_AI_Level"; 
    f_var_init = 0; publicVariable "f_var_init";
    allowedTP = "everyone"; publicVariable "allowedTP";    
    MissionSetup = 10; publicVariable "MissionSetup";
    CasualtyCapParam = 100; publicVariable "CasualtyCapParam";
    CivilianCap = 9999; publicVariable "CivilianCap";  
    enableRespawnParam = true; publicVariable "enableRespawnParam";
    initialPlayerLives = 5; publicVariable "initialPlayerLives";
    
    endMissionTrg = createTrigger["EmptyDetector",[0,0]]; 
    endMissionTrg setTriggerText "[End mission]";
    endMissionTrg setTriggerActivation["ALPHA","PRESENT",true];
    endMissionTrg setTriggerStatements["this", "myEnd = [1] execVM '"+ENGINE_PATH+"f\server\f_mpEndBroadcast.sqf'", ""];        
    
    // Stops the AI and saves you frames.
    stopAI = createTrigger["EmptyDetector",[0,0]]; 
    stopAI setTriggerText "[Disable the AI]";
    stopAI setTriggerActivation["JULIET","PRESENT",true];
    stopAI setTriggerStatements["this", "{ _x stop true } forEach allUnits", ""];    
    
    DAC_Marker = 7;
    DAC_Fast_Init = true;
    DAC_Com_Values = [1,2,0];
    player allowDamage false;     
};       
    paramLoad = false;
    
if (isMultiplayer) then { DAC_Com_Values = [0,0,0] };