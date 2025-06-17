*! Version1.0 Ryan Thombs 12/30/21


capture program drop eiwb
program define eiwb
 
        syntax varlist(min=2 max=2) [,vname(string) ln] 
		
		version 10
		
		marksample touse
		qui count if `touse'
		if `r(N)' == 0 {
			error 2000
		}
		
		if "`vname'" == "" {
			loc vname = "eiwb"
		}
		
		
		tokenize `varlist'
		
		loc e `1'
		loc s `2'
		
		
		tempvar me se ms ss cve cvs cf ce ec sc 
		
		qui sum `e' if `touse'
		gen `me' = r(mean)
		gen `se' = r(sd)
		
		qui sum `s' if `touse'
		gen `ms' = r(mean)
		gen `ss' = r(sd)
		
		qui gen `cve' = `se'/`me'
		qui gen `cvs' = `ss'/`ms'
		
		
		if `cve' >= `cvs' {
			qui gen `cf' = ((`se' * `ms')/(`ss')) - `me'
			qui sum `cf'
			loc f = r(mean)
			qui gen `ec' = `e' + `cf'
			qui gen `vname' = (`ec'/`s')*100
			qui label variable `vname' "((`e' + `f')/(`s'))*100"
		}
		else {
			qui gen `cf' = ((`ss' * `me')/(`se')) - `ms'
			qui sum `cf'
			loc f = r(mean)
			qui gen `sc' = `s' + `cf'
			qui gen `ec' = `e' + `cf'
			qui gen `vname' = (`ec'/`sc')*100 
			qui label variable `vname' "((`e')/(`s' + `f'))*100"
		}
		
		if "`ln'" == "ln" {
			gen `vname'_ln = ln(`vname')
			qui label variable `vname'_ln "natural logarithm of `vname'"
		}	

		display _newline
		display "Coefficients of Variation and Correction Factor"
		display as text _dup(59) "-"
		display as text "{bf:Coefficient of Variation for `e':}", `cve'
		display as text "{bf:Coefficient of Variation for `s':}", `cvs'
		display as text "{bf:Correction Factor:}", `f'
		display as text _dup(59) "-"
		
		
		end
