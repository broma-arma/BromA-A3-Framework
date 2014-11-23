/*
================================================================================

DESCRIPTION:
    Activates DAC zones and sends all units within to attack a certain location.

AUTHOR:
    Nife

PARAMETERS:
    0 - Zones to be activated and ordered to attack
    1 - Where they will be going to (marker)
    
RETURNS:
    Nothing.

USAGE:
    [[z1,z2,z3],"city_marker"] spawn fnc_dac_attack;
    
    [[z1],"respawn_west"] spawn fnc_dac_attack;

================================================================================
*/

if (!isServer) exitWith {};

_zones = _this select 0;
_target = _this select 1;
_unitsTgt = [];

_zones call DAC_Activate;

sleep 20;

{
    _size = triggerArea _x;
    
    _trg = createTrigger["EmptyDetector",getPos _x];
    _trg setTriggerArea [(_size select 0)*2, (_size select 1)*2, 0, true];
    _trg setTriggerActivation ["ANY","PRESENT",false];
    
    sleep 2;
    
    for "_i" from 0 to ((count (list _trg))-1) do {
        _unit = ((list _trg) select _i);
        if (alive _unit) then {
            _unitsTgt set [count _unitsTgt, (list _trg) select _i];
        };
    };
} forEach _zones;

sleep 1;

_side = (side (_unitsTgt select 0));

{
    if ((side _x == _side)) then {
        if (!(isPlayer _x)) then {
            [group _x] spawn DAC_fReleaseGroup;        

            [_x] joinSilent grpNull;
            [_x, getMarkerPos _target] call CBA_fnc_taskAttack;
        };
    };
} forEach _unitsTgt;