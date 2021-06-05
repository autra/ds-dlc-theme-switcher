--RemapSoundEvent("dontstarve_DLC002/music/music_FE", "dontstarve/music/music_FE")
--RemapSoundEvent("dontstarve_DLC003/music/theme", "dontstarve/music/music_FE")
local TheFrontEnd=GLOBAL.TheFrontEnd
local require=GLOBAL.require

-- local Image = require "widgets/image"

CreditsScreen = require("screens/creditsscreen")

-- comes from constant.lua. XXX import instead ?
-- but it depends on dlc
BGCOLOURS =
{
	RED = {255/255, 89/255, 46/255},
	PURPLE = {184/255, 87/255, 198/255},
	YELLOW = {255/255, 196/255, 45/255},
	TEAL = {80/255,193/255,204/255},
	--MUSTARD = {229/255,191/255,65/255},	pea soup?
	--MUSTARD = {193/255,151/255,165/255},	grey/purple
	--MUSTARD = {196/255,235/255,179/255},	  
	--MUSTARD = {177/255,236/255,151/255},	  -- pisatchio
	--MUSTARD = {206/255,162/255,182/255},	  
	--MUSTARD = {160/255,84/255,117/255},	  
	--MUSTARD = {234/255,187/255,205/255},	  --grey purple new
	--MUSTARD = {255/255,192/255,0/255},	  -- new mustard
	--MUSTARD = {255/255,223/255,147/255},	 -- yellow/gray
	MUSTARD = {255/255,127/255,159/255},
	GREEN = {87/255,164/255,86/255},	 -- THIS ONE
}

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

local function setBg(bg)
    key = GetModConfigData("mainScreenBgColor")
    print(key)
    if key == "rand" then
        rnum = math.random(0,5)
        i=0
        for k, v in pairs(BGCOLOURS) do
            bgcolours = v
            key = k
            if i == rnum then
                break
            end
            i = i+1
        end
    else
        bgcolours = BGCOLOURS[key]
    end
    print('Chosen bg', key)
    if bgcolours then
        bg:SetTint(bgcolours[1],bgcolours[2],bgcolours[3], 1)
    end
end

local function UpdateMainScreen(self,...)
    if self.mainmenu then
        GLOBAL.TheFrontEnd:GetSound():KillSound("FEMusic")
        playMusic()
        setBg(self.bg)
    end
end

AddClassPostConstruct("screens/mainscreen",UpdateMainScreen)

function CreditsScreen:OnBecomeInactive()
    self._base.OnBecomeInactive(self)
    GLOBAL.TheFrontEnd:GetSound():KillSound("creditsscreenmusic")
    playMusic()
end
