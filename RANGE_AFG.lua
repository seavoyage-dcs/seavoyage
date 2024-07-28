 -- ATIS Kandahar on ATIS: 	127.02 MHz AM.
atisKandahar=ATIS:New(AIRBASE.Afghanistan.Kandahar, 127.02)
atisKandahar:SetSoundfilesPath("ATIS Soundfiles/")
atisKandahar:SetRadioRelayUnitName("Radio Relay Camp Bastion")
atisKandahar:SetActiveRunway("L")
atisKandahar:SetTowerFrequencies({300.200, 119.500})
atisKandahar:SetTACAN(75)
atisKandahar:Start()

Designed to provide a grading on how close bomb impact is to target. 

target trigger zones ('target1', etc.) are created with targets within radius

 -- Setting up bombing Range "Iron Bombing Range"
local bombtargets={"target1", "target2", "target3", "target4"}
myRange=RANGE:New("Iron Bombing Range")
myRange:AddBombingTargets(bombtargets, 20)
myRange:SetRangeZone(ZONE:New("Iron Bombing Range"))
myRange:SetSoundfilesPath("Range Soundfiles/")
myRange:SetInstructorRadio(305)
myRange:SetRangeControl(256)
myRange.SetMessageON()
myRange:Start()

-- Setting up bombing Range "Iron Bombing Range"
local bombtargets={"target1", "target2", "target3", "target4"}
myRange=RANGE:New("Iron Bombing Range")
myRange:AddBombingTargets(bombtargets, 20)
myRange:SetRangeZone(ZONE:New("Iron Bombing Range"))
myRange:SetSoundfilesPath("Range Soundfiles/")
myRange:SetInstructorRadio(305)
myRange:SetRangeControl(256)
myRange.SetMessageON()
myRange:Start()
