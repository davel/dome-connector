$length_a = 1.09*10;
$length_b = 1.24*10;


$five_point_angle = acos(($length_b/(2*cos(54)))/$length_a);

echo($five_point_angle);

$tube_outer = 10;
$pipe_thickness = 3;
$pipe_endcap = 17;
$pipe_length = 50;


for(a= [0:4]) {
	difference() {
		rotate([a*(360/5), 0, 0])
		rotate([0, $five_point_angle, 0])
		linear_extrude(height=$pipe_length)
			circle($tube_outer+$pipe_thickness);
		rotate([a*(360/5), 0, 0])
		rotate([0, $five_point_angle, 0])
		translate([0, 0, $pipe_endcap])
		linear_extrude(height=$pipe_length - $pipe_endcap)
			circle($tube_outer);
	}
}