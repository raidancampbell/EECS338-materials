# Basic Shell Commands Redux
#### BASHing your head against the keyboard
---
- `cp`: CoPy
    - `cp original.c original.c.bak`  make a copy of "original.c" as "original.c.bak"
    - `cp -r HW1 HW1_backup`  make a copy of the  "HW1" directory to "HW1_backup"
- `rm`: ReMove
    - `rm incriminating_evidence.txt`  delete the "incriminating_evidence.txt" file
    - `rm -r folder_of_world_domination_plans`  delete the "folder_of_world_domination_plans" folder
    - `rm -f stubborn_undeletable_file`  try harder to delete the "stubborn_undeletable_file" file
    - `rm *.o`  delete all files in the current directory that end in ".o"
- `*`: glob pattern, matching any charcter[s]
- `mv`: MoVe
    - `mv original.c attempt1.c`  rename "original.c" as "attempt1.c"
    - `mv folder_of_world_domination_plans kitten_pictures`  rename the folder
- `grep`: who knows? it just means "look for a line with"
    - `ps aux | grep $(whoami)`  Show processes I'm running
    - `dmesg | grep -i ram`  Show kernel messages with case-insensitive "ram" in the line
    - `ps aux | grep -v root`  Show processes that don't contain the word "root"
- `|`: pipes stdout into stdin
- `awk`: ??? arcane incantations for string manipulation
    - `ps aux | grep $(whoami) | grep while | grep -v grep | awk '{print $2}' | xargs kill -9`  kill processes I'm running that contain the word "while"
- `cat`: conCATenate (or just print the file to stdout)
    - `cat hw1.c`  print the contents of the "hw1.c" file
    - `cat hw1.c | grep //`  print all the lines with line comments in "hw1.c"

