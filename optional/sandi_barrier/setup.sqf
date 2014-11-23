sleep 2;
_logic =  _this select 0;
_radius = _this select 1;
_time =   _this select 2;
_side =   _this select 3;

_pos = getMarkerPos _logic;
_dir = 0;
_startedVarName = "sandi_setup_done_" + (str _side);

if (isServer) then { // server
  [_time, _side, _startedVarName] spawn {
    _time = _this select 0;
    _side = _this select 1;
    _startedVarName = _this select 2;
    
    sleep _time; // wait for setup to end
    
    missionNamespace setVariable [_startedVarName, true];
    publicVariable _startedVarName;
  };
};

if (!isDedicated) then { // player 

  waitUntil {!isNull player};
  
  _isDead = player getVariable ["isDead",false];
  if (_isDead) exitWith {};  
  
  if (side player == _side) then {
  
    if (isNil _startedVarName) then { // setup
    
      _name = "setup_" + str _side;
      createMarkerLocal [_name, _pos];
      _name setMarkerDirLocal _dir;
      _name setMarkerShapeLocal "RECTANGLE"; 
      _name setMarkerSizeLocal [_radius, _radius];
      _name setMarkerBrushLocal "Border";
      
      if (_side == missionPlayerSide) then { _name setMarkerColorLocal "color"+colorPlayerSide };
      if (_side == missionEnemySide) then { _name setMarkerColorLocal "color"+colorEnemySide };     

      // make barrier
      _barrierHandle = [_pos, _radius, _radius, _dir, "rectangle", "You cannot leave the setup area until the time is over."] call compile preprocessFileLineNumbers (OPTIONAL_PATH+"sandi_barrier\register.sqf");
      
      sleep 5;
      hint parsetext ("<t size='1.40'>Mission begins in [" + (str _time) + "] seconds.</t>");
      
      [_startedVarName, _barrierHandle, _name] spawn {
        _startedVarName = _this select 0;
        _barrierHandle = _this select 1;
        _markerName = _this select 2;
        
        waitUntil {!isNil _startedVarName};

        sandi_barrier_barriers set [_barrierHandle, 0];
        deleteMarkerLocal _markerName;
        spawnBullets = true; publicvariable "spawnBullets";
        waitUntil {!(isNil "spawnBullets")};
        hint parsetext ("<t size='1.40'>Mission start.</t>");
      };
    };
  };
};