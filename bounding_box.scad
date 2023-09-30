
module __bb(excess=1) {
	
		xs = excess<.1? 1: excess;
		linear_extrude(xs, center=true)
			projection()
				rotate([90,0,0])
					linear_extrude(xs, center=true)
						projection()
							hull()
								children();
	
}


module __bby(excess=1)
{
    rotate(-90) __bb(excess) rotate(90) children(); 
}

module __bbx(excess=1)
{
    __bb(excess) children(); // x axis
}

module __bbz(excess=1)
{
   rotate([0,-90,0]) __bb(excess) rotate([0,90,0]) children();
}
