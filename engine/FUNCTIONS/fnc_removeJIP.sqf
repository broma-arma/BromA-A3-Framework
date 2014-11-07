if (allowJIP) exitWith {};
if !(playerIsJip) exitWith {};

// Removes JIPs from the game.
//==============================================================================
removeAllWeapons player;
removeAllItems player;
[player] joinSilent grpNull;
player enableSimulation false;
player setpos [0,0,0];
titletext ["JIP not allowed in this mission - entering spectator mode.", "BLACK",0];
sleep 10;
player enableSimulation true;
player setdamage 1;
//==============================================================================