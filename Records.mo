within VehicleDynamics_EB;
package Records
  extends Modelica.Icons.RecordsPackage;

  record InboardGeometry
    extends Modelica.Icons.Record;
    
    parameter String file = Modelica.Utilities.Files.loadResource("C:/Users/eduardob/Documents/OpenModelica/VehicleDynamics_EB/geometries/faraday_2023_front.mat") ".mat file with setup";  
    
    parameter Modelica.Units.SI.Position Roll_Bar_Attachment_1[3] = vector(Modelica.Utilities.Streams.readRealMatrix(file,"Roll_Bar_Attachment_2",1,3)) "Roll Bar Attachment 1";
  
    parameter Modelica.Units.SI.Position Roll_Bar_to_Link1[3] = vector(Modelica.Utilities.Streams.readRealMatrix(file,"Roll_Bar_to_Link2",1,3)) "Roll Bar to Link1";
  
    parameter Modelica.Units.SI.Position Roll_Bar_Revolute[3] = vector(Modelica.Utilities.Streams.readRealMatrix(file,"Roll_Bar_Mount_2",1,3)) "Roll Bar Revolute";
    
    parameter Modelica.Units.SI.Position Damper_to_body_point[3] = vector(Modelica.Utilities.Streams.readRealMatrix(file,"Damper_to_body_point",1,3)) "Damper to body point";
  
    parameter Modelica.Units.SI.Position Damper_to_rocker_point[3] = vector(Modelica.Utilities.Streams.readRealMatrix(file,"Damper_to_rocker_point",1,3)) "Damper to rocker point";
     
    
  end InboardGeometry;
  record OutboardGeometry
  
    extends Modelica.Icons.Record;
    
    parameter String file = Modelica.Utilities.Files.loadResource("C:/Users/eduardob/Documents/OpenModelica/VehicleDynamics_EB/geometries/faraday_2023_front.mat") ".mat file with setup";
    
    parameter Modelica.Units.SI.Position Lower_wishbone_front_pivot[3] = vector(Modelica.Utilities.Streams.readRealMatrix(file,"Lower_wishbone_front_pivot",1,3)) "Lower wishbone front pivot";
  
    parameter Modelica.Units.SI.Position Lower_wishbone_rear_pivot[3] = vector(Modelica.Utilities.Streams.readRealMatrix(file,"Lower_wishbone_rear_pivot",1,3)) "Lower wishbone rear pivot";
  
    parameter Modelica.Units.SI.Position Lower_wishbone_outer_ball_joint[3] = vector(Modelica.Utilities.Streams.readRealMatrix(file,"Lower_wishbone_outer_ball_joint",1,3)) "Lower wishbone outer ball joint";
  
    parameter Modelica.Units.SI.Position Upper_wishbone_front_pivot[3] = vector(Modelica.Utilities.Streams.readRealMatrix(file,"Upper_wishbone_front_pivot",1,3)) "Upper wishbone front pivot";
  
    parameter Modelica.Units.SI.Position Upper_wishbone_rear_pivot[3] = vector(Modelica.Utilities.Streams.readRealMatrix(file,"Upper_wishbone_rear_pivot",1,3)) "Upper wishbone rear pivot";
  
    parameter Modelica.Units.SI.Position Upper_wishbone_outer_ball_joint[3] = vector(Modelica.Utilities.Streams.readRealMatrix(file,"Upper_wishbone_outer_ball_joint",1,3)) "Upper wishbone outer ball joint";
  
    parameter Modelica.Units.SI.Position Push_rod_wishbone_end[3] = vector(Modelica.Utilities.Streams.readRealMatrix(file,"Push_rod_wishbone_end",1,3)) "Push rod wishbone end";
  
  parameter Modelica.Units.SI.Position Push_rod_rocker_end[3] = vector(Modelica.Utilities.Streams.readRealMatrix(file,"Push_rod_rocker_end",1,3)) "Push rod rocker end";
  
    parameter Modelica.Units.SI.Position Outer_track_rod_ball_joint[3] = vector(Modelica.Utilities.Streams.readRealMatrix(file,"Outer_track_rod_ball_joint",1,3)) "Outer track rod ball joint";
  
    parameter Modelica.Units.SI.Position Inner_track_rod_ball_joint[3] = vector(Modelica.Utilities.Streams.readRealMatrix(file,"Inner_track_rod_ball_joint",1,3)) "Inner track rod ball joint";
  
    parameter Modelica.Units.SI.Position Wheel_centre_point[3] = vector(Modelica.Utilities.Streams.readRealMatrix(file,"Wheel_centre_point",1,3)) "Wheel centre point";
  
    parameter Modelica.Units.SI.Position Rocker_axis_1st_point[3] = vector(Modelica.Utilities.Streams.readRealMatrix(file,"Rocker_axis_1st_point",1,3)) "Rocker axis 1st point";
  
    parameter Modelica.Units.SI.Position Rocker_axis_2nd_point[3] = vector(Modelica.Utilities.Streams.readRealMatrix(file,"Rocker_axis_2nd_point",1,3)) "Rocker axis 2nd point";
  
    
  end OutboardGeometry;
end Records;
