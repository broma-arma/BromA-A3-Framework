if (isDedicated) exitWith {};
if (isNull player) then {waitUntil{!isNull player}};

diag_log format ["== PLAYER %1: INITIALIZING PLAYER =======================================",player];

if !(playerIsJip) then {
//==============================================================================
//                     NON-JIP PLAYERS SCRIPTS GO HERE                         |
//==============================================================================    


//==============================================================================
} else { //              JIP PLAYERS HAVE SCRIPTS HERE                         |
//==============================================================================    
                        [] call FNC_teleport_jip;

};
//==============================================================================
//                            Platoon Roster
//==============================================================================
           [] execVM (ENGINE_FUNC_PATH+"init_platoonRoster.sqf");

//==============================================================================
//                 AI listens to players talking on the radio.
//==============================================================================
// WAITING ON API
                        [] spawn INIT_ai_hear_TFAR;
                            
//==============================================================================
//     Blocks third person for vehicle passengers according to parameters
//==============================================================================                           
                        [] call INIT_block_tp_veh;        
                        
                currentLives = [player] call FNC_getLives;

//==============================================================================
//               Check if the player is already dead or not.
//==============================================================================
                if ([player] call fnc_isDead) exitWith {
         player execVM (ENGINE_FUNC_PATH+"onPlayerRespawn.sqf") };
//==============================================================================
//                     Initializes the spectator script.
//==============================================================================
                         [] call INIT_spectator;

//==============================================================================
//                     Initializes Team Kill detection.
//==============================================================================
                          [] call INIT_getTeamKill;
                        
//==============================================================================
//                      Player cannot leave the AO.
//==============================================================================
                           [] call INIT_ao_limit;
                       
//==============================================================================
//                      Mutes in-game radio commands.
//==============================================================================
                               0 fadeRadio 0; 
                               
//==============================================================================
//                        Disables greeting menu.
//==============================================================================
            player setVariable ["BIS_noCoreConversations", true];           
                            
//==============================================================================
//         Remove JIPs from the game according to  mission settings.
//==============================================================================
                           [] call FNC_remove_jip;
                           
headbugR = ["Fix Headbug", {alive player}, { [] spawn fnc_fixHeadbug }, false] call AGM_Interaction_fnc_addInteractionSelf;
                           
diag_log format ["== PLAYER %1: PLAYER INITIALIZED =======================================",player];