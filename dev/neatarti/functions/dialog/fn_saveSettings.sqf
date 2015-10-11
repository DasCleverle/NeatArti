#include "script_component.hpp"

disableSerialization;

params ["_control"];

private ["_display", "_weaponConfig", "_magazines", "_modes"];
_display = ctrlParent _control;

_txtSettingsPosX = _display displayCtrl IDC_TXT_SETTINGS_POSX;
_txtSettingsPosY = _display displayCtrl IDC_TXT_SETTINGS_POSY;
_txtSettingsHeight = _display displayCtrl IDC_TXT_SETTINGS_HEIGHT;
_cmbSettingsWeapon = _display displayCtrl IDC_CMB_SETTINGS_ARTY;

GVAR(settingsPos) = [parseNumber ctrlText _txtSettingsPosX, parseNumber ctrlText _txtSettingsPosY];
GVAR(settingsHeight) = parseNumber ctrlText _txtSettingsHeight;
GVAR(settingsWeapon) = lbCurSel _cmbSettingsWeapon;

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