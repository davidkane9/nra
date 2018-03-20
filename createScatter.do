//preliminaries
clear
set more off

//load data
import delimited "/data/olenski_data/NRA/exhibits/injury_rate.csv", clear varnames(1)

//collapse to relative-week level
collapse (sum) gunshot total, by(rel_dates)

gen rate = gunshot/total * 100000

//plot
twoway (scatter rate rel_dates, connect(l) msymbol(s) lcolor(black) mcolor(black)) ///
	, graphregion(color(white)) ///
	legend(off) ///
	ytitle("Firearm-related injuries per 100,000 individuals",size(small)) ///
	xtitle("Weeks relative to NRA convention",size(small)) ///
	xlabel(-3(1)3,labsize(small)) name(unadj,replace) ///
	ylabel(1(0.2)2,labsize(small)) ///
	yscale(range(1(0.2)2))

