#! /bin/bash

## check directory

if [ -f "dlug-root" ]; then
    echo "generating DLUG webseite ..."
else
    echo "You must start this script from the DLUG project root directory!"
fi

## generate website

for f in *.pg;
do
  b=$(basename "${f}" .pg)
  echo "Processing $f to site/${b}.html ..."
  bin/aswsg "$f" > "site/${b}.html"
done

## generate website archive

cd archiv

for f in *.pg;
do
  b=$(basename "${f}" .pg)
  echo "Processing $f to site/archiv/${b}.html ..."
  ../bin/aswsg "$f" > "../site/archiv/${b}.html"
done

## generate website

cd ../projekte

for f in *.pg;
do
  b=$(basename "${f}" .pg)
  echo "Processing $f to site/projekte/${b}.html ..."
  ../bin/aswsg "$f" > "../site/projekte/${b}.html"
done

cd ..

echo "Done."

# EOF
