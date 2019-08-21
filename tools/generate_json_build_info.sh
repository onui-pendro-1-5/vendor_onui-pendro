#!/bin/sh
if [ "$1" ]
then
  datetime=$(grep org\.onui-pendro\.build_date_utc $OUT/system/build.prop | cut -d= -f2)
  romtype=$CUSTOM_BUILD_TYPE\
  url=https://sourceforge.net/projects/onui-pendro/files/$CUSTOM_BUILD/$(basename $(ls $OUT/OnUI-Pendro*.zip))\
  version=$(grep -m1 org\.onui-pendro\.version $OUT/system/build.prop | cut -d= -f2)\
  file_path=$1
  filename=$(basename "$file_path")
  if [ -f $file_path ]; then
    id=$(cat "$file_path.md5sum" | cut -d' ' -f1)
    echo "{\n\"response\": [\n{\n   \"datetime\": \"$datetime\",\n   \"filename\": \"$filename\",\n   \"id\": \"$id\",\n   \"romtype\": \"$romtype\",\n   \"size\": $(stat -c%s $OUT/OnUI-Pendro*.zip),\n   \"url\": \"$url\",\n   \"version\": \"$version\"\n}\n]\n}" > $file_path.json	
  fi
fi

