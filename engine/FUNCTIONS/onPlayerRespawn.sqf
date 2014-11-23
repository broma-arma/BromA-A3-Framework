private["_lives","_index"];

waitUntil {alive player};
currentLives = [player] call fnc_getLives;

if (((currentLives) == 0)||!(enableRespawnParam)) then {
    deadPlayersArray set [count deadPlayersArray, getPlayerUID player]; publicVariable "deadPlayersArray";
    player setVariable ["isDead", true, true];

    [player] spawn fnc_prepareSpectator;

    [] call f_fnc_CamInit;
    
} else {
    { 
        if ((_x select 0) == (getplayerUID player)) exitWith { 
            playerLives set [_forEachIndex,[getPlayerUID player,currentLives-1]]; publicVariable "playerLives";
        }
    } forEach playerLives;   
};