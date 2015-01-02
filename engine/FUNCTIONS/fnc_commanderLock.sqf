if (!use_co_lock) exitWith {};

lockFree = false;

player spawn {
    while {(true)} do {
        if (lockFree) exitWith {};
        
        if (vehicle player != _this) then {
            doGetOut _this;
            hint "Please wait until the commander clears the mission to begin.";
        };        
        sleep 0.2;
    };
};

removeBulletsEH = player addEventHandler ["Fired", { deleteVehicle (_this select 6) }];

if (player == co_lock_unit) then {
    
    freePlayers = {
        hint "The commander declares mission as go!";
        player removeEventHandler ["Fired", removeBulletsEH];
        lockFree = true; 
        publicVariable "lockFree";
    };
    publicVariable "freePlayers";
            
    player addAction ["<t color='#FF0000'>Start the mission.</t>", { [[],"freePlayers",true,true] spawn BIS_fnc_MP; },nil,0.5,true,true,"'", "(player == co_lock_unit)&&!lockFree" ];
};