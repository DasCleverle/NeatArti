#include "script_component.hpp"

disableSerialization;
params ["_control"];

private ["_display", "_cmbMagazine", "_btnGo", "_btnClear", "_btnBack", "_tbSolutionType", "_lnbSolutions"];
_display = ctrlParent _control;
_cmbMagazine = _display displayCtrl IDC_CMB_MAGAZINE;

_btnGo = _display displayCtrl IDC_BTN_GO;
_btnClear = _display displayCtrl IDC_BTN_CLEAR;
_btnBack = _display displayCtrl IDC_BTN_BACK;

_tbSolutionType = _display displayCtrl IDC_TB_SOLUTIONTYPE;
_lnbSolutions = _display displayCtrl IDC_LNB_SOLUTIONS;

_btnGo ctrlAddEventHandler ["ButtonClick", { _this spawn FUNC(btnGo_click) }];
_btnClear ctrlAddEventHandler ["ButtonClick", { _this spawn FUNC(btnClear_click) }];
_btnBack ctrlAddEventHandler ["ButtonClick", { _this spawn FUNC(btnBack_click) }];

lbClear _cmbMagazine;
{
    _cmbMagazine lbAdd _x;
} foreach GVAR(magazineNames);

_tbSolutionType ctrlAddEventHandler ["ToolBoxSelChanged", { _this spawn FUNC(setSolutionType); }];
_tbSolutionType lbSetCurSel GVAR(solutionTypeIndex);

[_lnbSolutions, GVAR(solutionType)] call FUNC(setSolutions);

[_display] call FUNC(loadInputs);