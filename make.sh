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

echo "Done."

# EOF
