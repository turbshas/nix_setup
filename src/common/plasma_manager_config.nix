{ config, pkgs, ... }:
let
    touchpadConfig = {
        naturalScroll = true;
        rightClickMethod = "twoFingers";
        scrollMethod = "twoFingers";
        twoFingerTap = "rightClick";
    };
in
{
    programs.plasma = {
        enable = true;

        input.touchpads = [
            {
                inherit touchpadConfig;
                vendorId = "0002";
                productId = "000e";
                name = "ETPS/2 Elantech Touchpad";
            }
        ];

        panels = [
            {
                alignment = "center";
                location = "bottom";
                lengthMode = "fill";
                floating = false;
                opacity = "adaptive";
                hiding = "none";
                screen = "all";
                widgets = [
                    "org.kde.plasma.kickoff"
                    "org.kde.plasma.icontasks"
                    "org.kde.plasma.marginseparator"
                    "org.kde.plasma.systemtray"
                    "org.kde.plasma.digitalclock"
                ];
                extraSettings = (builtins.readFile ../assets/kde_taskbar_extra_settings.js);
            }
        ];
    
        powerdevil.AC = {
            autoSuspend = {
                action = "sleep";
                idleTimeout = 3600;
            };

            dimDisplay = {
                enable = true;
                idleTimeout = 900;
            };

            turnOffDisplay = {
                enable = true;
                idleTimeout = 1800;
                idleTimeoutWhenLocked = 60;
            };

            dimKeyboard.enable = true;
            powerButtonAction = "lockScreen";
            whenLaptopLidClosed = "sleep";
            whenSleepingEnter = "standby";
        };
    };
}
