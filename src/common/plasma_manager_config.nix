{ config, pkgs, ... }:
{
    programs.plasma = {
        enable = true;

        input.touchpads = [
            {
                naturalScroll = true;
                rightClickMethod = "twoFingers";
                scrollMethod = "twoFingers";
                twoFingerTap = "rightClick";
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
    };
}
