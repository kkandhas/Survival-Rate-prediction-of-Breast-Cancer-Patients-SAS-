*;
*;
* HATCO - Multiple Regression Analysis;
*;
    ods graphics on;
*;
options ls=80 ps=50 nodate pageno=1;
*;*;
*;
* HATCO - Multiple Regression Analysis;
*;
    ods graphics on;
*;
options ls=80 ps=50 nodate pageno=1;
*;
* Input HATCO ;
*;
Data HATCO;
Infile '/folders/myfolders/HATCO_X1_X14.txt' DLM = '09'X TRUNCOVER;
Input  X1 X2 X3 X4 X5 X6 X7 X8 X9 X10 X11 X12 X13 X14;
*;
Data HATCO;
	Set HATCO (Keep = X1 X2 X3 X4 X5 X6 X7 X8 X9 X10 X11 X12 X13 X14);
	Label X1 = 'X1 - Delivery speed'
		  X2 = 'X2 - Price level‐'
		  X3 = 'X3 - Price flexibility‐'
		  X4 = 'X4 - Manufacturer"s image'
		  X5 = 'X5 - Service'
		  X6 = 'X6 - Salesforce"s image'
	      X7 = 'X7 - Product quality'
	      X8 = 'X8 - Size of firm'
          X9 = 'X9 - Usage level';
*;
Proc Print Data = HATCO;
*;
*;
* Correlation Matrix - All Variables;
*;
Proc Corr Data = HATCO;
    Var X1 X2 X3 X4 X5 X6 X7 X9;
*;
*;
* Regression Analysis - X19 = X9;
*;
Proc Reg Data = HATCO plots(unpack);
	Model X9 = X5 / STB Influence P R VIF Tol;
	Plot NQQ.*R. NPP.*R.; * NQQ.*R and NPP.*R request specific separate Normal Quantile and Normal Probability Plots;
*;
*;
Proc Reg Data = HATCO Corr Simple plots(unpack);
	Model X9 = X1 X2 X3 X4 X5 X6 X7 / Selection=Stepwise SLEntry=0.05 STB Influence P R VIF Tol;
	Plot NQQ.*R. NPP.*R.;
*;
*;
Proc Reg Data = HATCO Corr Simple plots(unpack);
	Model X9 = X1 X2 X3 X4 X5 X6 X7 / alpha=0.05 STB Influence P R VIF Tol;
	Plot NQQ.*R. NPP.*R.;
*;
*;
Proc Reg Data = HATCO Corr Simple plots(unpack);
	Model X9 = X3 X5 X6 X8  / STB Influence P R VIF Tol;
	Plot NQQ.*R. NPP.*R.;
*;
*;
*Proc Reg Data = HATCO Corr Simple plots(unpack);
*	Model X19 = X3 X6 X7 X9 X11 X12 / STB Influence P R VIF Tol;
*	Plot NQQ.*R. NPP.*R.;
*;
*;
*	ods graphics off;
*;
*;
Run;
Quit;
SLEntry=0.05SLEntry=0.05