#!/bin/bash

# this script "animates" color metatags in mac OSX finder windows
# usage: $ ./animated_metadata.sh [path to file on which to animate colors] [number of animation loops]

# TODO / "FEATURES":
# - automatically open and set appropriate Finder window in focus
# - stop "dropping frames"
# - figure out how to display more than 3 color metatags

# shout outs:
# - http://nshipster.com/extended-file-attributes/
# - http://arstechnica.com/apple/2013/10/os-x-10-9/9/


########################################
############## HEX VALUES ##############
########################################

# to grab pure hex values
# $ ruby -e 'puts `xattr -px [com.your.metadataKey] [filename]`.to_s.gsub(" ","").gsub("\n","")'

# com.apple.metadata:_kMDItemUserTags
# com.apple.FinderInfo

RED=62706C6973743030A101555265640A36080A0000000000000101000000000000000200000000000000000000000000000010;
O_R=62706C6973743030A20102555265640A36584F72616E67650A37080B11000000000000010100000000000000030000000000000000000000000000001A;
Y_O_R=62706C6973743030A3010203555265640A36584F72616E67650A375859656C6C6F770A35080C121B0000000000000101000000000000000400000000000000000000000000000024;
Gn_Y_O=62706C6973743030A3010203584F72616E67650A375859656C6C6F770A3557477265656E0A32080C151E0000000000000101000000000000000400000000000000000000000000000026;
B_Gn_Y=62706C6973743030A30102035859656C6C6F770A3557477265656E0A3256426C75650A34080C151D0000000000000101000000000000000400000000000000000000000000000024;
P_B_Gn=62706C6973743030A301020357477265656E0A3256426C75650A3458507572706C650A33080C141B0000000000000101000000000000000400000000000000000000000000000024;
Gy_P_B=62706C6973743030A301020356426C75650A3458507572706C650A3356477261790A31080C131C0000000000000101000000000000000400000000000000000000000000000023;
R_Gy_P=62706C6973743030A301020358507572706C650A3356477261790A31555265640A36080C151C0000000000000101000000000000000400000000000000000000000000000022;
O_R_Gy=62706C6973743030A301020356477261790A31555265640A36584F72616E67650A37080C13190000000000000101000000000000000400000000000000000000000000000022;
Gy_P=62706C6973743030A2010258507572706C650A3356477261790A31080B14000000000000010100000000000000030000000000000000000000000000001B;
GREY=62706C6973743030A10156477261790A31080A0000000000000101000000000000000200000000000000000000000000000011;


########################################
#### SET GLOBALS & DEFINE FUNCTIONS ####
########################################

### set up metadata arrays to iterate through:
# color tag metadata arrays
intro=($red
       $red
       $O_R
       $Y_O_R
       $Gn_Y_O
       $B_Gn_Y
       $P_B_Gn);

loop=($Gy_P_B
      $R_Gy_P
      $O_R_Gy
      $Y_O_R
      $Gn_Y_O
      $B_Gn_Y
      $P_B_Gn);

outro=($Gy_P_B
       $Gy_P
       $GREY);

### handle script arguments:
# if path/to/file argument is invalid, animate this script file
if [ -f "$1" ]; then
 file_to_animate="$1";
else
  file_to_animate="$0";
fi

# if number of loops argument is invalid, default to two loops
number_regex='^[0-9]+$';
if [[ "$2" =~ $number_regex ]]; then
  loops="$2";
else
  loops=2;
fi

BUFFER_COUNTER=0;

FRAMES=17;

while [ $BUFFER_COUNTER -lt $FRAMES ]; do
  filename=.buffer_${BUFFER_COUNTER}
  touch $filename
  buffer+=($filename);
  let "BUFFER_COUNTER = BUFFER_COUNTER + 1";
done;

echo "${buffer[@]}"
# xattr -wx com.apple.metadata:_kMDItemUserTags "$i" .buffer_3;


# touch .buffer__1 xattr -wx com.apple.metadata:_kMDItemUserTags "$i" .buffer__1;

# prep metadata
# xattr -wx com.apple.FinderInfo $RED_finder $file_to_animate;


########################################
############## ANIMATION ###############
########################################

# clear all tags to start
xattr -c $file_to_animate; # blank
wait;

# L O A D   M E T A D A T A   I N   B U F F E R

##### intro
BUFFER_FRAME=0;
for i in "${intro[@]}"; do
  echo .buffer_$BUFFER_FRAME
  xattr -wx com.apple.metadata:_kMDItemUserTags "$i" .buffer_$BUFFER_FRAME;
  let "BUFFER_FRAME = $BUFFER_FRAME + 1";
done;
wait;

##### loop
for i in "${loop[@]}"; do
  xattr -wx com.apple.metadata:_kMDItemUserTags "$i" .buffer_$BUFFER_FRAME;
  let "BUFFER_FRAME = $BUFFER_FRAME + 1";
done
wait;

##### outro
for i in "${outro[@]}"; do
  xattr -wx com.apple.metadata:_kMDItemUserTags "$i" .buffer_$BUFFER_FRAME;
  let "BUFFER_FRAME = $BUFFER_FRAME + 1";
done;
wait;



  # xattr -wx com.apple.metadata:_kMDItemUserTags \ "`xattr -px com.apple.metadata:_kMDItemUserTags ./.rainbow_frames/1_intro/$i`" animated_rainbow;


# A N I M A T E   B Y   C O P Y

##### intro
FINDER_i=0;
for i in "${intro[@]}"; do
  echo $FINDER_i
  xattr -wx com.apple.metadata:_kMDItemUserTags \ "`xattr -px com.apple.metadata:_kMDItemUserTags .buffer_"$FINDER_i"`" "$file_to_animate";
  let "FINDER_i = $FINDER_i + 1";
  osascript -e 'tell application "Finder" to delete (make new folder at (front window) with properties {name: ".hide-this"})' > /dev/null 2>&1;
done;
wait;

##### loop
COUNTER=0
while [ $COUNTER -lt $loops ]; do
  FINDER_l=7
  for i in "${loop[@]}"; do
    xattr -wx com.apple.metadata:_kMDItemUserTags \ "`xattr -px com.apple.metadata:_kMDItemUserTags .buffer_"$FINDER_l"`" "$file_to_animate";
    let "FINDER_l = $FINDER_l + 1";
    osascript -e 'tell application "Finder" to delete (make new folder at (front window) with properties {name: ".hide-this"})' > /dev/null 2>&1;
  done
  let COUNTER+=1;
done
wait;

##### outro
FINDER_o=14;
for i in "${outro[@]}"; do
  xattr -wx com.apple.metadata:_kMDItemUserTags \ "`xattr -px com.apple.metadata:_kMDItemUserTags .buffer_"$FINDER_o"`" "$file_to_animate";
  let "FINDER_o = $FINDER_o + 1";
  osascript -e 'tell application "Finder" to delete (make new folder at (front window) with properties {name: ".hide-this"})' > /dev/null 2>&1;
done
wait;



# clear all tags again
xattr -c $file_to_animate; # blank
osascript -e 'tell application "Finder" to delete (make new folder at (front window) with properties {name: ".hide-this"})' > /dev/null 2>&1;
# rm -rf .buffer*