// This script is used to call the message whenever a player fires his weapon
// before the timer is over. Feel free to change the warning to whatever you want.

{
    // Here we delete the object fired, be it grenades, bullets or even rockets.
    killbullets = _x addEventhandler ["Fired",{deletevehicle nearestobject [_this select 0,_this select 4]}];
    hintspam = _x addEventhandler ["Fired",{hintSilent "Please refrain from firing while the setup time is not over."}];
} forEach allUnits;