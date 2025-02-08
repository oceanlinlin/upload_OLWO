
clear all
clc

populationSize = 100; %种群数
Max_iteration = 500; %最大迭代次数
dim = 10;%可选2,10,20
runs = 1;

format longG;

load('matlab.mat')
 
    nexttile
    semilogy(PO_cg_curve_OLWO,'Color','red','LineWidth',2);

    grid on
    hold on

    
    semilogy(PO_cg_curve_WO,'b','LineWidth',2);
    
    semilogy(PO_cg_curve_WOA,'black','LineWidth',2);
    
   
   semilogy(PO_cg_curve_GJO,'Color',[1 0.41776 0.70588],'LineWidth',2);%hotpink
    
  
   semilogy(PO_cg_curve_HOA,'Color',"#1AA640",'LineWidth',2);
    

    semilogy(PO_cg_curve_KOA,'Color',[0 0.74902 1],'LineWidth',2);%deepskyblue
    

    semilogy(PO_cg_curve_DBO,'Color',[0.62745 0.12549 0.94118],'LineWidth',2);%purple
    

    semilogy(PO_cg_curve_SCA,'Color',[1 0.64706 0],'LineWidth',2);%darkorange
    
    legend('OLWO','WO','WOA','GJO','HOA','KOA','DBO','SCA');
    xlabel("Iteration");
    ylabel("Best Score obtained so far");
    title("CF1");

  