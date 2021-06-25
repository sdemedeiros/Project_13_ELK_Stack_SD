#!bin/bash
grep -E '08:00:00 PM' 0310_Dealer_schedule > 03108PM.txt
awk '{print $1, $2, $5, $6}' 03108PM.txt >> Dealers_working_during_losses.txt

