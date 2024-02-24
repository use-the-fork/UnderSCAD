// include a ruler


module __rSupportTextTen(i, mark_width = 0.125, text_color = "white"){
				translate( [0, i+(2*mark_width), 0.5] ) 
					rotate([90,0,90]) 
						color(text_color) 
							text(str(i), size=1.5,font = "Liberation Sans");
}

module __rSupportTextOne(i, mark_width = 0.125, text_color = "white"){
	
				marker_numer = i % 10;
	
				translate( [0, i+(2*mark_width), 4.25] ) 
					rotate([90,0,90]) 
						color(text_color) 
							text(str(marker_numer), size=.5,font = "Liberation Sans");
}

module __r(length = 150, t=[0,0,0], r=[0,0,0])
{
    mark_width = 0.125;
    mark_depth = 0.05;

    rotate(r) translate(t) union()
        {
			
			
            //__cb() cube( [mark_depth-0.01, length, 2] );
			__cb() cube( [mark_depth-0.01, length, 6] );
			__cw() cube( [mark_depth, 10, 4] );
			__rSupportTextTen(0, text_color = "black");
            for ( i = [1:length-1] )
            {

				if (i % 2 == 0){
					translate( [0, i, 4] ) __cb() cube( [mark_depth, 1, 2] );
					__rSupportTextOne(i, text_color = "white");
				} else {
					translate( [0, i, 4] ) __cw() cube( [mark_depth, 1, 2] );
					__rSupportTextOne(i, text_color = "black");
				}
				
				if (i % 10 == 0){
					
					if (i % 20 == 0){
						translate( [0, i, 0] )
							__cw() 
								cube( [mark_depth, 10, 4] );
							__rSupportTextTen(i, text_color = "black");
					} else {
						translate( [0, i, 0] ) __cb() cube( [mark_depth, 10, 4] );
						__rSupportTextTen(i, text_color = "white");
					}
					
					
				}
				
//                if (i % 10 == 0)	// tall one every 10
//                {
//                    translate( [0, i, 0] ) color(line_color) cube( [mark_depth, mark_width, 7 ] );
//                    translate( [0, i+(2*mark_width), 6.5] ) 
//						rotate([90,0,90]) 
//							color("white") 
//								text(str(i), size=1,font = "Liberation Sans");
//                }
//                else if (i % 5 == 0)	// med. tall one every 5
//                    translate( [0, i, 0] ) color(line_color) cube( [mark_depth, mark_width, 5 ] );
//                else	// otherwise a short one
//                    translate( [0, i, 0] ) color(line_color) cube( [mark_depth, mark_width, 3 ] );
            
        }
	
}
}

module __ry(length = 150)
{
    __r(length);
	children();
}

module __rx(length = 150)
{
    __r(length, r=[0,0,-90]);
	children();
}

module __rz(length = 150)
{
    __r(length, r=[90,0,-45]);
	children();
}

module __rxyz(length = 150)
{
    __rx(length);
    __ry(length);
    __rz(length);
	children();
}

