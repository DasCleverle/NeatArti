class RscControlsGroupNoScrollbars;
class RscPicture;
class RscButton;
class RscText;
class RscEdit;
class RscCombo;
class RscListNBox;
class RscToolbox;
class RscProgress;

class GVAR(Label): RscText {
    idc = -1;
    CELLSPAN(1,1);

    STYLE;
    shadow = 0;
    colorText[] = {COLOR_BLACK};
};

class GVAR(TextBox): RscEdit  {
    idc = -1;
    CELLSPAN(1,1);

    STYLE;
    shadow = 0;
    colorText[] = {COLOR_BLACK};
    colorSelection[] = {COLOR_WHITE_TR25};
};

class GVAR(ComboBox): RscCombo {
    idc = -1;
    CELLSPAN(2,1);

    STYLE;
    colorBackground[] = {COLOR_BLACK_TR50};
};

class GVAR(Button): RscButton {
    idc = -1;
    CELLSPAN(1,1);
    STYLE;
    shadow = 0;
};

class GVAR(ButtonDummy): GVAR(Button) {
    colorText[] = {COLOR_TR};
    colorBackground[] = {COLOR_TR};
    colorBackgroundActive[] = {COLOR_TR};
    colorFocused[] = {COLOR_TR};

    CELL(0, 0);
    CELLSPAN(0.1, 0.1);
};

class GVAR(Solutions): RscListNBox {
    idc = IDC_LNB_SOLUTIONS;
    CELLSPAN(3, 8);

    STYLE;
    shadow = 0;

    columns[] = {0, 3/32, 11/32, 35/64, 12/16};
    drawSideArrows = 0;
    idcLeft = -2;
    idcRight = -3;
    rowHeight = CELL_HEIGHT;
    color[] = {COLOR_WHITE};
    colorText[] = {COLOR_BLACK};
    colorDisabled[] = {COLOR_BLACK};
    colorScrollbar[] = {COLOR_WHITE};
    colorSelect[] = {COLOR_BLACK};
    colorSelect2[] = {COLOR_BLACK};
    colorSelectBackground[] = {COLOR_TR};
    colorSelectBackground2[] = {COLOR_TR};
    colorBackground[] = {COLOR_BLACK_TR50};
    soundSelect[] = {"",0,0};
    colorShadow[] = {COLOR_TR};
    period = 1;
};

class GVAR(ToolBox): RscToolbox {
    rows = 1;
    columns = 2;

    STYLE;
    shadow = 0;

    colorText[] = {COLOR_BLACK};
    colorBackground[] = {COLOR_WHITE_TR50};
    colorTextSelect[] = {COLOR_WHITE};
    colorSelectedBg[] = {COLOR_BLACK_TR80};

    strings[] = {"H", "L"};
    values[] = {"H", "L"};

    CELLSPAN(2/3,1);
};

class GVAR(grpMain): RscControlsGroupNoScrollbars {
    idc = IDC_GRP_MAIN;
    GRP_DIM;
    x = -GRP_WIDTH;
    onLoad = _this spawn FUNC(main_onLoad);

    class controls {
        HEADLINE("MAIN MENU");

        class lblAttackTypes: GVAR(Label) {
            text = "Attack Types";

            CELL(0,2);
            CELLSPAN(2,1);
        };

        class btnPointAttack: GVAR(Button) {
            idc = IDC_BTN_POINTATTACK;
            text = "Point Attack";

            CELL(0,3);
            CELLSPAN(2,1);
        };

        class btnLineAttack: GVAR(Button) {
            idc = IDC_BTN_LINEATTACK;
            text = "Line Attack";

            CELL(0,4);
            CELLSPAN(2,1);
        };

        class btnAreaAttack: GVAR(Button) {
            idc = IDC_BTN_AREAATTACK;
            text = "Area Attack";

            CELL(0,5);
            CELLSPAN(2,1);
        };

        POS_INPUT(PosX,PosY,IDC_TXT_SETTINGS_POSX,IDC_TXT_SETTINGS_POSY,2,2,"POS");
        LABELED_INPUT(Height,IDC_TXT_SETTINGS_HEIGHT,2,4,"HEIGHT");
        LABELED_COMBO(Arti,IDC_CMB_SETTINGS_ARTY,3,4,"ARTILLERY");

        BUTTON(GetPosition,IDC_BTN_SETTINGS_GETPOS,4,3,"Get Pos");
        BUTTON(SaveSettings,IDC_BTN_SETTINGS_SAVE,4,4,"Save");

        class pgbLoading: RscProgress {
            idc = IDC_PGB_LOADING;
            colorBar[] = {COLOR_BLACK_TR50};

            CELL(2,6);
            CELLSPAN(3,1);
        };

        class lblLoading: GVAR(Label) {
            idc = IDC_LBL_LOADING;
            style = 0x02; // centered

            CELL(2,7);
            CELLSPAN(3,1);
        };
    };
};

class GVAR(grpPoint): RscControlsGroupNoScrollbars {
    idc = IDC_GRP_POINT;
    x = -GRP_WIDTH;
    GRP_DIM;

    onLoad = _this spawn FUNC(attackType_onLoad);
    onUnload = "systemChat 'unload'";

    class controls {
        HEADLINE("POINT ATTACK");

        POS_INPUT(TPosX,TPosY,IDC_TXT_TPOSX,IDC_TXT_TPOSY,0,2,"TPOS");
        LABELED_INPUT(THeight,IDC_TXT_THEIGHT,2,2,"THEIGHT");

        LABELED_COMBO(Magazine,IDC_CMB_MAGAZINE,3,2,"MAGAZINE");

        BUTTON(Go,IDC_BTN_GO,0,4,"GO");
        BUTTON(Clear,IDC_BTN_CLEAR,1,4,"CLEAR");
        BUTTON(Back,IDC_BTN_BACK,2,4,"BACK");

        SOLUTIONS(5);
    };
};

class GVAR(grpLine): RscControlsGroupNoScrollbars {
    idc = IDC_GRP_LINE;
    x = -GRP_WIDTH;
    GRP_DIM;

    onLoad = _this spawn FUNC(attackType_onLoad);

    class controls {
        HEADLINE("LINE ATTACK");

        POS_INPUT(FromPosX,FromPosY,IDC_TXT_FROMPOSX,IDC_TXT_FROMPOSY,0,2,"FROMPOS");
        LABELED_INPUT(FromHeight,IDC_TXT_FROMHEIGHT,2,2,"FROMHEIGHT");
        LABELED_COMBO(Magazine,IDC_CMB_MAGAZINE,3,2,"MAGAZINE");

        POS_INPUT(ToPosX,ToPosY,IDC_TXT_TOPOSX,IDC_TXT_TOPOSY,0,4,"TOPOS");
        LABELED_INPUT(Count,IDC_TXT_COUNT,2,4,"COUNT");

        BUTTON(Go,IDC_BTN_GO,0,6,"GO");
        BUTTON(Clear,IDC_BTN_CLEAR,1,6,"CLEAR");
        BUTTON(Back,IDC_BTN_BACK,2,6,"BACK");

        SOLUTIONS(7);
    };
};

class GVAR(grpArea): RscControlsGroupNoScrollbars {
    idc = IDC_GRP_AREA;
    x = -GRP_WIDTH;
    GRP_DIM;

    onLoad = _this spawn FUNC(attackType_onLoad);

    class controls {
        HEADLINE("AREA ATTACK");

        POS_INPUT(TPosX,TPosY,IDC_TXT_TPOSX,IDC_TXT_TPOSY,0,2,"TPOS");
        LABELED_INPUT(THeight,IDC_TXT_THEIGHT,2,2,"THEIGHT");
        LABELED_COMBO(Magazine,IDC_CMB_MAGAZINE,3,2,"MAGAZINE");

        LABELED_INPUT(Radius,IDC_TXT_RADIUS,0,4,"RADIUS");

        BUTTON(Go,IDC_BTN_GO,0,6,"GO");
        BUTTON(Clear,IDC_BTN_CLEAR,1,6,"CLEAR");
        BUTTON(Back,IDC_BTN_BACK,2,6,"BACK");

        SOLUTIONS(7);
    };
};

class GVAR(grpWrapper): RscControlsGroupNoScrollbars {
    idc = IDC_GRP_WRAPPER;
    GRP_POS_DIM;
    onUnload = "systemChat 'unload'";
};

class GVAR(dialogArticalc) {
    idd = IDD_ARTICALC;
    onLoad = _this spawn FUNC(dialog_onLoad);

    class controls {
        class bgMain: RscPicture {
            idc = -1;
            text = QDATAPATH(background_tablet.paa);

            DIALOG_POS_DIM;
        };
    };
};

