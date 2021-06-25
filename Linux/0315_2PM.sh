#!bin/bash
grep -E '02:00:00 PM' 0315_Dealer_schedule > 03152PM.txt
awk '{print $1, $2, $5, $6}' 03152PM.txt >> Dealers_working_during_losses.txt

