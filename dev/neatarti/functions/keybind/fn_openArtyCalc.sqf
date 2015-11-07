#include "script_component.hpp"

if(dialog || { !(QGVAR(calculator) in items player) }) exitWith {};

createDialog QGVAR(dialogArticalc);