if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_prompt
    printf '╭─%s@%s : %s\n' $USER $hostname (pwd | sed "s/\/home\/$USER/~/")
    printf '╰─λ '
end

function fish_greeting
    clear
    neofetch
end