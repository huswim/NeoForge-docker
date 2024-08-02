#!/bin/sh

now=$(date +'%Y-%m-%d-%H:%M:%S')

echo "$now 백업 시작"

name="Backup_$now"

source_path="/data"
backup_path="/bak"

cp -r $source_path $backup_path/$name

tar -zcvf "$backup_path/$name.tar.gz" "$backup_path/$name"

rm -r "$backup_path/$name"

echo "$now 백업 완료"