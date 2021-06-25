#!bin/bash
grep -E '05:00:00 AM' 0315_Dealer_schedule > 03155AM.txt
awk '{print $1, $2, $5, $6}' 03155AM.txt >> Dealers_working_during_losses.txt

