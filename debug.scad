 include<ruler.scad>

function _isDebug() = false;

module __d(bb=true)
{
	 
	intersection(){
		__bbx(excess = 10) children();
		__rx(length = __rulerLength);
	} 
		 
	intersection(){
		__bby(excess = 10) children();
		__ry(length = __rulerLength);
	} 
	
			 
	intersection(){
		__bbz(excess = 10) children();
		__rz(length = __rulerLength);
	} 
	
    children();
}

module __dd(bb=true)
{
	 
	! __d()
		children();
}