within VehicleDynamics_EB;

package InboardSuspension

  model RockerToSpringDamper
  
      parameter Modelica.Units.SI.Position[3] ccD2R = {0.0, 0.4, 0.5} "Damper to rocker";
      parameter Modelica.Units.SI.Position[3] ccD2C = {0.0, 0.0, 0.5} "Damper to chassis";
      parameter Modelica.Units.SI.Position[3] ccPR2R = {0.0, 0.4, 0.5} "Pushrod to rocker";
  
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a PushrodToRocker_LHS annotation(
        Placement(visible = true, transformation(origin = {-160, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-160, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b PushrodToRocker_RHS annotation(
        Placement(visible = true, transformation(origin = {160, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {160, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a chassisFrame annotation(
        Placement(visible = true, transformation(origin = {0, 160}, extent = {{-16, -16}, {16, 16}}, rotation = -90), iconTransformation(origin = {0, 160}, extent = {{-16, -16}, {16, 16}}, rotation = -90)));
      VehicleDynamics_EB.Components.SpringDamper SpringDamper_LHS annotation(
      Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-28, -28}, {28, 28}}, rotation = 0)));
      VehicleDynamics_EB.Components.SpringDamper SpringDamper_RHS annotation(
      Placement(visible = true, transformation(origin = {80, 80}, extent = {{-28, 28}, {28, -28}}, rotation = -180)));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation toDamper_LHS(r = ccD2R - ccPR2R) annotation(
        Placement(visible = true, transformation(origin = {-120, 38}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation damperToChassis_LHS(animation = false, r = ccD2C) annotation(
        Placement(visible = true, transformation(origin = {-30, 80}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation damperToChassis_RHS(animation = false, r = ccD2C.*{1, -1, 1}) annotation(
        Placement(visible = true, transformation(origin = {30, 80}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation toDamper_RHS(r = (ccD2R - ccPR2R).*{1, -1, 1}) annotation(
        Placement(visible = true, transformation(origin = {120, 40}, extent = {{10, 10}, {-10, -10}}, rotation = -90)));
    equation
    connect(PushrodToRocker_LHS, toDamper_LHS.frame_a) annotation(
      Line(points = {{-160, 0}, {-120, 0}, {-120, 28}}));
    connect(toDamper_LHS.frame_b, SpringDamper_LHS.frame_a) annotation(
      Line(points = {{-120, 48}, {-120, 80}, {-108, 80}}));
    connect(PushrodToRocker_RHS, toDamper_RHS.frame_a) annotation(
      Line(points = {{160, 0}, {120, 0}, {120, 30}}));
    connect(toDamper_RHS.frame_b, SpringDamper_RHS.frame_a) annotation(
      Line(points = {{120, 50}, {120, 80}, {108, 80}}, color = {95, 95, 95}));
    connect(SpringDamper_RHS.frame_b, damperToChassis_RHS.frame_b) annotation(
      Line(points = {{52, 80}, {40, 80}}, color = {95, 95, 95}));
    connect(damperToChassis_RHS.frame_a, chassisFrame) annotation(
      Line(points = {{20, 80}, {0, 80}, {0, 160}}, color = {95, 95, 95}));
    connect(damperToChassis_LHS.frame_a, chassisFrame) annotation(
      Line(points = {{-20, 80}, {0, 80}, {0, 160}}, color = {95, 95, 95}));
    connect(SpringDamper_LHS.frame_b, damperToChassis_LHS.frame_b) annotation(
      Line(points = {{-52, 80}, {-40, 80}}, color = {95, 95, 95}));
    annotation(
        Diagram(coordinateSystem(extent = {{-160, -160}, {160, 160}})),
        Icon(coordinateSystem(extent = {{-160, -160}, {160, 160}})));
    end RockerToSpringDamper;

  model RockerToSpringDamperARB
    extends VehicleDynamics_EB.InboardSuspension.RockerToSpringDamper;
    
    parameter Modelica.Units.SI.Position[3] ccDL2R = {0.0, 0.3, 0.4} "Drop link to rocker";
    parameter Modelica.Units.SI.Position[3] ccDL2ARB = {0.0, 0.3, 0.2} "Drop link to ARB arm";
    parameter Modelica.Units.SI.Position[3] ccARBAxis = {-0.1, 0.3, 0.2} "Any point that sits in the ARB axis, which is parallel to {0,1,0}";
    parameter Modelica.Units.SI.RotationalSpringConstant kARB = 300 "ARB stiffness";  
    
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation toDropLink_RHS(animation = false, r = (ccDL2R - ccPR2R).*{1, -1, 1}) annotation(
      Placement(visible = true, transformation(origin = {120, -40}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation toDropLink_LHS(animation = false, r = ccDL2R - ccPR2R) annotation(
      Placement(visible = true, transformation(origin = {-120, -42}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  VehicleDynamics_EB.Components.AntiRollBar AntiRollBar(ccARBAxis = ccARBAxis, ccDL2ARB = ccDL2ARB, ccDL2R = ccDL2R, kARB = kARB) annotation(
      Placement(visible = true, transformation(origin = {0, -94}, extent = {{-52, -52}, {52, 52}}, rotation = 0)));
  equation
    connect(toDropLink_RHS.frame_b, AntiRollBar.toRocker_RHS) annotation(
      Line(points = {{120, -50}, {120, -94}, {52, -94}}));
    connect(toDropLink_LHS.frame_b, AntiRollBar.toRocker_LHS) annotation(
      Line(points = {{-120, -52}, {-120, -94}, {-52, -94}}, color = {95, 95, 95}));
  connect(toDropLink_LHS.frame_a, PushrodToRocker_LHS) annotation(
      Line(points = {{-120, -32}, {-120, 0}, {-160, 0}}));
  connect(toDropLink_RHS.frame_a, PushrodToRocker_RHS) annotation(
      Line(points = {{120, -30}, {120, 0}, {160, 0}}, color = {95, 95, 95}));
  connect(AntiRollBar.toChassis, chassisFrame) annotation(
      Line(points = {{0, -42}, {0, 160}}, color = {95, 95, 95}));
    annotation(
      Diagram(coordinateSystem(extent = {{-160, -160}, {160, 160}})),
      Icon(coordinateSystem(extent = {{-160, -160}, {160, 160}})));
end RockerToSpringDamperARB;
end InboardSuspension;
