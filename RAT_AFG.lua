---
-- Name: RAT-011 - Traffic at Kandahar
-- Author: seavoyage
-- Date Created: 25 July 2024
-- Updated: 25 July 2024
-- 
-- # Situation:
--
-- We want to generate some random air traffic at Kandahar, Camp Bastion, Dwyer, and Shindad.
-- 
-- # Test cases:
--
-- 1. A-10C are spawned at Kandahar with desitation Camp Bastion, Dwyer or Shinhad.
-- 2. CH-47 are spawned at Camp Bastion with desitation Kandahar, Dwyer or Shindad.
-- 3. F-18C are spawned at Kandahar with desitation Camp Bastion.
-- 4. KC-130 are spawned in air at two zones heading for Kandahar.

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Create RAT object from A-10C template.
local a10=RAT:New("RAT_A10C")

-- Departure Kandahar.
a10:SetDeparture(AIRBASE.Afghanistan.Kandahar)
a10:SetCoalition("same")

-- Destination Camp Bastion, Dwyer or Shinddad.
a10:SetDestination({AIRBASE.Afghanistan.Camp Bastion, AIRBASE.Afghanistan.Dwyer, AIRBASE.Afghanistan.Shindad})

-- Spawn three flights.
a10:Spawn(3)

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------

local ch47=RAT:New("RAT_CH47")

-- Departure Camp Bastion.
ch47:SetDeparture(AIRBASE.Afghanistan.Camp Bastion)
ch47:SetCoalition("same")

-- Destination Kandahar, Dwyer or Shinddad.
ch47:SetDestination({AIRBASE.Afghanistan.Kandahar, AIRBASE.Afghanistan.Dwyer, AIRBASE.Afghanistan.Shindad})

-- Spawn three flights.
ch47:Spawn(3)

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Create RAT object from F/A-18C template.
local f18=RAT:New("RAT_F18C")
f18:SetCoalition("same")

-- Departure airports.
f18:SetDeparture(AIRBASE.Afghanistan.Kandahar)

-- Destination Camp Bastion.
f18:SetDestination(AIRBASE.Afghanistan.Camp Bastion)

-- Spawn two flights.
f18:Spawn(2)


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Create RAT object from KC-135 template.
local kc135=RAT:New("RAT_KC135")

-- Set departure zones. We need takeoff "air" for that.
kc135:SetDeparture("RAT Zone East")

-- Set spawn in air.
kc135:SetTakeoff("air")

-- Aircraft will fly to Shindand
kc135:SetDestination(AIRBASE.Afghanistan.Shindand)

-- Spawn one aircraft.
kc135:Spawn(1)

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Store time at mission start
local T0=timer.getTime()

-- Send message with current misson time to all coalisions
local function print_mission_time()
  local Tnow=timer.getTime()
  local mission_time=Tnow-T0
  local mission_time_minutes=mission_time/60
  local mission_time_seconds=mission_time%60
  local text=string.format("Mission Time: %i:%02d", mission_time_minutes,mission_time_seconds)
  MESSAGE:New(text, 5):ToAll()
end

-- Start scheduler to report mission time.
local Scheduler_Mission_Time = SCHEDULER:New(nil, print_mission_time, {}, 0, 10)
