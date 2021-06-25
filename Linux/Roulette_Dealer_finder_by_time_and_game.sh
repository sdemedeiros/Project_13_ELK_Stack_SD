#!bin/bash
grep -E 'HH:MM:SS PM' DDDD_Dealer_schedule > MMDDHH_Dealer_Name.txt
awk '{print $1, $2, $5, $6}' MMDDHH_Dealer_Name.txt

Include 1 2 3 4 to find Black Jack Dealer 
Include 1 2 5 6 to find Roulette Dealer
Include 1 2 7 8 to find Texas Hold em Dealer 
