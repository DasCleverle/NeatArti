#include "script_component.hpp"

params ["_display"];

{
    private ["_varName", "_value"];
    _varName = format ["%1_input_%2", QUOTE(ADDON), ctrlIDC _x];
    switch (ctrlType _x) do {
        case CT_TEXTBOX: {
            missionNamespace setVariable [_varName, ctrlText _x];
        };
        case CT_COMBO: {
            missionNamespace setVariable [_varName, lbCurSel _x];
        };
        default {};
    };
} foreach allControls _display;