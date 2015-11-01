#include "script_component.hpp"

if(QGVAR(hudArtyInfo) in GVAR(visibleHuds)) then {
    [QGVAR(hudArtyInfo), IDC_HUD_ARTYINFO] call FUNC(closeHud);
}
else {
    [QGVAR(hudArtyInfo), IDC_HUD_ARTYINFO] call FUNC(openHud);
};

true;