local myTriangle = { 
color="yellow", 
thickness=12, 
npoints=5; 
{x=0, y=0}, 
{x=-15, y=0}, 
{x=-5, y=9}, 
} 

-- Print the color 
print(myTriangle[“color”]) 

-- Print it again using dot 
-- notation 
print(myTriangle.color) 

-- The points are accessible 
-- in myPolygon[1] to myPolygon[4] 

-- Print the second point’s x 
-- coordinate 
print(myTriangle[2].x) 