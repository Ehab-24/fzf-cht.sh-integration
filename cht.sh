languages=`echo "go rust cpp c typescript javascript python lua nodejs" | tr ' ' '\n'`
core_utils=`echo "curl wget tmux chmod xargs sed awk lshw" | tr ' ' '\n'`

selected=`echo "$languages$core_utils"| fzf --prompt="Select language: "`

read -p "query: " query

if echo $languages | grep -qs $selected; then
    curl -s cht.sh/$selected/`echo $query | tr ' ' '+'`
else
    curl -s cht.sh/$selected~$query
fi
