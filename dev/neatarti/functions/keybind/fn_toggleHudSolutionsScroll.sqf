#include "script_component.hpp"

private ["_value"];
if(GVAR(hudSolutionsScrolling)) then {
    _value = -1;
    GVAR(hudSolutionsScrolling) = false;
}
else {
    _value = 0.5;
    GVAR(hudSolutionsScrolling) = true;
};

((findDisplay IDD_DISPLAYMISSION) displayCtrl IDC_LNB_SOLUTIONS) ctrlSetAutoScrollSpeed _value;
((findDisplay IDD_DISPLAYMISSION) displayCtrl IDC_LNB_SOLUTIONS) ctrlSetAutoScrollRewind true;