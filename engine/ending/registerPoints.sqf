if !(isServer) exitWith {};
if !(missionGameMode == "tvt") then {    
    waitUntil{ DAC_Basic_Value == 1 };
};

if ( isnil "pointsPlayerSide" ) then {pointsPlayerSide = 0}; publicVariable "pointsPlayerSide";
if ( isnil "pointsEnemySide" ) then {pointsEnemySide = 0}; publicVariable "pointsEnemySide";
if ( isnil "deathsWest" ) then {deathsWest = 0}; publicVariable "deathsWest";
if ( isnil "deathsEast" ) then {deathsEast = 0}; publicVariable "deathsEast";
if ( isnil "spawnBullets" ) then {spawnBullets = false}; publicVariable "spawnBullets";    
if ( isnil "deadPlayers" ) then {deadPlayers = ["Error: No unit"]}; publicVariable "deadPlayers";    

// add score to Player Side    
fnc_addPlayerSideScore = {
    Justkilled = name (_this select 0); publicVariable "Justkilled";
    _killer = _this select 1;
    if (JustKilled in deadPlayers) then {
    } else {
        pointsPlayerSide = pointsPlayerSide + 1; publicvariable "pointsPlayerSide";
        deadPlayers = deadPlayers + [justKilled]; publicVariable "deadPlayers";                             
    };
};  

// add score to Enemy Side
fnc_addEnemySideScore = {
    Justkilled = name (_this select 0); publicVariable "Justkilled";
    if (JustKilled in deadPlayers) then {
    } else {
        pointsEnemySide = pointsEnemySide + 1; publicvariable "pointsEnemySide";
        deadPlayers = deadPlayers + [justKilled]; publicVariable "deadPlayers";                        
    };        
};       
  
{
    if (side _x == missionPlayerSide) then {
        _x addMPEventHandler ["mpkilled",fnc_addEnemySideScore]; 
    };
    if (side _x == missionEnemySide) then {
        _x addMPEventHandler ["mpkilled",fnc_addPlayerSideScore];   
    };    
} foreach allUnits;