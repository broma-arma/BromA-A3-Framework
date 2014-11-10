if !(useCoinModule) exitWith {};
// =============================================================================
    // These are the units enabled to use the COIN - feel free to customize as needed
    _COINunits = [Zero69Actual,Alpha69Actual,Bravo69Actual,Charlie69Actual,Delta69Actual];  
        
    _COINfunds = 2500;          // Money available
    _COINbase = "respawn_west"; // Where players will be able to build - currently a marker but you can customize that
                                // by changing line 104 to say getPos instead of getMarkerPos, and then the object you want as base.
    _COINdistance = 30;         // How far from the base they are able to build
    _COINpreset = 1;            // What preset will be used - see f\common\f_COINpresets.sqf"    
    
    _groupname = createGroup sideLogic;
    _coinModule = _groupname createUnit ["ConstructionManager", (getMarkerPos _COINbase), [], 0, "none"];
    {
        if (isPlayer _x) then {
            _coinModule synchronizeObjectsAdd [_x];
            [_coinModule,_x,_COINpreset,_COINfunds,_COINbase,_COINdistance] execVM (ENGINE_PATH+"f\common\f_COINpresets.sqf");
        };
    } forEach _COINunits;
// =============================================================================