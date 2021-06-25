#!bin/bash
grep -E '05:00:00 AM' 0310_Dealer_schedule > 03105AM.txt
awk '{print $1, $2, $5, $6}' 03105AM.txt >> Dealers_working_during_losses.txt

