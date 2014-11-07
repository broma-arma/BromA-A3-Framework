// Adds essential items.
// =============================================================================

_unit addWeapon "ItemMap";
_unit addWeapon "ItemGPS";
_unit addWeapon "ItemCompass";
_unit addWeapon "ItemWatch";
_unit addWeapon "ItemRadio";
_unit addItem "AGM_EarBuds";

_unit addWeapon _NVG;
// =============================================================================

// Now we start checking for the class names and giving them their loadout accordingly.
switch (_type) do
{   
// =============================================================================
//                          COMMANDING OFFICER
// =============================================================================
        case "CO":
        {
            ["BP"] call _addRadio;
            
            [_commonMarksman,7] call _addWeaponKit;
            ["primary",_commonRCO] call _attachToWeapon;
            ["primary",_laser] call _attachToWeapon;
            
            [[_unit,[_commonPistol select 1,2]]] call _addtoUniform;
            [_commonPistol] call _addWeapon;            
            
            ["laserdesignator"] call _addBinocs;
            
            [[_unit,            
                [_rchemlight,2],[_gchemlight,2],[_bchemlight,2],[_grenade,2],
                [_wsmoke,2],[_rsmoke,2],[_gsmoke,2],[_IRstrobe,2]
            ]] call _addtoBackpack;
            
            [] call _addMedicBasics;                        
        };
        
// =============================================================================
//                          SQUAD LEADER
// =============================================================================        
        
        case "SL":
        {
            [_rangemasterLite] call _useUniform;
                
            ["BP"] call _addRadio;                                                 
                
            [_commonrifleGL,10] call _addWeaponKit;
            ["primary",_commonRCO] call _attachToWeapon;
            ["primary",_laser] call _attachToWeapon;
            
            [_commonPistol] call _addWeapon;
            
            [[_unit,
                [_commonPistol select 1,2]
            ]] call _addtoUniform;
            
            [[_unit,
                [_commonrifleGL select 2,5]
            ]] call _addtoVest;
            
            [[_unit,            
                [_grenade,4],[_bchemlight,2],
                [_wsmoke,2],[_gsmoke,2],[_IRstrobe,1]
            ]] call _addtoBackpack;               
                        
            ["rangefinder"] call _addBinocs;

            [] call _addMedicBasics;            
        };
        
// =============================================================================
//                            FIRE TEAM LEADER
// =============================================================================        
        
        case "FTL":
        {
            [_rangemaster] call _useUniform;            
            
            [_commonBackpack] call _addEmptyBackpack;                           
                
            [_commonrifleGL,14] call _addWeaponKit;
            ["primary",_commonCCO] call _attachToWeapon;
            ["primary",_laser] call _attachToWeapon;
            
            [[_unit,            
                [_commonrifleGL select 1,5],[_commonrifleGL select 2,10],
                [_grenade,4],[_wsmoke,3]
            ]] call _addtoBackpack;
            
            ["binoc"] call _addBinocs;

            [] call _addMedicBasics;
        };            
        
// =============================================================================
//                              RIFLEMAN
// =============================================================================        
        
        case "rifleman":
        {
            [_commonBackpack] call _addEmptyBackpack;
             
            [_commonrifle,14] call _addWeaponKit;
            ["primary",_commonCCO] call _attachToWeapon;
            ["primary",_laser] call _attachToWeapon;
            
            [[_unit,            
                [_commonrifle select 1,15],
                [_grenade,6],[_wsmoke,3]
            ]] call _addtoBackpack;
            
            [_commonAT,1] call _addWeaponKit;

            [] call _addMedicBasics;
        };
        
// =============================================================================
//                                 JTAC
// =============================================================================        
        
        case "JTAC":
        {
            ["BP"] call _addRadio;
            
            [_commonrifleshort,7] call _addWeaponKit;
            ["primary",_commonCCO] call _attachToWeapon;
            ["primary",_laser] call _attachToWeapon;          
            
            ["laserdesignator"] call _addBinocs;
            
            [[_unit,            
                [_rchemlight,5],[_gchemlight,5],[_bchemlight,5],
                [_wsmoke,2],[_rsmoke,2],[_gsmoke,2],[_IRstrobe,5]
            ]] call _addtoBackpack;
            
            [] call _addMedicBasics;
        };  
        
// =============================================================================
//                              MARKSMAN
// =============================================================================        
        
        case "marksman":
        {
            [_commonBackpack] call _addEmptyBackpack;
             
            [_commonMarksman,14] call _addWeaponKit;
            ["primary",_commonRCO] call _attachToWeapon;
            ["primary",_laser] call _attachToWeapon;
            
            ["binoc"] call _addBinocs;
            
            [[_unit,            
                [_commonMarksman select 1,15],
                [_grenade,3],[_wsmoke,5]
            ]] call _addtoBackpack;

            [] call _addMedicBasics;
        };              
        
// =============================================================================
//                          AUTOMATIC RIFLEMAN
// =============================================================================          
        
        case "AR":
        {
            [_commonBackpack] call _addEmptyBackpack;
             
            [_commonMG,5] call _addWeaponKit;
            ["primary",_commonCCO] call _attachToWeapon;
            ["primary",_laser] call _attachToWeapon;
            
            [[_unit,            
                [_commonMG select 1,8],
                [_grenade,3],[_wsmoke,2]
            ]] call _addtoBackpack;

            [] call _addMedicBasics;
        }; 
        
// =============================================================================
//              ASSISTANT AUTOMATIC RIFLEMAN / MACHINEGUNNER
// =============================================================================      

        case "assistMG":
        {
            [_commonBackpack] call _addEmptyBackpack;
             
            [_commonrifleshort,5] call _addWeaponKit;
            ["primary",_commonCCO] call _attachToWeapon;
            ["primary",_laser] call _attachToWeapon;
            
            [[_unit,            
                [_commonMG select 1,5],
                [_grenade,2],[_wsmoke,1]
            ]] call _addtoBackpack;

            [] call _addMedicBasics;
        };
        
// =============================================================================
//                               ANTI-TANK
// =============================================================================        

        
        case "AT":
        {
            [_commonBackpack] call _addEmptyBackpack;
             
            [_commonrifleshort,5] call _addWeaponKit;
            ["primary",_commonCCO] call _attachToWeapon;
            ["primary",_laser] call _attachToWeapon;
            
            [_specAT] call _addWeapon;
            [[_unit,            
                [_specAT select 1,3]
            ]] call _addtoBackpack;
            
            [[_unit,
                [_grenade,2],[_wsmoke,2]
            ]] call _addtoVest;

            [] call _addMedicBasics;
        }; 
        
// =============================================================================
//                         ASSISTANT ANTI-TANK
// =============================================================================           

        case "assistAT":
        {
            [_commonBackpack] call _addEmptyBackpack;
             
            [_commonrifleshort,3] call _addWeaponKit;
            ["primary",_commonCCO] call _attachToWeapon;
            ["primary",_laser] call _attachToWeapon;
            
            [_commonAT,1] call _addWeaponKit;
            
            [[_unit,
                [_specAT select 1,3],[_wsmoke,1]
            ]] call _addtoBackpack;

            [] call _addMedicBasics;
        }; 
        
// =============================================================================
//                                MEDIC
// =============================================================================         
        
        case "medic":
        {
            [_commonBackpack] call _addEmptyBackpack;
             
            [_commonrifleshort,6] call _addWeaponKit;
            ["primary",_commonCCO] call _attachToWeapon;
            ["primary",_laser] call _attachToWeapon;
            
            [[_unit,
                [_bandage,30],[_morphine,20],[_epi,20],[_bloodbag,10],
                [_gsmoke,5],[_gchemlight,5]
            ]] call _addtoBackpack;

            [] call _addMedicBasics;
        };
        
// =============================================================================
//                                SNIPER
// =============================================================================        

        case "sniper":
        {
            ["BP"] call _addRadio;
            
            [_commonsniper,10] call _addWeaponKit;
            ["primary",_commonMagnified] call _attachToWeapon;
            ["primary",_laser] call _attachToWeapon;
            
            ["laserdesignator"] call _addBinocs;
            
            [[_unit,            
                [_rchemlight,5],[_gchemlight,5],[_bchemlight,5],
                [_wsmoke,2],[_rsmoke,2],[_gsmoke,2],[_IRstrobe,5]
            ]] call _addtoBackpack;

            [] call _addMedicBasics;
        };	
};