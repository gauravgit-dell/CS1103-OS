
if [ "$#" -lt 3 ]; then
	echo " 3 commands reached"
	exit 1
echo "Usage: $0 <delay_in_seconds> \"command1\" \"command2\" ..."
exit 1
fi
delay=$1
shift 
num = "$#"
echo "number of commands : $#"
for command in "$@"; do

echo "$command" 
echo "Waiting for $delay seconds..."
sleep "$delay" 
done
echo "All commands executed."
