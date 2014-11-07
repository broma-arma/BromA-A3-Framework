_puid = _this select 0;
_name = _this select 1;

_player = objNull;

{     
    if ((name (_x) == _name)||(getplayeruid (_x)==_puid)) exitWith { _player = _x };
} forEach playableUnits;

waitUntil{!(isNull _player)};

if !(isDedicated) then {
    if ((alive _player)&&(local _player)) then {

        _gearInit = _player getVariable "initUnit";

        _groupColor = _gearInit select 0;
        _faction = _gearInit select 1;
        _role = _gearInit select 2;

        _player assignTeam _groupColor;

        _found = false; _index = 0;

        { 
            if (((savedLoadouts select _forEachindex) select 0)==str(_player)) then {
                _found = true; _index = _forEachindex;
            }; 
        } forEach savedLoadouts;

        if (_found) then {
        diag_log format ["=========== %1 ALREADY EXISTS, ADDING OLD LOADOUT ================",((savedLoadouts select _index) select 0)];

            removeuniform _player;
            removevest _player;        
            removeallweapons _player; 
            removeallitems _player;
            clearWeaponCargo _player;
            clearmagazinecargo _player;
            removeBackpack _player;
            removeAllAssignedItems _player;
            removeAllItems _player; 
            removeGoggles _player;
            removeHeadgear _player;

            _player addbackpack (((savedLoadouts select _index) select 1) select 3);

            _player addVest (((savedLoadouts select _index) select 1) select 4);

            _uniformtoAdd = (((savedLoadouts select _index) select 1) select 5);
            [[{}, _player addUniform _uniformtoAdd], "BIS_fnc_spawn", true] call BIS_fnc_MP;        

            for "_i" from 0 to count((((savedLoadouts) select _index) select 1) select 0) do {
                _player addItemToUniform ((((savedLoadouts select _index) select 1) select 0) select _i);
            };

            for "_i" from 0 to count((((savedLoadouts) select _index) select 1) select 1) do {
                _player addItemToVest ((((savedLoadouts select _index) select 1) select 1) select _i);
            }; 

            for "_i" from 0 to count((((savedLoadouts) select _index) select 1) select 2) do {
                _player addItemToBackpack ((((savedLoadouts select _index) select 1) select 2) select _i);
            };        

            for "_i" from 0 to count((((savedLoadouts) select _index) select 1) select 6) do {
                _player addItem ((((savedLoadouts select _index) select 1) select 6) select _i);
            };

            for "_i" from 0 to count((((savedLoadouts) select _index) select 1) select 7) do {
                _player addItem ((((savedLoadouts select _index) select 1) select 7) select _i);
                _player assignItem ((((savedLoadouts select _index) select 1) select 7) select _i);
            };        

            for "_i" from 0 to count((((savedLoadouts) select _index) select 1) select 8) do {
                _player addWeapon ((((savedLoadouts select _index) select 1) select 8) select _i);
            };        

            for "_i" from 0 to count((((savedLoadouts) select _index) select 1) select 9) do {
                _player addPrimaryWeaponItem ((((savedLoadouts select _index) select 1) select 9) select _i);
            };

            for "_i" from 0 to count((((savedLoadouts) select _index) select 1) select 10) do {
                _player addSecondaryWeaponItem ((((savedLoadouts select _index) select 1) select 10) select _i);
            };

            _getPos = (((savedLoadouts select _index) select 1) select 11);
            _getVeh = (((savedLoadouts select _index) select 1) select 12);

            _player addGoggles (((savedLoadouts select _index) select 1) select 13);
            _player addHeadgear (((savedLoadouts select _index) select 1) select 14);

            if (_getVeh != vehicle _player) then {
                switch(true) do {
                    case (_getVeh emptyPositions "driver" > 0) : { _player moveinDriver _getVeh };
                    case (_getVeh emptyPositions "commander" > 0) : { _player moveinCommander _getVeh };
                    case (_getVeh emptyPositions "gunner" > 0) : { _player moveinGunner _getVeh };
                    case (_getVeh emptyPositions "cargo" > 0) : { _player moveinCargo _getVeh };
                    case (_getVeh emptyPositions "cargo" == 0) : { _player setPosATL _getPos };
                };
            } else {
                _player setPosATL _getPos;
            };

        } else {
        diag_log format ["================ %1 IS NEW, ASSIGNING GEAR ================",(_player)];
            [[_role,_player,_faction],"FNC_assignFactionGear",_player,false] spawn BIS_fnc_MP;
        };
    };
};