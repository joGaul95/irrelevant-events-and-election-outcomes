use "C:\Users\jgu\Dropbox\01_Studium\03_Univ_Mannheim\06_PhD\06_GESS\12_New_Perspectives_in_Economics_and_Politics\03_Code\election.dta", replace

*ssc install reghdfe

rename State state

//keep if state == "FLORIDA" | state == "TEXAS" | state == "NORTH CAROLINA" | state == "ALABAMA" | state == "LOUISIANA" | state == "MISSISSIPPI" | state == "GEORGIA" | state == "SOUTH CAROLINA" 


tab state, gen(state)

rdbwselect margin_democrat norm_dist_cutoff

rdrobust margin_democrat norm_dist_cutoff, p(1) kernel(uniform) h(0.48) covs(state1 state2 state3 state4 state5 state6 state7) all



rdplot margin_democrat norm_dist_cutoff, p(1) h(0.5) //covs(state1 state2 state3 state4 state5 state6 state7) all


keep if state == "Texas"
rdplot margin_democrat norm_dist_cutoff, p(1) h(0.5)




rdrobust margin_democrat norm_dist_cutoff, p(1) kernel(uniform) h(1) all
rdplot margin_democrat norm_dist_cutoff, p(1) kernel(uniform) h(0.4) all