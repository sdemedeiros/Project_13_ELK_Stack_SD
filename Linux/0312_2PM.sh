#!bin/bash
grep -E '02:00:00 PM' 0312_Dealer_schedule > 03122PM.txt
awk '{print $1, $2, $5, $6}' 03122PM.txt >> Dealers_working_during_losses.txt

