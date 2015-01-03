/*











                       Welcome to the BromA Framework A3.

                    In order to get started, open the folder
                      "mission\customize_these_files",
          start editing the files inside, and you're pretty much set!

         That means you're completely free to ignore the rest of this.











*/
diag_log "";
diag_log "**********************************************************************";
diag_log "=======================  MISSION STARTED =============================";
// Wait until players load the game.
startTime = diag_tickTime;
InitEngine = false;
paramLoad = false;
settingsLoad = false;
enableSaving [false, false];
if (isNull player) then { playerIsJip = true } else { playerIsJip = false };

// =============================================================================
//        Initalizes the framework engine with the essential scripts           |
//                                                                             |
//                         DO NOT DISABLE THIS!                                |
// =============================================================================
diag_log time+"==================== LOADING ENGINE-INIT.SQF =========================";
diag_log "";
             _initHandle = [] execVM "engine\engine-init.sqf";
                          waitUntil{InitEngine};
diag_log "====================== ENGINE INIT LOADED ============================";

// =============================================================================
//        Some basic scripts that are run for both new players and JIP         |
// =============================================================================
         _playerHandle = [] execVM (CUSTOM_FILES_PATH+"player_init.sqf");
                 waitUntil{(scriptDone(_playerHandle))};

diag_log "===================== PLAYER INITIALIZED =============================";

//==============================================================================
//          Assigns player gear and handles other connection things.
//==============================================================================
                            [] call fnc_onConnect;

player sidechat format ["BROMA FRAMEWORK INITIALIZED SUCCESSFULLY IN %1 SECONDS.",(diag_tickTime-startTime)];

//==============================================================================
//       Everything below this point will run after the mission begins.        |
//                                                                             |
                               sleep 0.1;
//                           v      v      v                                   |
//==============================================================================

//==============================================================================
//             BromA - Simple loading screen to avoid people                   |
//                    moving around and generating desync                      |
//==============================================================================
                         [] call FNC_loading_screen;

//==============================================================================
//             BromA - Server saves the current game time                      |
//==============================================================================
                          [] call FNC_stamp_time;

//==============================================================================
//                       Syncronizes current server time.
//==============================================================================
               [] execVM ENGINE_FUNC_PATH+"fnc_syncTime.sqf";

                                   sleep 0.5;

diag_log "======================= GAME STARTING ================================";
diag_log "**********************************************************************";
diag_log "";

currentLives = [player] call fnc_getLives;

if ((currentLives) == 0) then {
    deadPlayersArray set [count deadPlayersArray, getPlayerUID player]; publicVariable "deadPlayersArray";

    [player] spawn fnc_prepareSpectator;

    [] spawn INIT_spectator;
} else {
    // Temporary hack for JIPs
    sleep 3;

    if (time > 60) then {
        [] call INIT_player;
        [] call FNC_onConnect
    };
};