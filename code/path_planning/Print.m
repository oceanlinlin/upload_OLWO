function Print(BestPosition,start,target,theta,d,model,fn)
% Transform all points to the standard coordination to plot
    A_prime = inv([cosd(theta) sind(theta) 0; -sind(theta) cosd(theta) 0; 0 0 1]);
    transform_path_x = BestPosition.x;
    transform_path_y = BestPosition.y;
    transform_path_z = BestPosition.z;
    for j =1:d 
        transform_path(j,1) = transform_path_x(j);
        transform_path(j,2) = transform_path_y(j);
        transform_path(j,3) = transform_path_z(j);
    end
    standard_path = zeros(d,3);
    for i = 1:d
        % Coordinates of all d points in standard coordination
        standard_path(i, :) = A_prime * transpose(transform_path(i, :)) + transpose(start);
    end
     

   plot3(start(1), start(2) , start(3), '-o', 'MarkerSize', 8, 'MarkerEdgeColor','black','MarkerFaceColor', 'black');
   plot3(target(1), target(2), target(3), '-pentagram', 'MarkerSize', 10, 'MarkerEdgeColor','green','MarkerFaceColor', 'green');
   
P(1,:) = standard_path(:,1);
P(2,:) = standard_path(:,2);
P(3,:) = standard_path(:,3);
n = 11;
k = 3;

flag = 2;


switch flag
    case 1
        NodeVector = linspace(0, 1, n+k+2); 

        if fn == 1
           plot3(P(1, 1:n+1), P(2, 1:n+1), P(3, 1:n+1),'o','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',6);
        elseif fn == 2
           plot3(P(1, 1:n+1), P(2, 1:n+1), P(3, 1:n+1),'o','LineWidth',1,'MarkerEdgeColor','c','MarkerFaceColor','m','MarkerSize',6);
        end
        line(P(1, 1:n+1), P(2, 1:n+1),P(3, 1:n+1));
        Nik = zeros(n+1, 1);
        for u = k/(n+k+1) : 0.001 : (n+1)/(n+k+1)          
            for i = 0 : 1 : n
                Nik(i+1, 1) = BaseFunction(i, k , u, NodeVector);
            end
        p_u = P * Nik;
        if fn == 1
          line(p_u(1,1), p_u(2,1), p_u(3,1), 'Marker','.','LineStyle','-', 'Color',[.3 .6 .9]);
        elseif fn == 2
          line(p_u(1,1), p_u(2,1), p_u(3,1), 'Marker','.','LineStyle','-', 'Color',[1 .5 0]);
        end

        end
    case 2
        NodeVector = U_quasi_uniform(n, k);    
        DrawSpline(n, k, P, NodeVector,model,fn);    
       

    case 3
        NodeVector = U_piecewise_Bezier(n, k);  
        DrawSpline(n, k, P, NodeVector,model,fn);
    otherwise
        fprintf('error!\n');
end
end