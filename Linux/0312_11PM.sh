#!bin/bash
grep -E '11:00:00 PM' 0312_Dealer_schedule > 031211PM.txt
awk '{print $1, $2, $5, $6}' 031211PM.txt >> Dealers_working_during_losses.txt

