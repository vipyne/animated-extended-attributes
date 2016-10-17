#!/bin/bash

# red_grey_purple="62706C6973743030A301020358507572706C650A3356477261790A31555265640A36080C151C0000000000000101000000000000000400000000000000000000000000000022"






# if don't exist make dir with color metadata... make them dot files so no show?
# maybe just write out metadata for each color

# wait

# loops="$1"

# echo $loops;

for i in $(ls rainbow_frames/1_intro); do
  xattr -wx com.apple.metadata:_kMDItemUserTags \ "`xattr -px com.apple.metadata:_kMDItemUserTags ./rainbow_frames/1_intro/$i`" animated_rainbow;
  ls > /dev/null 2>&1
  xattr -wx com.apple.metadata:_kMDItemUserTags \ "`xattr -px com.apple.metadata:_kMDItemUserTags ./rainbow_frames/1_intro/$i`" animated_rainbow;
  ls > /dev/null 2>&1
  xattr -wx com.apple.metadata:_kMDItemUserTags \ "`xattr -px com.apple.metadata:_kMDItemUserTags ./rainbow_frames/1_intro/$i`" animated_rainbow;
  ls > /dev/null 2>&1
  # osascript -e 'tell application "Finder" to delete (make new folder at (front window) with properties {name:".hidden"})' > /dev/null 2>&1;
  xattr -wx com.apple.metadata:_kMDItemUserTags \ "`xattr -px com.apple.metadata:_kMDItemUserTags ./rainbow_frames/1_intro/$i`" "$0";
  # xattr -wx com.apple.metadata:_kMDItemUserTags \ "`xattr -px com.apple.metadata:_kMDItemUserTags ./rainbow_frames/1_intro/$i`" "$0";
done

# # for ((n = 0; n < $loops; n++)); do
#   for i in $(ls rainbow_frames/2_loop); do
#     xattr -wx com.apple.metadata:_kMDItemUserTags \ "`xattr -px com.apple.metadata:_kMDItemUserTags ./rainbow_frames/2_loop/$i`" animated_rainbow;
#     xattr -wx com.apple.metadata:_kMDItemUserTags \ "`xattr -px com.apple.metadata:_kMDItemUserTags ./rainbow_frames/2_loop/$i`" animated_rainbow;
#     # osascript -e 'tell application "Finder" to delete (make new folder at (front window) with properties {name:".hidden"})' > /dev/null 2>&1;
#     xattr -wx com.apple.metadata:_kMDItemUserTags \ "`xattr -px com.apple.metadata:_kMDItemUserTags ./rainbow_frames/2_loop/$i`" "$0";
#     # xattr -wx com.apple.metadata:_kMDItemUserTags \ "`xattr -px com.apple.metadata:_kMDItemUserTags ./rainbow_frames/2_loop/$i`" "$0";
#   done
# # done

# for i in $(ls rainbow_frames/3_outro); do
#   xattr -wx com.apple.metadata:_kMDItemUserTags \ "`xattr -px com.apple.metadata:_kMDItemUserTags ./rainbow_frames/3_outro/$i`" animated_rainbow;
#   xattr -wx com.apple.metadata:_kMDItemUserTags \ "`xattr -px com.apple.metadata:_kMDItemUserTags ./rainbow_frames/3_outro/$i`" animated_rainbow;
#   # osascript -e 'tell application "Finder" to delete (make new folder at (front window) with properties {name:".hidden"})' > /dev/null 2>&1;
#   xattr -wx com.apple.metadata:_kMDItemUserTags \ "`xattr -px com.apple.metadata:_kMDItemUserTags ./rainbow_frames/3_outro/$i`" "$0";
#   # xattr -wx com.apple.metadata:_kMDItemUserTags \ "`xattr -px com.apple.metadata:_kMDItemUserTags ./rainbow_frames/3_outro/$i`" "$0";
# done