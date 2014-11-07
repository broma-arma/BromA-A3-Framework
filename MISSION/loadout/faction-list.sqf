_type = _this select 0;
_object = _this select 1;
_unit = _object;
_faction = _this select 2;

#include "loadout_init.sqf"

switch (toUpper(_faction)) do {
    
    case "BLUFOR": {
        #include "factions\fac_nato.sqf"
        
        #include "factions\cargo_generic.sqf"        
        #include "factions\structure_generic.sqf"
    };
    
    case "INDFOR": {                
        #include "factions\fac_aaf.sqf"
        
        #include "factions\cargo_generic.sqf"        
        #include "factions\structure_generic.sqf"
    };
    
    case "OPFOR": {                
        #include "factions\fac_csat.sqf"
        
        #include "factions\cargo_generic.sqf"        
        #include "factions\structure_generic.sqf"
    };    
            
    case "NATO": {                
        #include "factions\fac_nato.sqf"
        
        #include "factions\cargo_generic.sqf"        
        #include "factions\structure_generic.sqf"
    };
    
    case "CSAT": {        
        #include "factions\fac_csat.sqf"   
        
        #include "factions\cargo_generic.sqf"        
        #include "factions\structure_generic.sqf"
    };
    
    case "AAF": {        
        #include "factions\fac_aaf.sqf"     
        
        #include "factions\cargo_generic.sqf"        
        #include "factions\structure_generic.sqf"
    };
    
    case "ARMALITES": {        
        #include "factions\fac_armalites.sqf" 
        
        #include "factions\cargo_generic.sqf"        
        #include "factions\structure_generic.sqf"
    };  
    
    case "AKS": {        
        #include "factions\fac_aks.sqf"   
        
        #include "factions\cargo_generic.sqf"        
        #include "factions\structure_generic.sqf"
    };  
    
    case "HKS": {        
        #include "factions\fac_hks.sqf"  
        
        #include "factions\cargo_generic.sqf"        
        #include "factions\structure_generic.sqf"
    };
    
    case "FAMAS": {        
        #include "factions\fac_famas.sqf"  
        
        #include "factions\cargo_generic.sqf"        
        #include "factions\structure_generic.sqf"
    };     
    
};