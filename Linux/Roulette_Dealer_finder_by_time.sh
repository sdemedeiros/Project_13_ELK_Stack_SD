#!bin/bash
grep -E 'HH:MM:SS PM' DDDD_Dealer_schedule > MMDDHH_Roulette_Dealer_Name.txt
awk '{print $1, $2, $5, $6}' MMDDHH_Roulette_Dealer_Name.txt

