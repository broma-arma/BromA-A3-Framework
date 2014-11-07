private["_origin","_loadout","_size","_side"];

_origin = _this select 0;
_loadout = _this select 1;
_size = _this select 2;

if (count _this > 3) then { _side = _this select 3; };

_trg= createTrigger["EmptyDetector",getPos _origin]; 
_trg setTriggerArea [_size,_size,0,false];
_trg setTriggerActivation ["ANY","PRESENT",false];

sleep 2;

{
    _pass = false;
    if (count _this > 3) then {
        if (side _x == _side) then {
            _pass = true;
        };
    } else {
        _pass = true;
    };
    if (_pass) then {
        [-2, {[_this select 0,_this select 1] call FNC_arsenalLoadout}, [_loadout,_x]] call CBA_fnc_globalExecute;
    };
} forEach (list _trg);