#include "script_component.hpp"

if(GVAR(hudSolutionsVisible)) then {
    call FUNC(closeHudSolutions);
}
else {
    call FUNC(openHudSolutions);
};

true;