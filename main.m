clc
clear all

symbol   = 'bo';  % �����ɫ����(b. ���㣻 bo��Ȧ)
symbol1  = 'go';  % �����ɫ����(w. �׵㣻 wo��Ȧ)
    
% ����֮�����
width = 10;

% �� 8*8 ���� 19 ����
array_f = [0 1 1 1 1 1 1 0;
           0 0 1 0 0 0 0 0;
           0 0 1 0 0 1 0 0;
           0 0 1 1 1 1 0 0;
           0 0 0 0 0 1 0 0;
           0 0 1 0 0 0 0 0;
           0 0 1 0 0 0 0 0;
           0 1 1 1 0 0 0 0];
       

array_z = [0 1 1 1 1 1 1 0;
           0 1 0 0 0 1 0 0;
           0 0 0 0 1 0 0 0;
           0 0 0 1 0 0 0 0;
           0 0 0 1 0 0 0 0;
           0 0 1 0 0 0 0 0;
           0 0 0 0 0 1 0 0;
           1 1 1 1 1 1 0 0];

       
xmin = 0;xmax = 100;ymin = 0;ymax = 100; %�����ķ�Χ
axis([xmin xmax ymin ymax]); %�趨���귶Χ
figure(1);
hold on ; %������ͼ����

% ���Ƴ�ʼͼ��
% for i = 1: 8
%    for j = 1: 8 
%        if array_f(i, j) == 1
%            plot((j - 1) * width + 10, 80 - (i - 1) * width + 10, 'bo');
%        end
% 
%    end
% end

id_sta_addr = zeros(19,2);
id_sto_addr = zeros(19,2);
id_cur_addr = zeros(19,2);
id_tm = zeros(19, 1);         %�����ƶ�ʱ��
index = 1;

% ���ɻ�ʵʱ��ţ���ɨ��
for i = 1: 8
   for j = 1: 8 
       % start ����
       if array_f(i, j) == 1
            id_sta_addr(index, 1) = (j - 1) * width + 10 ;
            id_sta_addr(index, 2) = 80 - (i - 1) * width + 10;
            index = index + 1;
            % ���
            plot((j - 1) * width + 10, 80 - (i - 1) * width + 10, 'bo');
       end
   end
end

dt = 1;
v  = 1;

%xa = 10; ya = 10; xb = 30; yb = 30;

id_sto_addr(1, 1) = 20;
id_sto_addr(1, 2) = 70;

id_sto_addr(2, 1) = 20;
id_sto_addr(2, 2) = 80;

% ���Բ���  ��һ���� �ƶ���30 * 30
id_tm(1)=sqrt((id_sto_addr(1, 1)-id_sta_addr(1, 1))^2 + (id_sto_addr(1, 2)-id_sta_addr(1, 2))^2) / v; %������� Step ���ƶ�ʱ��

id_tm(2)=sqrt((id_sto_addr(2, 1)-id_sta_addr(2, 1))^2 + (id_sto_addr(2, 2)-id_sta_addr(2, 2))^2) / v; %������� Step ���ƶ�ʱ��

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%tm=sqrt((xb-xa)^2 + (yb-ya)^2) / v; %������� Step ���ƶ�ʱ��
 
% ����ǰ������
%pre_x = 0;
%pre_y = 0;

max_tm = max(id_tm);
% id scan
 for t=0:dt:max_tm
     
    for index = 1:2
        % �����ƶ�
        [id_cur_addr(index, 1), id_cur_addr(index, 2)] = move(index,       ...
                                                              id_sta_addr, ...
                                                              id_sto_addr, ...
                                                              id_cur_addr, ...
                                                              t,           ...
                                                              id_tm,       ...
                                                              v);

    end
end
        
% t = move(10, 10, 30, 30, 1, 1);
% t






