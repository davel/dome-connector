$length_a = 546.15;
$length_b = 618.05;


$five_point_angle = acos(($length_b/(2*cos(54)))/$length_a);

echo($five_point_angle);

$tube_outer_diameter = 10;
$pipe_thickness = 3;
$pipe_endcap = 15;
$pipe_length = 40;


for(a= [0:4]) {
	difference() {
		rotate([a*(360/5), 0, 0])
		rotate([0, $five_point_angle, 0])
		linear_extrude(height=$pipe_length)
			circle(d = $tube_outer_diameter+$pipe_thickness);
		rotate([a*(360/5), 0, 0])
		rotate([0, $five_point_angle, 0])
		translate([0, 0, $pipe_endcap])
		linear_extrude(height=$pipe_length - $pipe_endcap+1)
			circle(d = $tube_outer_diameter);
	}
}