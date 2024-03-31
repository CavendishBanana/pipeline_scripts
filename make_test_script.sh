#!/bin/bash
manage_file_dir=$(cat /home/jenkins/task/manage_file_dir_path.txt)
if [[ $manage_file_dir == "" ]] ;then
  cd "/home/jenkins/task/aplikacja_lista_zakopow/lista_zakopow"
else
  cd "$manage_file_dir"
fi
test_string="test"
python3 manage.py $test_string > /home/jenkins/task/test_report.txt
cd /home/jenkins/task/
test_failed=$(cat test_report.txt | tail -n 2 | grep FAILED | wc -l)

if [[ $test_failed -gt 0 ]] ;then
  echo "Error detected - check report for details"
  cat /home/jenkins/task/test_report.txt
  declare -i one=1 zero=0 infinity=one/zero
fi
