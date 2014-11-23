/*
================================================================================

DESCRIPTION:
    Easier and shorter way to create markers. Makes an icon marker locally.
    
AUTHOR:
    Nife

PARAMETERS:
    0 - Position.
    1 - Type: The marker's icon. See https://community.bistudio.com/wiki/cfgMarkers
    2 - (OPTIONAL) Color: "ColorRed", "ColorBlue" etc.
    3 - (OPTIONAL) Text.
    4 - (OPTIONAL) Size: an array with the width and the height, 1 being the default.
    5 - (OPTIONAL) Direction in degrees.
    6 - (OPTIONAL) Opacity, from 0 to 1.
    
    
RETURNS:
    Object of the marker created.

USAGE:
    _mynewMarker = [ (getPos player), "hd_flag", "ColorBlue", "Help us!", [1,1], 0, 1] call fnc_newMarkerIconLocal
    
    _mynewMarker = [ (getPos enemy), "hd_warning", "ColorRed", "Enemy infantry", [0.5,0.5], 0, 0.3] call fnc_newMarkerIconLocal

================================================================================
*/

_count = 0;

_name = format ["%1", floor(random(100000000000000000))];

_marker = createMarkerLocal [_name, (_this select _count)];

_marker setMarkerShapeLocal "ICON";

_count = _count+1;

_marker setMarkerTypeLocal (_this select _count);

    _count = _count+1; if (count _this <= _count) exitWith {_marker};

_marker setMarkerColorLocal (_this select _count);

    _count = _count+1; if (count _this <= _count) exitWith {_marker};

_marker setMarkerTextLocal (_this select _count);

    _count = _count+1; if (count _this <= _count) exitWith {_marker};

_marker setMarkerSizeLocal (_this select _count);

    _count = _count+1; if (count _this <= _count) exitWith {_marker};

_marker setMarkerDirLocal (_this select _count);

    _count = _count+1; if (count _this <= _count) exitWith {_marker};

_marker setMarkerAlphaLocal (_this select _count);

    _count = _count+1; if (count _this <= _count) exitWith {_marker};

_marker