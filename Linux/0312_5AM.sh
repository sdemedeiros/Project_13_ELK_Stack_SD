#!bin/bash
grep -E '05:00:00 AM' 0312_Dealer_schedule > 03125AM.txt
awk '{print $1, $2, $5, $6}' 03125AM.txt >> Dealers_working_during_losses.txt

