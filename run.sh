
whiptail --title "Example Title" --msgbox "This is an example message box. Press OK to continue." 8 70
if (whiptail --title "Example Title" --yesno "This is an example yes/no box." 8 70); then
    echo "YES"
else
    echo "NO"
fiCOLOR=$(whiptail --inputbox "What is your favorite Color?" 8 78 Blue --title "Example Dialog" 3>&1 1>&2 2>&3)

# The `3>&1 1>&2 2>&3` is a small trick to swap the stderr with stdout
# Meaning instead of return the error code, it returns the value entered

# Now to check if the user pressed OK or Cancel
exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "User selected Ok and entered " $COLOR
else
    echo "User selected Cancel."
fi

echo "(Exit status was $exitstatus)"
