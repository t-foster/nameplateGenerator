# nameplateGenerator

## The problem this solves:

At work the doors had nameplates on the doors showing who had offices where.  At some point shortly before I started working there, there was a change in personnel and the knowledge of who to ask to get them for new hires was lost.  I eventually got myself a personal compact CNC machine and realized I could engrave my own.  So I made a few for my team and management learned about it and paid me some money to order materials for the rest of the building.  Before I would have just done them on my own one at a time but now I have 30+ to do.  So I automated a script to modify a template svg file with the new name to input, then use inkscape to figure out the width of the new text, then do the math for the new location to put the text, then inkscape is used to automate applying a hershey text modification to turn it into single line for engraving.

## calling routine

`./generateNameplateEngrave.sh "first last"`

You may need to modify the script for your inkscape install location

## links

[inkscape download](https://inkscape.org/release/inkscape-1.0.2/)

[lamacoids for nameplates](https://www.mcmaster.com/lamacoids/)