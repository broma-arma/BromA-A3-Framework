// THIS SCRIPT IS ONLY USED FOR SINGLEPLAYER TESTING.

if !(isDedicated) then {
    waitUntil { !isNull player }; 
    waitUntil{ time > 1};       

    _gearInit = player getVariable "initUnit";

    _groupColor = _gearInit select 0;
    _faction = _gearInit select 1;
    _role = _gearInit select 2;

    player assignTeam _groupColor;            

    [_role,player,_faction] call FNC_assignFactionGear;
};