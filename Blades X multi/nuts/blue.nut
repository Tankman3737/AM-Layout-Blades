

//Blade X layout by Tankman3737
// Thanks to Chadnaunt and Oomek for the great modules



/*
::fe.layout.width = 1920;
::fe.layout.height = 1080;
fe.load_module("wheel");     /////////////////https://github.com/oomek/attract-extra/tree/main/modules///////////////////////
fe.load_module("inertia");  /////////////////                       As above                                     //////////////


fe.load_module("blur");  /////////////////https://github.com/Chadnaut/Attract-Mode-Modules/tree/master/modules//////////////
fe.load_module("mask");  /////////////////                       As above                                     //////////////
*/

////BG stuff////////////
local BG=fe.add_image("art/BG.png",0,0,1920,1080)




//////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////
// MARK:Surface prev

/////////////////////////////////////THIS IS THE NEW CODE, PUT IT HERE. MORE STUFF DOWN BY SIGNAL HANDLERS///////////////////////////
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
vin.alpha=200

////////Artwork with mask///////////////
local mask = ::fe.add_image("art/MP.png");
mask.visible = false;
local art = Mask(Prevtest.add_artwork("snap", 350, 50, 600, 400));
art.mask = mask;
art.set_mask_slice(50, 50, 50, 50);
art.index_offset = 1
art.video_flags = Vid.NoAudio;



local mask2 = ::fe.add_image("art/MP.png");
mask2.visible = false;
local art2 = Mask(Prevtest.add_artwork("flyer", 1150, 200, 360, 530));
art2.mask = mask;
art2.set_mask_slice(50, 50,50, 50);
art2.index_offset = 1
local mask3 = ::fe.add_image("art/MP.png");
mask3.visible = false;
local art3 = Mask(Prevtest.add_artwork("marquee", 1150, 50, 360, 130));
art3.mask = mask;
art3.set_mask_slice(50, 50,50, 50);
art3.index_offset = 1
////////Artwork with mask///////////////

local year2= Prevtest.add_text( "[Year]", 1150, 750, 250, 20);
year2.charsize = 35;
year2.align = Align.Left;
year2.index_offset = 1
local year= Prevtest.add_text( "[Manufacturer]", 1170, 750, 350, 20);
year.charsize = 35;
year.align = Align.Right;
year.index_offset = 1
local players= Prevtest.add_text( "Players: [Players]", 1230, 750, 200, 20);
players.charsize = 35;
players.align = Align.Left;
players.index_offset = 1


local wheel= Prevtest.add_artwork("wheel",1100,850,500,200)
wheel.preserve_aspect_ratio =true
wheel.index_offset = 1



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
vin.alpha=200

////////Artwork with mask///////////////

local mask3 = ::fe.add_image("art/MP.png");
mask3.visible = false;
local art3 = Mask(surfacenow.add_artwork("marquee", 1150, 50, 360, 130));
art3.mask = mask;
art3.set_mask_slice(50, 50,50, 50);


local mask2 = ::fe.add_image("art/MP.png");
mask2.visible = false;
local art2 = Mask(surfacenow.add_artwork("flyer", 1150, 200, 360, 530));
art2.mask = mask;
art2.set_mask_slice(50, 50,50, 50);

local mask = ::fe.add_image("art/MP.png");
mask.visible = false;
local art = Mask(surfacenow.add_artwork("snap", 350, 50, 600, 400));
art.mask = mask;
art.set_mask_slice(50, 50, 50, 50);


////////Artwork with mask///////////////

local year2= surfacenow.add_text( "[Year]", 1150, 750, 250, 20);
year2.charsize = 35;
year2.align = Align.Left;
local year= surfacenow.add_text( "[Manufacturer]", 1170, 750, 350, 20);
year.charsize = 35;
year.align = Align.Right;
local players= surfacenow.add_text( "Players: [Players]", 1230, 750, 200, 20);
players.charsize = 35;
players.align = Align.Left;


local wheel= surfacenow.add_artwork("wheel",1100,850,500,200)
wheel.preserve_aspect_ratio =true
//MARK: blades left




local bladegreySNow=surfacenow.add_image("art/Blueblade2A.png",100,0,145,1080)
local bladegreenSNow=surfacenow.add_image("art/Blueblade2.png",100,0,145,1080)

local nameSNow= surfacenow.add_text( " [Name]", 215, 350, 300, 20);
nameSNow.charsize = 35;
nameSNow.align = Align.Centre; 
nameSNow.word_wrap = true; 
nameSNow.rotation=90

local  SNowP=fe.add_surface(1245,1080)
SNowP.x=0
SNowP.y=0
local bladegreySNowP=SNowP.add_image("art/Blueblade2A.png",40,0,145,1080)
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
local bladegreySNowP2=SNowP2.add_image("art/Blueblade2A.png",40,0,145,1080)
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
local bladegreySNowP2=SNowP3.add_image("art/Blueblade2A.png",40,0,145,1080)
//bladegreySNowP2.alpha=0
local nameP3=SNowP3.add_text( " [Name]", 155, 350, 300, 20);
nameP3.charsize = 35;
nameP3.align = Align.Centre; 
nameP3.word_wrap = true; 
nameP3.rotation=90
nameP3.index_offset = 3
//nameP2.alpha=0





///////////overview on surface with animation//////////////
local textsurf=surfacenow.add_surface(520,827)
textsurf.set_pos( 390,450)
local text =  textsurf.add_text( "[Overview]", 10, 15, 500, 900);
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


//MARK: surface Prev
local surfaceprev=fe.add_surface(1920,1080)
surfaceprev.x=0
surfaceprev.y=0
surfaceprev.alpha=0

local b = surfaceprev.add_artwork("fanart",170,0,1580,1080);
local vin=surfaceprev.add_image("art/vin.png",170,0,1580,1080)

local black=surfaceprev.add_image("art/black.png",170,0,1580,1080)
local b = Blur(surfaceprev.add_artwork("fanart",170,0,1580,1080));
b.blur_size = 50;
b.alpha=150
b.index_offset = -1
local vin=surfaceprev.add_image("art/vin.png",170,0,1580,1080)
vin.alpha=100

////////Artwork with mask///////////////

local mask2 = ::fe.add_image("art/MP.png");
mask2.visible = false;
local art2 = Mask(surfaceprev.add_artwork("flyer", 1150, 200, 360, 530));
art2.mask = mask;
art2.set_mask_slice(50, 50,50, 50);
art2.index_offset = -1
local mask3 = ::fe.add_image("art/MP.png");
mask3.visible = false;
local art3 = Mask(surfaceprev.add_artwork("marquee", 1150, 50, 360, 130));
art3.mask = mask;
art3.set_mask_slice(50, 50,50, 50);
art3.index_offset = -1

local mask = ::fe.add_image("art/MF.png");
mask.visible = false;
local art = Mask(surfaceprev.add_artwork("snap", 350, 50, 600, 400));
art.mask = mask;
art.set_mask_slice(50, 50, 50, 50);
art.index_offset = -1
art.video_flags = Vid.NoAudio;



////////Artwork with mask///////////////

local year2= surfaceprev.add_text( "[Year]", 1150, 750, 250, 20);
year2.charsize = 35;
year2.align = Align.Left;
year2.index_offset = -1
local year= surfaceprev.add_text( "[Manufacturer]", 1170, 750, 350, 20);
year.charsize = 35;
year.align = Align.Left;
year.index_offset = -1
local players= surfaceprev.add_text( "Players: [Players]", 1230, 750, 200, 20);
players.charsize = 35;
players.align = Align.Centre;
players.index_offset = -1
//local bladegreenSNow=surfaceprev.add_image("art/Blueblade2.png",100,0,145,1080)
local bladegreySNow=surfaceprev.add_image("art/Blueblade2A.png",100,0,145,1080)

//local bladegreySNowP=surfaceprev.add_image("Blueblade2A.png",40,0,145,1080)
local nameSprevP= surfaceprev.add_text( " [Name]", 215, 350, 300, 20);
nameSprevP.charsize = 35;
nameSprevP.align = Align.Centre; 
nameSprevP.word_wrap = true; 
nameSprevP.rotation=90
nameSprevP.index_offset = -1


local wheel= surfaceprev.add_artwork("wheel",1100,850,500,200)
wheel.preserve_aspect_ratio =true


///////////overview on surface with animation//////////////
local textsurf=surfaceprev.add_surface(520,827)
textsurf.set_pos( 390,450)
local text2 =  textsurf.add_text( "[Overview]", 10, 15, 500, 900);
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

local BG=fe.add_image("art/BG2.png",1715,0,320,1080)




//MARK: blades right

local  SNextP4=fe.add_surface(245,1080)
SNextP4.x=1715
SNextP4.y=0
//SNextP4.alpha=0
local bladegreySNextP4=SNextP4.add_image("art/Blueblade2A.png",40,0,145,1080)
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
local bladegreySNextP3=SNextP3.add_image("art/Blueblade2A.png",40,0,145,1080)
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
local bladegreySNextP2=SNextP2.add_image("art/Blueblade2A.png",40,0,145,1080)
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

local bladegreySNextP=SNextP.add_image("art/Blueblade2A.png",40,0,145,1080)
local nameP=SNextP.add_text( " [Name]", 155, 350, 300, 20);
nameP.charsize = 35;
nameP.align = Align.Centre; 
nameP.word_wrap = true; 
nameP.rotation=90
nameP.index_offset = -1


	//MARK: Signal Handlers
function interationControls(sig)
{
    switch (sig)
    {
        case "left":
            fe.signal("prev_game")
			surfacenow.x=1520  
            surfacenow.to_x=0	
            surfacenow.alpha=255  
        	Prevtest.x=0////////////////////////////////movement for new code///////////////////
			Prevtest.to_x=-60////////////////////////////////movement for new code///////////////////		
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
            bladegreenSNow.delay_alpha=500
            bladegreenSNow.alpha=0
            bladegreenSNow.to_alpha=255
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

             bladegreenSNow.delay_alpha=500
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




Prevtest= Inertia(Prevtest, 500,"x","y","alpha"); ////////////////////////////////interia for new code///////////////////
surfaceprev= Inertia(surfaceprev, 500,"x","y","alpha");     
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





 







