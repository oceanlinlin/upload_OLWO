clc;
clear;

model = CreateModel();

start = model.start;
target = model.end;
nVar= model.n; 
theta = atand((target(2)-start(2))/(target(1)-start(1)));

%绘制路径
disp("----------- Plot Path -------------")
%
figure(1)
plot3(model.MAPSIZE_X,model.MAPSIZE_Y,model.MAPSIZE_Z,'Color',"none");
grid on;
    axis equal;
    xlabel('x [m]');
    ylabel('y [m]');
    zlabel('z [m]');
    hold on
% Plot threat cylindrials 绘制障碍物
    % Threats as cylinders
    threats = model.threats;
    threat_num = size(threats,1);
    
    for i = 1:threat_num
        threat = threats(i,:);
        threat_x = threat(1);
        threat_y = threat(2);
        threat_z = threat(3);
        threat_radius = threat(4);

        %绘制3维圆柱形障碍物
        
        [xc,yc,zc]=cylinder(threat_radius);
        xc=xc+threat_x;  
        yc=yc+threat_y;
        zc=zc*threat_z;
        c = surf(xc,yc,zc); % plot the cylinder 
        set(c,'edgecolor','none','facecolor','#FF0000','FaceAlpha',0.3); 
      
        %绘制圆柱体顶部分
        hold on
        theta_c = linspace(0,2*pi,50);
        x = threat_x+ threat_radius*cos(theta_c);
        y = threat_y+ threat_radius*sin(theta_c);
        z = ones(size(theta_c))*threat_z;
        color = [1 0 0];
        p = fill3(x,y,z,color);
        p.FaceAlpha=0.3;
        p.LineStyle ='--';
        %绘制圆柱体底部
        %
        hold on
        theta_c1 = linspace(0,2*pi,50);
        x1 = threat_x+ threat_radius*cos(theta_c1);
        y1 = threat_y+threat_radius*sin(theta_c1);
        z1 = ones(size(theta_c1));
        color = [1 1 1];
        q = fill3(x1,y1,z1,color);
        q.FaceAlpha=0.3;
        q.LineStyle ='--';
        %}
    end
    %view(3)%在三维视角下看图
    grid on
    %}    
    load('matlab.mat');
 Print(BestPosition_OLWO,start,target,theta,nVar,model,1);%蓝色

 Print(BestPosition_WO,start,target,theta,nVar,model,2);
 hold on;
 Print(BestPosition_WOA,start,target,theta,nVar,model,4);
 hold on;
 Print(BestPosition_SCSO,start,target,theta,nVar,model,5);
 hold on;
 Print(BestPosition_PSO,start,target,theta,nVar,model,6);
 hold on;
 
 %Print(BestPosition_NMOPSO,start,target,theta,nVar,model,6);%黄色
 
 %Print(BestPosition_MadDE,start,target,theta,nVar,model,7);%绿色

figure(2)
 load('matlab1.mat');
semilogy(BestCostCurve_OLWO,'b','LineWidth',1.5);
grid on;
 hold on;
semilogy(BestCostCurve_WO,'black','LineWidth',1.5);
semilogy(BestCostCurve_WOA,'Color',[0 0.74902 1],'LineWidth',1.5);
semilogy(BestCostCurve_PSO,'Color',[1 0.64706 0],'LineWidth',1.5);
semilogy(BestCostCurve_GJO,'Color',[1 0.41776 0.70588],'LineWidth',1.5);
semilogy(BestCostCurve_SCSO,'Color',[0.62745 0.12549 0.94118],'LineWidth',1.5);
 

 legend('OLWO','WO','WOA','PSO','GJO','SCSO');
 xlabel("Iteration");
 ylabel("Cost Value");
 title("Case1");
     
 

 