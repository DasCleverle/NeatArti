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
_weaponDir = _vehicle weaponDirection currentWeapon _vehicle;
_elev = (_weaponDir select 2) atan2 sqrt((_weaponDir select 0)^2 + (_weaponDir select 1)^2);
_elev = ROUND_NUMBER(_elev, 2);

// DIR
private ["_animPhase", "_turretDir", "_northedVectorDir", "_rotTurretDir", "_rotVectorUp", "_finalAngle", "_rotated", "_rotatedDir"];
_animPhase = deg (_vehicle animationPhase "mainturret");
_turretDir = (getDir _vehicle) - _animPhase;
if(_turretDir < 0) then { _turretDir = _turretDir + 360 };

/*_northedVectorDir = [vectorDir _vehicle, getDir _vehicle] call BIS_fnc_rotateVector2D;
_rotTurretDir = [_northedVectorDir, vectorUp _vehicle, - _turretDir] call FUNC(rotate3D);
_rotVectorUp = [vectorUp _vehicle, _rotTurretDir, 90] call FUNC(rotate3D);

_finalAngle = atan ((_rotTurretDir select 2) / sqrt((_rotTurretDir select 0)^2 + (_rotTurretDir select 1)^2));
_rotated = [_rotTurretDir, _rotVectorUp, - _finalAngle] call FUNC(rotate3D);
_rotatedDir = ((_rotated select 0) atan2 (_rotated select 1));
if(_rotatedDir < 0) then { _rotatedDir = _rotatedDir + 360 };*/

_dir = TOMILS(_turretDir);

// MODE
_mode = getArtilleryComputerSettings select 0;

((findDisplay IDD_DISPLAYMISSION) displayCtrl IDC_DLBL_BANK) ctrlSetText str _bank;
((findDisplay IDD_DISPLAYMISSION) displayCtrl IDC_DLBL_ELEV) ctrlSetText str _elev;
((findDisplay IDD_DISPLAYMISSION) displayCtrl IDC_DLBL_DIR) ctrlSetText str _dir;
((findDisplay IDD_DISPLAYMISSION) displayCtrl IDC_DLBL_MODE) ctrlSetText _mode;