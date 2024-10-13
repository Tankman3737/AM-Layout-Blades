
//Blade X Coded by layout by Tankman3737 
//Design and art Tankman3737 & midgetonebeta M1
// Thanks to Chadnaunt and Oomek for the great modules and Rodrigo Borges for the dynamic image selction code//



class UserConfig {
	
    </ label="Power Grid", help="Enable / Disable Grid overlay", options="On,Off", order=4 /> grid="OFF";

    </ label="Left Blade", 
       help="Select the color of the left blade. ",
       options="RED,BLUE,GREEN,BLACK", order=1, per_display="false" 
    />
      left_blade="RED";

      </ label="right Blade", 
       help="Select the color of the right blade. ",
       options="RED,BLUE,GREEN,BLACK", order=2, per_display="false" 
    />  
      right_blade="RED";

 </ label="Single frame colour", help="Enable / Disable Grid overlay", options="BLADE DEPENDENT,RED,BLUE,GREEN,BLACK", order=3 /> framecolour=" ";

}
cfg <- fe.get_config()


::fe.layout.width = 1920;
::fe.layout.height = 1080;
fe.load_module("wheel");     /////////////////https://github.com/oomek/attract-extra/tree/main/modules///////////////////////
fe.load_module("inertia");  /////////////////                       As above                                     //////////////
fe.load_module("blur");  /////////////////https://github.com/Chadnaut/Attract-Mode-Modules/tree/master/modules//////////////
fe.load_module("mask");  /////////////////                       As above                                     //////////////


if (cfg["grid"] == "On")
{
local grid=fe.add_image("art/LSgrid.png",0,0,1920,1080)
grid.zorder = 1000

}


////BG stuff////////////
local BG=fe.add_image("art/BG.png",0,0,1920,1080)

// MARK:Surface prev

local Prevtest=fe.add_surface(1920,1080)
Prevtest.x=0
Prevtest.y=0
local b = Prevtest.add_artwork("fanart",170,0,1580,1080);
//Prevtest.alpha=0

local black=Prevtest.add_image("art/black.png",170,0,1580,1080)
local b = Blur(Prevtest.add_artwork("fanart",170,0,1580,1080));
b.blur_size = 50;
b.alpha=150
b.index_offset = 1
local vin=Prevtest.add_image("art/vin.png",170,0,1580,1080)
vin.alpha=150

///////////overview on surface with animation//////////////
local textsurf=Prevtest.add_surface(680,827)
textsurf.set_pos( 320,535)
local text =  textsurf.add_text( "[Overview]", 10, 15, 640, 900);
text.index_offset = 1
text.charsize = 24;
text.word_wrap = true;
text.align = Align.TopLeft;

text= Inertia( text, 55500,"y");

     function  text( ttype, var, ttime )
     {
         if(  ttype==Transition.ToNewSelection || ttype==Transition.StartLayout )
         {
              text.tween_y= Tween.Linear
               text.y=50
	       text.to_y=-800
              text.delay_y=1500;
              text.loop_y=true			   			   
         }

    }

fe.add_transition_callback( "text" );
///////////overview on surface with animation//////////////

local snap=Prevtest.add_artwork("snap",300, 50, 700, 490)
snap.index_offset = 1;
snap.video_flags = Vid.NoAudio;
local mask = fe.add_image("art/MF.png");
mask.visible = false;
snap.shader = ::fe.add_shader(Shader.Fragment, "mask.frag");
snap.shader.set_texture_param("mask", mask);
local snapframe=Prevtest.add_image ("art/frames/"+cfg["left_blade"]+ cfg["right_blade"] + ".png",300, 50, 700, 490);

local mask = ::fe.add_image("art/M3.png");
mask.visible = false;
local art = Mask(Prevtest.add_artwork("flyer", 1105, 310, 430, 620));
art.mask = mask;
art.set_mask_slice(50, 50,50, 50);
art.index_offset = 1

local flyerframe1=Prevtest.add_image ("art/frames/F"+cfg["left_blade"]+ cfg["right_blade"] + ".png", 1060, 280, 520, 680)

local art3 = Mask(Prevtest.add_artwork("marquee", 1050, 80, 535, 160));
art3.mask = mask;
art3.set_mask_slice(50, 50,50, 50);
art3.index_offset = 1
local marqueeframe=Prevtest.add_image ("art/frames/"+cfg["left_blade"]+ cfg["right_blade"] + ".png",1030, 65, 580, 190);



if (cfg["framecolour"] == "GREEN" || cfg["framecolour"] == "RED" || cfg["framecolour"] == "BLUE" || cfg["framecolour"] == "RED" || cfg["framecolour"] == "BLACK" )
{
local snapblack=Prevtest.add_image("art/frames/"+cfg["framecolour"]+".png", 300, 50, 700, 490  )
   
}

if (cfg["framecolour"] == "GREEN" || cfg["framecolour"] == "RED" || cfg["framecolour"] == "BLUE" || cfg["framecolour"] == "RED" || cfg["framecolour"] == "BLACK" )
{
local marqueeblack=Prevtest.add_image("art/frames/"+cfg["framecolour"]+".png", 1030, 65, 580, 190)
   
}

if (cfg["framecolour"] == "GREEN" || cfg["framecolour"] == "RED" || cfg["framecolour"] == "BLUE" || cfg["framecolour"] == "RED" || cfg["framecolour"] == "BLACK" )
{
   local flyerblack=Prevtest.add_image("art/frames/F"+cfg["framecolour"]+".png",1060, 280, 520, 680)
   
}


local bar=Prevtest.add_image("art/bar.png",190,1010,1480,70)
local syslogo = Prevtest.add_image(  "art/platforms/[DisplayName].png", 880, 1010, 160, 70 );
syslogo.preserve_aspect_ratio=true

local year2= Prevtest.add_text( "[Year]", 970, 1035, 250, 20);
year2.charsize = 35;
year2.align = Align.Right;
year2.index_offset = 1
local year= Prevtest.add_text( "[Manufacturer]", 1300, 1035, 350, 20);
year.charsize = 35;
year.align = Align.Left;
year.index_offset = 1
local play = Prevtest.add_image( "art/Players/[Players].png", 1240, 1020, 50, 50 );
play.preserve_aspect_ratio=true
play.index_offset = 1


// MARK:Surface Now
local surfacenow=fe.add_surface(1920,1080)
surfacenow.x=0
surfacenow.y=0

local b = surfacenow.add_artwork("fanart",170,0,1580,1080);
//surfacenow.alpha=0

local black=surfacenow.add_image("art/black.png",170,0,1580,1080)
local b = Blur(surfacenow.add_artwork("fanart",170,0,1580,1080));
b.blur_size = 50;
b.alpha=150

local vin=surfacenow.add_image("art/vin.png",170,0,1580,1080)
vin.alpha=150

///////////overview on surface with animation//////////////
local textsurf=surfacenow.add_surface(680,827)
textsurf.set_pos( 320,500)
local text =  textsurf.add_text( "[Overview]", 10, 15, 640, 900);
text.charsize = 24;
text.word_wrap = true;
text.align = Align.TopLeft;

text= Inertia( text, 55500,"y");

     function  text( ttype, var, ttime )
     {
         if(  ttype==Transition.ToNewSelection || ttype==Transition.StartLayout )
         {
              text.tween_y= Tween.Linear
               text.y=50
	       text.to_y=-800
              text.delay_y=1500;
              text.loop_y=true			   			   
         }

    }

fe.add_transition_callback( "text" );
///////////overview on surface with animation//////////////

local snap2=surfacenow.add_artwork("snap",295, 45, 710, 495)
local mask2 = fe.add_image("art/MF.png");
mask2.visible = false;
snap2.shader = ::fe.add_shader(Shader.Fragment, "mask.frag");
snap2.shader.set_texture_param("mask", mask2);

local snapframe2=surfacenow.add_image ("art/frames/"+cfg["left_blade"]+ cfg["right_blade"] + ".png",300, 50, 700, 490);

local art2 = Mask(surfacenow.add_artwork("flyer", 1100, 310, 435, 620));
art2.mask = mask;
art2.set_mask_slice(50, 50,50, 50);
local flyerframe2=surfacenow.add_image ("art/frames/F"+cfg["left_blade"]+ cfg["right_blade"] + ".png", 1060, 280, 520, 680)

local art3 = Mask(surfacenow.add_artwork("marquee", 1050, 80, 535, 160));
art3.mask = mask;
art3.set_mask_slice(50, 50,50, 50);
local marqueeframe2=surfacenow.add_image ("art/frames/"+cfg["left_blade"]+ cfg["right_blade"] + ".png",1030, 65, 580, 190);


if (cfg["framecolour"] == "GREEN" || cfg["framecolour"] == "RED" || cfg["framecolour"] == "BLUE" || cfg["framecolour"] == "RED" || cfg["framecolour"] == "BLACK" )
{
local snapblack=surfacenow.add_image("art/frames/"+cfg["framecolour"]+".png", 300, 50, 700, 490  )
   
}

if (cfg["framecolour"] == "GREEN" || cfg["framecolour"] == "RED" || cfg["framecolour"] == "BLUE" || cfg["framecolour"] == "RED" || cfg["framecolour"] == "BLACK" )
{
local marqueeblack=surfacenow.add_image("art/frames/"+cfg["framecolour"]+".png", 1030, 65, 580, 190)
   
}

if (cfg["framecolour"] == "GREEN" || cfg["framecolour"] == "RED" || cfg["framecolour"] == "BLUE" || cfg["framecolour"] == "RED" || cfg["framecolour"] == "BLACK" )
{
   local flyerblack=surfacenow.add_image("art/frames/F"+cfg["framecolour"]+".png",1060, 280, 520, 680)
   
}



////////Artwork with mask///////////////
local bar=surfacenow.add_image("art/bar.png",190,1010,1480,70)
local syslogo = surfacenow.add_image(  "art/platforms/[DisplayName].png", 880, 1010, 160, 70 );
syslogo.preserve_aspect_ratio=true


local year2= surfacenow.add_text( "[Year]", 970, 1035, 250, 20);
year2.charsize = 35;
year2.align = Align.Right;
local year= surfacenow.add_text( "[Manufacturer]", 1300, 1035, 350, 20);
year.charsize = 35;
year.align = Align.Left;



local play = surfacenow.add_image( "art/Players/[Players].png", 1240, 1020, 50, 50 );
play.preserve_aspect_ratio=true


//MARK: blades left

local bladegreySNow=surfacenow.add_image("art/blades/dark" + cfg["left_blade"] + ".png",100, 0, 145, 1080);
local bladegreenSNow=surfacenow.add_image("art/blades/light" + cfg["left_blade"] + ".png", 100, 0, 145, 1080);
local bladegreySNow3=surfacenow.add_image("art/blades/dark" + cfg["right_blade"] + ".png",100, 0, 145, 1080);
bladegreySNow3.alpha=0

local nameSNow= surfacenow.add_text( " [Name]", 215, 350, 300, 20);
nameSNow.charsize = 35;
nameSNow.align = Align.Centre; 
nameSNow.word_wrap = true; 
nameSNow.rotation=90
nameSNow.outline = 2
nameSNow.set_outline_rgb( 0,0,0 )

local  SNowP=fe.add_surface(1245,1080)
SNowP.x=0
SNowP.y=0
local bladegreySNowP=SNowP.add_image("art/blades/dark" + cfg["left_blade"] + ".png"    ,40,0,145,1080)
local nameP=SNowP.add_text( " [Name]", 155, 350, 300, 20);
nameP.charsize = 35;
nameP.align = Align.Centre; 
nameP.word_wrap = true; 
nameP.rotation=90
nameP.index_offset = 1
//nameP.alpha=0

local  SNowP2=fe.add_surface(245,1080)
SNowP2.x=-60
SNowP2.y=0
//SNowP2.alpha=0
local bladegreySNowP2=SNowP2.add_image("art/blades/dark" + cfg["left_blade"] + ".png",40,0,145,1080)
//bladegreySNowP2.alpha=0
local nameP2=SNowP2.add_text( " [Name]", 155, 350, 300, 20);
nameP2.charsize = 35;
nameP2.align = Align.Centre; 
nameP2.word_wrap = true; 
nameP2.rotation=90
nameP2.index_offset = 2
//nameP2.alpha=0


local  SNowP3=fe.add_surface(245,1080)
SNowP3.x=-60
SNowP3.y=0
SNowP3.alpha=0
local bladegreySNowP2=SNowP3.add_image("art/blades/dark" + cfg["left_blade"] + ".png",40,0,145,1080)
//bladegreySNowP2.alpha=0
local nameP3=SNowP3.add_text( " [Name]", 155, 350, 300, 20);
nameP3.charsize = 35;
nameP3.align = Align.Centre; 
nameP3.word_wrap = true; 
nameP3.rotation=90
nameP3.index_offset = 3
//nameP2.alpha=0




//MARK: SurfacePrev
local surfaceprev=fe.add_surface(1920,1080)
surfaceprev.x=0
surfaceprev.y=0
surfaceprev.alpha=0

local black=surfaceprev.add_image("art/black.png",170,0,1580,1080)
local b = Blur(surfaceprev.add_artwork("fanart",170,0,1580,1080));
b.blur_size = 50;
b.alpha=150
b.index_offset = -1
local vin=surfaceprev.add_image("art/vin.png",170,0,1580,1080)
vin.alpha=150

///////////overview on surface with animation//////////////
local textsurf=surfaceprev.add_surface(680,827)
textsurf.set_pos( 320,535)
local text2 =  textsurf.add_text( "[Overview]", 10, 15, 640, 900);
text2.index_offset = -1
text2.charsize = 24;
text2.word_wrap = true;
text2.align = Align.TopLeft;

text2= Inertia( text2, 42500,"y");

     function  text2( ttype, var, ttime )
     {
         if(  ttype==Transition.ToNewSelection || ttype==Transition.StartLayout )
         {
              text2.tween_y= Tween.Linear
               text2.y=50
	       text2.to_y=-800
              text2.delay_y=1500;
              text2.loop_y=true			   			   
         }

    }

fe.add_transition_callback( "text" );
///////////overview on surface with animation//////////////

local snap3=surfaceprev.add_artwork("snap",300, 50, 700, 490)
snap3.index_offset = -1;
snap3.video_flags = Vid.NoAudio;
local mask3 = fe.add_image("art/MF.png");
mask3.visible = false;
snap3.shader = ::fe.add_shader(Shader.Fragment, "mask.frag");
snap3.shader.set_texture_param("mask", mask3);

local snapframe1=surfaceprev.add_image ("art/frames/"+cfg["left_blade"]+ cfg["right_blade"] + ".png",300, 50, 700, 490);

local mask2 = ::fe.add_image("art/MP.png");
mask2.visible = false;
local art2 = Mask(surfaceprev.add_artwork("flyer", 1105, 310, 430, 620));
art2.mask = mask;
art2.set_mask_slice(50, 50,50, 50);
art2.index_offset = -1
local mask3 = ::fe.add_image("art/MP.png");
mask3.visible = false;
local art3 = Mask(surfaceprev.add_artwork("marquee", 1050, 80, 535, 160));
art3.mask = mask;
art3.set_mask_slice(50, 50,50, 50);
art3.index_offset = -1

local marqueeframe3=surfaceprev.add_image ("art/frames/"+cfg["left_blade"]+ cfg["right_blade"] + ".png",1030, 65, 580, 190);
local flyerframe=surfaceprev.add_image ("art/frames/F"+cfg["left_blade"]+ cfg["right_blade"] + ".png", 1060, 280, 520, 680)
local bar=surfaceprev.add_image("art/bar.png",190,1010,1480,70)
local syslogo = surfaceprev.add_image(  "art/platforms/[DisplayName].png", 880, 1010, 160, 70 );
syslogo.preserve_aspect_ratio=true


if (cfg["framecolour"] == "GREEN" || cfg["framecolour"] == "RED" || cfg["framecolour"] == "BLUE" || cfg["framecolour"] == "RED" || cfg["framecolour"] == "BLACK" )
{
local snapblack=surfaceprev.add_image("art/frames/"+cfg["framecolour"]+".png", 300, 50, 700, 490  )
   
}

if (cfg["framecolour"] == "GREEN" || cfg["framecolour"] == "RED" || cfg["framecolour"] == "BLUE" || cfg["framecolour"] == "RED" || cfg["framecolour"] == "BLACK" )
{
local marqueeblack=surfaceprev.add_image("art/frames/"+cfg["framecolour"]+".png", 1030, 65, 580, 190)
   
}

if (cfg["framecolour"] == "GREEN" || cfg["framecolour"] == "RED" || cfg["framecolour"] == "BLUE" || cfg["framecolour"] == "RED" || cfg["framecolour"] == "BLACK" )
{
   local flyerblack=surfaceprev.add_image("art/frames/F"+cfg["framecolour"]+".png",1060, 280, 520, 680)
   
}




local year2= surfaceprev.add_text( "[Year]", 970, 1035, 250, 20);
year2.charsize = 35;
year2.align = Align.Right;
year2.index_offset = -1
local year= surfaceprev.add_text( "[Manufacturer]", 1300, 1035, 350, 20);
year.charsize = 35;
year.align = Align.Left;
year.index_offset = -1
local play = surfaceprev.add_image( "art/Players/[Players].png", 1240, 1020, 50, 50 );
play.preserve_aspect_ratio=true
play.index_offset = -1

local bladegreySNow=surfaceprev.add_image("art/blades/light" + cfg["left_blade"] + ".png",100,0,145,1080)
    //bladegreySNow.alpha=0
local bladegreySNow2=surfaceprev.add_image("art/blades/dark" + cfg["right_blade"] + ".png",100,0,145,1080)

local nameSprevP= surfaceprev.add_text( " [Name]", 215, 350, 300, 20);
nameSprevP.charsize = 35;
nameSprevP.align = Align.Centre; 
nameSprevP.word_wrap = true; 
nameSprevP.rotation=90
nameSprevP.index_offset = -1

local BG=fe.add_image("art/BG2.png",1715,0,320,1080)


//MARK: BladesRight

local  SNextP4=fe.add_surface(245,1080)
SNextP4.x=1715
SNextP4.y=0
//SNextP4.alpha=0

local bladegreySNextP4=SNextP4.add_image("art/blades/dark" + cfg["right_blade"] + ".png",40,0,145,1080)
//bladegreySNextP4.alpha=0

local nameP4=SNextP4.add_text( " [Name]", 155, 350, 300, 20);
nameP4.charsize = 35;
nameP4.align = Align.Centre; 
nameP4.word_wrap = true; 
nameP4.rotation=90
nameP4.index_offset = -4
//nameP4.alpha=0

local  SNextP3=fe.add_surface(245,1080)
SNextP3.x=1715
SNextP3.y=0
//SNextP3.alpha=0
local bladegreySNextP3=SNextP3.add_image("art/blades/dark" + cfg["right_blade"] + ".png",40,0,145,1080)
//bladegreySNextP3.alpha=0
local nameP3=SNextP3.add_text( " [Name]", 155, 350, 300, 20);
nameP3.charsize = 35;
nameP3.align = Align.Centre; 
nameP3.word_wrap = true; 
nameP3.rotation=90
nameP3.index_offset = -3
//nameP2.alpha=0

local  SNextP2=fe.add_surface(245,1080)
SNextP2.x=1650
SNextP2.y=0
//SNextP2.alpha=0

local bladegreySNextP2=SNextP2.add_image("art/blades/dark" + cfg["right_blade"] + ".png",40,0,145,1080)
//bladegreySNextP2.alpha=0
local nameP2=SNextP2.add_text( " [Name]", 155, 350, 300, 20);
nameP2.charsize = 35;
nameP2.align = Align.Centre; 
nameP2.word_wrap = true; 
nameP2.rotation=90
nameP2.index_offset = -2
//nameP2.alpha=0

local  SNextP=fe.add_surface(245,1080)
SNextP.x=1590
SNextP.y=0
//SNextP.alpha=0
local bladegreySNextP=SNextP.add_image("art/blades/dark" + cfg["right_blade"] + ".png",40,0,145,1080)
local nameP=SNextP.add_text( " [Name]", 155, 350, 300, 20);
nameP.charsize = 35;
nameP.align = Align.Centre; 
nameP.word_wrap = true; 
nameP.rotation=90
nameP.index_offset = -1

//////////CLOCK////////////



local txt_time3 =  Prevtest.add_text("", 420, 1015, 500, 60)//Controll code "empty","left or right","Up or down","Left as is";"Size" "( label, x, y, w, h )"
txt_time3.set_rgb(255, 255, 255)
txt_time3.style = Style.Bold
txt_time3.zorder = 99
txt_time3.outline = 3


local txt_time2 =  surfaceprev.add_text("", 420, 1015, 500, 60)//Controll code "empty","left or right","Up or down","Left as is";"Size" "( label, x, y, w, h )"
txt_time2.set_rgb(255, 255, 255)
txt_time2.style = Style.Bold
txt_time2.zorder = 99
txt_time2.outline = 3

local txt_time =  surfacenow.add_text("", 420, 1015, 500, 60)//Controll code "empty","left or right","Up or down","Left as is";"Size" "( label, x, y, w, h )"
txt_time.set_rgb(255, 255, 255)
txt_time.style = Style.Bold
txt_time.zorder = 99
txt_time.outline = 3


function on_tick(tick_time)
{
   local ttime = date()
   local suffix = "AM"

   if (ttime.hour >= 12) {
      suffix = "PM"
   }

   txt_time.msg = format("%02d:%02d %s", ttime.hour % 12, ttime.min, suffix)
   txt_time2.msg = format("%02d:%02d %s", ttime.hour % 12, ttime.min, suffix)
   txt_time3.msg = format("%02d:%02d %s", ttime.hour % 12, ttime.min, suffix)

}

fe.add_ticks_callback(this, "on_tick") 




	//MARK: SignalHandlers
function interationControls(sig)
{
    switch (sig)
    {
        case "left":
            fe.signal("prev_game")

			surfacenow.x=1520  
            surfacenow.to_x=0	
            surfacenow.alpha=255  
        	Prevtest.x=0
			Prevtest.to_x=-60	
			SNowP.x=60
			SNowP.to_x=0
            SNowP2.x=0
			SNowP2.to_x=-60
            SNowP2.to_alpha=255
            SNowP2.time_alpha=1    
            SNowP3.x=-60
			SNowP3.to_x=-180
            SNowP3.to_alpha=255
            SNowP3.time_alpha=1   
            surfaceprev.alpha=255
            surfaceprev.to_alpha=0
            surfaceprev.time_alpha=1
            SNextP.alpha=0
            SNextP.to_alpha=255
            SNextP.time_alpha=1
            SNextP.x=1650
            SNextP.to_x=1590
            SNextP2.x=1715
            SNextP2.to_x=1650
            SNextP3.x=1920
            SNextP3.to_x=1710
            SNextP4.alpha=0
            bladegreenSNow.delay_alpha=100
            bladegreenSNow.alpha=0
            bladegreenSNow.to_alpha=255
            bladegreySNow3.delay_alpha=400
            bladegreySNow3.alpha=255
            bladegreySNow3.to_alpha=0
           
            return true;
        case "right":
            fe.signal("next_game")

            surfacenow.x=-60  
            surfacenow.to_x=0
            SNowP.x=-60
            SNowP.to_x=0
            SNowP2.x=-160
            SNowP2.to_x=-60
            surfaceprev.x=-60  
            surfaceprev.to_x=0
            surfaceprev.alpha=0
            surfaceprev.to_alpha=255
            surfaceprev.time_alpha=1
            surfaceprev.x=100
            surfaceprev.to_x=1530
            SNextP.alpha=255
            SNextP.to_alpha=0
            SNextP.time_alpha=1
            SNextP2.x=1590
            SNextP2.to_x=1650
            SNextP3.alpha=0
            SNextP3.to_alpha=255
            SNextP3.time_alpha=1
            SNextP3.x=1650
            SNextP3.to_x=1710
            SNextP4.alpha=255
            SNextP4.time_alpha=1
            SNextP4.x=1710
            SNextP4.to_x=1920
            bladegreySNow2.delay_alpha=200
            bladegreySNow2.alpha=0
            bladegreySNow2.to_alpha=255
            bladegreenSNow.delay_alpha=300
            bladegreenSNow.alpha=0
            bladegreenSNow.to_alpha=255

            return true;
        case "up":
            fe.signal("prev_game")
			
            
            return true;
        case "down":
            fe.signal("next_game")
		
            
            return true;
        default:
            return false;
    }
}
fe.add_signal_handler("interationControls");


Prevtest= Inertia(Prevtest, 500,"x","y","alpha"); 
//surfaceprev= Inertia(surfaceprev, 2500,"x","y","alpha");     
surfaceprev= Inertia(surfaceprev, 500,"x","y","alpha");      
surfacenow= Inertia(surfacenow, 500,"x","y","alpha");     
SNowP3= Inertia(SNowP3, 500,"x","y","alpha");  
SNowP2= Inertia(SNowP2, 500,"x","y","alpha");  
SNowP= Inertia(SNowP, 500,"x","y","alpha");  
SNextP4= Inertia(SNextP4, 500,"x","y","alpha"); 
SNextP3= Inertia(SNextP3, 500,"x","y","alpha"); 
SNextP2= Inertia(SNextP2, 500,"x","y","alpha");  
SNextP= Inertia(SNextP, 500,"x","y","alpha"); 
bladegreenSNow=Inertia(bladegreenSNow, 500,"x","y","alpha");
bladegreySNow2=Inertia(bladegreySNow2, 500,"x","y","alpha");
bladegreySNow3=Inertia(bladegreySNow3, 500,"x","y","alpha");



 







