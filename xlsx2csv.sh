for f in *.xlsx
do
	file_name="${f%.*}"
	echo "${file_name} ... "
	ssconvert ${f} ${file_name}.csv
done