if (!isServer) exitWith {};
if (isNil "coverMap") then { coverMap = false };
if (!coverMap) exitWith {};

_center = createCenter sideLogic;
_group = createGroup _center;
_pos = getMarkerPos "ao";
_size = getMarkerSize "ao";

_area = _group createUnit ["LocationArea_F", _pos,[],0.5,"NONE"];

_trg = createTrigger["EmptyDetector", _pos]; 
_trg setTriggerArea [_size select 0, _size select 0, 0, true];

_logic = _group createUnit ["Logic", [0,0,0],[],0.5,"NONE"];

_area synchronizeObjectsAdd [_trg];
_logic synchronizeObjectsAdd [_area];

[_logic, nil, true] call BIS_fnc_moduleCoverMap;