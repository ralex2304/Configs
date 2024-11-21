#!/usr/bin/env bash
#
# nightfly theme
#
# Upstream: github.com/bluz71/vim-nightfly-colors

# Set status line, windows, pane and message colors.
tmux set-option -g message-style "bg=#092236,fg=#9fa8b6"
tmux set-option -g pane-active-border-style "bg=#011627,fg=#82aaff"
tmux set-option -g pane-border-style "bg=#011627,fg=#2f3346"
tmux set-option -g status-style "bg=#092236,fg=#9fa8b6"
tmux set-option -g window-status-activity-style none
tmux set-option -g window-status-current-style "bg=#34415a,fg=#82aaff"
# Set active and inactive window style.
tmux set-option -g window-status-current-format " #I #[fg=#9fa8b6] #[fg=default]#W #[fg=#ff5874]#{?window_flags,#{window_flags}, }#[fg=default] "
tmux set-option -g window-status-format " #I  #W #[fg=#ff5874]#{?window_flags,#{window_flags}, }#[fg=default] "

# Set status bar components and style.
tmux set-option -g status-left "#[fg=#f78c6c]⠶ #[fg=#82aaff]#S@#h "

