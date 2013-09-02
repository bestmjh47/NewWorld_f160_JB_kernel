git show $1 > temp.patch
echo "This(1), or Other Kernel(2)?"
read ch
if [ $ch -eq 2 ]; then
mv temp.patch ../../sk/kernel/temp.patch
cd ../../sk/kernel/
fi
patch -p1 -t < temp.patch
rm temp.patch
