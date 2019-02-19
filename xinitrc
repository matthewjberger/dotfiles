systemctl --user import-environment DISPLAY
xsetroot -cursor_name left_ptr
export KDEWM='BSPWM'
exec startkde "$@"
