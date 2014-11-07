//==============================================================================
// This script will execute a countdown based on the time limit decided in the
// parameters.
//==============================================================================

// Receive the ending from the init.sqf
_whatEnd = _this select 0;

// Receive the limit from the paramters
countdown = TimerLimit;

diag_log "== SERVER LOADED MODULE: MISSION TIME LIMIT ==========================";

// Execute the loop.
waitUntil {     
    if (isServer) then { 
        sleep 1; 
        countdown = (countdown - 1);
        publicVariable "countdown";
        //===============================================
        // Runs a script that shows how much
        // time players have left 
        // Configure it to show more/less warnings
        // ==============================================
        [] call FNC_show_countdown;        
    } else { 
        "countdown" addPublicVariableEventHandler {
        //===============================================
        // Runs a script that shows how much
        // time players have left 
        // Configure it to show more/less warnings
        // ==============================================
        [] call FNC_show_countdown;
        };
    };
    
//Coutdown ends
countdown <= 0};

//Calls any end you want
myEnd = [_whatEnd] execVM (ENGINE_PATH+"f\server\f_mpEndBroadcast.sqf");