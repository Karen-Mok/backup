sed 's/^.*href=\"\([^"]*\)\".*$/\1/g' index.html  #先从html文件中提取文件后缀名到downlist

sed 's/^http:\/\/188.213.134.185\/downloads\/aria2\/zip\//g' downlist
#将http前缀插入文件名之前
