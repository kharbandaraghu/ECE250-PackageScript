if [$1 == '']
then
echo "Please provide path as arguement"
return 0
fi
# install packages
if ! which tar > /dev/null; then
   echo -e "Command not found! Install? (y/n) \c"
   read
   if "$REPLY" = "y"; then
      sudo apt-get update
      sudo apt-get install tar
   fi
fi
if ! which gzip > /dev/null; then
   echo -e "Command not found! Install? (y/n) \c"
   read
   if "$REPLY" = "y"; then
      sudo apt-get update
      sudo apt-get install gzip
   fi
fi
echo "Packaging files at the following path:"
echo $1
echo "Enter your uw user ID: "
read userid
echo "Enter project number.. example 1, 2 or 3"
read num
tar -cvf $userid"_p"$num".tar" -C $1 .
gzip $userid"_p"$num".tar"
echo "Done"
