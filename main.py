from dict2xml import dict2xml



channels = ['Lower wishbone front pivot',
            'Lower wishbone rear pivot',
            'Lower wishbone outer ball joint',
            'Upper wishbone front pivot',
            'Upper wishbone rear pivot',
            'Upper wishbone outer ball joint',
            'Push rod wishbone end',
            'Push rod rocker end',
            'Outer track rod ball joint',
            'Inner track rod ball joint',
            'Damper to body point',
            'Damper to rocker point',
            'Wheel spindle point',
            'Wheel centre point',
            'Rocker axis 1st point',
            'Rocker axis 2nd point',
            'Roll Bar Attachment 1',
            'Roll Bar Attachment 2',
            'Roll Bar to Link1',
            'Roll Bar to Link2',
            'Roll Bar Mount 1',
            'Roll Bar Mount 2',
            'Roll Bar Revolute',
            'Drop Link 1 C of G',
            'Drop Link 2 C of G',
            'Roll Bar 1 C of G',
            'Roll Bar 2 C of G']

hardpoints = {}
axle = "front"
with open("geometries\\faraday_2023.html", "r") as f:
    for line in f.readlines():
        
        if any(channel in line for channel in channels):
            
            for channel in channels:
                if channel in line:
                    hardpoint = channel.replace(' ', '_')
                    break
            
            channel = 1
            coord = []
            linesplit = line.split(' ')
            for char in linesplit:
                if char != '':
                    coord.append(float(char)/1000)
                    if len(coord) == 3:
                        coord = [-coord[0], -coord[1], coord[2]]
                        break
                    
            hardpoints[hardpoint] = {"Value": str(coord)}
            stop = 1
            
        if len(hardpoints) == len(channels):
            xml = dict2xml(hardpoints, wrap="Parameters", indent="   ")
            with open("geometries\\faraday_2023_" + axle +".xml", 'w') as f:
                f.write('<?xml version="1.0" encoding="UTF-8"?>\n')
                f.write(xml)
            axle = "rear"
