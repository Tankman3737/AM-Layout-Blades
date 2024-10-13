# Basic Layout For Attract Mode Plus
# Design By: Tankman3737)
# Coded By: Tankman3737



# Layout Size

fe.layout.width=1920;
fe.layout.height=1080;


# Modules

fe.load_module("config");
fe.load_module("fade");
fe.load_module("inertia");
fe.load_module("mask");
fe.load_module("wheel");
fe.load_module( "animate" );

fe.do_nut ( "artwork/wheel.nut" );
# Background

local t = fe.add_image( "artwork/BG.png", 0, 0, 1920, 1080);


local artworksurf=fe.add_surface(1920,1080)
artworksurf.set_pos( 0,0)
artworksurf.alpha=0

local text = artworksurf.add_text( "[Overview]", 170, 300, 480, 920);
text.charsize = 24;
text.word_wrap = true;
text.align = Align.TopLeft;


local year= artworksurf.add_text( "[Year]", 1250, 450, 150, 20);
year.charsize = 35;
year.align = Align.Left;
local year= artworksurf.add_text( "[Manufacturer]", 1270, 500, 200, 20);
year.charsize = 35;
year.align = Align.Left;
local year= artworksurf.add_text( "Players: [Players]", 1290, 550, 200, 20);
year.charsize = 35;
year.align = Align.Left;  

local marquee=artworksurf.add_artwork("marquee2" 560,775,800,250)
//marquee.anchor=Anchor.Centre
local mask = fe.add_image("artwork/M3.png");
mask.visible = false;

marquee.shader = ::fe.add_shader(Shader.Fragment, "mask.frag");
marquee.shader.set_texture_param("mask", mask);



/////////////////////
//Video
/////////////////////

local last_nav = 0;
local gtime = 0;
local art_flag = true;

local video = artworksurf.add_image( fe.get_art("snap"),660, 300, 600, 400 );  //Use add_image so the snap doesn't auto-update while navigating
//video.anchor=Anchor.Centre
video.alpha=0
local mask = artworksurf.add_image("artwork/M2.png");
mask.visible = false;

video.shader = ::fe.add_shader(Shader.Fragment, "mask.frag");
video.shader.set_texture_param("mask", mask);





fe.add_transition_callback( "my_transition" );
function my_transition( ttype, var, ttime )
{
    if ( ttype == Transition.FromOldSelection || Transition.ToNewList )
    {
        last_nav = gtime;
        art_flag = true;
        video.video_playing = false
    }
}

fe.add_ticks_callback( this, "on_tick" );
function on_tick( ttime )
{
    gtime = ttime;
    if (art_flag && (ttime - last_nav > 1800))  //400ms delay
    {
        video.file_name = fe.get_art("snap");
        art_flag = false;
        video.video_playing = true
    }
    if ( video.video_playing == false && video.preserve_aspect_ratio == false)
        video.preserve_aspect_ratio = true
}


video= Inertia( video, 500,"x","y","alpha");

     function video (ttype, var, ttime )
     {
         if(   ttype==Transition.StartLayout)
         {
               
               
               video.to_alpha=255			   
			   video.delay_alpha=2000;
			  	
              
			   		   
         }
         if( ttype == Transition.ToNewSelection )
		 {
		    video.alpha=0
             video.to_alpha=255			   		  			  			   
			   video.delay_alpha=1500;
             
			 
			 }


    }

fe.add_transition_callback( "video" );






artworksurf= Inertia( artworksurf, 500,"x","y","alpha");

     function artworksurf(ttype, var, ttime )
     {
         if(   ttype==Transition.StartLayout)
         {
                             
               artworksurf.to_alpha=255			   
			  artworksurf.delay_alpha=2000;
			  	
			   		   
         }
         if( ttype == Transition.ToNewSelection )
		 {
		    artworksurf.alpha=0
             artworksurf.to_alpha=255			   		  			  			   
			   artworksurf.delay_alpha=1500;
             
			 }


    }

fe.add_transition_callback( "artworksurf" );


















# Wheel Horizontal split (Bottom)

local surfC= fe.add_surface(1920, 1080);
surfC.set_pos( 0,0)
local menustrip=surfC.add_image("menuGradient.png",0,412,1920,250)
menustrip.zorder=1
local retrocentre =
{
    function init()
    {
    slots <- 9
    speed <- 0900
    artwork_label <- "wheel" 
    video_flags <- Vid.ImagesOnly
    x <- 200
    y <- 400
    layout.y <- [ 140, 140, 140, 140, 140, 140, 140, 140, 140 ]
    layout.x <- [ -740, -410, -20, 360, 760, 1150, 1530, 1940, 1940 ] 
    layout.width <- [ 300, 300, 300, 300, 350, 300, 300, 300, 300 ]
    layout.height <- [ 100, 100, 100, 100, 150, 100, 100, 100, 100 ]
    layout.alpha <- [ 0, 0, 0, 0, 255, 0, 0, 0, 0 ]
    zorder <- 2
    //anchor <- Wheel.Anchor.Centre
    }
}	
local wheelcentre = fe.add_wheel( retrocentre,surfC)



surfC = Inertia( surfC, 100,"y");

     function  surfC( ttype, var, ttime )
     {
         if(ttype==Transition.ToNewSelection || ttype==Transition.StartLayout)
         {
              
               surfC.y=0
	       surfC.to_y=-400
               surfC.delay_y=1500;			   			   
         }

    }

fe.add_transition_callback( "surfC" );


local surfaceleft = fe.add_surface(1920, 1080);
surfaceleft.set_pos( 0,0)
surfaceleft.mipmap = true
local retroleft =
{
    function init()
    {
    slots <- 9
    speed <- 0900
    artwork_label <- "wheel" 
    video_flags <- Vid.ImagesOnly
    x <- 200
    y <- 400
    layout.y <- [ 140, 140, 140, 140, 140, 140, 140, 140, 140 ]
    layout.x <- [ -740, -410, -20, 360, 760, 1150, 1530, 1940, 1940 ] 
    layout.width <- [ 300, 300, 300, 300, 350, 300, 300, 300, 300 ]
    layout.height <- [ 100, 100, 100, 100, 150, 100, 100, 100, 100 ]
    layout.alpha <- [ 255, 255, 255, 255, 0, 0, 0, 0, 0]
    zorder <- 2
    //anchor <- Wheel.Anchor.Centre
    }
}	
local wheelleft = fe.add_wheel( retroleft,surfaceleft )



//////////animate wheel///////

surfaceleft= Inertia( surfaceleft, 1500,"x");

     function  surfaceleft( ttype, var, ttime )
     {
         if(  ttype==Transition.ToNewSelection || ttype==Transition.StartLayout )
         {
              
               surfaceleft.x=0
	       surfaceleft.to_x=-800
               surfaceleft.delay_x=1500;			   			   
         }

    }

fe.add_transition_callback( "surfaceleft" );

local surfaceright = fe.add_surface(1920, 1080);
surfaceright.set_pos( 0,0)
surfaceright.mipmap = true


local retroright =
{
    function init()
    {
    slots <- 9
    speed <- 0900
    artwork_label <- "wheel" 
    video_flags <- Vid.ImagesOnly
    x <- 200
    y <- 400
    layout.y <- [ 140, 140, 140, 140, 140, 140, 140, 140, 140 ]
    layout.x <- [ -740, -410, -20, 360, 760, 1150, 1530, 1940, 1940 ] 
    layout.width <- [ 300, 300, 300, 300, 350, 300, 300, 300, 300 ]
    layout.height <- [ 100, 100, 100, 100, 150, 100, 100, 100, 100 ]
    layout.alpha <- [ 0, 0, 0, 0, 0, 255, 255, 255, 255 ]
    zorder <- 2
   // anchor <- Wheel.Anchor.Centre
    }
}	
local wheelright = fe.add_wheel( retroright,surfaceright )

//////////animate wheel///////

surfaceright = Inertia( surfaceright , 700,"alpha");

     function  surfaceright ( ttype, var, ttime )
     {
         if(  ttype==Transition.ToNewSelection || ttype==Transition.StartLayout)
         {
              
               surfaceright .alpha=255
	       surfaceright .to_alpha=0
               surfaceright .delay_alpha=3000;			   			   
         }

    }

fe.add_transition_callback( "surfaceright " );

//////////animate wheel///////

surfaceright= Inertia( surfaceright, 1500,"x");

     function  surfaceright( ttype, var, ttime )
     {
         if( ttype==Transition.ToNewSelection || ttype==Transition.StartLayout)
         {
              
               surfaceright.x=0
	       surfaceright.to_x=800
               surfaceright.delay_x=1500;			   			   
         }

    }

fe.add_transition_callback( "surfaceright" );




local S1=fe.add_surface(1920,1080)
S1.x=0
S1.y=0

//S1.alpha=0








local BladeS1=S1.add_image("artwork/BL.png",-1050,0,1920,1080)

local glowS1=S1.add_image("artwork/glow lineBL.png",-1050,0,1920,1080)



BladeS1 = Inertia( BladeS1, 500,"x","y");
S1 = Inertia( S1, 500,"x","y");
glowS1 = Inertia( glowS1, 500,"x","y");
mask = Inertia( mask, 500,"x","y");

     function S1 (ttype, var, ttime )
     {
         if(  ttype==Transition.ToNewSelection || ttype==Transition.StartLayout)
         {
               
               BladeS1.x=-1050
			   BladeS1.to_x=0
			  mask.x=0
			  mask.to_x=1920
			  mask.time_x=3000
			   glowS1.x=-1050
			   glowS1.to_x=0
			  mask.x=350
			  mask.to_x=1920
			  mask.delay_x=3000
			  mask.time_x=3000
			   
			   S1.x=0
			   BladeS1.delay_x=500;
			  	
               glowS1.delay_x=500;
			   		   
         }
         if( ttype == Transition.EndNavigation ||  ttype==Transition.StartLayout){
             S1.to_x=-1050
			 
			 S1.delay_x=1900
             
			 
			 }


    }

fe.add_transition_callback( "S1" );



local S3=fe.add_surface(1920,1080)
S3.x=0
S3.y=0


//S3.alpha=0

local BladeS3=S3.add_image("artwork/TR.png",1050,0,1920,1080)

local glowS3=S3.add_image("artwork/glow lineBL.png",1330,0,1920,1080)



BladeS3 = Inertia( BladeS3, 500,"x","y");
S3 = Inertia( S3, 500,"x","y");
glowS3 = Inertia( glowS3, 500,"x","y");

     function S3 (ttype, var, ttime )
     {
         if(  ttype==Transition.ToNewSelection || ttype==Transition.StartLayout )
         {
               //S3.tween_x= Tween.Back
               BladeS3.x=1050
			   BladeS3.to_x=0
			  
			   glowS3.x=1330
			   glowS3.to_x=280
			  
			   
			   S3.x=0
			   BladeS3.delay_x=700;
			  	
               glowS3.delay_x=700;
			   		   
         }
         if( ttype == Transition.EndNavigation || ttype==Transition.StartLayout){
             S3.to_x=1050
			 
			 S3.delay_x=2100
             
			 
			 }


    }

fe.add_transition_callback( "S3" );



local S2=fe.add_surface(1920,1080)
S2.x=0
S2.y=0




local BladeS2=S2.add_image("artwork/TL.png",-1050,0,1920,1080)

local glowS2=S2.add_image("artwork/glow lineBR.png",-1330,0,1920,1080)





BladeS2 = Inertia( BladeS2, 500,"x","y");
S2 = Inertia( S2, 500,"x","y");
glowS2 = Inertia( glowS2, 500,"x","y");

     function S2 (ttype, var, ttime )
     {
         if(  ttype==Transition.ToNewSelection || ttype==Transition.StartLayout )
         {
               //S2.tween_x= Tween.Elastic
               BladeS2.x=-1050
			   BladeS2.to_x=0
			 
			   glowS2.x=-1330
			   glowS2.to_x=-280
			  
			   
			   S2.x=0
			   BladeS2.delay_x=900;
			  	
               glowS2.delay_x=900;
			  			   
         }
         if( ttype == Transition.EndNavigation || ttype==Transition.StartLayout){
            
			 
			 S2.delay_x=1500             
			 S2.to_x=-1050
			  
			 }


    }

fe.add_transition_callback( "S2" );

local S4=fe.add_surface(1920,1080)
S4.x=0
S4.y=0



local BladeS4=S4.add_image("artwork/BR.png",1050,0,1920,1080)
local glowS4=S4.add_image("artwork/glow lineBR.png",1050,0,1920,1080)






BladeS4 = Inertia( BladeS4, 500,"x","y");
S4 = Inertia( S4, 500,"x","y");
glowS4 = Inertia( glowS4, 500,"x","y","alpha");

     function S4 (ttype, var, ttime )
     {
         if(  ttype==Transition.ToNewSelection || ttype==Transition.StartLayout)
         {
              
               BladeS4.x=1050
			   BladeS4.to_x=0
			  
			   glowS4.x=1050
			   glowS4.to_x=0
			  
			   
			   S4.x=0
			   BladeS4.delay_x=700;
			  	
               glowS4.delay_x=700;
			   		   
         }
         if( ttype == Transition.EndNavigation || ttype==Transition.StartLayout){
             S4.to_x=1050			 
			 S4.delay_x=1700
			
			 }


    }

fe.add_transition_callback( "S4" );








//local grid = fe.add_image( "LSgrid.png", 0, 0, 1920, 1080);






local surf = fe.add_surface(1920, 1080);
surf.visible = false;
surf.repeat = true;

local mask2 = surf.add_image("mask.png", 0, 0, 200, 1080);
local snap2 = Mask(fe.add_image("artwork/glow lineBR.png", -1200, 0, 1920, 1080));
local snap5 = Mask(fe.add_image("artwork/glow lineBL.png", -900, 0, 1920, 1080));
snap2.mask = surf;
snap5.mask = surf;





local surf2 = fe.add_surface(1920, 1080);
surf2.visible = false;
surf2.repeat = true;

local mask3 = surf2.add_image("mask.png", 0, 0, 200, 1080);
local snap3 = Mask(fe.add_image("artwork/glow lineBL.png", 1200, 0, 1920, 1080));
snap3.mask = surf2;
local snap4 = Mask(fe.add_image("artwork/glow lineBR.png", 900, 0, 1920, 1080));
snap4.mask = surf2;




 mask2 = Inertia(  mask2, 1300,"x","y","alpha");
 mask3 = Inertia(  mask3, 1300,"x","y","alpha");
     function green (ttype, var, ttime )
     {
         if(  ttype==Transition.ToNewSelection || ttype==Transition.StartLayout)
         {
              
                mask2.x=1920
			    mask2.to_x=0
			    mask3.x=0
			    mask3.to_x=1920
			    
			   		   
         }
         if( ttype == Transition.EndNavigation || ttype==Transition.StartLayout){
             
			
			 }


    }

fe.add_transition_callback( "green" );



# Date & Time (Top Right Corner)

function update_clock(ttime)
{
    now <- date();
    
    if (now.hour == 0) {
        now.hour = 12;
        dt.msg = format("%02d", now.hour) + ":" + format("%02d", now.min) + " AM";
    } else if (now.hour < 12) {
        dt.msg = format("%02d", now.hour) + ":" + format("%02d", now.min) + " AM";
    } else if (now.hour == 12) {
        dt.msg = format("%02d", now.hour) + ":" + format("%02d", now.min) + " PM";
    } else {
        dt.msg = format("%02d", now.hour - 12) + ":" + format("%02d", now.min) + " PM";
    }
    
    return dt.msg;
}

fe.add_ticks_callback(this, "update_clock");

dt <- fe.add_text("", 920, 05, 200, 20);
dt.align = Align.Right;
dt.charsize = 20;
dt.set_rgb(255, 255, 255);

function updateTimestamp() // Short
{
    days <- [ "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" ]
    months <- [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]
    now <- date()
    return days[now.wday] + ", " + months[now.month + 0] + " " + now.day + "  " + now.year
}

timestamp <- fe.add_text ( "[!updateTimestamp]", 520, 05, 500, 20 )
timestamp.align = Align.Right;
timestamp.charsize = 20;
timestamp.set_rgb( 255, 255, 255 );


# Game Counter

local game = fe.add_text ( "[ListEntry]/[ListSize]", 810, 1053, 300, 25 );
game.align = Align.Centre;
























