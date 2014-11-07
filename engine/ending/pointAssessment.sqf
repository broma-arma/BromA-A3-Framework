// =============================================================================
// Before we start, a reminder:
//  All these endings can be found start at line 80 at the file:
//                                  f\common\f_mpEndReceiver.sqf
// =============================================================================    
//  Starts the variables up.
private["_finalPercent", "_reason"];
_reason = _this select 0;
_time = countdown;
// =============================================================================    

// =============================================================================
//  Counts all the units in the game and assigns them into variables.

if (isServer) then {
    numWEST = count f_var_units_BLU; publicvariable "numWEST";
    numEAST = count f_var_units_OPF; publicvariable "numEAST";
    numGUER = count f_var_units_RES; publicvariable "numGUER";
    numCIV = count f_var_units_CIV; publicvariable "numCIV";
    
    countUnitsPlayer = count f_var_units_PLAYERSIDE; publicVariable "countUnitsPlayer";
    countUnitsEnemy = count f_var_units_ENEMYSIDE; publicVariable "countUnitsEnemy";
};
// =============================================================================

//  Receives the original ending number.

victoryReason = _reason; publicvariable "victoryReason";

[] execVM (CUSTOM_FILES_PATH+"endings.sqf");
// =============================================================================
/* 
    Now here we calculate the number of deaths in the mission in a percentage:
    depending on how many players died for each side, the "margin" variable
    will be change accordingly to reflect the winner, and for how much.
*/
    percentPlayer = floor ((100/countUnitsEnemy) * pointsPlayerSide);
    percentEnemy = floor ((100/countUnitsPlayer) * pointsEnemySide);

    _finalPercent = percentPlayer - percentEnemy;

// =============================================================================   
// Declare the margin for victory
// -- you don't really need to worry about this --

if (isNil "margin") then {
    
    switch(true) do {
        
        case (_finalPercent > 0 && _finalPercent < 20):  {
            margin = format["PYRRHIC %1 VICTORY", playerFactionName]; publicVariable "margin";
            color = colorPlayerSide;
        };

        case (_finalPercent > 20 && _finalPercent < 90): {
            margin = format["MARGINAL %1 VICTORY", playerFactionName]; publicVariable "margin";
            color = colorPlayerSide;
        };

        case (_finalPercent >= 90): {
            margin = format["ABSOLUTE %1 VICTORY", playerFactionName]; publicVariable "margin";
            color = colorPlayerSide;
        };

        case (_finalPercent < 0 && _finalPercent > -20): {
            margin = format["PYRRHIC %1 VICTORY", enemyFactionName]; publicVariable "margin";
            color = colorEnemySide;
        };

        case (_finalPercent < -20 && _finalPercent > -90): {
            margin = format["MARGINAL %1 VICTORY", enemyFactionName]; publicVariable "margin";
            color = colorEnemySide;
        };
        
        case (_finalPercent <= -90): {
            margin = format["ABSOLUTE %1 VICTORY", enemyFactionName]; publicVariable "margin";
            color = colorEnemySide;
        };    

        case (_finalPercent == 0): {
            margin = "STALEMATE"; publicVariable "margin";
            color = "yellow";
        };    
        
        default {
            margin = "CASUALTIES:"; publicVariable "margin";
        };
    };

};
// =============================================================================
[] call FNC_process_color;
// =============================================================================
//  Lets the server calculate mission time so there is no desync between players.

if (isServer) then {
    hours = time / 3600,
    remainder = time % 3600,
    minutes = remainder / 60,
    seconds = remainder % 60;

    hours = round(hours);
    minutes = round(minutes);
    seconds = round(seconds);

    publicVariable "hours";
    publicVariable "minutes";
    publicVariable "seconds";
};

//  Wait for time assessment so we don't end up with nil vars
waitUntil {!(isNil "seconds")};
// =============================================================================

// =============================================================================
/*  This will be the message printed at every ending. If you want to add or remove
    parameters, remember to modify the line at the variable line and make sure
    you are broadcasting the variables shown here in order to avoid "any" values.
*/
[victoryReason] execVM (CUSTOM_FILES_PATH+"ending-screen.sqf");