within VehicleDynamics_EB;

package RigComponents
  
  model KinematicsRig_Table
  
    parameter Modelica.Units.SI.Position ccWheelCentre[3] = {0.0, 0.8, 0.3} "Wheel centre position";
    Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(
      Placement(visible = true, transformation(origin = {100, 50}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {100, 60}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical(animation = false)  annotation(
      Placement(visible = true, transformation(origin = {82, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(animation = false, n = {0, 1, 0})  annotation(
      Placement(visible = true, transformation(origin = {18, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(color = {255, 255, 0}, r = ccWheelCentre.*{0, -0.1, 0}, width = 0.05)  annotation(
      Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(color = {255, 255, 0},r = ccWheelCentre.*{0, 0, 1}, shapeType = "cylinder", width = 0.05) annotation(
      Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(animation = false, n = {0, 0, 1}, stateSelect = StateSelect.always) annotation(
      Placement(visible = true, transformation(origin = {0, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed(animation = false, r = {0, 0, 0}) annotation(
      Placement(visible = true, transformation(origin = {80, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation2(animation = false, r = ccWheelCentre.*{1, 1.1, 0}) annotation(
      Placement(visible = true, transformation(origin = {40, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(animation = true, cylinderColor = {255, 255, 0}, cylinderDiameter = 0.075, cylinderLength = 0.1) annotation(
      Placement(visible = true, transformation(origin = {0, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Sources.Position position annotation(
      Placement(visible = true, transformation(origin = {-26, -10}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds annotation(
      Placement(visible = true, transformation(origin = {-60, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.ContinuousClock continuousClock annotation(
      Placement(visible = true, transformation(origin = {-100, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(spherical.frame_b, frame_a) annotation(
      Line(points = {{92, 50}, {100, 50}}));
    connect(fixedTranslation1.frame_b, prismatic1.frame_a) annotation(
      Line(points = {{0, 30}, {0, 50}, {8, 50}}, color = {95, 95, 95}));
    connect(prismatic1.frame_b, fixedTranslation.frame_a) annotation(
      Line(points = {{28, 50}, {40, 50}}));
    connect(fixedTranslation.frame_b, spherical.frame_a) annotation(
      Line(points = {{60, 50}, {72, 50}}));
    connect(fixed.frame_b, fixedTranslation2.frame_a) annotation(
      Line(points = {{80, -90}, {80, -80}, {50, -80}}, color = {95, 95, 95}));
  connect(prismatic.frame_b, fixedTranslation1.frame_a) annotation(
      Line(points = {{0, -8}, {0, 10}}));
  connect(revolute.frame_b, prismatic.frame_a) annotation(
      Line(points = {{0, -46}, {0, -28}}, color = {95, 95, 95}));
  connect(fixedTranslation2.frame_b, revolute.frame_a) annotation(
      Line(points = {{30, -80}, {0, -80}, {0, -66}}, color = {95, 95, 95}));
  connect(position.flange, prismatic.axis) annotation(
      Line(points = {{-18, -10}, {-6, -10}}, color = {0, 127, 0}));
  connect(position.support, prismatic.support) annotation(
      Line(points = {{-26, -18}, {-26, -22}, {-6, -22}}, color = {0, 127, 0}));
  connect(combiTable1Ds.y, position.s_ref) annotation(
      Line(points = {{-49, -10}, {-36, -10}}, color = {0, 0, 127}));
  connect(continuousClock.y, combiTable1Ds.u) annotation(
      Line(points = {{-89, -10}, {-72, -10}}, color = {0, 0, 127}));
    annotation(
      Icon(graphics = {Rectangle(origin = {0, -85}, fillColor = {255, 255, 0}, fillPattern = FillPattern.VerticalCylinder, extent = {{-90, 11}, {90, -11}}), Rectangle(origin = {0, 28}, fillColor = {255, 255, 0}, fillPattern = FillPattern.VerticalCylinder, extent = {{-14, -52}, {14, 52}}), Rectangle(origin = {37, 60}, fillColor = {255, 255, 0}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-23, 20}, {23, -20}}), Rectangle(origin = {75, 60}, fillColor = {165, 165, 165}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-15, 10}, {15, -10}}), Rectangle(origin = {0, -49}, fillColor = {255, 255, 0}, fillPattern = FillPattern.VerticalCylinder, extent = {{-20, -25}, {20, 25}}), Rectangle(origin = {-50, 16}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, extent = {{-4, 40}, {4, -40}}), Polygon(origin = {-51, 66}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, points = {{-19, -10}, {21, -10}, {1, 10}, {1, 10}, {-19, -10}}), Polygon(origin = {-51, -46}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, points = {{-19, 22}, {21, 22}, {1, 2}, {1, 2}, {-19, 22}}), Rectangle(origin = {60, -36}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-12, 6}, {12, -6}}), Rectangle(origin = {84, -36}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-12, 6}, {12, -6}}), Rectangle(origin = {41, 0}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-7, 6}, {7, -6}}), Rectangle(origin = {84, -48}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-12, 6}, {12, -6}}), Rectangle(origin = {60, 0}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-12, 6}, {12, -6}}), Rectangle(origin = {60, -12}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-12, 6}, {12, -6}}), Rectangle(origin = {41, -48}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-7, 6}, {7, -6}}), Rectangle(origin = {41, -36}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-7, 6}, {7, -6}}), Rectangle(origin = {60, -24}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-12, 6}, {12, -6}}), Rectangle(origin = {41, -24}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-7, 6}, {7, -6}}), Rectangle(origin = {41, -12}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-7, 6}, {7, -6}}), Rectangle(origin = {84, 0}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-12, 6}, {12, -6}}), Rectangle(origin = {84, -24}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-12, 6}, {12, -6}}), Rectangle(origin = {60, -48}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-12, 6}, {12, -6}}), Rectangle(origin = {84, -12}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-12, 6}, {12, -6}}), Text(origin = {0, 180}, textColor = {0, 0, 255}, extent = {{-100, 10}, {100, -10}}, textString = "%name"), Text(origin = {0, 94}, textColor = {0, 0, 255}, extent = {{-100, 10}, {100, -10}}, textString = "%name")}, coordinateSystem(extent = {{-100, -100}, {100, 100}})));
  end KinematicsRig_Table;
  
  model KinematicsRig_ExtInput
  
    parameter Modelica.Units.SI.Position ccWheelCentre[3] = {0.0, 0.8, 0.3} "Wheel centre position";
    Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(
      Placement(visible = true, transformation(origin = {100, 50}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {100, 60}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical(animation = false)  annotation(
      Placement(visible = true, transformation(origin = {82, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(animation = false, n = {0, 1, 0})  annotation(
      Placement(visible = true, transformation(origin = {18, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(color = {255, 255, 0}, r = ccWheelCentre.*{0, -0.1, 0}, width = 0.05)  annotation(
      Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(color = {255, 255, 0},r = ccWheelCentre.*{0, 0, 1}, shapeType = "cylinder", width = 0.05) annotation(
      Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(animation = false, n = {0, 0, 1}, stateSelect = StateSelect.always) annotation(
      Placement(visible = true, transformation(origin = {0, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed(animation = false, r = {0, 0, 0}) annotation(
      Placement(visible = true, transformation(origin = {80, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation2(animation = false, r = ccWheelCentre.*{1, 1.1, 0}) annotation(
      Placement(visible = true, transformation(origin = {40, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(animation = true, cylinderColor = {255, 255, 0}, cylinderDiameter = 0.075, cylinderLength = 0.1) annotation(
      Placement(visible = true, transformation(origin = {0, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Sources.Position position annotation(
      Placement(visible = true, transformation(origin = {-26, -10}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(
      Placement(visible = true, transformation(origin = {-100, -10}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  equation
    connect(spherical.frame_b, frame_a) annotation(
      Line(points = {{92, 50}, {100, 50}}));
    connect(fixedTranslation1.frame_b, prismatic1.frame_a) annotation(
      Line(points = {{0, 30}, {0, 50}, {8, 50}}, color = {95, 95, 95}));
    connect(prismatic1.frame_b, fixedTranslation.frame_a) annotation(
      Line(points = {{28, 50}, {40, 50}}));
    connect(fixedTranslation.frame_b, spherical.frame_a) annotation(
      Line(points = {{60, 50}, {72, 50}}));
    connect(fixed.frame_b, fixedTranslation2.frame_a) annotation(
      Line(points = {{80, -90}, {80, -80}, {50, -80}}, color = {95, 95, 95}));
    connect(prismatic.frame_b, fixedTranslation1.frame_a) annotation(
      Line(points = {{0, -8}, {0, 10}}));
    connect(revolute.frame_b, prismatic.frame_a) annotation(
      Line(points = {{0, -46}, {0, -28}}, color = {95, 95, 95}));
    connect(fixedTranslation2.frame_b, revolute.frame_a) annotation(
      Line(points = {{30, -80}, {0, -80}, {0, -66}}, color = {95, 95, 95}));
    connect(position.flange, prismatic.axis) annotation(
      Line(points = {{-18, -10}, {-6, -10}}, color = {0, 127, 0}));
    connect(position.support, prismatic.support) annotation(
      Line(points = {{-26, -18}, {-26, -22}, {-6, -22}}, color = {0, 127, 0}));
  connect(u, position.s_ref) annotation(
      Line(points = {{-100, -10}, {-36, -10}}, color = {0, 0, 127}));
    annotation(
      Icon(graphics = {Rectangle(origin = {0, -85}, fillColor = {255, 255, 0}, fillPattern = FillPattern.VerticalCylinder, extent = {{-90, 11}, {90, -11}}), Rectangle(origin = {0, 28}, fillColor = {255, 255, 0}, fillPattern = FillPattern.VerticalCylinder, extent = {{-14, -52}, {14, 52}}), Rectangle(origin = {37, 60}, fillColor = {255, 255, 0}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-23, 20}, {23, -20}}), Rectangle(origin = {75, 60}, fillColor = {165, 165, 165}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-15, 10}, {15, -10}}), Rectangle(origin = {0, -49}, fillColor = {255, 255, 0}, fillPattern = FillPattern.VerticalCylinder, extent = {{-20, -25}, {20, 25}}), Rectangle(origin = {-50, 16}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, extent = {{-4, 40}, {4, -40}}), Polygon(origin = {-51, 66}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, points = {{-19, -10}, {21, -10}, {1, 10}, {1, 10}, {-19, -10}}), Polygon(origin = {-51, -46}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, points = {{-19, 22}, {21, 22}, {1, 2}, {1, 2}, {-19, 22}}), Text(origin = {0, 94}, textColor = {0, 0, 255}, extent = {{-100, 10}, {100, -10}}, textString = "%name")}, coordinateSystem(extent = {{-100, -100}, {100, 100}})));
  end KinematicsRig_ExtInput;
end RigComponents;
