#include "script_component.hpp"

if(QGVAR(hudSolutions) in GVAR(visibleHuds) || { !(QGVAR(calculator) in items player) }) then {
    [QGVAR(hudSolutions), IDC_HUD_SOLUTIONS] call FUNC(closeHud);
}
else {
    [QGVAR(hudSolutions), IDC_HUD_SOLUTIONS] call FUNC(openHud);
};

true;