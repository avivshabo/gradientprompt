set reset_colors = "%{\033[0m%}"
#set prompt_colors = ( 33 27 26 21 20 19 18 17 16 ) #blueish
set prompt_colors = ( 37 36 35 34 28 22 23 30 36)  #greenish
set prompt_components = ('%D %w %Y' ' %P' ' %n' '@' '%m ' "[$0]" ' %~ ' ' >' "$reset_colors ")
set prompt_line = ""
set i = 1
foreach comp ( $prompt_components:q )
	set bg = "%{\033[48;5;$prompt_colors[$i]m%}"	
	set prompt_line = "${prompt_line}${bg}${comp}"	
    @ i++
end

set prompt="$prompt_line"
