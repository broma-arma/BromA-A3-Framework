if (!(isNull player) && !(isMultiplayer)) exitWith {};

if (isServer) then { callIntro = false }; publicVariable "callIntro";
if (playerIsJip && !(allowJIP)) exitWith {};
//==============================================================================
// Here we declare what text will be shown to the player when the game is loading.

if ( isnil "briefLoad" ) then { briefLoad =
"Please wait in order to allow the game to synchronize with all players.\n
\n 
Remember to ALWAYS read the briefing.\n
\n
Take your time to plan your tactics with your teammates.";
}; publicVariable "briefLoad";
//==============================================================================
[] call FNC_putWeaponAway;
// Stop the players from moving.
player enableSimulation false;
player switchMove "amovpercmstpslowwrfldnon_player_idlesteady03";  //lower players weapon

titletext [format ["Loading mission \n\n 0%2 \n[-----------] \n\n%1", briefLoad, "%"], "BLACK FADED",0];
sleep 1;
titletext [format["Loading mission \n\n 25%2 \n[==--------] \n\n%1", briefLoad, "%"], "BLACK FADED",0];
sleep 2;
titletext [format["Loading mission \n\n 50%2 \n[=====-----] \n\n%1", briefLoad, "%"], "BLACK FADED",0];
sleep 1;
titletext [format["Loading mission \n\n 75%2 \n[=======---] \n\n%1", briefLoad, "%"], "BLACK FADED",0];
sleep 2;
titletext [format["Loading mission \n\n 100%2 \n[=========] \n\n%1", briefLoad, "%"], "BLACK FADED",0];
sleep 7;
titleText ["", "PLAIN"];
// Players can now move again.
_intro = [] execVM (CUSTOM_FILES_PATH+"intro.sqf");

waitUntil{scriptDone(_intro)};

player enableSimulation true;