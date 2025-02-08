
function model=CreateModel()

    MAPSIZE_X = 0:100:1000; % x index
    MAPSIZE_Y = 0:100:1000; % y index
    MAPSIZE_Z = 0:100:1000;
    
    % Threats as cylinders

    %3D Case 1
    R1=120;  % Radius
    x1 = 200; y1 = 600;z1 = 800; 

    R2=120;  % Radius
    x2 = 500; y2 = 800; z2 = 800;
 
    R3=120;  % Radius
    x3 = 800; y3 = 600;z3 = 800;
    
    R4=120;  % Radius
    x4 = 300; y4 =200;z4 = 800; 
    
    R5= 120;  % Radius
    x5 = 700; y5 = 200; z5 = 800;

    R6=120;  % Radius
    x6 = 500; y6 = 450;z6 = 800;

    % Map limits
    xmin= 0;
    xmax= 1000;
    
    ymin= 0;
    ymax= 1000;

    zmin= 0;
    zmax= 1000;
    
    % Start and end position
    start_location = [0,0,0];
    end_location = [1000,1000,1000];
    
    % Number of path nodes 
    n=12;
    
    % Incorporate map and searching parameters to a model
    model.start=start_location;
    model.end=end_location;
    model.n=n;
    model.xmin=xmin;
    model.xmax=xmax;
    model.zmin=zmin;
    model.ymin=ymin;
    model.ymax=ymax;
    model.zmax=zmax;
    model.MAPSIZE_X = MAPSIZE_X;
    model.MAPSIZE_Y = MAPSIZE_Y;
    model.MAPSIZE_Z = MAPSIZE_Z;
    model.threats = [
        x1 y1 z1 R1;
        x2 y2 z2 R2; 
        x3 y3 z3 R3;
        x4 y4 z4 R4;
        x5 y5 z5 R5;
        x6 y6 z6 R6;
        ];   
  %Plot3DModel(model);
end
