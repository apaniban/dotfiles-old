#!/bin/sh
SESSION_NAME=`basename "$PWD"`

if [ -f "$PWD/.nvmrc" ]
then
  NODE_PROEJECT=true
fi

tmux has-session -t ${SESSION_NAME}

if [ $? != 0 ]
then
  # Create the session
  tmux new-session -s ${SESSION_NAME} -n editor -d
  tmux new-window -n console -t ${SESSION_NAME}
  tmux split-window -h -t ${SESSION_NAME}:1
  if [ -n "${NODE_PROJECT}" ]; then
    for _pane in $(tmux list-panes -a -F '#{pane_id}'); do \
      tmux send-keys -t ${_pane} 'nvm use' C-m
    done
  fi

  # First window (0) -- vim
  tmux send-keys -t ${SESSION_NAME}:0.0 'vim .' C-m

  # Start out on the first window when we attach
  tmux select-window -t ${SESSION_NAME}:0
fi

tmux attach -t ${SESSION_NAME}
