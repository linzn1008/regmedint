
/** Set libname */
libname w './';

/* Load SAS macro */
%include './mediation.sas';

/* Load data */
proc import datafile = './data-pbc_cc.csv'
    out = pbc_cc
    dbms = csv
    replace;
run;
%mediation(
    data = pbc_cc,
    yvar = spiders,
    avar = trt,
    mvar = bili_bin,
    cvar = ,
    a0 = 1,
    a1 = 2,
    m = 1,
    yreg = loglinear,
    mreg = logistic,
    interaction = true,
    casecontrol = false,
    output = ,
    c = ,
    boot = ,
    cens = cens);
run;