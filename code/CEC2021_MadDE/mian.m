clc;
clear all;

format long;
Runs=20;
fhd=@Parametrized_benchmark_func;

%optimum= [100, 1100, 700, 1900, 1700, 1600, 2100, 2200, 2400, 2500]; %Bias
optimum= [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; %Basic

C = [
    0 0 0;%basic
    1 0 0;%bias
    ];

max_nfes = 10000;


D = 10;
%{
for func = 1:10
    for i = 1:1%选择CEC2021的操作
         fprintf('\n-------------------------------------------------------\n\n')
         [curve_MadDE,all_bsf_fit_vals_MadDE,all_fun_no_fit_errorval_MadDE] = MadDE(Runs,fhd,C(i,:),D,func,max_nfes,optimum);
         
         %函数值
            Best_all_bsf_fit_vals_MadDE = min(all_bsf_fit_vals_MadDE);
            Worst_all_bsf_fit_vals_MadDE = max(all_bsf_fit_vals_MadDE);
            Median_all_bsf_fit_vals_MadDE = median(all_bsf_fit_vals_MadDE);
            Mean_all_bsf_fit_vals_MadDE = mean(all_bsf_fit_vals_MadDE);
            Std_all_bsf_fit_vals_MadDE = std(all_bsf_fit_vals_MadDE);
   
            %函数误差
            Best_all_fun_no_fit_errorval_MadDE = min(all_fun_no_fit_errorval_MadDE);
            Worst_all_fun_no_fit_errorval_MadDE = max(all_fun_no_fit_errorval_MadDE);
            Median_all_fun_no_fit_errorval_MadDE = median(all_fun_no_fit_errorval_MadDE);
            Mean_all_fun_no_fit_errorval_MadDE = mean(all_fun_no_fit_errorval_MadDE);
            Std_all_fun_no_fit_errorval_MadDE = std(all_fun_no_fit_errorval_MadDE);
            file_save_errorval_MadDE(func,:) = [Best_all_fun_no_fit_errorval_MadDE,Mean_all_fun_no_fit_errorval_MadDE,Std_all_fun_no_fit_errorval_MadDE];
          
    end
end
%}

[curve_MadDE,all_bsf_fit_vals_MadDE,all_fun_no_fit_errorval_MadDE] = MadDE(Runs,fhd,C(1,:),10,1,10000,optimum);

temp = 1:500:max_nfes;

semilogy(curve_MadDE,'-p','MarkerIndices',temp,'Color','blue','MarkerFaceColor','blue','LineWidth',1);
grid on;
hold on;

title('CF1(dim = 10)');
legend('MadDE','EA4eig','mLSHADE','OLWO');
xlabel('Function Evaluation');
ylabel('Best Score obtained so-far');
