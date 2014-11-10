_isOfficer = (_type == "CO")||(_type == "Officer");
_isSquadLeader = (_type == "SL")||(_type == "Squad Leader");
_isTeamLeader = (_type == "FTL")||(_type == "Team Leader");
_isRifleman = (_type == "rifleman")||(_type == "Rifleman");
_isRiflemanAT = (_type == "at")||(_type == "Rifleman (AT)");
_isMarksman = (_type == "marksman")||(_type == "Marksman");
_isAutorifleman = (_type == "mg")||(_type == "Autorifleman");
_isLifeSaver = (_type == "medic")||(_type == "Combat Life Saver");
_isGrenadier = (_type == "grenadier")||(_type == "Grenadier");

// ASSIGN LOADOUTS BASED ON FACTION ============================================

switch (toUpper(_faction)) do {
    
    case "BLUFOR": {
        #include "factions\us-vietnam.sqf"
    };
    
    case "REDFOR": {
        #include "factions\british70.sqf"
    };
    
    case "INDFOR": {
        #include "factions\us-vietnam.sqf"
    };

    case "default": {        
        #include "factions\default.sqf"
    };     
    
};