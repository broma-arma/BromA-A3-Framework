private["_lives","_index"];

waitUntil {alive player};
currentLives = [player] call fnc_getLives;

if (((currentLives) == 0)||!(enableRespawnParam)) then {
    deadPlayersArray set [count deadPlayersArray, getPlayerUID player]; publicVariable "deadPlayersArray";

    [player] spawn fnc_prepareSpectator;

    [] execVM ENGINE_path+"spectator\specta.sqf";
} else {
    { 
        if ((_x select 0) == (getplayerUID player)) exitWith { 
            playerLives set [_forEachIndex,[getPlayerUID player,currentLives-1]]; publicVariable "playerLives";
        }
    } forEach playerLives;   
};