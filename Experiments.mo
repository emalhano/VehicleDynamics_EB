within VehicleDynamics_EB;

package Experiments
  model Test
  
    ExternData.XMLFile setupXML(fileName=Modelica.Utilities.Files.loadResource( "C:/Users/eduardob/Documents/OpenModelica/VehicleDynamics_EB/geometries/faraday_2023_front.xml"));
  
    Modelica.Mechanics.MultiBody.Parts.Fixed fixed annotation(
      Placement(visible = true, transformation(origin = {0, -104}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(animation = false, r = {0.3, 0.4, 0.25}) annotation(
      Placement(visible = true, transformation(origin = {56, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    inner Modelica.Mechanics.MultiBody.World world(n = {0, 0, -1}) annotation(
      Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    VehicleDynamics_EB.OutboardSuspension.DoubleWishbonePushrodToLowerWishbone outboard_LHS(ccLWB2UR = setupXML.getRealArray1D("Damper_to_body_point.Value", 3), ccLWBL2C = setupXML.getRealArray1D("Damper_to_body_point.Value", 3), ccLWBT2C = setupXML.getRealArray1D("Damper_to_body_point.Value", 3), ccPR2LWB = setupXML.getRealArray1D("Damper_to_body_point.Value", 3), ccPR2R = setupXML.getRealArray1D("Damper_to_body_point.Value", 3), ccRockerAxis1 = setupXML.getRealArray1D("Damper_to_body_point.Value", 3), ccRockerAxis2 = setupXML.getRealArray1D("Damper_to_body_point.Value", 3), ccS2C = setupXML.getRealArray1D("Damper_to_body_point.Value", 3), ccS2UR = setupXML.getRealArray1D("Damper_to_body_point.Value", 3), ccUWB2UR = setupXML.getRealArray1D("Damper_to_body_point.Value", 3), ccUWBL2C = setupXML.getRealArray1D("Damper_to_body_point.Value", 3), ccUWBT2C = setupXML.getRealArray1D("Damper_to_body_point.Value", 3), ccWC = setupXML.getRealArray1D("Damper_to_body_point.Value", 3))  annotation(
      Placement(visible = true, transformation(origin = {125, -75}, extent = {{-35, -35}, {35, 35}}, rotation = 0)));
    VehicleDynamics_EB.OutboardSuspension.DoubleWishbonePushrodToLowerWishbone outboard_RHS(ccLWB2UR = setupXML.getRealArray1D("Damper_to_body_point.Value", 3).*{1, -1, 1}, ccLWBL2C = setupXML.getRealArray1D("Damper_to_body_point.Value", 3).*{1, -1, 1}, ccLWBT2C = setupXML.getRealArray1D("Damper_to_body_point.Value", 3).*{1, -1, 1}, ccPR2LWB = setupXML.getRealArray1D("Damper_to_body_point.Value", 3).*{1, -1, 1}, ccPR2R = setupXML.getRealArray1D("Damper_to_body_point.Value", 3).*{1, -1, 1}, ccRockerAxis1 = setupXML.getRealArray1D("Damper_to_body_point.Value", 3).*{1, -1, 1}, ccRockerAxis2 = setupXML.getRealArray1D("Damper_to_body_point.Value", 3).*{1, -1, 1}, ccS2C = setupXML.getRealArray1D("Damper_to_body_point.Value", 3).*{1, -1, 1}, ccS2UR = setupXML.getRealArray1D("Damper_to_body_point.Value", 3).*{1, -1, 1}, ccUWB2UR = setupXML.getRealArray1D("Damper_to_body_point.Value", 3).*{1, -1, 1}, ccUWBL2C = setupXML.getRealArray1D("Damper_to_body_point.Value", 3).*{1, -1, 1}, ccUWBT2C = setupXML.getRealArray1D("Damper_to_body_point.Value", 3).*{1, -1, 1}, ccWC = setupXML.getRealArray1D("Damper_to_body_point.Value", 3).*{1, -1, 1}) annotation(
      Placement(visible = true, transformation(origin = {-125, -75}, extent = {{35, -35}, {-35, 35}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(animation = false, r = {0.3, -0.4, 0.25}) annotation(
      Placement(visible = true, transformation(origin = {-36, -62}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.Fixed fixed1 annotation(
      Placement(visible = true, transformation(origin = {4, 102}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    VehicleDynamics_EB.InboardSuspension.RockerToSpringDamperARB rockerToSpringDamperARB annotation(
      Placement(visible = true, transformation(origin = {3, -1}, extent = {{35, -35}, {-35, 35}}, rotation = 0)));
  equation
    connect(fixed.frame_b, fixedTranslation.frame_a) annotation(
      Line(points = {{0, -94}, {46, -94}, {46, -62}}));
    connect(fixedTranslation.frame_b, outboard_LHS.steeringFrame) annotation(
      Line(points = {{66, -62}, {90, -62}, {90, -57.5}}, color = {95, 95, 95}));
    connect(fixed.frame_b, outboard_LHS.suspensionFrame) annotation(
      Line(points = {{0, -94}, {90, -94}, {90, -92.5}}));
    connect(fixed.frame_b, fixedTranslation1.frame_a) annotation(
      Line(points = {{0, -94}, {-14, -94}, {-14, -62}, {-26, -62}}, color = {95, 95, 95}));
    connect(fixed.frame_b, outboard_RHS.suspensionFrame) annotation(
      Line(points = {{0, -94}, {-45, -94}, {-45, -92}, {-90, -92}}, color = {95, 95, 95}));
    connect(fixedTranslation1.frame_b, outboard_RHS.steeringFrame) annotation(
      Line(points = {{-46, -62}, {-90, -62}, {-90, -58}}));
    connect(outboard_RHS.rockerFrame, rockerToSpringDamperARB.PushrodToRocker_RHS) annotation(
      Line(points = {{-124, -40}, {-122, -40}, {-122, 0}, {-32, 0}}, color = {95, 95, 95}));
    connect(outboard_LHS.rockerFrame, rockerToSpringDamperARB.PushrodToRocker_LHS) annotation(
      Line(points = {{126, -40}, {122, -40}, {122, 0}, {38, 0}}, color = {95, 95, 95}));
    connect(rockerToSpringDamperARB.chassisFrame, fixed1.frame_b) annotation(
      Line(points = {{4, 34}, {4, 92}}, color = {95, 95, 95}));
    annotation(
      Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
      Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})));
  end Test;

  model fmu_test
    Modelica.Mechanics.MultiBody.Parts.Body body(m = 5, r_CM = {1, 0, 0}) annotation(
      Placement(visible = true, transformation(origin = {58, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    inner Modelica.Mechanics.MultiBody.World world(n = {0, 0, -1}) annotation(
      Placement(visible = true, transformation(origin = {-64, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Revolute revolute(n = {0, 1, 0}) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(world.frame_b, revolute.frame_a) annotation(
      Line(points = {{-54, 0}, {-10, 0}}));
    connect(revolute.frame_b, body.frame_a) annotation(
      Line(points = {{10, 0}, {48, 0}}, color = {95, 95, 95}));
  end fmu_test;

  model read_xml
    inner parameter ExternData.XMLFile dataSource(fileName=Modelica.Utilities.Files.loadResource( "C:/Users/eduardob/Documents/OpenModelica/VehicleDynamics_EB/geometries/faraday_2023_front.xml"));
    Modelica.Mechanics.MultiBody.Parts.Fixed fixed(r = dataSource.getRealArray1D("Damper_to_body_point.Value", 3));
  equation
  
    annotation(
      Placement(visible = true, transformation(origin = {-80, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  end read_xml;
end Experiments;
