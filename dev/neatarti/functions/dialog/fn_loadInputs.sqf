#include "script_component.hpp"

params ["_display"];

{
    private ["_varName", "_value"];
    _varName = format ["%1_input_%2", QUOTE(ADDON), ctrlIDC _x];
    switch (ctrlType _x) do {
        case CT_TEXTBOX: {
            _x ctrlSetText (missionNamespace getVariable [_varName, ""]);
        };
        case CT_COMBO: {
            _x lbSetCurSel (missionNamespace getVariable [_varName, 0]);
        };
        default {};
    };
} foreach allControls _display;