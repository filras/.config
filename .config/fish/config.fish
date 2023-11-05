if status is-interactive
    # Commands to run in interactive sessions can go here

end

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf ' %s%s%s > ' \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color 29828a)
end

function fish_greeting
    echo (set_color yellow; date +%T; set_color 29828a) $USER(set_color grey)@(set_color green)$hostname

end
