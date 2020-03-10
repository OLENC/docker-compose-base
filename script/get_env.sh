# /bin/bash
if [ $1 ]; then
    echo "${1}"
fi
read -p "请输入环境变量: " ENV
echo "ENV: ${ENV}"
# 先获取compose
# 判断是否清空数据库
getENV
getENV() {
    ls compose |
        awk '{split($0,a,"."); print a[1]}' |
        awk 'BEGIN{a="|"}{a=a$1"|"}END{print a}'
}
