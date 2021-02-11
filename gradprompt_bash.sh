# PROMPT
function get_cwd()
{
	full_pwd="$(pwd -P)"
	if test ${#full_pwd} -le 40 ; then
		cwd="${PWD}"
	else
		cwd="$(basename $full_pwd)"
		if test ${#cwd} -ge 40 ; then
			trimmed_cwd="${cwd:0:20}";
			trimmed_cwd+="..."
			trimmed_cwd+="${cwd: -17}";
			cwd="${trimmed_cwd}"
		fi
	fi
	echo "$cwd"
}

function get_shell()
{
	echo "$(basename $0)"
}

reset_colors='\[\e[0m\]'
declare -a prompt_colors=("33" "27" "26" "21" "20" "19" "18" "17")
declare -a prompt_components=('\D{%d %b %Y}' ' \t' ' \u' '@' '\h' ' [$(eval "get_shell")]' ' $(eval "get_cwd")' " >$reset_colors ")

prompt=''
for i in "${!prompt_components[@]}" ; do
	bg='\[\e[48;5;'"${prompt_colors[$i]}"'m\]'
	prompt+="${bg}${prompt_components[$i]}"
done

export PS1="$prompt"
