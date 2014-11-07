// F2 - Multiplayer Ending Controller 
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS
// Not used.

// ====================================================================================

// SERVER CHECK
// Ensure this script only executes on the server:

if (isServer) then
{	
// SET ENDING & BROADCAST
// The desired ending # is taken from the arguments passed to this script.
// A new value for f_endSelected is being listened for by a trigger on all machines.
// When fired, the trigger will call f_mpEndReceiver.sqf. The same variable will
// also be used locally to change the listening trigger into an appropriate end trigger.
	
	f_endSelected = _this select 0;
	publicVariable "f_endSelected";
diag_log format ["== SERVER: ENDING %1 TRIGGERED ===============================",f_endSelected];
}
else
{
// nothing happens if the script is executed on a client.
};

// ====================================================================================