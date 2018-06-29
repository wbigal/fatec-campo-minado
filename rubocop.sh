# !/bin/bash
set -e

ALLOWED_WARNINGS=0
warnings=`bundle exec rubocop --config .rubocop.yml --format simple |grep "offense[s]\? detected" |cut -d " " -f4`

if [ $warnings == "no" ]
then
  warnings=0
fi

if [ $warnings -gt $ALLOWED_WARNINGS ]
then
  echo -e "allowed warnings $ALLOWED_WARNINGS"
  echo -e "actual warnings $warnings"
  echo -e "Too many rubocop warnings"
  echo -e "Try running 'bin/check_rubocop_against_master'"
  exit 1
else
  echo $warnings/$ALLOWED_WARNINGS is close enough ಠ_ಠ
  exit 0
fi
