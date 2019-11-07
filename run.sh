#!/bin/bash
# Starting the xvfb with better screen resolution, configuring and running the vnc server
export DISPLAY=:20
Xvfb :20 -screen 0 1366x768x16 &
x11vnc -passwd wizeline -display :20 -N -forever