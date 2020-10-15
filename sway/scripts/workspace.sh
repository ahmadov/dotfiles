# workspace default - disable everything except the laptop screen
function default {
  swaymsg output eDP-1 enable
  swaymsg output DP-2 disable
  swaymsg output HDMI-A-1 disable
}

# workspace home - work and meeting mode without video
function homeWorkWoMeeting {
  swaymsg output eDP-1 disable
  swaymsg output DP-2 enable
  swaymsg output HDMI-A-1 enable

  swaymsg output DP-2 pos 0 0 res 3840x2160
  swaymsg output HDMI-A-1 pos 3840 0 res 1920x1080
}

# workspace office - work mode
# workspace home/office - meeting mode with video
function workWMeeting {
  swaymsg output eDP-1 enable 
  swaymsg output DP-2 enable
  swaymsg output HDMI-A-1 disable

  swaymsg output DP-2 pos 0 0 res 3840x2160
  swaymsg output eDP-1 pos 0 2160 res 1920x1080
}

function workMeetingFallback {
  swaymsg output eDP-1 disable 
  swaymsg output DP-2 disable
  swaymsg output HDMI-A-1 enable

  swaymsg output HDMI-A-1 pos 0 0 res 1920x1080
} 

mode="$1x"

if [[ $mode == "defaultx" ]]; then
  default
elif [[ $mode == "homex" ]]; then
  homeWorkWoMeeting
elif [[ $mode == "workx" ]]; then
  workWMeeting
elif [[ $mode == "work-fallbackx" ]]; then
  workMeetingFallback
fi

