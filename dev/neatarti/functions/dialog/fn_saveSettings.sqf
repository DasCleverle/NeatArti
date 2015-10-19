#include "script_component.hpp"

disableSerialization;

params ["_control"];

private ["_display", "_weaponConfig", "_magazines", "_modes", "_posX", "_posY", "_height"];
_display = ctrlParent _control;

_txtSettingsPosX = _display displayCtrl IDC_TXT_SETTINGS_POSX;
_txtSettingsPosY = _display displayCtrl IDC_TXT_SETTINGS_POSY;
_txtSettingsHeight = _display displayCtrl IDC_TXT_SETTINGS_HEIGHT;
_cmbSettingsWeapon = _display displayCtrl IDC_CMB_SETTINGS_ARTY;

_posX = ctrlText _txtSettingsPosX;
_posY = ctrlText _txtSettingsPosY;
_height = ctrlText _txtSettingsHeight;
if(!CAN_BE_PARSED(_posX)) then { _posX = "0"; };
if(!CAN_BE_PARSED(_posY)) then { _posY = "0"; };
if(!CAN_BE_PARSED(_height)) then { _height = "0"; };

GVAR(settingsPos) = [parseNumber _posX, [parseNumber _posY] call FUNC(correctY)];
GVAR(settingsHeight) = parseNumber _height;
GVAR(settingsWeapon) = lbCurSel _cmbSettingsWeapon;
if(GVAR(settingsWeapon) == -1) then { GVAR(settingsWeapon) = 0; };

[_display] call FUNC(loadSettings);

_weaponConfig = GVAR(weaponConfigs) select GVAR(settingsWeapon);
_magazines = getArray(_weaponConfig >> "magazines");
_modes = getArray(_weaponConfig >> "modes");

GVAR(modeConfigs) = [];
{
    _config = _weaponConfig >> _x;
    if(getNumber(_config >> "showToPlayer") != 0) then {
        GVAR(modeConfigs) pushBack _config;
    };
} foreach _modes;

GVAR(magazineConfigs) = [];
GVAR(magazineNames) = [];
{
    _config = configFile >> "CfgMagazines" >> _x;
    if !(_config in GVAR(magazineConfigs)) then {
        GVAR(magazineConfigs) pushBack _config;
        GVAR(magazineNames) pushBack getText(_config >> "displayName");
    };
} foreach _magazines;

GVAR(settingsSaved) = true;