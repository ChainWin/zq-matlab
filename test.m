clear all
clc;

symbol   = 'bo';  % �����ɫ����(b. ���㣻 bo��Ȧ)
symbol1  = 'go';  % �����ɫ����(w. �׵㣻 bo��Ȧ)
%��ز����趨
T = 100; %����ʱ�� s
dt = 2; %����ʱ�� s
vmin = 1;vmax = 1.5; %�ٶȷ�Χ

tmin = 0.5;tmax = 0.5; %ͣ��ʱ�䷶Χ s

xmin = 0;xmax = 100;ymin = 0;ymax = 50; %�����ķ�Χ
tex=0; %��ʼ������ʱ��������
axis([xmin xmax ymin ymax]); %�趨���귶Χ
figure(1);
hold on ; %������ͼ����

xa=unifrnd(0,100,[1,1]); %���������ʼ������
ya=unifrnd(0,50,[1,1]);

% ����ǰһ������
pre_x = 0;
pre_y = 0;

while (1)
    xb=unifrnd(0,100,[1,1]); %�������һ��·������
    yb=unifrnd(0,50,[1,1]);
    v=unifrnd(vmin,vmax,[1,1]); %�������һ���ٶ�ֵ���ٶȴ�С���Ӿ��ȷֲ�
    tp=unifrnd(tmin,tmax,[1,1]); %�������һ��ͣ��ʱ�䣬ͣ��ʱ����Ӿ��ȷֲ�
    tm=sqrt((xb-xa)^2+(yb-ya)^2)/v; %������� Step ���ƶ�ʱ��
    
    if xa==xb && ya==yb %�ڳ������Ŀ�ĵ�������ͬʱ��������
        pre_x = xa;
        pre_y = xb;
        plot(x, y, symbol);
        
        pause(tp); %ֹͣһ��ʱ��
        tex=tex+tp; %��������ʱ��������
        
    else
        if T-tex>=tm; %���� Step �ڷ���ʱ�䲻�ᵽ
 
            for t=0:dt:tm
                
                plot(pre_x, pre_y, symbol1);
                
                x=xa+v*((xb-xa)/sqrt((xb-xa)^2+(yb-ya)^2))*t;
                y=ya+v*((yb-ya)/sqrt((xb-xa)^2+(yb-ya)^2))*t;

                plot(x,y, symbol);
                pre_x = x;
                pre_y = y;    
                pause(0.5)
                tex=tex+dt; %��������ʱ��������
                
            end
            if T-tex>=tp;
                pause(tp); %ֹͣһ��ʱ��
                tex=tex+tp; %��������ʱ��������
            else
            	pause(T-tex); %ʱ�䵽
                return
            end
            
        else %���� Step �ڷ���ʱ��ᵽ
            for t=0:dt:T-tex
                
                plot(pre_x,pre_y, symbol1);
                
                x=xa+v*((xb-xa)/sqrt((xb-xa)^2+(yb-ya)^2))*t;
            	y=ya+v*((yb-ya)/sqrt((xb-xa)^2+(yb-ya)^2))*t;
                plot(x,y, symbol);
                
                pre_x = x;
                pre_y = y;
                
            end
            
            return %ʱ�䵽
        end
    end
    
    xa=xb;ya=yb; %��Ŀ������Ϊ�� Step �����
    
    %delete(xb,yb)
end