/*

Modular Gear Script made by Nife and Royal for BromA

*/
private ["_isLeader","_bandage","_morphine","_epi","_medkit","_wsmoke","_gsmoke","_rsmoke","_backpack","_addBinocs","_addRadio","_addAmmo","_addWeapon","_wep","_ammoamount"];

_isMan = _unit isKindOf "Man";
if (_isMan) then {
_isLeader = isFormationLeader _unit;
};

// First we remove all the already existing items from the default units.

if (_isMan) then {
    removeallweapons _unit;
    removeallitems _unit;
    clearWeaponCargo _unit;
    clearmagazinecargo _unit;
    removeBackpack _unit;
    removeAllAssignedItems _unit;
    removeAllItems _unit;
};

// Now we add the items that EVERY soldier should have: how much or how little
// is entirely up to you, but keep in mind that since everyone will have these
// items keeping it down to the basics is recommended.

// Medical and items stuff -----------------------------------------------------
_bandage = "AGM_Bandage";
_morphine = "AGM_Morphine";
_epi = "AGM_Epipen";
_bloodbag = "AGM_Bloodbag";
_medkit = "ACE_Medkit";
_wsmoke = "SmokeShell";
_gsmoke = "SmokeShellGreen";
_rsmoke = "SmokeShellRed";
_bchemlight = "chemlight_blue";
_rchemlight = "chemlight_red";
_gchemlight = "chemlight_green";
_grenade = "HandGrenade";
_minigrenade = "MiniGrenade";
_IRstrobe = "B_IR_Grenade";

#include "content-list.sqf";

//             0             1                2
_optics = ["Binocular","Rangefinder","Laserdesignator"];
//             0 battery
_battery = ["Laserbatteries"];

// Some nifty functions to save time -------------------------------------------
_addBinocs = {
    _kind = _this select 0;
    if _isMan then {
        switch(_kind) do {
            case "binoc": { _unit addWeapon (_optics select 0)};
            case "rangefinder": { _unit addWeapon (_optics select 1);};
            case "laserdesignator": { _unit addWeapon (_optics select 2); _unit addMagazine (_battery select 0)};
        };
    } else {
        switch(_kind) do {
            case "binoc": { _unit addWeaponCargoGlobal (_optics select 0)};
            case "rangefinder": { _unit addWeaponCargoGlobal (_optics select 1);};
            case "laserdesignator": { _unit addWeaponCargoGlobal (_optics select 2); _unit addMagazineCargoGlobal (_battery select 0)};
        };    
    };
};

_attachToWeapon = {
    _type = _this select 0;
    _kind = _this select 1;
    switch (_type) do {
        case "primary": { _unit addPrimaryWeaponItem _kind };
        case "secondary": { _unit addSecondaryWeaponItem _kind };
    };
};

_addRadio = {        
    _kind = _this select 0;
    _side = side _unit;
    
    if (_isMan) then {
        switch(_side) do {
            case WEST: {
                switch(_kind) do {
                    case "SR": { _unit linkItem "tf_anprc152"};
                    case "LR": { _unit linkItem "tf_rf7800str"};
                    case "BP": { removeBackpack _unit; _unit addBackPack "tf_rt1523g"};
                };
            };
            case EAST: {
                switch(_kind) do {
                    case "SR": { _unit linkItem "tf_fadak"};
                    case "LR": { _unit linkItem "tf_pnr1000a"};
                    case "BP": { removeBackpack _unit; _unit addBackPack "tf_mr3000"};
                };
            };     
            case RESISTANCE: {
                switch(_kind) do {
                    case "SR": { _unit linkItem "tf_anprc154"};
                    case "LR": { _unit linkItem "tf_anprc148jem"};
                    case "BP": { removeBackpack _unit; _unit addBackPack "tf_anprc155"};
                };
            };            
        };           
    } else {
        switch(_side) do {
            case WEST: {
                switch(_kind) do {
                    case "SR": { _unit addWeaponCargoGlobal "tf_anprc152"};
                    case "LR": { _unit addWeaponCargoGlobal "tf_rf7800str"};
                    case "BP": { _unit addBackPackCargoGlobal "tf_rt1523g"};
                };
            };
            case EAST: {
                switch(_kind) do {
                    case "SR": { _unit addWeaponCargoGlobal "tf_fadak"};
                    case "LR": { _unit addWeaponCargoGlobal "tf_pnr1000a"};
                    case "BP": { _unit addBackPackCargoGlobal "tf_mr3000"};
                };
            };     
            case RESISTANCE: {
                switch(_kind) do {
                    case "SR": { _unit addWeaponCargoGlobal "tf_anprc154"};
                    case "LR": { _unit addWeaponCargoGlobal "tf_anprc148jem"};
                    case "LR": { _unit addWeaponCargoGlobal "tf_anprc155"};
                };
            };            
        };     
    };
};

_stripUnit = {
    removeVest (_this select 0);
    removeHeadgear (_this select 0);
    removeBackpack (_this select 0);
    removeGoggles (_this select 0);
    removeUniform (_this select 0);
};

_addEmptyBackpack = {    
    _unit addBackpack (_this select 0);
    clearAllItemsFromBackpack _unit;
};

_useUniform = {
    _set = _this select 0;
    _headgear = (_set select 0);
    _uniform = (_set select 1);
    _vest = (_set select 2);
    _backpack = (_set select 3);
    
    switch(_headgear) do {
        case ("keep"): {};
        case ("empty"): { removeHeadgear _unit };
        default {removeHeadgear _unit; _unit addHeadgear _headgear };
    };
    switch(_uniform) do {
        case ("keep"): {};
        case ("empty"): { removeUniform _unit };
        default { removeUniform _unit; [[{}, _unit addUniform _uniform], "BIS_fnc_spawn", true] call BIS_fnc_MP }
    };    
    switch(_vest) do {
        case ("keep"): {};
        case ("empty"): { removeVest _unit };
        default { removeVest _unit; _unit addVest _vest};
    };
    switch(_backpack) do {
        case ("keep"): {};
        case ("empty"): { removeBackpack _unit };
        default { removeBackpack _unit; _unit addBackpack _backpack};
    };    
    
};

_addAmmo = {
    _kind = _this select 0;
    _amount = _this select 1;
    if _isMan then {
        if (typeName _kind == "ARRAY") then { for "_i" from 1 to _amount do { if ((vest _unit)=="") then {_unit addMagazine (_kind select 1)} else {_unit addItemToVest (_kind select 1)}};
        } else { for "_i" from 1 to _amount do {if ((vest _unit)=="") then {_unit addMagazine _kind} else {_unit addItemToVest _kind}}};
    } else {
        if (typeName _kind == "ARRAY") then { _unit addMagazineCargoGlobal [(_kind select 1),_amount];
        } else { _unit addMagazineCargoGlobal [_kind,_amount] };
    };
};

_addItem = {
    _kind = _this select 0;
    _amount = _this select 1;
    if (_isMan) then {
        if (typeName _kind == "ARRAY") then { for "_i" from 1 to _amount do { if ((vest _unit)=="") then {_unit addItem (_kind select 1)} else {_unit addItemToVest (_kind select 1)}};
        } else { for "_i" from 1 to _amount do {if ((vest _unit)=="") then {_unit addItem _kind} else {_unit addItemToVest _kind}}};
    } else {
        if (typeName _kind == "ARRAY") then { _unit addItemCargoGlobal [(_kind select 1),_amount];
        } else { _unit addItemCargoGlobal [_kind,_amount] };
    };
};

_addWeapon = {
    _kind = _this select 0;
    if _isMan then {    
        if (typeName _kind == "ARRAY") then { _unit addWeapon (_kind select 0); } 
        else { _unit addWeapon _kind; };
    } else {
        _amount = _this select 1;
        if (typeName _kind == "ARRAY") then { _unit addWeaponCargoGlobal [_kind select 0,_amount]; } 
        else { _unit addWeaponCargoGlobal [_kind,_amount] };
    };
};

_addtoUniform = {
    _array = _this select 0;
    _unit = _array select 0;
    
    for "_i" from 1 to (count _array) do {
        for "_j" from 1 to ((_array select _i)select 1) do {
            _unit addItemToUniform ((_array select _i)select 0);
        };        
    };
};

_addtoVest = {  
    _array = _this select 0;
    _unit = _array select 0;
    
    for "_i" from 1 to (count _array) do {
        for "_j" from 1 to ((_array select _i)select 1) do {
            _unit addItemToVest ((_array select _i)select 0);
        };        
    };
};

_addtoBackpack = {
    _array = _this select 0;
    _unit = _array select 0;
    
    for "_i" from 1 to (count _array) do {
        for "_j" from 1 to ((_array select _i)select 1) do {
            _unit addItemToBackpack ((_array select _i)select 0);
        };        
    };
};

_addWeaponKit = {
    [_this select 0, _this select 1] call _addAmmo;
    [_this select 0] call _addWeapon;
};

_addMedicBasics = {
    [[_unit,[_bandage,6],[_morphine,2],[_epi,2]]] call _addToUniform;
};

_addtoCargo = {
    _array = _this select 0;
    _unit = _array select 0;
    _type = _array select 1;
    
    for "_i" from 2 to (count _array) do {
        switch(_type) do {
            case("weapon"): { _unit addWeaponCargoGlobal [((_array select _i)select 0),((_array select _i)select 1)]};
            case("magazine"): { _unit addMagazineCargoGlobal [((_array select _i)select 0),((_array select _i)select 1)]};
            case("item"): { _unit addItemCargoGlobal [((_array select _i)select 0),((_array select _i)select 1)]};
        };
    };
};