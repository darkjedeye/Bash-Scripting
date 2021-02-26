#!/bin/bash
tmux new -s ark \; detatch
tmux send-keys -t ark.0 "arkmanager run" ENTER
