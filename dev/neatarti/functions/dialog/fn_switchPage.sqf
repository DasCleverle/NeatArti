#include "script_component.hpp"

disableSerialization;
params ["_control", "_type", ["_animate", true]];

if !(_type in PAGES) exitWith {};

private ["_display", "_grpWrapper", "_grpCurrent", "_grpNew"];
if(typeName _control == typeName displayNull) then {
    _display = _control;
}
else {
    _display = ctrlParent _control;
};

_grpWrapper = _display displayCtrl IDC_GRP_WRAPPER;

if(!isNull _grpWrapper && {_animate}) then {
    _grpCurrent = _display displayCtrl IDC_GRP_CONTENT;
    if (!isNull _grpCurrent) then {
        _grpCurrent ctrlSetPosition GRP_POS_INIT;
        _grpCurrent ctrlCommit ANIM_TIME;
        sleep ANIM_TIME;
    };
};
ctrlDelete _grpWrapper;

GVAR(currentAttackType) = _type;
_type = format ["%1_grp%2", QUOTE(ADDON), _type];

_grpWrapper = _display ctrlCreate [QGVAR(grpWrapper), IDC_GRP_WRAPPER];
_grpNew = _display ctrlCreate [_type, IDC_GRP_CONTENT, _grpWrapper];
_grpNew ctrlSetPosition GRP_POS_FINAL;

if(_animate) then {
    _grpNew ctrlCommit ANIM_TIME;
}
else {
    _grpNew ctrlCommit 0;
};