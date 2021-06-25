#!bin/bash
grep -E '08:00:00 AM' 0312_Dealer_schedule > 03128AM.txt
awk '{print $1, $2, $5, $6}' 03128AM.txt >> Dealers_working_during_losses.txt

