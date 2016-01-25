#include "script_component.hpp"

if !(QGVAR(hudArtyInfo) in GVAR(visibleHuds)) exitWith {};
if (vehicle player == player) exitWith { [QGVAR(hudArtyInfo), IDC_HUD_ARTYINFO] call FUNC(closeHud); };

private ["_vehicle", "_vectorUp", "_weaponDir", "_bank", "_elev", "_dir", "_mode"];

_vehicle = vehicle player;

// BANK
_vectorUp = vectorUp _vehicle;
_vectorUp = [_vectorUp, getDir _vehicle] call BIS_fnc_rotateVector2D;
if(_vectorUp select 2 != 0) then {
    _bank = atan ((_vectorUp select 0) / (_vectorUp select 2));
}
else {
    _bank = 0;
};

_bank = ROUND_NUMBER(_bank, 2);

// ELEV
_weaponDir = _vehicle weaponDirection (currentWeapon _vehicle);
_elev = asin (_weaponDir select 2);
_elev = ROUND_NUMBER(_elev, 2);

// MODE
_mode = getArtilleryComputerSettings select 0;

// Props to ACE 3 for finding out this :)
// DIR
_dirArray = [];
if(GVAR(looksAtSky)) then {
    _dirArray = _weaponDir;
}
else {
    _dirArray = positionCameraToWorld [0,0,0] vectorFromTo positionCameraToWorld [0,0,10];
};
_dir = (_dirArray select 0) atan2 (_dirArray select 1);
_dir = TOMILS(_dir);

((findDisplay IDD_DISPLAYMISSION) displayCtrl IDC_DLBL_BANK) ctrlSetText str _bank;
((findDisplay IDD_DISPLAYMISSION) displayCtrl IDC_DLBL_ELEV) ctrlSetText str _elev;
((findDisplay IDD_DISPLAYMISSION) displayCtrl IDC_DLBL_DIR) ctrlSetText str _dir;
((findDisplay IDD_DISPLAYMISSION) displayCtrl IDC_DLBL_MODE) ctrlSetText _mode;