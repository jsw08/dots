static const char norm_fg[] = "#abbcba";
static const char norm_bg[] = "#070E19";
static const char norm_border[] = "#778382";

static const char sel_fg[] = "#abbcba";
static const char sel_bg[] = "#E0602D";
static const char sel_border[] = "#abbcba";

static const char urg_fg[] = "#abbcba";
static const char urg_bg[] = "#A04D32";
static const char urg_border[] = "#A04D32";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
