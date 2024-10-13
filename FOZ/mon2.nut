










local fan=FadeArt("fanart",-380,-1080,1920,1080)
fan.zorder=10
local retro2 =
{
    function init()
    {
        slots <- 9
        speed <- 0900
        artwork_label <- "icon" 
        video_flags <- Vid.ImagesOnly
        x <- 0
        y <- 0
		layout.y <- [ -200, -200, -200, -200, -410, -200,-200, -200,-200 ]
		layout.x <- [ -400, -580, -130, 240, 590, 940, 1310, 1740, 1940 ] 
        layout.width <- [ 0, 400, 400, 400, 650, 400, 400, 400, 400 ]
        layout.height <- [ 0, 400, 400, 400, 650, 400, 400, 400, 400 ]
		layout.alpha <- [ 0, 255, 255, 255, 255, 255, 255, 255, 255 ]
		zorder <- 2
		//anchor <- Wheel.Anchor.top
		preserve_aspect_ratio<-true
    }
}	
local wheel = fe.add_wheel( retro2 )
wheel.zorder=15