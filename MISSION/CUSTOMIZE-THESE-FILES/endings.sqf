switch (victoryReason) do {

// =============================================================================
//   NOTE:
//   "color" refers to the color of the victoryReason2 variable, aka the
//   mission end title.
//
//   valid colors are: "blue","red","green","white","black" and "yellow".
//   declare more colors@"broma\procColor.sqf".
// =============================================================================

// =============================================================================
//                       GENERIC MISSION OVER SCREEN                           |
// =============================================================================    
case 1:
    {           
        victoryReason2 = "A TEAM IS NOT COMBAT EFFECTIVE";        
        
        // If the mission isn't a TVT, we need to declare who won.
        if !(missionGameMode == "tvt") then {
            margin = format["%1 FAILURE", playerFactionName];            
            color = "red";
        };
    };

// ============================================================================= 
//                  MISSION OVER - CUSTOMIZE AS YOU WISH                       |
// =============================================================================    
case 2:
    {
        
        victoryReason2 = "SOMETHING HAPPENED";
        color = "white";
        
        margin = "AND YET NOTHING HAPPENS";
        
    }; 
        
// =============================================================================         
//                     COMPLETED ALL MAIN OBJECTIVES                           |
// =============================================================================    
case 3:
    {                
        
        victoryReason2 = "OBJECTIVES COMPLETED";
        color = "green";
        
        margin = format["DECISIVE %1 VICTORY", playerFactionName];
        
        // Succeeded on not killing the civilians.
        if (CivilianCap < 9990) then { ["civCapTask", "succeeded"] call SHK_Taskmaster_upd }; 
        
    };            
// =============================================================================  
//                      FAILED AN IMPORTANT OBJECTIVE                          |
// =============================================================================    
case 4:
    {                
        
        victoryReason2 = "OBJECTIVE FAILED";
        color = "red";
        
        margin = format["%1 FAILURE", playerFactionName];
        
    };    
        
// ============================================================================= 
//                      KILLED TOO MANY CIVILIANS                              |
// =============================================================================    
case 5:
    {
        
        // If the Civilian Cap parameter was enabled, the task has failed.
        if (CivilianCap < 9990) then { ["civCapTask", "failed"] call SHK_Taskmaster_upd };
        
        victoryReason2 = "UNACCEPTABLE CIVILIAN CASUALTIES";
        color = "red";
        
        margin = format["%1 FAILURE", playerFactionName];
        
    }; 
        
// =============================================================================         
//                              TIME OVER                                      |
// =============================================================================    
case 6:
    {
        
        victoryReason2 = "TIME LIMIT REACHED";        
        
        if !(missionGameMode == "tvt") then {
            margin = format["%1 FAILURE", playerFactionName];
            color = "red";
        };
        
    };        
        
};
// =============================================================================

publicvariable "victoryReason2";
publicvariable "margin";
[] call FNC_process_color;