// ====================================================================================
// BRIEFING GOES ON HERE
waitUntil{!isNull player};
[] execVM CUSTOM_FILES_PATH+"credits.sqf";

switch (side player) do
{
case WEST:
{
diag_log "== PLAYER: ASSIGNING WEST BRIEFING ===================================";
#include "briefingWest.sqf";
};
case EAST:
{
diag_log "== PLAYER: ASSIGNING EAST BRIEFING ===================================";
#include "briefingEast.sqf";
};
case RESISTANCE:
{
diag_log "== PLAYER: ASSIGNING INDEPENDENT BRIEFING ============================";
#include "briefingInd.sqf";
};
case CIVILIAN:
{
diag_log "== PLAYER: ASSIGNING CIVILIAN BRIEFING ===================================";    
#include "briefingCiv.sqf";
};
};