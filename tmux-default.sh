#!/bin/sh
SESSION_NAME=`basename "$PWD"`

tmux has-session -t ${SESSION_NAME}

if [ $? != 0 ]
then
  # Create the session
  tmux new-session -s ${SESSION_NAME} -n vim -d

  # First window (0) -- vim
  tmux send-keys -t ${SESSION_NAME} 'vim .' C-m

  # server/debug log (1)
  tmux new-window -n server -t ${SESSION_NAME}
  tmux split-window -h -t ${SESSION_NAME}:1
  tmux send-keys -t ${SESSION_NAME}:1.1 'git status' C-m
  tmux split-window -v -t ${SESSION_NAME}:1.1

  # Start out on the first window when we attach
  tmux select-window -t ${SESSION_NAME}:0
fi
tmux attach -t ${SESSION_NAME}
