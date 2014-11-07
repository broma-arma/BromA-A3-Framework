private["_unit","_uid","_check","_check"];

_unit = _this select 0;
_uid = getPlayerUID _unit;
_check = false;

if (!(isPlayer _unit)) exitWith {    
    false
};

{
    if ((_uid) == (_x)) exitWith {
        _check = true;
    };
} forEach deadPlayersArray;

_check