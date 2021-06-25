#!bin/bash
grep -E '11:00:00 PM' 0310_Dealer_schedule > 031011PM.txt
awk '{print $1, $2, $5, $6}' 031011PM.txt >> Dealers_working_during_losses.txt

