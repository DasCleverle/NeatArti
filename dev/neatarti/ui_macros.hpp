// IDD and IDCs
#define IDD_ARTICALC            12448
#define IDC_GRP_WRAPPER         12449
#define IDC_GRP_CONTENT         12450

// MAIN MENU
#define IDC_BTN_POINTATTACK     12451
#define IDC_BTN_LINEATTACK      12452
#define IDC_BTN_AREAATTACK      12453

#define IDC_TXT_SETTINGS_POSX   12454
#define IDC_TXT_SETTINGS_POSY   12455
#define IDC_TXT_SETTINGS_HEIGHT 12456
#define IDC_CMB_SETTINGS_ARTY   12457
#define IDC_BTN_SETTINGS_SAVE   12466
#define IDC_BTN_SETTINGS_GETPOS 12467

#define IDC_PGB_LOADING         12458
#define IDC_LBL_LOADING         12459

// COMMON ATTACK TYPES
#define IDC_CMB_MAGAZINE        12461

#define IDC_BTN_GO              12462
#define IDC_BTN_CLEAR           12463
#define IDC_BTN_BACK            12464

#define IDC_LNB_SOLUTIONS       12465
#define IDC_LBL_ERROR           12466
#define IDC_TB_SOLUTIONTYPE     12467

// POINT ATTACK
#define IDC_TXT_TPOSX           12501
#define IDC_TXT_TPOSY           12502
#define IDC_TXT_THEIGHT         12503

// LINE ATTACK
#define IDC_TXT_FROMPOSX        12601
#define IDC_TXT_FROMPOSY        12602
#define IDC_TXT_FROMHEIGHT      12603

#define IDC_TXT_TOPOSX          12604
#define IDC_TXT_TOPOSY          12605

#define IDC_TXT_COUNT           12606

// AREA ATTACK
#define IDC_TXT_RADIUS          12701

// Constants
#define DIALOG_X (safeZoneX + (safeZoneW - DIALOG_WIDTH) / 2)
#define DIALOG_Y (0)
#define DIALOG_WIDTH (2.25 * GUIMIN_3_2(1.2,2))
#define DIALOG_HEIGHT (4/3 * DIALOG_WIDTH)

#define DIALOG_POS x = DIALOG_X; y = DIALOG_Y
#define DIALOG_DIM w = DIALOG_WIDTH; h = DIALOG_HEIGHT
#define DIALOG_POS_DIM DIALOG_POS; DIALOG_DIM

#define GRP_X (DIALOG_X + 3.3 * GUIMIN_3_2(1.2, 25))
#define GRP_Y (DIALOG_Y + 5.3 * GUIMIN_3_2(1.2, 25))
#define GRP_WIDTH (18.5 * GUIMIN_3_2(1.2, 25))
#define GRP_HEIGHT (14.5 * GUIMIN_3_2(1.2, 25))

#define GRP_POS x = GRP_X; y = GRP_Y
#define GRP_DIM w = GRP_WIDTH; h = GRP_HEIGHT
#define GRP_POS_DIM GRP_POS; GRP_DIM

#define COLUMNS 7
#define ROWS 18

#define CELL_MARGIN (0.1 * GUIMIN_3_2(1.2, 25))
#define CELL_WIDTH (GRP_WIDTH / COLUMNS)
#define CELL_HEIGHT (GRP_HEIGHT / ROWS)

#define CELL_FONTSIZE (0.75 * CELL_HEIGHT)

#define GRP_POS_INIT [-GRP_WIDTH, 0, GRP_WIDTH, GRP_HEIGHT]
#define GRP_POS_FINAL [0, 0, GRP_WIDTH, GRP_HEIGHT]

#define ANIM_TIME 0.2

// Functional Macros
#define GUIMIN_1(var1)                  GUIMIN_2(var1, var1)
#define GUIMIN_2(var1, var2)            (((safezoneW / safezoneH) min var1) / var2)
#define GUIMIN_3(var1, var2, var3)      (GUIMIN_2(var1, var2) / var3)
#define GUIMIN_3_2(var1, var2)          GUIMIN_3(var1, var1, var2)

#define SHOWERROR(display, error) ((display displayCtrl IDC_LBL_ERROR) ctrlSetText error)

#include "ui_template.hpp"