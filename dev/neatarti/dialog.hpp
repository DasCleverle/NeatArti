class RscControlsGroupNoScrollbars;
class RscPicture;
class RscButton;
class RscText;
class RscEdit;
class RscCombo;
class RscListNBox;
class RscToolbox;

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

    onButtonClick = 'diag_log (_this select 0)';
};

class GVAR(ButtonInvisible): GVAR(Button) {
    colorText[] = {COLOR_BLACK};
    colorBackground[] = {COLOR_TR};
    colorBackgroundActive[] = {COLOR_TR};
    colorFocused[] = {COLOR_TR};

    CELLSPAN(1/3, 1);
};

class GVAR(ButtonDummy): GVAR(ButtonInvisible) {
    CELL(0, 0);
    CELLSPAN(0.1, 0.1);
};

class GVAR(Box): GVAR(Label) {
    colorBackground[] = {COLOR_WHITE_TR50};

    CELLSPAN(1/3, 1);
};

class GVAR(Solutions): RscListNBox {
    idc = 122;
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

class GVAR(grpPointAttack): RscControlsGroupNoScrollbars {
    idc = IDC_GRP_MAINMENU;
    GRP_POS_DIM;

    class controls {
        HEADLINE("POINT ATTACK");

        POS_INPUT(PosX,PosY,21,22,0,2,"POS");
        LABELED_INPUT(Height,25,2,2,"HEIGHT");
        LABELED_COMBO(Arti,40,3,2,"ARTI");

        POS_INPUT(TPosX,TPosY,23,24,0,4,"TPOS");
        LABELED_INPUT(THeight,25,2,4,"THEIGHT");
        LABELED_COMBO(Mode,41,3,4,"MODE");

        LABELED_COMBO(Magazine,42,3,6,"MAGAZINE");

        BUTTON(Go,55,0,7,"GO");
        BUTTON(Clear,56,1,7,"CLEAR");
        BUTTON(Back,57,2,7,"BACK");

        SOLUTIONS(8);
    };
};

class GVAR(dialogArticalc) {
    idd = IDD_ARTICALC;

    class controls {
        class bgMain: RscPicture {
            idc = -1;
            text = QDATAPATH(background_tablet.paa);

            DIALOG_POS;
            DIALOG_DIM;
        };

        class grpPointAttack: GVAR(grpPointAttack) {};
    };
};

