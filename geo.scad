$length_a = 546.15;
$length_b = 618.05;


$five_point_angle = acos(($length_b/(2*cos(54)))/$length_a);


$tube_outer_diameter = 10;
$pipe_thickness = 4;
$pipe_endcap = 12;
$pipe_length = 40;

$support_length = 30;

$circle_quality = 1;

echo("Length a is ", ($length_a-2*$pipe_endcap), "mm");
echo("Length b is ", ($length_b-2*$pipe_endcap), "mm");

translate([0, 0, -7.7])
linear_extrude(height=$tube_outer_diameter+$pipe_thickness)
    circle(d = $pipe_endcap);

for(a= [0:4]) {
    our_angle = a * (360/5);
	difference() {
        union () {
            rotate([a*(360/5), 90, 0])
            rotate([0, $five_point_angle, 0])
            linear_extrude(height=$pipe_length)
                circle(d = $tube_outer_diameter+$pipe_thickness, fa=$circle_quality);
          translate([0, 0, -10])
            linear_extrude(height=5)
                polygon(points = [[0,0],
                        [cos(-36-our_angle)*$support_length, sin(-36-our_angle)*$support_length],           
                        [cos(0-our_angle)*$support_length, sin(0-our_angle)*$support_length],
                        [cos(36-our_angle)*$support_length, sin(36-our_angle)*$support_length],
                ]);
        }
		rotate([a*(360/5), 90, 0])
		rotate([0, $five_point_angle, 0])
		translate([0, 0, $pipe_endcap])
		linear_extrude(height=$pipe_length - $pipe_endcap+1)
			circle(d = $tube_outer_diameter, fa=$circle_quality);
	}
}