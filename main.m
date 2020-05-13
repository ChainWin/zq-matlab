clc
clear all

symbol   = 'bo';  % �����ɫ����(b. ���㣻 bo��Ȧ)
symbol1  = 'wo';  % �����ɫ����(w. �׵㣻 wo��Ȧ)
   
dt = 1; % ��������
v  = 1; % �ٶ�


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

%�����ķ�Χ       
xmin = 0;xmax = width * 8 + 20;ymin = 0;ymax = width * 8 + 20; 
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


% ���ɻ�ʵʱ��ţ���ɨ�� ����ɴ���
for i = 1: 8
	for j = 1: 8 
        % start ����
        if array_f(i, j) == 1
            % �������λ��Ӧ��ʵ�ʳ���
            [id_sta_addr(index, 1), id_sta_addr(index, 2)] = calc(i, j, width);
            index = index + 1;            
        end
	end
end



%���� �������˻��������ʱ��
 for i=1:19
	id_tm(i)=sqrt((id_sta_addr(i, 1)-id_sto_addr(i, 1))^2 + (id_sta_addr(i, 2)-id_sto_addr(i, 2))^2) / v; %������� Step ���ƶ�ʱ��
 end

max_tm = max(id_tm);
% id scan
 for t=0:dt:max_tm
     
    for index = 1:19
        % �����ƶ�
        [id_cur_addr(index, 1), id_cur_addr(index, 2)] = move(index,       ...
                                                              id_sto_addr, ...
                                                              id_sta_addr, ...
                                                              id_cur_addr, ...
                                                              t,           ...
                                                              id_tm,       ...
                                                              v);

    end
    pause(0.1);
 end


 % ��λ�õ�����ָ��λ��
for i=1:19
    plot(id_cur_addr(i, 1), id_cur_addr(i, 2), symbol1);
    plot(id_sta_addr(i, 1), id_sta_addr(i, 2), symbol);
end


% ������ �ȴ����������α仯
pause(3);



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
            % �������λ��Ӧ��ʵ�ʳ���
            [id_sta_addr(index, 1), id_sta_addr(index, 2)] = calc(i, j, width);
            % ���÷ɻ�
            %plot(id_sta_addr(index, 1), id_sta_addr(index, 2), 'bo');
            index = index + 1;            
        end
	end
end
    
    

%%�㷨������� ����ֻ��ģ����֤
% ���Բ���%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

id_sto_addr = id_sta_addr;

% ��ʾ ID 7�ĵ� �ƶ���(2,2) ��λ��
[id_sto_addr(7, 1) , id_sto_addr( 7, 2)] = calc(2, 2, width);
[id_sto_addr(8, 1) , id_sto_addr( 8, 2)] = calc(3, 5, width);
[id_sto_addr(9, 1) , id_sto_addr( 9, 2)] = calc(2, 6, width);
[id_sto_addr(10, 1), id_sto_addr(10, 2)] = calc(4, 4, width);
[id_sto_addr(11, 1), id_sto_addr(11, 2)] = calc(5, 4, width);
[id_sto_addr(12, 1), id_sto_addr(12, 2)] = calc(8, 5, width);
[id_sto_addr(13, 1), id_sto_addr(13, 2)] = calc(7, 6, width);
[id_sto_addr(14, 1), id_sto_addr(14, 2)] = calc(8, 6, width);
[id_sto_addr(16, 1), id_sto_addr(16, 2)] = calc(8, 1, width);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%���� �������˻�����ʱ��
 for i=1:19
	id_tm(i)=sqrt((id_sto_addr(i, 1)-id_sta_addr(i, 1))^2 + (id_sto_addr(i, 2)-id_sta_addr(i, 2))^2) / v; %������� Step ���ƶ�ʱ��
 end

max_tm = max(id_tm);
% id scan
 for t=0:dt:max_tm
     
    for index = 1:19
        % �����ƶ�
        [id_cur_addr(index, 1), id_cur_addr(index, 2)] = move(index,       ...
                                                              id_sta_addr, ...
                                                              id_sto_addr, ...
                                                              id_cur_addr, ...
                                                              t,           ...
                                                              id_tm,       ...
                                                              v);

    end
    pause(0.1);
end
        

fprintf('�����������˻�����Ϊ %d ����λʱ�� �������ʱ��Ϊ %f \n', width, ...
                                                                 max_tm)





