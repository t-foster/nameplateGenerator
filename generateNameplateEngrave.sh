#!/bin/bash

# input the argument string
name=$1

echo $name

nameNoSpaces="${name// /_}"

##change the text
sed "s/nameToBeReplaced/$name/g" nameEngrave_template.svg > $nameNoSpaces.svg

inkscape=/Applications/Inkscape.app/Contents/MacOS/inkscape


## get the width in pixels then change to mm then update in file
elementWidthInPixels=$($inkscape \
      --query-id="text89" \
      --query-width \
      $nameNoSpaces.svg)
echo "elementWidthInPixels = $elementWidthInPixels"

elementWidthInMm=$(echo $elementWidthInPixels \* 181.201 / 684.855 | bc -l)
echo "elementWidthInMm = $elementWidthInMm"

newXLocationInMm=$(echo "scale=6; ( 204 - $elementWidthInMm ) / 2.0" | bc )
echo "newXLocationInMm = $newXLocationInMm"

sed -i -e "s/9.4468746/$newXLocationInMm/g" $nameNoSpaces.svg


## do the hershey text magic
$inkscape \
      --with-gui \
      --select="text89" \
      --verb "org.evilmad.text.hershey.noprefs;FileSave;FileClose"  \
      --batch-process \
      $nameNoSpaces.svg
