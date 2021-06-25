#!bin/bash
grep -E '02:00:00 PM' 0310_Dealer_schedule > 03102PM.txt
awk '{print $1, $2, $5, $6}' 03102PM.txt >> Dealers_working_during_losses.txt

