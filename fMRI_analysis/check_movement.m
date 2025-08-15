
% check the movement from each run by  rp.txt files from each realignment
% 

temp=dir('/Users/caglademirkan/Documents/MATLAB/sub009_1504/CCNB_11531/sesexpP2_taskP2_run01_dirAP_bold_0020/rp_MFV6522-0020-00001-000001.txt')
movement = textread(temp(1).name);
figure;
subplot(2,1,1)
plot(movement(:,1:3));
title('translations')
ylabel('mm')
xlabel('scan')
xlim([0 450])

subplot(2,1,2)
plot(movement(:,4:6));
title('rotations')
ylabel('degree')
xlabel('scan')
xlim([0 450])



% to, for example, only show movement until the 400th volume - the y axis should adjust automatically
% otherwise you can also adjust the y axis by doing
% ylim([your_lower_limit, your_higher_limit])