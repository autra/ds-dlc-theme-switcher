name = "RoG Soundtrack restorer"

description = "Restore RoG SoundTrack in main menu."

author = "fisikantix"

version = "1.1"

api_version = 6

forumthread ="https://github.com/autra/ds-rog-theme-restorer/issues"

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
        label = "Main screen music",
        options = 
        {
            {description = "Original Don't Starve & Reign Of Giants", data = "rog"},
            {description = "Shipwrecked", data = "shi"},
            {description = "Hamlet", data = "ham"},
            {description = "Random", data = "rand"}
        },
        default = "donstarve/music/music_FE",
    }
}
