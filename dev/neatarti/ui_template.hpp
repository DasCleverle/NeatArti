#define CELL(X, Y) \
    x = (X) * (CELL_WIDTH + CELL_MARGIN); \
    y = (Y) * (CELL_HEIGHT + 4/3 * CELL_MARGIN)

#define CELLSPAN(W, H) \
    w = (W) * CELL_WIDTH + ((W) - 1) * CELL_MARGIN; \
    h = (H) * CELL_HEIGHT + ((H) - 1) * 4/3 * CELL_MARGIN

#define STYLE \
    sizeEx = CELL_FONTSIZE; \
    font = "EtelkaMonospacePro"

#define HEADLINE(TEXT) \
    class lblHeadline: GVAR(Label) { \
        CELL(0, 0); \
        CELLSPAN(6, 2); \
        text = TEXT; \
        sizeEx = 2 * CELL_FONTSIZE; \
    }

#define DATALABEL(ID, IDC, X, Y, TEXT) \
    class dlbl##ID##: GVAR(Label) { \
        idc = IDC; \
        CELL(X, Y); \
        text = TEXT; \
    }

#define LABEL(ID, X, Y, TEXT) \
    class lbl##ID##: GVAR(Label) { \
        CELL(X, Y); \
        text = TEXT; \
    }

#define ERRORLABEL \
    class lblError: GVAR(Label) { \
        idc = IDC_LBL_ERROR; \
        CELL(0, 14); \
        CELLSPAN(7,1); \
    }

#define INPUT(ID, IDC, X, Y) \
    class txt##ID##: GVAR(TextBox) { \
        idc = IDC; \
        CELL(X, Y); \
    }

#define LABELED_INPUT(ID, IDC, X, Y, TEXT) LABEL(ID, X, Y, TEXT); INPUT(ID, IDC, X, Y + 1)

#define POS_INPUT(IDX, IDY, IDCX, IDCY, X, Y, TEXT) LABELED_INPUT(IDX, IDCX, X, Y, TEXT); INPUT(IDY, IDCY, X + 1, Y + 1)

#define COMBO(ID, IDC, X, Y) \
    class cmb##ID##: GVAR(ComboBox) { \
        idc = IDC; \
        CELL(X, Y); \
    }

#define LABELED_COMBO(ID, IDC, X, Y, TEXT) LABEL(ID, X, Y, TEXT); COMBO(ID, IDC, X, Y + 1)

#define BUTTON(ID, IDC, X, Y, TEXT) \
    class btn##ID##: GVAR(Button) { \
        idc = IDC; \
        text = TEXT; \
        CELL(X, Y); \
    }

#define SOLUTIONS(Y) \
    class tbSolutionType: GVAR(Toolbox) { \
        idc = IDC_TB_SOLUTIONTYPE; \
        rows = 1; \
        columns = 2; \
        strings[] = {"H", "L"}; \
        values[] = {"H", "L"}; \
        CELL(0,Y); \
        CELLSPAN(2/3,1); \
    }; \
    class btnDummyLeft: GVAR(ButtonDummy) { \
        idc = -2; \
    }; \
    class btnDummyRight: GVAR(ButtonDummy) { \
        idc = -3; \
    }; \
    class lnbSolutions: GVAR(Solutions) { \
        CELL(0,Y + 1); \
    }


#define CORRECTIONS(X, Y) \
    LABELED_INPUT(CorrNorthSouth,IDC_TXT_CORR_NS,X,Y,"CORR N/S"); \
    LABELED_INPUT(CorrWestEast,IDC_TXT_CORR_WE,X+1,Y,"CORR W/E")
