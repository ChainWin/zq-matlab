
% ����ӳ�� ��������ӳ�䵽ʵ��ģ������
% ���磺
%��������(1, 2) ->  (10, 80)
function [x, y] = calc(ox, oy, width)

    x = (oy - 1) * width + 10 ;
    y = (width * 8) - (ox - 1) * width + 10;
end