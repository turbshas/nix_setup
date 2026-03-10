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
    };
}
