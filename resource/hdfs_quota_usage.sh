echo 'pwd' | kinit hdfs 2>&1 > /dev/null
if [ $# -ne 2 ]
then
   echo "Usage: ${0} <check_dir> <output_path>"
   exit 1
fi
NOW=`date +%Y%m%d%H%M%S`
QUOTAPATH="${1}"
OUTFILE="${2}.${NOW}"
declare PHYUSAGE=0
echo "PATH;SPACE_QUOTA;REMAINING_SPACE_QUOTA;USED_QUOTA" > $OUTFILE
for i in `hdfs dfs -ls  ${QUOTAPATH}/|grep -e "${QUOTAPATH}"|grep -v grep|awk '{ print $8 }'`
# e.g.: /user/b40
# /user/b41
# /user/davidjou
do
   SEP=" "
   CHKUSAGE=`hdfs dfs -count -q ${i}`
   # e.g.:         none             inf 322122547200000 322122547184322           18           10               5226 /user/b40
   USAGELIST=( ${CHKUSAGE//$SEP/ } )
   PHYUSAGE=$((${USAGELIST[2]}-${USAGELIST[3]}))
   SEP=";"
   echo "$i$SEP${USAGELIST[2]}$SEP${USAGELIST[3]}$SEP$((${PHYUSAGE}/1048576))" >> $OUTFILE
done

