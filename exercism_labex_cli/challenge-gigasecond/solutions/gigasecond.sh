#!/usr/bin/env bash

###  Return given date plus one gigasecond...  
### Must use GNU date on OSX; otherwise, it's just 'date' on Linux

echo `gdate -u --date="$1 + 1000000000 seconds"`