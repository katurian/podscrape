read -p "Enter libsyn, patreon, etc. feed url: " url
read -p "Enter output directory name: " directory

wget --output-document=feed.xml $url

python3 podscrape.py

mkdir $directory

cd $directory

wget -i ../urls.txt --content-disposition

if [[ $url =~ "patreon" ]]; then
   echo "Skipping filename cleaning."
else
   for i in *.mp3*; do mv "$i" "${i%\?*}"; done
   find -type f -name '*teaser*' -delete
   find -type f -name '*TEASER*' -delete
   find -type f -name '*Teaser*' -delete
   find -type f -name '*preview*' -delete
   find -type f -name '*PREVIEW*' -delete
   find -type f -name '*Preview*' -delete
   find -type f -name '*Trailer*' -delete
   find -type f -name '*trailer*' -delete
   find -type f -name '*TRAILER*' -delete
fi

rm feed.xml
rm urls.txt
