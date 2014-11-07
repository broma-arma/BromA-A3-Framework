// By rocko adapted by nife
_vehicle = vehicle player;

cutText ["", "BLACK OUT",1];
sleep 1;
if (vehicle player != player) then {
    player action ["Eject", vehicle player];
    player enableSimulation false;
    sleep 2;
};
_pos = getposATL player;
headbugfix = createVehicle ["B_SDV_01_F", [0,0,0], [], 0, "NONE"];
player moveinDriver headbugfix;
sleep 1;
unassignVehicle player;
player action ["Eject", vehicle player];
deleteVehicle headbugfix;
player setposATL _pos;
sleep 1;
player setposATL _pos;
if (_vehicle != player) then {
    player enableSimulation true;
    sleep 1;
    player moveInAny _vehicle;    
};
cutText ["", "BLACK IN",1];