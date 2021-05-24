--RemapSoundEvent("dontstarve_DLC002/music/music_FE", "dontstarve/music/music_FE")
--RemapSoundEvent("dontstarve_DLC003/music/theme", "dontstarve/music/music_FE")
local TheFrontEnd=GLOBAL.TheFrontEnd
local require=GLOBAL.require

CreditsScreen = require("screens/creditsscreen")

-- TODO test currently installed dlc
local musicByDlc = {
    rog = "dontstarve/music/music_FE",
    shi = "dontstarve_DLC002/music/music_FE",
    ham = "dontstarve_DLC003/music/theme"
}

local function playMusic()
    key = GetModConfigData("mainScreenMusic")
    if key == "rand" then
        rnum = math.random(0,2)
        i=0
        for k, v in pairs(musicByDlc) do
            music = v
            if i == rnum then
                break
            end
            i = i+1
        end
    else
        music = musicByDlc[key]
    end
    print('Chosen music', music)
    GLOBAL.TheFrontEnd:GetSound():PlaySound(music, "FEMusic")
end

local function UpdateMainScreen(self,...)
    if self.mainmenu then
        GLOBAL.TheFrontEnd:GetSound():KillSound("FEMusic")
        playMusic()
    end
end

AddClassPostConstruct("screens/mainscreen",UpdateMainScreen)

function CreditsScreen:OnBecomeInactive()
    self._base.OnBecomeInactive(self)
    GLOBAL.TheFrontEnd:GetSound():KillSound("creditsscreenmusic")
    playMusic()
end
