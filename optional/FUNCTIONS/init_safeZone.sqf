diag_log "== PLAYER LOADED MODULE: SPAWN SAFE ZONE =============================";

//--- Spawn Protection ---//
#define SAFETY_ZONES	[["BASE OPFOR", 10],["BASE BLUFOR", 10]]
#define MESSAGE			"DO NOT SHOOT in the base"
SPAWN_Restriction=["APERSBoundingMine_Range_Ammo","ATMine_Range_Ammo","DemoCharge_Remote_Ammo","SatchelCharge_Remote_Ammo","SLAMDirectionalMine_Wire_Ammo","APERSTripMine_Wire_Ammo","APERSMine_Range_Ammo","GrenadeHand","smokeshell","F_20mm_Green","F_20mm_Red","F_20mm_White","F_20mm_Yellow","F_40mm_Green","F_40mm_Cir","F_40mm_Red","F_40mm_White","F_40mm_Yellow","NLAW_F","R_TBG32V_F","R_PG32V_F","M_Titan_AP","SmokeShellBlue","SmokeShellGreen","SmokeShellOrange","SmokeShellPurple","SmokeShellRed","SmokeShell","SmokeShellYellow","G_40mm_SmokeBlue","G_40mm_SmokeGreen","G_40mm_SmokeOrange","G_40mm_SmokePurple","G_40mm_SmokeRed","G_40mm_Smoke","G_40mm_SmokeYellow","ClaymoreDirectionalMine_Remote_Ammo","mini_Grenade","GrenadeHand_stone","G_40mm_HE","M_NLAW_AT_F","M_Titan_AT"];

waitUntil {!isNull player};

private["_playerMarker","_enemyMarker","_tvtEnabled"];

_areasize = _this select 0;
_tvtEnabled = _this select 1;

switch(missionPlayerSide) do {
    case WEST: { _playerMarker = "respawn_west" };
    case EAST: { _playerMarker = "respawn_east" };
    case RESISTANCE: { _playerMarker = "respawn_resistance" };
    case CIVILIAN: { _playerMarker = "respawn_civilian" };
};

switch(missionEnemySide) do {
    case WEST: { _enemyMarker = "respawn_west" };
    case EAST: { _enemyMarker = "respawn_east" };
    case RESISTANCE: { _enemyMarker = "respawn_resistance" };
    case CIVILIAN: { _enemyMarker = "respawn_civilian" };
};

player addEventHandler ["Fired", {
    if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then {
        _type = typeOf(_this select 6);

        if(_type in SPAWN_Restriction) then {
            deleteVehicle (_this select 6);
            titleText [MESSAGE, "PLAIN", 3];		
        };
    };
}];

_PlayerInAreas		= [];
_OldPlayerInAreas 	= [];

_PlayerInAreas2		= [];
_OldPlayerInAreas2 	= [];

_TriggerList 	 	= [];
_TriggerList2 	 	= [];
_Debug 			= false;

// =============================================================================
if (_tvtEnabled) then {
    
// ENEMY Zone
_Pos			= getMarkerPos _enemyMarker;
_SpawnProtection2       = createTrigger ["EmptyDetector",_Pos];
_SpawnProtection2 setTriggerArea [_areasize,_areasize,0,true]; 
_SpawnProtection2 setTriggerActivation ["ANY","PRESENT",true];
_SpawnProtection2 setTriggerStatements ["","",""];
_TriggerList2 set [count _TriggerList2, [_SpawnProtection2, missionEnemySide]];

_markermain2 = createMarkerLocal [str(random(100)), getPos _SpawnProtection2];
_markermain2 setMarkerShapeLocal "ELLIPSE";
_markermain2 setMarkerColorLocal "color"+colorEnemySide;
_markermain2 setMarkerPosLocal (position _SpawnProtection2);
_markermain2 setMarkerBrushLocal "SolidBorder";
_markermain2 setMarkerAlphaLocal 0.2;
_markermain2 setMarkerDirLocal (triggerArea _SpawnProtection2 select 2);    
_markermain2 setMarkerSizeLocal  [( triggerArea _SpawnProtection2 select 0),(triggerArea _SpawnProtection2 select 1)]; 
};
// =============================================================================

// =============================================================================
// PLAYER Zone
_Pos			= getMarkerPos _playerMarker;
_SpawnProtection        = createTrigger ["EmptyDetector",_Pos]; 
_SpawnProtection setTriggerArea [_areasize,_areasize,0,true]; 
_SpawnProtection setTriggerActivation ["ANY","PRESENT",true];
_SpawnProtection setTriggerStatements ["","",""];
_TriggerList set [count _TriggerList, [_SpawnProtection, missionPlayerSide]];

_markermain = createMarkerLocal [str(random(100)), getPos _SpawnProtection];
_markermain setMarkerShapeLocal "ELLIPSE";
_markermain setMarkerColorLocal "color"+colorPlayerSide;
_markermain setMarkerPosLocal (position _SpawnProtection );
_markermain setMarkerBrushLocal "SolidBorder";
_markermain setMarkerAlphaLocal 0.2;
_markermain setMarkerDirLocal (triggerArea _SpawnProtection select 2 );    
_markermain setMarkerSizeLocal  [( triggerArea _SpawnProtection select 0),(triggerArea _SpawnProtection select 1)]; 
// =============================================================================

sleep 1;
_InZoneArea = [];
    
while {true} do {

    {
        _InZoneArea = _x select 0;
        _InZoneArea = list _InZoneArea;
        _SideZone 	= _x select 1;
        
        if (count(_InZoneArea) > 0) then {
        {
            // For infantry
            if (side _x == _SideZone) then {
                _x allowDamage false;
                _PlayerInAreas set [count _PlayerInAreas, _x];
            };	
            
            // For vehicles
                if(((_x isKindOf  "Air") ||(_x isKindOf  "Car")||(_x isKindOf  "Ship") ||(_x isKindOf  "Tank")||(_x isKindOf  "Helicopter")))then {
                    if (count crew _x > 0) then {
                        _PlayerInAreas set [count _PlayerInAreas, _x];
                        _x allowDamage false;
                        _friendlies = false;
                        {
                            if(side _x == _SideZone)then{ _x allowDamage false;_PlayerInAreas set [count _PlayerInAreas, _x];};
                        } forEach (crew _x);
                    } else { _x allowDamage false; _PlayerInAreas set [count _PlayerInAreas, _x];};
                };
        } forEach _InZoneArea;

                // Find the player who left the area and setDamage true
                {
                        if (!(_x in _PlayerInAreas)) then {
                            
                                _x allowDamage true;
                                
                                if (_Debug) then { hint format ["left the area %1", _x];};
                        } else { if(_Debug) then { hint format  ["in the area %1", _x];};};
                } forEach _OldPlayerInAreas;
         };       
    } forEach _TriggerList;
    
    // Refresh the Index
    _OldPlayerInAreas = _PlayerInAreas;
    _PlayerInAreas = [];      
    
    
    {
        _InZoneArea = _x select 0;
        _InZoneArea = list _InZoneArea;
        _SideZone 	= _x select 1;
        
        if (count(_InZoneArea) > 0) then {
        {          
            // For infantry
            if (side _x == _SideZone) then {
                _x allowDamage false;
                _PlayerInAreas2 set [count _PlayerInAreas2, _x];                
            };	
            
            // For vehicles
                if(((_x isKindOf  "Air") ||(_x isKindOf  "Car")||(_x isKindOf  "Ship") ||(_x isKindOf  "Tank")||(_x isKindOf  "Helicopter")))then {
                    if (count crew _x > 0) then {
                        _PlayerInAreas2 set [count _PlayerInAreas2, _x];
                        _x allowDamage false;
                        _friendlies = false;
                        {
                            if(side _x == _SideZone)then{ _x allowDamage false;_PlayerInAreas2 set [count _PlayerInAreas2, _x];};
                        } forEach (crew _x);
                    } else { _x allowDamage false; _PlayerInAreas2 set [count _PlayerInAreas2, _x];};
                };
        } forEach _InZoneArea;

                // Find the player who left the area and setDamage true
                {
                        if (!(_x in _PlayerInAreas2)) then {
                            
                                _x allowDamage true;
                                
                                if (_Debug) then { hint format ["left the area %1", _x];};
                        } else { if(_Debug) then { hint format  ["in the area %1", _x];};};
                } forEach _OldPlayerInAreas2;
        };
    } forEach _TriggerList2;    

    // Refresh the Index
    _OldPlayerInAreas2 = _PlayerInAreas2;
    _PlayerInAreas2 = [];    
    
    sleep 1;
};