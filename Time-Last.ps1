#Calculate amount of time left until you can go home
 
#When can I go home? (With user input)
$time_input = read-host -Prompt "Enter the time you can leave the office (Format HH:MM)"
#If you don't like entering the time you can leave every time you run the script, enter your static value here: (Make sure to uncomment that line and to comment line 4)
#$time_input = 17:00
 
Do {
#Figure out what time it is now:
$time_now = get-date -format "HH:mm:ss"
 
#Calculate time left
$diff_h = (New-TimeSpan -start $time_now -end $time_input).Hours
$diff_m = (New-TimeSpan -start $time_now -end $time_input).Minutes
$diff_s = (New-TimeSpan -start $time_now -end $time_input).Seconds
 
#Output the time left
echo "Time left until ${time_input}:
${diff_h} Hours
${diff_m} Minutes
${diff_s} Seconds"
 
#Here is where the fun begins ;)
if ($diff_h -ge 4){
    echo "Geez buddy, you've still got a long day ahead of you if you're already checking me"
} elseif ($diff_h -ge 1 -and $diff_h -lt 4) {
    echo "You're half way there, keep it up!"
} elseif ($diff_h -eq 0 -and $diff_m -le 60 -and $diff_m -ge 30) {
    echo "You're almost done, less than 1 hour until it's time!"
} elseif ($diff_h -eq 0 -and $diff_m -lt 30 -and $diff_m -ge 5) {
    echo "Less than half an hour until you're done!"
} elseif ($diff_h -eq 0 -and $diff_m -lt 5 -and $diff_m -ge 0) {
    echo "Pack your stuff, you're can leave buddy!"
} else {
    echo "else"
}
 
sleep 1
clear
} While ($time_now -lt $time_input) 