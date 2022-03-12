function [east_phaseid,east_red_starttime,east_red_endtime,east_green_starttime,east_green_endtime,east_yellow_starttime,east_yellow_endtime,north_phaseid,north_red_starttime,north_red_endtime,north_green_starttime,north_green_endtime,north_yellow_starttime,north_yellow_endtime,east_green,east_yellow,east_red,north_red,north_yellow,north_green] = fcn(t)
    light_run_time = mod(fix(t),15);%����·������15s
    %% ����ֱ�еƣ�·Ȩ9s��east_phaseid=1
    east_phaseid=1;%������λphaseid
    east_red=0;east_yellow=0;east_green=0;
    %v2x spat��Ϣ��ʼ����
    east_red_starttime=0;
    east_red_endtime = 0;
    east_green_starttime=0;
    east_green_endtime = 0;
    east_yellow_starttime=0;
    east_yellow_endtime = 0;
    if(light_run_time<6)
        east_green=0;east_yellow=0;east_red=1;%��ɫ����
        %v2x spat��Ϣ��
        east_red_starttime=0;
        east_red_endtime = 6-light_run_time;
        east_green_starttime=6-light_run_time;
        east_green_endtime = 12-light_run_time;%6s�̵�
        east_yellow_starttime=12-light_run_time;
        east_yellow_endtime = 15-light_run_time;%3s�Ƶ�
    end
    if(light_run_time>=6&&light_run_time<12)%6s�̵�
        east_red=0;east_yellow=0;east_green=1;%��ɫ����
        %v2x spat��Ϣ��
        east_red_starttime=15-light_run_time;
        east_red_endtime = 21-light_run_time;
        east_green_starttime = 0;
        east_green_endtime = 12-light_run_time;%6s�̵�
        east_yellow_starttime=12-light_run_time;
        east_yellow_endtime = 15-light_run_time;%3s�Ƶ�
    end
    if(light_run_time>=12)%3s�Ƶ�
        east_red=0;east_yellow=1;east_green=0;%��ɫ����
        %v2x spat��Ϣ��
        east_red_starttime = 15-light_run_time;
        east_red_endtime = 21-light_run_time;
        east_green_starttime = 21-light_run_time;
        east_green_endtime = 27-light_run_time;%6s�̵�
        east_yellow_starttime=0;
        east_yellow_endtime = 15-light_run_time;%3s�Ƶ�
    end

    %% �ϱ����̵�,·Ȩ6s
    north_red=0;north_yellow=0;north_green=0;
    north_phaseid=2;%�ϱ���λphaseid
    %v2x spat��Ϣ��ʼ����    
    north_red_starttime = 0;
    north_red_endtime = 0;
    north_green_starttime = 0;
    north_green_endtime = 0;
    north_yellow_starttime=0;
    north_yellow_endtime = 0;
    if(light_run_time<3)%3s�̵�
        north_red=0;north_yellow=0;north_green=1;
        %v2x spat��Ϣ��    
        north_red_starttime = 6-light_run_time;
        north_red_endtime = 15-light_run_time;%9s���
        north_green_starttime = 0;
        north_green_endtime = 3-light_run_time;%3s�̵�
        north_yellow_starttime=3-light_run_time;
        north_yellow_endtime = 6-light_run_time;%3s�Ƶ�    
    end
    if(light_run_time>=3&&light_run_time<6)%3s�Ƶ�
        north_red=0;north_yellow=1;north_green=0;
        %v2x spat��Ϣ��
        north_red_starttime = 6-light_run_time;
        north_red_endtime = 15-light_run_time;%9s���
        north_green_starttime = 15-light_run_time;
        north_green_endtime = 18-light_run_time;%3s�̵�
        north_yellow_starttime=0;
        north_yellow_endtime = 6-light_run_time;%3s�Ƶ�
    end
    if(light_run_time>=6)%9s���
        north_red=1;north_yellow=0;north_green=0;
        %v2x spat��Ϣ��
        north_red_starttime = 0;
        north_red_endtime = 15-light_run_time;%9s���
        north_green_starttime = 15-light_run_time;
        north_green_endtime = 18-light_run_time;%3s�̵�
        north_yellow_starttime=18-light_run_time;
        north_yellow_endtime = 21-light_run_time;%3s�Ƶ�
    end
end
