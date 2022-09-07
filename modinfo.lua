name = "DLC Theme Switcher"

description = "Switch between DLC themes on the main screen. At the moment you can choose the music and the background, or make it random!"

author = "fisikantix"

version = "0.1"

api_version = 6

forumthread ="https://forums.kleientertainment.com/forums/topic/143036-new-mod-dlc-theme-switcher/"

-- Compatible only with SW. Must have the sound and theme files to change them!
dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = true
dst_compatible = false
hamlet_compatible = true

restart_required = false

configuration_options = {
    {
        name = "mainScreenMusic",
        label = "Music",
        options = 
        {
            {description = "Original Don't Starve & Reign Of Giants", data = "rog"},
            {description = "Shipwrecked", data = "shi"},
            {description = "Hamlet", data = "ham"},
            {description = "Random", data = "rand"}
        },
        default = "rog",
    },
    {
        name = "mainScreenBgColor",
        label = "Background color",
        options = 
        {
            {description = "Don't Starve", data = "RED"},
            {description = "Reign Of Giants", data = "PURPLE"},
            {description = "Shipwrecked", data = "TEAL"},
            {description = "Hamlet", data = "GREEN"},
            {description = "Bonus1", data = "YELLOW"},
            {description = "Bonus2", data = "MUSTARD"},
            {description = "Random", data = "rand"}
        },
        default = "RED",
    }
}
