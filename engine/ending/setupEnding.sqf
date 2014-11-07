//Written by beta
//Init file
sleep 1;  //wait until mission starts
fnc_EndingAssessment = compile preprocessFileLineNumbers (ENGINE_PATH+"ending\pointAssessment.sqf");
["ending_assessment", fnc_EndingAssessment] call CBA_fnc_addEventHandler;