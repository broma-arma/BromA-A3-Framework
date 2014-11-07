if !(missionGameMode == "tvt") then {    
    waitUntil{ DAC_Basic_Value == 1 };
};
diag_log "== SERVER LOADED MODULE: CIVILIAN CASUALTY CAP =======================";

endingCalled = _this select 0;

if (isNil "hostileCivilians") then {hostileCivilians = []};

// Global variable to hold the death counter.
if (isServer) then {
    if ( isnil "DeadCivilians" ) then {DeadCivilians = 0};
};

// Function to display the death count.
fnc_showCivDeathCount = {
  if (CivilianCap < 9999) then {
    hint format ["Civilian casualties: %1 out of %2",DeadCivilians, CivilianCap];
    diag_log format ["== SERVER: CIVILIAN CASUALTIES %1 out of %2 ==================",DeadCivilians, CivilianCap];
  };
};

fnc_CivFiredWeapon = {
    _killed = _this select 0;
    _killed addMPEventHandler ["mpkilled",fnc_deadHostileCivilian];
    if !(_killed in hostileCivilians) then {
        hostileCivilians = hostileCivilians + [_killed];
diag_log format ["== SERVER: %1 IS NOW CONSIDERED HOSTILE ==========================",_killed];
    };
};

fnc_deadHostileCivilian = {
    _killed = _this select 0;
    _killed removeAllEventHandlers "mpkilled";
};

// Server will do all the work.
if isServer then {
  
  // Function to update death counter.
  fnc_countCivDeaths = {
    _killed = _this select 0;
    _killer = _this select 1;
          
    if !(_killed in hostileCivilians) then {
        if ((isPlayer _killer)&&(side _killer == missionPlayerSide)) then {
            DeadCivilians = DeadCivilians + 1; publicvariable "DeadCivilians";
            diag_log format ["== SERVER: %2 HAS KILLED CIVILIAN %1 =============================",name _killed,name _killer];
            if !isDedicated then {
              call fnc_showCivDeathCount;
            };            
        };
    };
    
    // Checks if the max number of civies is beyond the limit
        if (DeadCivilians >= CivilianCap) then {
            myEnd = [endingCalled] execVM (ENGINE_PATH+"f\server\f_mpEndBroadcast.sqf");
        };      
  };
  
  // Add killed -eventhandler to all civilians.
  {
    if (side _x == civilian) then {
      _x addEventHandler ["fired",fnc_CivFiredWeapon];
      _x addMPEventHandler ["mpkilled",fnc_countCivDeaths];
    };
  } foreach allUnits;

// Non-host clients.
} else {
  // PublicVariable eventhandler to catch the update sent by the server.
  "DeadCivilians" addPublicVariableEventHandler {call fnc_showCivDeathCount};
};