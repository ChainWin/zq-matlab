% % ��ʼ�����꣨xa, ya�� ��ֹ�����꣨xb, yb�� vΪ�ٶ�
% % dt wΪ����ʱ��
% % �����ƶ�ʱ��tm
% function [ tm ] = move(xa, ya, xb, yb, v, dt)
%     symbol   = 'bo';  % �����ɫ����(b. ���㣻 bo��Ȧ)
%     symbol1  = 'go';  % �����ɫ����(w. �׵㣻 wo��Ȧ)
% 
%     % ����ǰ������
%      persistent   pre_x;
%      persistent   pre_y;
%     if isempty(pre_x)
%     	pre_x = 0;
%     end
%     
%     if isempty(pre_y)
%     	pre_y = 0;
%     end
%     
%     tm=sqrt((xb-xa)^2 + (yb-ya)^2) / v; %������� Step ���ƶ�ʱ��
%     
% 	for t=0:dt:tm
%                 
%         plot(pre_x, pre_y, symbol1);
%                 
%         x=xa+v*((xb-xa)/sqrt((xb-xa)^2+(yb-ya)^2))*t;
%         y=ya+v*((yb-ya)/sqrt((xb-xa)^2+(yb-ya)^2))*t;
% 
%         plot(x,y, symbol);
%         pre_x = x;
%         pre_y = y;
%         pause(dt)
% 	end  
% end

% ���봫�봫ǰ�������������
% ���봫����ʼ������
% ���봫����ֹ������
% ���봫��ʱ��t
function [x, y] = move(id, id_sta_addr, id_sto_addr, id_cur_addr, t, id_tm, v)

    if id_tm(id) < t 
        x = id_cur_addr(id, 1);
        y = id_cur_addr(id, 2);
        return;
    end

    symbol   = 'bo';  % �����ɫ����(b. ���㣻 bo��Ȧ)
    symbol1  = 'wo';  % �����ɫ����(w. �׵㣻 wo��Ȧ)
    
%     if id == 2
%         fprintf('id = %d , x = %d y = %d \n', id, id_cur_addr(id, 1), id_cur_addr(id, 2))
%     end
    %(id_sto_addr(id, 1)
    
    
%    [m, n] = size(id_cur_addr);
    plot(id_cur_addr(id, 1), id_cur_addr(id, 2), symbol1);
    
    x=id_sta_addr(id,1)+v*((id_sto_addr(id,1)-id_sta_addr(id,1))/sqrt((id_sto_addr(id,1)-id_sta_addr(id,1))^2+(id_sto_addr(id,2)-id_sta_addr(id,2))^2))*t;
    y=id_sta_addr(id,2)+v*((id_sto_addr(id,2)-id_sta_addr(id,2))/sqrt((id_sto_addr(id,1)-id_sta_addr(id,1))^2+(id_sto_addr(id,2)-id_sta_addr(id,2))^2))*t;

        plot(x,y, symbol);
        %id_cur_addr(id, 1) = x;
        %id_cur_addr(id, 2) = y;
        pause(0.1);

end

