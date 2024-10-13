///////////////////////////////////////////////////////////////////////
# New TV Style With Stand & Book Shelves                    Dark   ////
# Design By JJTheKing                                              ////
# (AM+) v3.0.6 (Build 385)                                         ////
# Updated (11-29-23)                                       Genesis ////
///////////////////////////////////////////////////////////////////////

class UserConfig {
	</ label="Logo Pulse", help="Enable / Disable Wheel Pulse", options="Yes,No", order=2 /> pulse="Yes";
	</ label="Logo Pulse Color", help="Select Wheel Pulse Color", options="Red,White,Blue,Black,Green,Purple,Yellow,Rainbow", order=3 /> color="Red";
}
cfg <- fe.get_config()

# Layout Size
fe.layout.preserve_aspect_ratio = true
  
fe.layout.width=1080;
fe.layout.height=1920;

local flx = fe.layout.width;
local fly = fe.layout.height;
local flw = fe.layout.width;
local flh = fe.layout.height;
	
# Modules

fe.load_module("wheel");
fe.load_module("animate");
fe.load_module("fade");
fe.load_module("file");
fe.load_module("file-format");

# Background Behind TV
local snap=fe.add_artwork("snapsmall", 1080, 0, 190, 180);
local pf = fe.add_image( "playfield.mp4", 1080, 1920, 1080, 1920 );
pf.rotation=180


local snap=fe.add_artwork("table3", 1080, 0, 1920, 1080);

snap.rotation=90

 fe.add_image("green.png", 0, 1380, 1080, 540 );

local w=fe.add_artwork("wheel", 40, 10, 1000, 600);
w.preserve_aspect_ratio = true


# Aperture Over Snap

//local masking = fe.add_image( "artwork/scanlines/aperture.png",450, 250, 1020, 580)



# Wheel & Position

local retro =
{
    function init()
    {
        slots <- 9
        speed <- 0900
        artwork_label <- "icon" 
        //video_flags <- Vid.ImagesOnly
        x <- 0
        y <- 1590
		layout.y <- [ 20, 20, 20, 20, 95, 20, 20, 20, 20 ]
		     layout.x <- [ -200, 85, 210, 335, 540, 745, 870, 995, 1280 ] 
      layout.width <- [  150,  150,  150,  150, 370, 150,  150,  150, 150 ]
     layout.height <- [  125,  125,  125,  125, 270, 125,  125,  125, 125 ]
		layout.alpha <- [ 255, 255, 255, 255, 255, 255, 255, 255, 255 ]
		zorder <- 2
		anchor <- Wheel.Anchor.Bottom
    }
}	
local wheel = fe.add_wheel(retro)

# Pulse Selected Logo

if (cfg["pulse"] == "Yes")
{
    {
    local pulse_once = false
    local pulse = 0.0
    local pulse_freq = 1.1    // times per second
    local pulse_scale = 0.2

    local pulse_slot = fe.add_clone( wheel.sel_slot )
    pulse_slot.zorder = wheel.cfg.zorder + wheel.selected_slot_idx - 2

if (cfg["color"] == "Red")
{
	pulse_slot.set_rgb( 255,0,0 )
}

if (cfg["color"] == "White")
{
	pulse_slot.set_rgb( 255,255,255 )
}

if (cfg["color"] == "Blue")
{
	pulse_slot.set_rgb( 0,0,196 )
}

if (cfg["color"] == "Black")
{
	pulse_slot.set_rgb( 0,0,0 )
}

if (cfg["color"] == "Green")
{
	pulse_slot.set_rgb( 0,255,0 )
}

if (cfg["color"] == "Purple")
{
	pulse_slot.set_rgb( 206,47,202 )
}

if (cfg["color"] == "Yellow")
{
	pulse_slot.set_rgb( 255,255,0 )
}

if (cfg["color"] == "Rainbow")
{
	pulse_slot = Inertia ( pulse_slot, 1500, "red", "green", "blue" )
	pulse_slot.tween_all = Tween.FullSine
	pulse_slot.loop_all = true
	pulse_slot.set_all = 150
	pulse_slot.to_all = 255
	pulse_slot.delay_green = -1000
	pulse_slot.delay_blue = -1000
}

    function update_pulse()
    {
        if( pulse_once )
            return

        if( !wheel.velocity)
            pulse += pulse_freq / ScreenRefreshRate
        else
            pulse = 0.0

            if( pulse > 1.0 ) pulse = 0.0

            local sel = wheel.sel_slot
            pulse_slot.x = sel.x
            pulse_slot.y = sel.y
            pulse_slot.width = sel.width * ( 1.0 + pulse * pulse_scale )
            pulse_slot.height = sel.height * ( 1.0 + pulse * pulse_scale )
            pulse_slot.rotation = sel.rotation
            pulse_slot.origin_x = sel.origin_x + sel.width * pulse * pulse_scale / 2
            pulse_slot.origin_y = sel.origin_y + sel.height * pulse * pulse_scale / 2
            pulse_slot.alpha = 150 * ( 1.2 - pulse )


        if(( pulse_slot.alpha == 1 ))
            pulse_once = true
    }

    fe.add_ticks_callback( "tick_pulse" )
    function tick_pulse( ttime )
    {
        update_pulse()
        }

        fe.add_transition_callback("transition_pulse")
        function transition_pulse(ttype, var, ttime)
        {
            if( ttype == Transition.ToNewSelection || ttype == Transition.ToNewList )
            {
                pulse = 0.0
                pulse_once = false
            }
            return false
        }
    }
}

# Boxart Left Side
	


# Game Counter

local Game_Count = fe.add_text( "[ListEntry]/[ListSize]", 505, 1755, 960, 25 )
Game_Count.align = Align.Left;
Game_Count.zorder - 7;


local title =fe.add_text( "[Title]", 290, 1715, 500, 25 )
    
     
      
# Meta


	
fe.add_image( "controllers/[Control]", 1570, 730, 200, 150 );
	
# End.