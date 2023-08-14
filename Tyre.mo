within VehicleDynamics_EB;

package Tyre
  model SimpleTLR
    parameter Modelica.Units.SI.TranslationalSpringConstant kTyre = 150e3;
    parameter Modelica.Units.SI.TranslationalDampingConstant cTyre = 200;
    parameter Modelica.Units.SI.Position r0 = 0.255;
    Modelica.Units.SI.Position tyreRadius;
    Modelica.Units.SI.Velocity dertyreRadius;
    Modelica.Mechanics.MultiBody.Interfaces.Frame_a groundFrame annotation(
      Placement(visible = true, transformation(origin = {0, -100}, extent = {{-16, -16}, {16, 16}}, rotation = -90), iconTransformation(origin = {0, -100}, extent = {{-16, -16}, {16, 16}}, rotation = -90)));
    Modelica.Mechanics.MultiBody.Interfaces.Frame_b wheelCentreFrame annotation(
      Placement(visible = true, transformation(origin = {0, 100}, extent = {{-16, -16}, {16, 16}}, rotation = -90), iconTransformation(origin = {0, 100}, extent = {{-16, -16}, {16, 16}}, rotation = -90)));
    Modelica.Mechanics.MultiBody.Sensors.RelativePosition relativePosition annotation(
      Placement(visible = true, transformation(origin = {-74, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
    Modelica.Mechanics.MultiBody.Forces.Force force annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  equation
    tyreRadius = -relativePosition.r_rel[3];
    dertyreRadius = der(tyreRadius);
    force.force[1] = 0.0;
    force.force[2] = 0.0;
    force.force[3] = -(tyreRadius - r0)*kTyre - dertyreRadius*cTyre;
    connect(force.frame_b, wheelCentreFrame) annotation(
      Line(points = {{0, 10}, {0, 100}}, color = {95, 95, 95}));
    connect(force.frame_a, groundFrame) annotation(
      Line(points = {{0, -10}, {0, -100}}, color = {95, 95, 95}));
    connect(relativePosition.frame_b, groundFrame) annotation(
      Line(points = {{-74, -10}, {-74, -60}, {0, -60}, {0, -100}}));
    connect(wheelCentreFrame, relativePosition.frame_a) annotation(
      Line(points = {{0, 100}, {0, 60}, {-74, 60}, {-74, 10}}));
  end SimpleTLR;
  annotation(
    Diagram,
  Icon(graphics = {Rectangle( lineColor = {200, 200, 200}, fillColor = {248, 248, 248}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, -100}, {100, 100}}, radius = 25), Ellipse(origin = {0, -2},fillColor = {113, 113, 113}, fillPattern = FillPattern.VerticalCylinder, extent = {{-80, 80}, {80, -80}}), Ellipse(origin = {0, -2},lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}})}, coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end Tyre;
