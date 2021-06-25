#!bin/bash
grep -E '08:00:00 PM' 0312_Dealer_schedule > 03128PM.txt
awk '{print $1, $2, $5, $6}' 03128PM.txt >> Dealers_working_during_losses.txt

