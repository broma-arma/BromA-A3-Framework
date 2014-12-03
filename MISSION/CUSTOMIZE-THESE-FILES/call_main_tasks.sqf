/*

    This script uses TASKMASTER by Shuko, for any help you can basically check out the script itself
    at the tasks folder, has pretty much all common commands you want

    Forum: http://forums.bistudio.com/showthread.php?t=100731  
  
// =============================================================================

    Here we declare our tasks. The current format is really simple:

    ["taskName","Main name of the task", "The description of the task, with more details.", The side or group it belongs to]
    
*/
[[

    // As you can see, adds a normal task to the player side.
    ["taskMain","Attack the objective.","Capture the enemy objective.", missionPlayerSide], // don't forget the comma if it isn't the last objective.
    
    // And now we add a defend task to the enemy side, if the mission calls for it.
    ["taskMainEnemy","Defend the objective","Defend the objective from being captured.", missionEnemySide],    
    
    //And another one, but this one is optional.
    ["taskSec","OPTIONAL: Establish an FOB.","You can't really complete this objective, btw.",  missionPlayerSide]    
    
]] call FNC_taskmaster;

// =============================================================================
/* 
Now here come the obligatory objectives, those which MUST be succeeded.

If a single one is failed, the mission ends with missionfailEnd - 
but if they are all completed, it goes with missionwinEnd.
*/

// =============================================================================
// CHECKS TASKS FOR THE PLAYERS
// =============================================================================
mandatoryTasksPLAYER = [];
mandatoryTasksPLAYER = mandatoryTasksPLAYER +
// =============================================================================
// Add the players' objectives to this array.

["taskMain"];

[mandatoryTasksPLAYER,missionfailEnd,missionwinEnd] spawn FNC_check_task;
diag_log format ["== SERVER: INITIALIZED PLAYER TASKS %1 ====================",mandatoryTasksPLAYER];
// =============================================================================

if (missionGameMode == "coop") exitWith {};

// =============================================================================
// CHECKS TASKS FOR THE ENEMIES
// =============================================================================
mandatoryTasksENEMY = [];
mandatoryTasksENEMY = mandatoryTasksENEMY +
// =============================================================================
// Add the players' objectives to this array.

["taskMainEnemy"];

[mandatoryTasksENEMY,missionfailEnd,genericEnding] spawn FNC_check_task;
diag_log format ["== SERVER: INITIALIZED ENEMY TASKS %1 ====================",mandatoryTasksENEMY];
// =============================================================================