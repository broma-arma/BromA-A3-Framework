_player = player;
diag_log format ["========================= %1 INITIALIZING =========================",name _player];

waitUntil{!isNull player};

if !(isDedicated) then {
    if ((alive _player)&&(local _player)) then {
        
        private["_assignIndex"];

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
            
            _player enableSimulation false;
            
            [_player, (savedLoadouts select _index) select 1] call AGM_Respawn_fnc_restoreGear;
            
            _player setVariable ["AGM_Blood",(((savedLoadouts select _index) select 1) select 18),true];
            _player setVariable ["AGM_Bleeding",(((savedLoadouts select _index) select 1) select 19),true];
            _player setVariable ["AGM_Painkiller",(((savedLoadouts select _index) select 1) select 20),true];
            _player setVariable ["AGM_Pain",(((savedLoadouts select _index) select 1) select 21),true];
            _player setVariable ["AGM_InPain",(((savedLoadouts select _index) select 1) select 22), true];
            _player setVariable ["AGM_Unconscious",(((savedLoadouts select _index) select 1) select 23),true];
            
            _getPos = (((savedLoadouts select _index) select 1) select 24);
            _getVeh = (((savedLoadouts select _index) select 1) select 25);
            
            [_player,_getVeh,_getPos] spawn {
                _player = _this select 0;
                _getVeh = _this select 1;
                _getPos = _this select 2;
                
                sleep 3;
                
                diag_log format ["** VEHICLE: %1 | LAST VEHICLE: %2 **",(vehicle _player), _getVeh];
                diag_log "== TELEPORTING PLAYER LAST POSITION ==================================";  
                if ((vehicle _player) == (_getVeh)) then {
                    _player setPosATL _getPos; 
                } else {
                    if ( damage _getVeh < 0.9 ) then {
                        _getVeh enableSimulation false;
                        _getVeh engineOn true;      
                        _player setPosATL _getPos;
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
            };
            
            _player enableSimulation true;
        } else {
        diag_log format ["================ %1 IS NEW, ASSIGNING GEAR ================",(_player)];
            switch (loadoutStylePlayer) do {
                case "classic": { [[_role,_player,_faction],"FNC_assignFactionGear",_player,false] spawn BIS_fnc_MP };
                case "arsenal": { [[_faction, _player, _role],"FNC_arsenalLoadout",_player,false] spawn BIS_fnc_MP };
            };
        };
    };
};