private["_loadout","_size","_side","_return"];

_origin = curatorCamera;
_loadout = _this select 0;
_size = _this select 1;

_side = nil;
if (count _this > 2) then { _side = _this select 2; };

_units = [];

#include "fnc_getUnits.sqf"

if ( (count _units) > 0) then {
    {
        [-2, {[_this select 0,_this select 1] call FNC_arsenalLoadout}, [_loadout,_x]] call CBA_fnc_globalExecute;
    } forEach _units;
};