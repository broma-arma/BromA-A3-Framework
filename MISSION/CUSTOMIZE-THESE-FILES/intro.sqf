/*

Put your own intro in here.

Keep in mind that after "introOver" evaluates to true, players will be able to move again.

*/

introOver = true;

// =============================================================================
//  This is a little script that gets the time and place where the players are,
//               and shows them on the screen very quickly.
// =============================================================================

_location = nearestLocation [ getPos player, "nameVillage"];
_location = text _location;
if (_location == "") then { _location = "Virtual Reality" };
_minute = (date select 4); if ([str(_minute)] call CBA_fnc_strLen == 1) then { _minute = "0"+str(_minute) };

_time = format ["%1:%2",(date select 3),_minute];

[0,2,false,true] call BIS_fnc_cinemaBorder;

[_location, _time] spawn BIS_fnc_infoText;

sleep 3;
[1,2,false,true] call BIS_fnc_cinemaBorder;