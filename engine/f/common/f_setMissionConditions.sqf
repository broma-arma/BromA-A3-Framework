// F2 - Mission Conditions Selector
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_timeOfDay","_weather","_MissionOvercast","_MissionRain","_MissionRainbow","_MissionLightnings","_MissionWindStr","_MissionWindGusts","_MissionFog","_MissionWaves","_MissionHumidity", "_timeLimit","_deadCivilians","_aiSkill"];

// ====================================================================================

// WAIT FOR PARAMSARRAY TO BE PROCESSED

waitUntil { scriptDone f_processParamsArray };

// ====================================================================================

// SET KEY VARIABLES
// Conditions are set in the parameters screen (during mission set-up).

_timeOfDay = f_param_timeOfDay;
_weather = f_param_weather;
_timeLimit = time_limit;
_deadCivilians = dead_civies;
_aiSkill = ai_level;
_setuptime = setup_time;
_cascap = cas_cap;
_playerlives = player_lives;
_respawnon = allow_respawn;
_tpveh = allow_tp_veh;
_revivetime = revive_time;

// ====================================================================================

// SELECT MISSION TIME OF DAY
// Using the value of _timeOfDay, a new date is set.

switch (_timeOfDay) do
{
// Dawn
	case 0:
	{
		setDate [2007, 5, 11, 4, 50];
	};
// Early Morning
	case 1:
	{
		setDate [2007, 5, 11, 5, 50];
	};
// Morning
	case 2:
	{
		setDate [2007, 5, 11, 9, 00];
	};
// Noon
	case 3:
	{
		setDate [2007, 5, 11, 12, 0];
	};
// Afternoon
	case 4:
	{
		setDate [2007, 5, 11, 15, 00];
	};
// Evening
	case 5:
	{
		setDate [2007, 5, 11, 17, 50];
	};
// Dusk
	case 6:
	{
		setDate [2007, 5, 11, 18, 50];
	};
// Night
	case 7:
	{
		setDate [2007, 5, 11, 0, 0];
	};
};

// ====================================================================================

// SELECT MISSION WEATHER
// Using the value of _weather, values for _MissionOvercast and _MissionFog are set.

switch (_weather) do
{
// Clear (Calm)
	case 0:
	{
		_MissionOvercast = 0.01;
		_MissionRain = 0;
		_MissionRainbow = 0;
		_MissionLightnings = 0;
		_MissionWindStr = 0;
		_MissionWindGusts = 0;
		_MissionFog = 0;
		_MissionWaves = 0.1;
		_MissionHumidity = 0.2;
	};
// Clear (Light Winds)
	case 1:
	{
		_MissionOvercast = 0.01;
		_MissionRain = 0;
		_MissionRainbow = 0;
		_MissionLightnings = 0;
		_MissionWindStr = 0.25;
		_MissionWindGusts = 0.5;
		_MissionFog = 0;
		_MissionWaves = 0.25;
		_MissionHumidity = 0.2;
	};
// Clear (Strong Winds)
	case 2:
	{
		_MissionOvercast = 0.01;
		_MissionRain = 0;
		_MissionRainbow = 0;
		_MissionLightnings = 0;
		_MissionWindStr = 0.75;
		_MissionWindGusts = 1;
		_MissionFog = 0;
		_MissionWaves = 0.75;
		_MissionHumidity = 0.2;
	};
// Overcast (Calm)
	case 3:
	{
		_MissionOvercast = 0.8;
		_MissionRain = 0;
		_MissionRainbow = 0;
		_MissionLightnings = 0;
		_MissionWindStr = 0;
		_MissionWindGusts = 0;
		_MissionFog = 0;
		_MissionWaves = 0.1;
		_MissionHumidity = 0.2;
	};
// Overcast (Light Winds)
	case 4:
	{
		_MissionOvercast = 0.8;
		_MissionRain = 0;
		_MissionRainbow = 0;
		_MissionLightnings = 0;
		_MissionWindStr = 0.25;
		_MissionWindGusts = 0.5;
		_MissionFog = 0;
		_MissionWaves = 0.25;
		_MissionHumidity = 0.2;
	};
// Overcast (Strong Winds)
	case 5:
	{
		_MissionOvercast = 0.8;
		_MissionRain = 0;
		_MissionRainbow = 0;
		_MissionLightnings = 0;
		_MissionWindStr = 0.75;
		_MissionWindGusts = 1;
		_MissionFog = 0;
		_MissionWaves = 0.75;
		_MissionHumidity = 0.2;
	};
// Rain (Light Winds)
	case 6:
	{
		_MissionOvercast = 1;
		_MissionRain = 1;
		_MissionRainbow = 0;
		_MissionLightnings = 0;
		_MissionWindStr = 0.25;
		_MissionWindGusts = 0.5;
		_MissionFog = 0;
		_MissionWaves = 0.75;
		_MissionHumidity = 0.9;
	};
// Rain (Strong Winds)
	case 7:
	{
		_MissionOvercast = 1;
		_MissionRain = 1;
		_MissionRainbow = 0;
		_MissionLightnings = 0;
		_MissionWindStr = 0.75;
		_MissionWindGusts = 1;
		_MissionFog = 0;
		_MissionWaves = 0.75;
		_MissionHumidity = 0.9;
	};
// Storm
	case 8:
	{
		_MissionOvercast = 1;
		_MissionRain = 1;
		_MissionRainbow = 0;
		_MissionLightnings = 1;
		_MissionWindStr = 1;
		_MissionWindGusts = 1;
		_MissionFog = 0;
		_MissionWaves = 1;
		_MissionHumidity = 1;
	};
// Light Fog
	case 9:
	{
		_MissionOvercast = 0.25;
		_MissionRain = 0;
		_MissionRainbow = 0;
		_MissionLightnings = 0;
		_MissionWindStr = 0;
		_MissionWindGusts = 0;
		_MissionFog = 0.3;
		_MissionWaves = 0;
		_MissionHumidity = 0.7;
	};
// Heavy Fog
	case 10:
	{
		_MissionOvercast = 0.8;
		_MissionRain = 0;
		_MissionRainbow = 0;
		_MissionLightnings = 0;
		_MissionWindStr = 0;
		_MissionWindGusts = 0;
		_MissionFog = 0.7;
		_MissionWaves = 0;
		_MissionHumidity = 0.7;
	};
};

// ====================================================================================

// SELECT MISSION TIME LIMIT
// When the time limit selected ends, the mission is over

switch (_timeLimit) do
{
	case 0:
	{
            TimerLimit = 999999999999;
	};
	case 1:
	{
            TimerLimit = 10800;
	};
	case 2:
	{
            TimerLimit = 7200;
	};
	case 3:
	{
            TimerLimit = 3600;
	};
	case 4:
	{
            TimerLimit = 2700;
	};
	case 5:
	{
            TimerLimit = 1800;
	};     
	case 6:
	{
            TimerLimit = 900;
	};
	case 7:
	{
            TimerLimit = 600;
	};
	case 8:
	{
            TimerLimit = 60;
	};         
};
publicvariable "TimerLimit";
// ====================================================================================

// SELECT MISSION SETUP TIME
// Sets the time players have to prepare in adversarial missions

switch (_setuptime) do
{
	case 0:	{ MissionSetup = 60*1 };
        case 1:	{ MissionSetup = 60*3 };
        case 2:	{ MissionSetup = 60*5 };
        case 3:	{ MissionSetup = 60*10 };
       
};
publicvariable "MissionSetup";
// ====================================================================================

// CIVILIAN CASUALTY CAP
// Ends the mission whenever a certain number of civilians has been killed

switch (_deadCivilians) do
{
	case 0:
	{
            CivilianCap = 9999;
	};
	case 1:
	{
            CivilianCap = 3;
	};
	case 2:
	{
            CivilianCap = 10;
	};
	case 3:
	{
            CivilianCap = 30;
	};        
};
publicVariable "CivilianCap";
// ====================================================================================

// DAC AI SKILL
// Ends the mission whenever a certain number of civilians has been killed

switch (_aiSkill) do
{    
	case 0:
	{
            DAC_AI_Level = 1;
	};        
	case 1:
	{
            DAC_AI_Level = 1;
	};
	case 2:
	{
            DAC_AI_Level = 2;
	};
	case 3:
	{
            DAC_AI_Level = 3;
	};
	case 4:
	{
            DAC_AI_Level = 4;
	};        
};
publicVariable "DAC_AI_Level";

// ====================================================================================
// Casualty Cap

switch (_cascap) do
{
	case 0:
	{
           CasualtyCapParam = 80;
	};
	case 1:
	{
           CasualtyCapParam = 90;
	};
	case 2:
	{
           CasualtyCapParam = 95;
	};
	case 3:
	{           
           CasualtyCapParam = 100;
	};       
};
publicVariable "CasualtyCapParam";
// ====================================================================================

// Respawning

switch (_respawnon) do
{
	case 0:
	{
           enableRespawnParam = true;
	};
	case 1:
	{
           enableRespawnParam = false;
	};      
};
publicVariable "enableRespawnParam";
// ====================================================================================

// Player lives

switch (_playerlives) do
{
	case 0:
	{
           initialPlayerLives = 1;
	};
	case 1:
	{
           initialPlayerLives = 3;
	};
	case 2:
	{
           initialPlayerLives = 5;
	};
	case 3:
	{
           initialPlayerLives = 10;
	};        
};
publicVariable "initialPlayerLives";

// ====================================================================================
// Revive time

switch (_revivetime) do
{
	case 0:
	{
           AGM_Medical_MaxUnconsciousnessTime = 10;
	};
	case 1:
	{
           AGM_Medical_MaxUnconsciousnessTime = 120;
	};
	case 2:
	{
           AGM_Medical_MaxUnconsciousnessTime = 300;
	};
	case 3:
	{
            AGM_Medical_MaxUnconsciousnessTime = 600;
	};         
};
publicVariable "AGM_Medical_MaxUnconsciousnessTime";

// ====================================================================================
// Third Person allowed for passengers inside vehicles

switch (_tpveh) do
{
	case 0:
	{
           allowedTP = "disabled";
	};
	case 1:
	{
           allowedTP = "everyone";
	}; 
	case 2:
	{
           allowedTP = "drivers";
	};          
};
publicVariable "allowedTP";
// ====================================================================================

// ENABLE DEBUG MODE
// If either _timeOfDay or _weather is set to 99, debug mode is enabled; in this case
// conditions are set to Noon, Clear.

if ((_timeOfDay == 99) || (_weather == 99)) then 
{
	setDate [2007, 5, 11, 12, 0];
	_MissionOvercast = 00.00;
	_MissionFog = 00.00;
};

// ====================================================================================

// SET MISSION CONDITIONS
// Use new values for _MissionTime, _MissionOvercast and _MissionFog to set
// mission conditions on server and all clients (including JIP clients).

0 setOvercast _MissionOvercast;
0 setFog _MissionFog;
0 setRain _MissionRain;
0 setRainbow _MissionRainbow;
0 setWindStr  _MissionWindStr;
0 setWindForce _MissionWindGusts;
0 setWaves _MissionWaves;

// ====================================================================================

diag_log "=================== MISSION PARAMETERS ASSIGNED ======================";
if (true) exitWith {paramLoad = true};