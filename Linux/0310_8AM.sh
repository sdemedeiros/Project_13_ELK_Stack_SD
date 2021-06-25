#!bin/bash
grep -E '08:00:00 AM' 0310_Dealer_schedule > 03108AM.txt
awk '{print $1, $2, $5, $6}' 03108AM.txt >> Dealers_working_during_losses.txt

