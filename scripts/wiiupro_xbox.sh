#!/bin/bash
if [ -z $1 ];
then
	echo "Enter device number as parameter"
else
	xboxdrv --deadzone 10% --evdev /dev/input/event$1 --evdev-keymap "BTN_B=B,BTN_X=X,BTN_Y=Y,BTN_A=A,BTN_TR=RB,BTN_TL=LB,BTN_TR2=RT,BTN_THUMBR=TR,BTN_THUMBL=TL,BTN_START=Start,BTN_SELECT=Back,BTN_MODE=Guide,KEY_#544=DU,KEY_#545=DD,KEY_#547=DR,KEY_#546=DL" --evdev-absmap "ABS_RY=Y2,ABS_RX=X2,ABS_Y=Y1,ABS_X=X1" 
fi
