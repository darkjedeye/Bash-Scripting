#!/bin/bash
tmux new -s ark \; detach
tmux send-keys -t ark.0 "arkmanager run" ENTER
