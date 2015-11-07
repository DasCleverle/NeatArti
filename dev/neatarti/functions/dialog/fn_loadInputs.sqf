#include "script_component.hpp"

params ["_display", ["_clear", false]];

{
    private ["_varName", "_value"];
    _varName = format ["%1_input_%2", QUOTE(ADDON), ctrlIDC _x];
    switch (ctrlType _x) do {
        case CT_TEXTBOX: {
            if(_clear) then { _value = ""; } else { _value = missionNamespace getVariable [_varName, ""]; };
            _x ctrlSetText _value;
        };
        case CT_COMBO: {
            if(_clear) then { _value = 0; } else { _value = missionNamespace getVariable [_varName, 0]; };
            _x lbSetCurSel _value;
        };
        default {};
    };
} foreach allControls _display;