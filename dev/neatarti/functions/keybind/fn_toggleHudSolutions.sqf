#include "script_component.hpp"

if(QGVAR(hudSolutions) in GVAR(visibleHuds)) then {
    [QGVAR(hudSolutions), IDC_HUD_SOLUTIONS] call FUNC(closeHud);
}
else {
    [QGVAR(hudSolutions), IDC_HUD_SOLUTIONS] call FUNC(openHud);
};

true;