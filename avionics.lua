size = { 1024, 1024 }  --We declare here the image size we are using
panelWidth3d  = 1024  -- I don't know why, but without these lines you cannot get the coords to work right
panelHeight3d = 1024

-- Custom properties + commands

defineProperty("screen1_mode",createGlobalPropertyf("jb/sasl/MFD/1/mode"))  -- 0=off, 1= PFD,  2=NAV,  3=AC (engines} or whatever, etc
set(screen1_mode, 1)
defineProperty("screen2_mode",createGlobalPropertyf("jb/sasl/MFD/2/mode"))  
set(screen2_mode,3)
defineProperty("iPad1_mode",createGlobalPropertyf("jb/sasl/iPads/1/mode"))  -- 0=off, 1= EFIS or whatever, etc
set(iPad1_mode, -1)
defineProperty("iPadVisibility",createGlobalPropertyi("jb/sasl/iPads/visible"))  -- 0=off, 1= ON (INT)
set(iPadVisibility,  1) 
defineProperty("HudHidden",createGlobalPropertyi("jb/sasl/Hud/hidden"))  -- 0=visible, 1= hidden (killed) (INT)
set(HudHidden,  0) 
defineProperty("jb_yawControl",  createGlobalPropertyi("jb/sasl/afcs/yawControl"))  -- 0=off, 1= ON (INT)
createProp("jb/sasl/currentWaypointID", "int", 0);
defineProperty("currentWaypointID",   globalPropertyi("jb/sasl/currentWaypointID"))

createProp("jb/sasl/cwpTest", "int", 0);  -- NOT USED IN TIGRE ?
defineProperty("cwpTest",   globalPropertyi("jb/sasl/cwpTest"))
set(cwpTest,  0) 

--createProp("jb/sasl/hoverMode", "int", 0);
--defineProperty("jb_hoverMode",   globalPropertyi("jb/sasl/hoverMode"))
--createProp("jb/sasl/torqueReading","float", 0.0)
--defineProperty("jb_torqueReading",globalPropertyf("jb/sasl/torqueReading"))
--createProp    ("jb/sasl/climbAngle","float", 0.0)
--defineProperty("jb_climbAngle",    globalPropertyf("jb/sasl/climbAngle"))

createCommand("jb/sasl/iPads/toggle", "show_hide_iPads") -- jb/sasl/iPads/visible
createCommand("jb/sasl/yawDamper/toggle", "auto pedals ON/OFF")  -- jb_yawControl
createCommand("jb/sasl/hud/toggle", "show hide FlightPathMarker") -- jb/sasl/Hud/hidden
createCommand("jb/sasl/view/tilt_right", "head tilt to right") -- sim/graphics/view/pilots_head_phi﻿﻿﻿﻿﻿﻿    float    y    degrees    Position of the pilot's head roll﻿﻿﻿﻿﻿﻿﻿﻿﻿
createCommand("jb/sasl/view/tilt_left", "head tilt to left")
defineProperty(                 "headRoll",  globalPropertyf("sim/graphics/view/pilots_head_phi"))
defineProperty(                 "headHdg",  globalPropertyf("sim/graphics/view/pilots_head_psi"))
defineProperty(                 "headPitch",  globalPropertyf("sim/graphics/view/pilots_head_the"))
--sim/graphics/view/pilots_head_psi	float	y	degrees	Position of pilot's head heading
--sim/graphics/view/pilots_head_the	float	y	degrees	Position of pilot's head pitch
--sim/graphics/view/pilots_head_phi	float	y	degrees	Position of the pilot's head roll'



defineProperty("runTime",  globalPropertyf("sim/time/total_running_time_sec"))
lastCommandClick = get(runTime)

--Power
defineProperty(                 "IAS",  globalPropertyf("sim/flightmodel/position/indicated_airspeed"))
defineProperty("collectivePitch",  globalPropertyf("sim/flightmodel2/engines/prop_pitch_deg"))
defineProperty(        "pitchMax",  globalPropertyf("sim/aircraft/prop/acf_max_pitch"))
defineProperty(         "pitchMin",  globalPropertyf("sim/aircraft/prop/acf_min_pitch"))
defineProperty(           "throttle",  globalPropertyf("sim/cockpit2/engine/actuators/throttle_ratio_all"))
defineProperty(            "engTq",  globalPropertyf("sim/flightmodel/engine/ENGN_TRQ"))
defineProperty(        "engWattsA",  globalPropertyf("sim/cockpit2/engine/indicators/power_watts[0]"))
defineProperty(        "engWattsB",  globalPropertyf("sim/cockpit2/engine/indicators/power_watts[1]"))

-- abs max power = 1322 kW PER ENGINE!
-- Tigre HAD (Spanish)  (1,092 kW / 1,464 shp during normal operation; 1,322 kW / 1,774 shp in contingency power mode)

-- Pitch
defineProperty("pitchCyclic",  globalPropertyf("sim/joystick/yoke_pitch_ratio"))

-- Roll
defineProperty("rollCyclic",  globalPropertyf("sim/joystick/yoke_roll_ratio"))

-- Yaw
defineProperty(          "yawRate", globalPropertyf("sim/flightmodel/position/R"))
defineProperty(        "yawForce",  globalPropertyf("sim/flightmodel/forces/N_total"))
defineProperty(             "pedals",  globalPropertyf("sim/cockpit2/controls/yoke_heading_ratio"))
defineProperty(          "TRPtitch",  globalPropertyf("sim/flightmodel2/engines/prop_pitch_deg[1]"))
defineProperty(          "TR_rpm", globalPropertyf("sim/cockpit2/engine/indicators/prop_speed_rpm[1]"))
defineProperty(          "parking_brake", globalPropertyf("sim/cockpit2/controls/parking_brake_ratio"))

-- for Head Mounted Display
-- sim/graphics/view/pilots_head_x	float	y	meters	Position of pilot's head relative to CG, X (STBD)
-- sim/graphics/view/pilots_head_y	float	y	meters	Position of pilot's head relative to CG, Y (UP)    2.20m
-- sim/graphics/view/pilots_head_z	float	y	meters	Position of pilot's head relative to CG, Z (AFT) -2.60m
-- these are measurements in METRES from the CG set in Planemaker
defineProperty(             "viewPointSTBD", globalPropertyf("sim/graphics/view/pilots_head_x"))
defineProperty(             "viewPointUP",      globalPropertyf("sim/graphics/view/pilots_head_y")) --   2.20m from zero 1.2 from CG
defineProperty(             "viewPointAFT",    globalPropertyf("sim/graphics/view/pilots_head_z")) --  -2.60m

--sim/aircraft/weight/acf_cgY_original	float	n	feet	This is the ORIGINAL reference point in PM in _feet_.  (UP) 1.00m
--sim/aircraft/weight/acf_cgZ_original	float	n	feet	This is the ORIGINAL reference point in PM in _feet_. (AFT) 0.00m
--WTF ????? FEET??
defineProperty(             "acf_cgY_original", globalPropertyf("sim/aircraft/weight/acf_cgY_original")) -- (UP) 1.00m
defineProperty(             "acf_cgZ_original", globalPropertyf("sim/aircraft/weight/acf_cgZ_original")) --  (AFT) 0.00m

defineProperty(             "panelLight1", globalPropertyf("sim/cockpit2/electrical/panel_brightness_ratio[1]"))
defineProperty(              "panelLight2", globalPropertyf("sim/cockpit2/electrical/panel_brightness_ratio[2]"))
defineProperty( "cockpit_lights_level", globalPropertyf("sim/cockpit/electrical/cockpit_lights"))
defineProperty(                 "brightness",globalPropertyf("sim/cockpit2/electrical/instrument_brightness_ratio[0]")) -- the brightness level for dimming text 

defineProperty(            "batteryON", globalPropertyf("sim/cockpit2/electrical/battery_on"))
defineProperty(            "DCcurrent", globalPropertyf("sim/cockpit2/electrical/generator_amps"))
defineProperty(            "DCvoltage", globalPropertyf("sim/cockpit2/electrical/battery_voltage_indicated_volts"))
defineProperty(    "engOilPressure", globalPropertyf("sim/cockpit2/engine/indicators/oil_pressure_psi"))
defineProperty(         "engOilTemp", globalPropertyf("sim/cockpit2/engine/indicators/oil_temperature_deg_C"))
defineProperty(               "fuelFlow", globalPropertyf("sim/cockpit2/engine/indicators/fuel_flow_kg_sec"))
defineProperty(                  "fuelKg", globalPropertyf("sim/flightmodel/weight/m_fuel_total"))
defineProperty(                       "NF", globalPropertyf("sim/cockpit2/engine/indicators/N2_percent"))
defineProperty(                       "NFA", globalPropertyf("sim/cockpit2/engine/indicators/N2_percent[0]"))
defineProperty(                       "NFB", globalPropertyf("sim/cockpit2/engine/indicators/N2_percent[1]"))
defineProperty(                       "NR", globalPropertyf("sim/cockpit2/engine/indicators/prop_speed_rpm"))
defineProperty(                     "OAT", globalPropertyf("sim/cockpit2/temperature/outside_air_temp_degc"))

defineProperty(                  "COM1", globalPropertyf("sim/cockpit/radios/com1_freq_hz"))
defineProperty(                  "COM2", globalPropertyf("sim/cockpit/radios/com2_freq_hz"))
defineProperty(    "COM1_SBY_M", globalPropertyf("sim/cockpit2/radios/actuators/com1_standby_frequency_Mhz"))
defineProperty(    "COM1_SBY_k",  globalPropertyf("sim/cockpit2/radios/actuators/com1_standby_frequency_khz"))
defineProperty(    "COM2_SBY_M",  globalPropertyf("sim/cockpit2/radios/actuators/com2_standby_frequency_Mhz"))
defineProperty(     "COM2_SBY_k",  globalPropertyf("sim/cockpit2/radios/actuators/com2_standby_frequency_khz"))

defineProperty(                    "NAV1", globalPropertyf("sim/cockpit/radios/nav1_freq_hz"))
defineProperty(                    "NAV2", globalPropertyf("sim/cockpit/radios/nav2_freq_hz"))

defineProperty(     "NAV1_SBY_M", globalPropertyf("sim/cockpit2/radios/actuators/nav1_standby_frequency_Mhz"))
defineProperty(      "NAV1_SBY_k", globalPropertyf("sim/cockpit2/radios/actuators/nav1_standby_frequency_khz"))
defineProperty(      "NAV2_SBY_M", globalPropertyf("sim/cockpit2/radios/actuators/nav2_standby_frequency_Mhz"))
defineProperty(       "NAV2_SBY_k", globalPropertyf("sim/cockpit2/radios/actuators/nav2_standby_frequency_khz"))

defineProperty (                     "SQK", globalPropertyf("sim/cockpit/radios/transponder_code"))
defineProperty("transponder_mode", globalPropertyf("sim/cockpit/radios/transponder_mode"))

defineProperty(                 "MagVar", globalPropertyf("sim/flightmodel/position/magnetic_variation"))
defineProperty(            "currentLAT", globalPropertyf("sim/flightmodel/position/latitude"))
defineProperty(           "currentLON", globalPropertyf("sim/flightmodel/position/longitude"))

defineProperty(           "currentBaro", globalPropertyf("sim/cockpit/misc/barometer_setting"))
defineProperty(           "altitude_m", globalPropertyf("sim/flightmodel/position/elevation"))  -- in metres!
defineProperty(           "m_agl", globalPropertyf("sim/flightmodel/position/y_agl"))  -- in metres!

defineProperty(           "Hdg", globalPropertyf("sim/flightmodel/position/mag_psi"))

--defineProperty("alt_hold",  globalPropertyf("sim/cockpit2/autopilot/altitude_dial_ft"))          -- the altitude we want to hold
--defineProperty("altitude",  globalPropertyf("sim/cockpit2/gauges/indicators/altitude_ft_pilot")) -- the altiltude we are now

-- WEAPONS DATAREFS
-- sim/cockpit2/weapons/gun_offset_heading_ratio	float	y	ratio	Heading offset of the gun from within its maximum heading range
-- sim/cockpit2/weapons/gun_offset_pitch_ratio	float	y	ratio	Pitch offset of the gun from within its maximum pitch range
--sim/weapons/gun_del_psi_deg_max	float[25]	y	???	Aimable guns for c130 Spectre, etc
--sim/weapons/gun_del_the_deg_max	float[25]	y	???	Aimable guns for c130 Spectre, etc

defineProperty(           "gunHdgMax",    globalPropertyf("sim/weapons/gun_del_psi_deg_max"))
defineProperty(           "gunPitchMax",  globalPropertyf("sim/weapons/gun_del_the_deg_max"))

defineProperty(            "gunHdgRatio", globalPropertyf("sim/cockpit2/weapons/gun_offset_heading_ratio"))
defineProperty(           "gunPitchRatio", globalPropertyf("sim/cockpit2/weapons/gun_offset_pitch_ratio"))
 
 
defineProperty("gunHdgAngle",createGlobalPropertyf("jb/sasl/weapons/gunHdgAngle"))  
defineProperty("gunPitchAngle",createGlobalPropertyf("jb/sasl/weapons/gunPitchAngle"))  
set(gunHdgAngle,  0.0)
set(gunPitchAngle, 0.0)
set(headHdg, 0.0)
set(headPitch, 0.0)

defineProperty("guns_armed",createGlobalPropertyf("sim/cockpit/weapons/guns_armed"))  
 set(guns_armed, 0)




 
 
font_Sans10=loadFont('custom avionics/MS_Sans10.fnt')  
font_Sans12=loadFont('custom avionics/MS_Sans12.fnt')  
font_Sans24=loadFont('custom avionics/MS_Sans24.fnt')  

font_Sans36=loadFont('custom avionics/JB_Sans_36.fnt') -- numbers ONLY
font_led_24=loadFont('custom avionics/JB_LED_7S_24.fnt')
font_led_32=loadFont('custom avionics/JB_LED_7S_32.fnt')


components = {
	commands    {position={     0, 256, 256, 110} },
	Radios           {position={ 512,    256, 440, 256} },
	screen_1       {position={     0, 768, 256, 256} },
	barometer      {position={  512, 256, 440, 256} },
	HMD             {position={      0,     0,   512, 512} }

	
}

-- iPad0             {position={      0,  416, 256, 192} },
--i Pad1             {position={  256,  416, 256, 192} },
--	iPad2             {position={  512,  416, 256, 192} },
--	iPad3             {position={  756,  416, 256, 192} },
	
set(panelLight1, 1)
set(panelLight2, 1)

--saslReload = findCommand("sasl/reload")  
--commandOnce(saslReload)

-- =======================================================================================
--             returns {distance_nm, degreesTrue, degreesMag} from a start and end lat/lon
function LatLonToNmDegT(lat1, lon1, lat2, lon2)
  if lat1 == nil or lon1 == nil or lat2 == nil or lon2 == nil then
    return {nil, nil}
  end
  local NS = lat1 - lat2
  local EW = lon1 - lon2
  local NSnm = 60* NS -- should really be 59.91 for NS
  local EWnm = 60* EW * math.cos(math.rad(lat1))	
  local distance_nm = 0.1*math.floor(10*math.sqrt(NSnm*NSnm + EWnm*EWnm) )
  local degreesTrue = 270 -  math.deg(math.atan2(NSnm, EWnm))
  if degreesTrue > 360 then degreesTrue = degreesTrue -360 end
  local degreesMag = degreesTrue + get(MagVar) 
  return {distance_nm, degreesTrue, degreesMag}
end