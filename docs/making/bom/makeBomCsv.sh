#/bin/bash

grep -E '^\|[^\|]*\| [1-9]' index.md | sed -E "s/ *\| */,/g" | sed -E "s/,([^,]*),([^,]*),([^,]*).*/\1\t\2\t\3/" | sort |

awk '
BEGIN {
    FS = "\t";
    FS="\t";
    total = 0;
    price = 0;
    description = "";
};
{
    if ($1 != description) {
        if (description != "") {
            print description,total,price
        }
        description = $1;
        price = $3;
        total = $2;
    } else {
        total = total + $2;
    }
}
' > BOM.tsv

exit
TOTAL=`cut -f2,3 BOM.tsv | sed -E "s/(.*)\t(.*)/ (\1 * \2) /g" | sed -E "s/  */ /g" | tr '\n' '+' | sed -E "s/^ (.*) \+$/\1\n/" | bc`

echo "Price total: $TOTAL"
