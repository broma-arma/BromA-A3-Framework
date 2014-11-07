_center = createCenter sideLogic;
_group = createGroup _center;
_pos = getMarkerPos "boot_hill";

_playerarray = [];

{
    if (name _x in allowedMissionMakers) then {
        _playerarray set [count _playerarray, getPlayerUID _x];
    };
} forEach allUnits;

mcc_rights setvariable ["names",str(_playerarray)];

[mcc_rights] spawn MCC_fnc_accessRights;