/*
================================================================================

DESCRIPTION:
    Assigns loadouts all units inside a trigger.
    
AUTHOR:
    Nife

PARAMETERS:
    0 - thistrigger - Don't change this.
    1 - The loadout called: must be defined inside "mission\loadout\arsenal\faction-list.sqf"
    2 - (OPTIONAL) Side: only units belonging to this side will get the loadout.    
    
RETURNS:
    Units affected.

USAGE:
    TRIGGER CONDITION must be: (time > 1)

    Make sure you use SPAWN instead of CALL.

    _units = [thistrigger, "blufor"] SPAWN fnc_assignLoadout
    
    _units = [thistrigger, "redfor", east] SPAWN fnc_assignLoadout

================================================================================
*/

private["_origin","_loadout","_size","_side"];

_origin = _this select 0;
_loadout = _this select 1;
_size = triggerArea _origin;

if (count _this > 2) then { _side = _this select 2 };

_trg = createTrigger["EmptyDetector",getPos _origin];
_trg setTriggerArea [_size select 0, _size select 1, 0, true];
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