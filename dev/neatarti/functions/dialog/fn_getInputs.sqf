#include "script_component.hpp"

params ["_display"];

private ["_inputs", "_errorState", "_targetPosX", "_targetPosY", "_targetHeight", "_magazine", "_correctionNS", "_correctionWE", "_y"];
_inputs = [];
_errorState = false;

if(!GVAR(settingsSaved)) exitWith { SHOWERROR(_display, "Invalid operation: Settings missing."); };

SHOWERROR(_display, "");

_targetPosX = ctrlText (_display displayCtrl IDC_TXT_TPOSX);
_targetPosY = ctrlText (_display displayCtrl IDC_TXT_TPOSY);
_targetHeight = ctrlText (_display displayCtrl IDC_TXT_THEIGHT);
_magazine = lbCurSel (_display displayCtrl IDC_CMB_MAGAZINE);

_correctionNS = ctrlText (_display displayCtrl IDC_TXT_CORR_NS);
_correctionWE = ctrlText (_display displayCtrl IDC_TXT_CORR_WE);
if(_correctionNS == "") then { _correctionNS = "0"; };
if(_correctionWE == "") then { _correctionWE = "0"; };

if(!COORD_IS_VALID(_targetPosX))   exitWith { SHOWERROR(_display, "Invalid format: TPOS"); };
if(!COORD_IS_VALID(_targetPosY))   exitWith { SHOWERROR(_display, "Invalid format: TPOS"); };
if(!CAN_BE_PARSED(_targetHeight)) exitWith { SHOWERROR(_display, "Invalid format: THEIGHT"); };
if(_magazine == -1) exitWith { SHOWERROR(_display, "Invalid operation: No magazine found."); };

if(!CAN_BE_PARSED(_correctionNS)) exitWith { SHOWERROR(_display, "Invalid format: CORR N/S"); };
if(!CAN_BE_PARSED(_correctionWE)) exitWith { SHOWERROR(_display, "Invalid format: CORR W/E"); };

_inputs pushBack [
    parseNumber _targetPosX + parseNumber _correctionWE,
    ([parseNumber _targetPosY] call FUNC(correctY)) + parseNumber _correctionNS
];
_inputs pushBack ((parseNumber _targetHeight) - GVAR(settingsHeight));
_inputs pushBack (GVAR(magazineConfigs) select _magazine);

switch(GVAR(attackType)) do {
    case "line": {
        private ["_range", "_direction", "_count"];

        _range = ctrlText (_display displayCtrl IDC_TXT_RANGE);
        _direction = ctrlText (_display displayCtrl IDC_TXT_DIRECTION);
        _count = ctrlText (_display displayCtrl IDC_TXT_COUNT);

        if(!CAN_BE_PARSED(_range))      exitWith { SHOWERROR(_display, "Invalid format: RANGE"); _errorState = true; };
        if(!CAN_BE_PARSED(_direction))  exitWith { SHOWERROR(_display, "Invalid format: DIR"); _errorState = true; };
        if(!CAN_BE_PARSED(_count))      exitWith { SHOWERROR(_display, "Invalid format: COUNT"); _errorState = true; };

        _inputs pushBack parseNumber _range;
        _inputs pushBack parseNumber _direction;
        _inputs pushBack parseNumber _count;
    };
    case "area": {
        private ["_radius", "_count"];

        _radius = ctrlText (_display displayCtrl IDC_TXT_RADIUS);
        _count =  ctrlText (_display displayCtrl IDC_TXT_COUNT);

        if(!CAN_BE_PARSED(_radius)) exitWith { SHOWERROR(_display, "Invalid format: RADIUS"); _errorState = true; };
        if(!CAN_BE_PARSED(_count))  exitWith { SHOWERROR(_display, "Invalid format: COUNT"); _errorState = true; };

        _inputs pushBack parseNumber _radius;
        _inputs pushBack parseNumber _count;
    };
};

if(_errorState) exitWith { };

_inputs;