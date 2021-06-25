#!bin/bash
grep -E '08:00:00 AM' 0315_Dealer_schedule > 03158AM.txt
awk '{print $1, $2, $5, $6}' 03158AM.txt >> Dealers_working_during_losses.txt

