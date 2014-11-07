private ["_player","_loadout","_index","_ct","_vehvalue","_posvalue","_headgear","_goggles","_uniformitems","_vestitems","_backpackitems","_uniform","_vest","_backpack","_items","_primwep","_primwepmag","_secwep","_secwepmag","_handwep","_handwepmag","_primweaponatt","_secweaponatt","_agmBLOODindex","_agmBLEEDINGindex","_agmPAINKILLERindex","_agmPAINindex","_agmINPAINindex","_agmUNCONindex","_getPos","_getVeh","_i","_uniformtoAdd","_assignIndex"];

_player = _this select 0;
_loadout = _this select 1;

_player enableSimulation false;

_ct = 0;

_vehvalue = _ct; _ct = _ct+1;
_posvalue = _ct; _ct = _ct+1;

_headgear = _ct; _ct = _ct+1;
_goggles = _ct; _ct = _ct+1;   

_uniformitems = _ct; _ct = _ct+1;
_vestitems = _ct; _ct = _ct+1;
_backpackitems = _ct; _ct = _ct+1;            

_uniform = _ct; _ct = _ct+1;
_vest = _ct; _ct = _ct+1;
_backpack = _ct; _ct = _ct+1;           

_items = _ct; _ct = _ct+1;

_primwep = _ct; _ct = _ct+1;
_primwepmag = _ct; _ct = _ct+1;
_secwep = _ct; _ct = _ct+1;
_secwepmag = _ct; _ct = _ct+1;
_handwep = _ct; _ct = _ct+1;
_handwepmag = _ct; _ct = _ct+1;

_primweaponatt = _ct; _ct = _ct+1;
_secweaponatt = _ct; _ct = _ct+1;

_agmBLOODindex = _ct; _ct = _ct+1;
_agmBLEEDINGindex = _ct; _ct = _ct+1;
_agmPAINKILLERindex = _ct; _ct = _ct+1;
_agmPAINindex = _ct; _ct = _ct+1;
_agmINPAINindex = _ct; _ct = _ct+1;
_agmUNCONindex = _ct; _ct = _ct+1;

_getPos = ((_loadout) select _posvalue);
_getVeh = ((_loadout) select _vehvalue);

diag_log format ["** VEHICLE: %1 | LAST VEHICLE: %2 **",(vehicle _player), _getVeh];            
diag_log "== TELEPORTING PLAYER LAST POSITION ==================================";  
if ((vehicle _player) == (_getVeh)) then {
    _player setPosATL _getPos; 
} else {
    if ( damage _getVeh < 0.9 ) then {
        _getVeh enableSimulation false;
        _getVeh engineOn true;                              
        diag_log "== TELEPORTING PLAYER TO VEHICLE =====================================";
        switch(true) do {
            case (_getVeh emptyPositions "driver" > 0) : { _player moveinDriver _getVeh };
            case (_getVeh emptyPositions "commander" > 0) : { _player moveinCommander _getVeh };
            case (_getVeh emptyPositions "gunner" > 0) : { _player moveinGunner _getVeh };
            case (_getVeh emptyPositions "cargo" > 0) : { _player moveinCargo _getVeh };
            case (_getVeh emptyPositions "cargo" == 0) : { _player setPosATL _getPos };
        };
        sleep 2;
        _getVeh enableSimulation true;
    };
};

diag_log "== ASSIGNING WEAPONS =================================================";
clearWeaponCargo _player;

diag_log "== PRIMARY WEAPON =============================================";
if !((_loadout select _primwep) == "") then {
    _player addWeapon (_loadout select _primwep) };

diag_log "== SECONDARY WEAPON ===========================================";
if !((_loadout select _secwep) == "") then { 
    _player addWeapon (_loadout select _secwep)};

diag_log "== HANDGUN WEAPON =============================================";
if !((_loadout select _handwep) == "") then {
    _player addWeapon (_loadout select _handwep) };

diag_log "== ASSIGNING PRIMARY WEAPON ITEMS ====================================";
if (count(_loadout select _primweaponatt) > 0) then {
for "_i" from 0 to count((_loadout) select _primweaponatt) do {
    _player addPrimaryWeaponItem ((_loadout select _primweaponatt) select _i);
}};

diag_log "== ASSIGNING HANDGUN WEAPON ITEMS ====================================";
if (count(_loadout select _secweaponatt) > 0) then {
for "_i" from 0 to count((_loadout) select _secweaponatt) do {
    _player addHandgunItem ((_loadout select _secweaponatt) select _i);
}};            

diag_log "== ASSIGNING UNIFORM =================================================";
if ((_loadout select _uniform) != "") then {
_uniformtoAdd = (_loadout select _uniform);
[[{}, _player addUniform _uniformtoAdd], "BIS_fnc_spawn", true] call BIS_fnc_MP};

diag_log "== ASSIGNING VEST ====================================================";
if ((_loadout select _vest) != "") then {
_player addVest (_loadout select _vest)};

diag_log "== ASSIGNING BACKPACK ================================================";
if ((_loadout select _backpack) != "") then {
_player addbackpack (_loadout select _backpack)};

diag_log "== ASSIGNING ITEMS ===================================================";
if !(count(_loadout select _items) == 0) then {
for "_i" from 0 to count((_loadout) select _items)-1 do {
    _assignIndex = ((_loadout select _items) select _i);
    if !(_assignIndex == "<null>") then {
    if ((_assignIndex == "Binocular") || (_assignIndex == "Rangefinder") || (_assignIndex == "Laserdesignator")) then {
    _player addWeapon ((_loadout select _items) select _i) } else {
    _player addItem ((_loadout select _items) select _i);
    _player assignItem ((_loadout select _items) select _i)}};
}};

diag_log "== ASSIGNING HEADGEAR ================================================";
_player addHeadgear (_loadout select _headgear);
_player addGoggles (_loadout select _goggles); 

diag_log "== ADDING AMMUNITION =================================================";                
if (count(_loadout select _primwepmag) > 0) then {
    _player addMagazine ((_loadout select _primwepmag) select 0)};

if (count(_loadout select _secwepmag) > 0) then {
    _player addMagazine (_loadout select _secwepmag) select 0 }; 

if (count(_loadout select _handwepmag) > 0) then {
    _player addMagazine (_loadout select _handwepmag) select 0 };   

diag_log "== ASSIGNING UNIFORM ITEMS ===========================================";
if !(count(_loadout select _uniformitems) == 0) then {
for "_i" from 0 to count((_loadout) select _uniformitems) do {
    _player addItemToUniform ((_loadout select _uniformitems) select _i);
}};

diag_log "== ASSIGNING VEST ITEMS ==============================================";            
if !(count(_loadout select _vestitems) == 0) then {
for "_i" from 0 to count((_loadout) select _vestitems) do {
    _player addItemToVest (((_loadout select _vestitems) select _i));
}};

diag_log "== ASSIGNING BACKPACK ITEMS ==========================================";
clearAllItemsFromBackpack _player;
if !(count(_loadout select _backpackitems) == 0) then {
for "_i" from 0 to count((_loadout) select _backpackitems) do {
    _player addItemToBackpack ((_loadout select _backpackitems) select _i);
}};                

diag_log "== AGM MEDICAL =======================================================";

_player setVariable ["AGM_Blood",(_loadout select _agmBLOODindex),true];
_player setVariable ["AGM_Bleeding",(_loadout select _agmBLEEDINGindex),true];
_player setVariable ["AGM_Painkiller",(_loadout select _agmPAINKILLERindex),true];
_player setVariable ["AGM_Pain",(_loadout select _agmPAINindex),true];
_player setVariable ["AGM_InPain",(_loadout select _agmINPAINindex), true];
_player setVariable ["AGM_Unconscious",(_loadout select _agmUNCONindex),true];

diag_log format ["=========== GEAR ASSIGNED: %1",(_loadout)];

_player enableSimulation true;