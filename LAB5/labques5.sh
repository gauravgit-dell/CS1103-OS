
usage() {
echo "Usage: $0 <filename>"
exit 1
}

if [ "$#" -ne 1 ]; then
usage
fi
filename=$1

if [ ! -e "$filename" ]; then
echo "Error: File '$filename' does not exist."
exit 1
fi

current_permissions=$(ls -l "$filename" | awk '{print $1}')
echo "Current permissions for '$filename': $current_permissions"

read -p "Enter new permissions (e.g., 755 for rwxr-xr-x): " new_permissions

chmod "$new_permissions" "$filename"
if [ $? -eq 0 ]; then
echo "Permissions for '$filename' changed to $new_permissions."
else
echo "Error: Could not change permissions for '$filename'."
exit 1
fi

new_permissions_display=$(ls -l "$filename" | awk '{print $1}')
echo "New permissions for '$filename': $new_permissions_display"

read -p "Do you want to change the ownership of the file? (y/n): " change_ownership
if [[ "$change_ownership" =~ ^[Yy]$ ]]; then
read -p "Enter new owner (username): " new_owner
read -p "Enter new group (groupname): " new_group

chown "$new_owner":"$new_group" "$filename"
if [ $? -eq 0 ]; then
echo "Ownership for '$filename' changed to $new_owner:$new_group."
else
echo "Error: Could not change ownership for '$filename'."
exit 1
fi
else
echo "Ownership change skipped."
fi

echo "Final details for '$filename':"
ls -l "$filename"
