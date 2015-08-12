# Purpose:
This script uses ```hdfs dfs -count -q``` to report quota values subdirectories under specified directory.

# Prerequirements
These subdirectories must be set quota by ```hdfs dfsadmin -setSpaceQuota``` command

# Usage:
```<this_script> <check_dir> <output_path>```

```check_dir``` The source directory to report the quota values.

```output_path``` The output file path.

# Output
Text file with filename start as <output_path> and report timestamp <yyyymmddHHMMSS> as suffix.
