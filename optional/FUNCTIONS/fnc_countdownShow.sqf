//================================================================
//  Announce to the player how much time there's left in the mission
//  You are free to disable as many of these as you want 
//  in order to keep the players from knowing how much 
//  time they have left. It's also sort of annoying
//  to be reminded every 15 minutes.
//=================================================================
// == 2 Hours ==
if (countdown == 7200) then {           
    hintSilent "2 hours remaining in the mission!";               
};
//==================================================================
// == 1 Hour ==
if (countdown == 3600) then {           
    hintSilent "1 hour remaining in the mission!";               
}; 
//==================================================================
//    // == 45 minutes ==
//    if (countdown == 2700) then {           
//        hintSilent "45 minutes remaining in the mission!";               
//    };       
//==================================================================
//    // == 30 minutes ==
//    if (countdown == 1800) then {           
//        hintSilent "30 minutes remaining in the mission!";               
//    };
//==================================================================
// == 15 minutes ==
if (countdown == 900) then {           
    hintSilent "15 minutes remaining in the mission!";               
};
//==================================================================
//    // == 10 minutes ==
//    if (countdown == 600) then {           
//        hintSilent "10 minutes remaining in the mission!";               
//    };
//==================================================================
//    // == 5 minutes ==
//    if (countdown == 300) then {           
//        hintSilent "5 minutes remaining in the mission!";               
//    };
//==================================================================
// == 1 minute ==
if (countdown == 60) then {           
    hintSilent "1 minute remaining in the mission!";               
}; 
//==================================================================
//    // == 30 seconds ==
//    if (countdown == 30) then {           
//        hintSilent "30 seconds remaining in the mission!";               
//    }; 
//==================================================================
//    // == 15 seconds ==
//    if (countdown == 15) then {           
//        hintSilent "15 seconds remaining in the mission!";               
//    };
//==================================================================
//    // == 10 seconds ==
//    if (countdown == 10) then {           
//        hintSilent "10 seconds remaining in the mission!";               
//    };  
//==================================================================
// == And here we have a custom timer that 
// == repeats itself if the timer is smaller
// == than the number you decided, making
// == a sort of countdown.
if (countdown <= 10) then {     
    hintSilent format ["Time left: %1", countdown];               
};