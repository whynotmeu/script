#!/bin/bash
if [[ $# -ne 1 ]]; then
	echo "Ошибка: требуется один параметр - путь до директории, оканчивающийся '/'"
	exit 1
fi
DIR=$1
if [[ ! -d "$DIR" ]]; then
	echo "Ошибка: указанный путь не существует или не является директорией"
	exit 1
fi
if [[ ${DIR: -1} != "/" ]]; then
	echo "Ошибка: путь должен оканчиваться '/'"
	exit 1
fi
START=$(date +%s.%N)
TOTAL_FOLDERS=$(find "$DIR" -type d | wc -l)
TOP5_FOLDERS=$(du -sh "$DIR"* 2>/dev/null | sort -rh | head -n5)
TOTAL_FILES=$(find "$DIR" -type f | wc -l)
CONF_FILES=$(find "$DIR" -type f -name "*.conf" | wc -l)
TEXT_FILES=$(find "$DIR" -type f -name "*.txt" | wc -l)
EXEC_FILES=$(find "$DIR" -type f -perm /u+x | wc -l)
LOG_FILES=$(find "$DIR" -type f -name "*.log" | wc -l)
ARCHIVE_FILES=$(find "$DIR" -type f \( -name "*.zip" -o -name "*.tar" -o -name "*.gz" -o -name "*.rar" \) | wc -l)
SYMLINKS=$(find "$DIR" -type l | wc -l)
TOP10_FILES=$(find "$DIR" -type f -exec ls -lh {} + 2>/dev/null | sort -k5 -rh | head -n10 | awk '{print $9 ", " $5 ", " $1}')
TOP10_EXEC=$(find "$DIR" -type f -perm /u+x -exec ls -lh {} + 2>/dev/null | sort -k5 -rh | head -n10 | while read -r line; do
    FILE=$(echo $line | awk '{print $9}')
    SIZE=$(echo $line | awk '{print $5}')
    MD5=$(md5sum "$FILE" | awk '{print $1}')
    echo "$FILE, $SIZE, $MD5"
   done)
echo "Total number of folders (including all nested ones) = $TOTAL_FOLDERS"
echo ""
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
count=1
while read -r line; do
	echo "$count - $line"
	((count++))
done <<< "$TOP5_FOLDERS"
echo ""
echo "Total number of files = $TOTAL_FILES"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $CONF_FILES"
echo "Text files = $TEXT_FILES"
echo "Executable files = $EXEC_FILES"
echo "Log files (with the extension .log) = $LOG_FILES"
echo "Archive files = $ARCHIVE_FILES"
echo "Symbolic links = $SYMLINKS"
echo ""
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
count=1
while read -r line; do
    echo "$count - $line"
    ((count++))
done <<< "$TOP10_FILES"
echo ""
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
count=1
while read -r line; do
    echo "$count - $line"
    ((count++))
done <<< "$TOP10_EXEC"
END=$(date +%s.%N)
DIFF=$(echo "$END - $START" | bc)
echo ""
echo "Script execution time (in seconds) = $DIFF"

