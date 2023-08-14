within VehicleDynamics_EB;

package Experiments model KinematicsSweep
  VehicleDynamics_EB.OutboardSuspension.DoubleWishbonePushrodToUpperWishbone outboard_LHS(ccLWB2UR = outboardGeometry.Lower_wishbone_outer_ball_joint, ccLWBL2C = outboardGeometry.Lower_wishbone_front_pivot, ccLWBT2C = outboardGeometry.Lower_wishbone_rear_pivot, ccPR2WB = outboardGeometry.Push_rod_wishbone_end, ccPR2R = outboardGeometry.Push_rod_rocker_end, ccRockerAxis1 = outboardGeometry.Rocker_axis_1st_point, ccRockerAxis2 = outboardGeometry.Rocker_axis_2nd_point, ccS2C = outboardGeometry.Inner_track_rod_ball_joint, ccS2UR = outboardGeometry.Outer_track_rod_ball_joint, ccUWB2UR = outboardGeometry.Upper_wishbone_outer_ball_joint, ccUWBL2C = outboardGeometry.Upper_wishbone_front_pivot, ccUWBT2C = outboardGeometry.Upper_wishbone_rear_pivot, ccWC = outboardGeometry.Wheel_centre_point) annotation(
      Placement(visible = true, transformation(origin = {-80, 1.06581e-14}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
    inner Modelica.Mechanics.MultiBody.World world(n = {0, 0, -1}) annotation(
      Placement(visible = true, transformation(origin = {-150, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    VehicleDynamics_EB.OutboardSuspension.DoubleWishbonePushrodToUpperWishbone outboard_RHS(ccLWB2UR = outboardGeometry.Lower_wishbone_outer_ball_joint.*{1, -1, 1}, ccLWBL2C = outboardGeometry.Lower_wishbone_front_pivot.*{1, -1, 1}, ccLWBT2C = outboardGeometry.Lower_wishbone_rear_pivot.*{1, -1, 1}, ccPR2WB = outboardGeometry.Push_rod_wishbone_end.*{1, -1, 1}, ccPR2R = outboardGeometry.Push_rod_rocker_end.*{1, -1, 1}, ccRockerAxis1 = outboardGeometry.Rocker_axis_1st_point.*{1, -1, 1}, ccRockerAxis2 = outboardGeometry.Rocker_axis_2nd_point.*{1, -1, 1}, ccS2C = outboardGeometry.Inner_track_rod_ball_joint.*{1, -1, 1}, ccS2UR = outboardGeometry.Outer_track_rod_ball_joint.*{1, -1, 1}, ccUWB2UR = outboardGeometry.Upper_wishbone_outer_ball_joint.*{1, -1, 1}, ccUWBL2C = outboardGeometry.Upper_wishbone_front_pivot.*{1, -1, 1}, ccUWBT2C = outboardGeometry.Upper_wishbone_rear_pivot.*{1, -1, 1}, ccWC = outboardGeometry.Wheel_centre_point.*{1, -1, 1}) annotation(
      Placement(visible = true, transformation(origin = {80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    VehicleDynamics_EB.Records.OutboardGeometry outboardGeometry annotation(
      Placement(visible = true, transformation(origin = {110, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    VehicleDynamics_EB.Records.InboardGeometry inboardGeometry annotation(
      Placement(visible = true, transformation(origin = {140, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    VehicleDynamics_EB.InboardSuspension.RockerToSpringDamperARB rockerToSpringDamperARB(ccARBAxis = inboardGeometry.Roll_Bar_Revolute, ccD2C = inboardGeometry.Damper_to_body_point, ccD2R = inboardGeometry.Damper_to_rocker_point, ccDL2ARB = inboardGeometry.Roll_Bar_to_Link1, ccDL2R = inboardGeometry.Roll_Bar_Attachment_1, ccPR2R = outboardGeometry.Push_rod_rocker_end) annotation(
      Placement(visible = true, transformation(origin = {0, 80}, extent = {{-32, 32}, {32, -32}}, rotation = 0)));
    VehicleDynamics_EB.RigComponents.KinematicsRig_ExtInput RigLHS annotation(
      Placement(visible = true, transformation(origin = {-140, -12}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    VehicleDynamics_EB.RigComponents.KinematicsRig_ExtInput RigRHS annotation(
      Placement(visible = true, transformation(origin = {140, -12}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
    VehicleDynamics_EB.Components.SteeringRack steeringRack annotation(
      Placement(visible = true, transformation(origin = {-1.55431e-15, 10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  equation
    connect(outboard_RHS.rockerFrame, rockerToSpringDamperARB.PushrodToRocker_RHS) annotation(
      Line(points = {{80, 20}, {80, 80}, {32, 80}}, color = {95, 95, 95}));
    connect(outboard_LHS.rockerFrame, rockerToSpringDamperARB.PushrodToRocker_LHS) annotation(
      Line(points = {{-80, 20}, {-80, 80}, {-32, 80}}, color = {95, 95, 95}));
    connect(RigLHS.frame_a, outboard_LHS.wheelFrame) annotation(
      Line(points = {{-120, 0}, {-100, 0}}, color = {95, 95, 95}));
    connect(RigRHS.frame_a, outboard_RHS.wheelFrame) annotation(
      Line(points = {{120, 0}, {100, 0}}, color = {95, 95, 95}));
    connect(steeringRack.toLHS, outboard_LHS.steeringFrame) annotation(
      Line(points = {{-20, 10}, {-60, 10}}, color = {95, 95, 95}));
    connect(steeringRack.toRHS, outboard_RHS.steeringFrame) annotation(
      Line(points = {{20, 10}, {60, 10}}, color = {95, 95, 95}));
    connect(world.frame_b, rockerToSpringDamperARB.chassisFrame) annotation(
      Line(points = {{-140, 40}, {0, 40}, {0, 48}}));
    connect(world.frame_b, steeringRack.toChassis) annotation(
      Line(points = {{-140, 40}, {0, 40}, {0, 30}}, color = {95, 95, 95}));
    connect(world.frame_b, outboard_LHS.suspensionFrame) annotation(
      Line(points = {{-140, 40}, {-40, 40}, {-40, -10}, {-60, -10}}, color = {95, 95, 95}));
    connect(world.frame_b, outboard_RHS.suspensionFrame) annotation(
      Line(points = {{-140, 40}, {40, 40}, {40, -10}, {60, -10}}));
    annotation(
      Diagram(coordinateSystem(extent = {{-160, 160}, {160, -100}})),
      Icon(coordinateSystem(extent = {{-160, -160}, {160, 160}})));
  end KinematicsSweep;
end Experiments;
