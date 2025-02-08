
function DrawSpline(n, k, P, NodeVector,model,fn)
Nik = zeros(n+1, 1);
for u = 0 : 0.005 : 1-0.005
    for i = 0 : 1 : n
        Nik(i+1, 1) = BaseFunction(i, k , u, NodeVector);
    end
    p_u = P * Nik;
    if u == 0
        tempx = p_u(1,1);
        tempy = p_u(2,1);
        tempz = p_u(3,1);
       
    else
        
        if fn == 1          
         plot3([tempx p_u(1,1)], [tempy p_u(2,1)], [tempz p_u(3,1)],'Marker','.','LineStyle','-', 'Color','b', 'LineWidth',2,'DisplayName','OLWO');
      
        elseif fn == 2
         plot3([tempx p_u(1,1)], [tempy p_u(2,1)], [tempz p_u(3,1)],'Marker','.','LineStyle','-', 'Color','black', 'LineWidth',2,'DisplayName','WO');
         
        elseif fn == 3
           plot3([tempx p_u(1,1)], [tempy p_u(2,1)], [tempz p_u(3,1)],'Marker','.','LineStyle','-', 'Color',[1 0.41776 0.70588], 'LineWidth',2,'DisplayName','GJO');
           
        elseif fn == 4
            plot3([tempx p_u(1,1)], [tempy p_u(2,1)], [tempz p_u(3,1)],'Marker','.','LineStyle','-', 'Color',[0 0.74902 1], 'LineWidth',2,'DisplayName','WOA');
          
        elseif fn == 5
           plot3([tempx p_u(1,1)], [tempy p_u(2,1)], [tempz p_u(3,1)],'Marker','.','LineStyle','-', 'Color',[0.62745 0.12549 0.94118], 'LineWidth',2,'DisplayName','SCSO');
          
        elseif fn == 6
           plot3([tempx p_u(1,1)], [tempy p_u(2,1)], [tempz p_u(3,1)],'Marker','.','LineStyle','-', 'Color',[1 0.64706 0], 'LineWidth',2,'DisplayName','PSO');
         
        elseif fn == 7
            plot3([tempx p_u(1,1)], [tempy p_u(2,1)], [tempz p_u(3,1)],'Marker','.','LineStyle','-', 'Color',"#1AA640", 'LineWidth',2,'DisplayName','PSO');

       
        end
  
        tempx = p_u(1,1);
        tempy = p_u(2,1);
        tempz = p_u(3,1);
    end
end


target = model.end;
if fn == 1
  plot3([tempx target(1)], [tempy target(2)], [tempz target(3)],'Marker','.','LineStyle','-', 'Color','b', 'LineWidth',2,'DisplayName','OLWO');

elseif fn == 2
  plot3([tempx target(1)], [tempy target(2)], [tempz target(3)],'Marker','.','LineStyle','-', 'Color','black', 'LineWidth',2,'DisplayName','WO');
  
elseif fn == 3
  plot3([tempx target(1)], [tempy target(2)], [tempz target(3)],'Marker','.','LineStyle','-', 'Color',[1 0.41776 0.70588], 'LineWidth',2,'DisplayName','GJO');
 
elseif fn == 4
  plot3([tempx target(1)], [tempy target(2)], [tempz target(3)],'Marker','.','LineStyle','-', 'Color',[0 0.74902 1], 'LineWidth',2,'DisplayName','WOA');
    
elseif fn == 5
  plot3([tempx target(1)], [tempy target(2)], [tempz target(3)],'Marker','.','LineStyle','-', 'Color',[0.62745 0.12549 0.94118], 'LineWidth',2,'DisplayName','SCSO');
    
elseif fn == 6
  plot3([tempx target(1)], [tempy target(2)], [tempz target(3)],'Marker','.','LineStyle','-', 'Color',[1 0.64706 0], 'LineWidth',2,'DisplayName','PSO');

elseif fn == 7
  plot3([tempx target(1)], [tempy target(2)], [tempz target(3)],'Marker','.','LineStyle','-', 'Color',"#1AA640", 'LineWidth',2,'DisplayName','PSO');
end

end


