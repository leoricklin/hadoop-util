# Purpose:
This script uses ```hdfs dfs -count -q``` to report quota values subdirectories under specified directory.

# Prerequirements
These subdirectories must be set quota by ```hdfs dfsadmin -setSpaceQuota``` command

# Usage:
Login Hadoop nodes as hdfs account, and execute the following command:

```<this_script> <check_dir> <output_path>```

### Parameters:

```check_dir``` The source directory to report the quota values.

```output_path``` The output file path.

# Output
Text file with filename start as <output_path> and report timestamp <yyyymmddHHMMSS> as suffix.

# Example

````
$ whoami
hdfs
$ hdfs_quota_usage.sh /user /tmp/quota_user.log
$ cat /tmp/quota_user.log.20150812111801
PATH;SPACE_QUOTA;REMAINING_SPACE_QUOTA;USED_QUOTA(MB)
/user/abc;53687091200000;53685268118567;1738
/user/def;8053063680000;222538006770;7467771
```
