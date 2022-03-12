function [east_phaseid,east_red_starttime,east_red_endtime,east_green_starttime,east_green_endtime,east_yellow_starttime,east_yellow_endtime,north_phaseid,north_red_starttime,north_red_endtime,north_green_starttime,north_green_endtime,north_yellow_starttime,north_yellow_endtime,east_green,east_yellow,east_red,north_red,north_yellow,north_green] = fcn(t)
    light_run_time = mod(fix(t),15);%丁字路口周期15s
    %% 东西直行灯，路权9s，east_phaseid=1
    east_phaseid=1;%东西相位phaseid
    east_red=0;east_yellow=0;east_green=0;
    %v2x spat信息初始化：
    east_red_starttime=0;
    east_red_endtime = 0;
    east_green_starttime=0;
    east_green_endtime = 0;
    east_yellow_starttime=0;
    east_yellow_endtime = 0;
    if(light_run_time<6)
        east_green=0;east_yellow=0;east_red=1;%灯色控制
        %v2x spat信息：
        east_red_starttime=0;
        east_red_endtime = 6-light_run_time;
        east_green_starttime=6-light_run_time;
        east_green_endtime = 12-light_run_time;%6s绿灯
        east_yellow_starttime=12-light_run_time;
        east_yellow_endtime = 15-light_run_time;%3s黄灯
    end
    if(light_run_time>=6&&light_run_time<12)%6s绿灯
        east_red=0;east_yellow=0;east_green=1;%灯色控制
        %v2x spat信息：
        east_red_starttime=15-light_run_time;
        east_red_endtime = 21-light_run_time;
        east_green_starttime = 0;
        east_green_endtime = 12-light_run_time;%6s绿灯
        east_yellow_starttime=12-light_run_time;
        east_yellow_endtime = 15-light_run_time;%3s黄灯
    end
    if(light_run_time>=12)%3s黄灯
        east_red=0;east_yellow=1;east_green=0;%灯色控制
        %v2x spat信息：
        east_red_starttime = 15-light_run_time;
        east_red_endtime = 21-light_run_time;
        east_green_starttime = 21-light_run_time;
        east_green_endtime = 27-light_run_time;%6s绿灯
        east_yellow_starttime=0;
        east_yellow_endtime = 15-light_run_time;%3s黄灯
    end

    %% 南北红绿灯,路权6s
    north_red=0;north_yellow=0;north_green=0;
    north_phaseid=2;%南北相位phaseid
    %v2x spat信息初始化：    
    north_red_starttime = 0;
    north_red_endtime = 0;
    north_green_starttime = 0;
    north_green_endtime = 0;
    north_yellow_starttime=0;
    north_yellow_endtime = 0;
    if(light_run_time<3)%3s绿灯
        north_red=0;north_yellow=0;north_green=1;
        %v2x spat信息：    
        north_red_starttime = 6-light_run_time;
        north_red_endtime = 15-light_run_time;%9s红灯
        north_green_starttime = 0;
        north_green_endtime = 3-light_run_time;%3s绿灯
        north_yellow_starttime=3-light_run_time;
        north_yellow_endtime = 6-light_run_time;%3s黄灯    
    end
    if(light_run_time>=3&&light_run_time<6)%3s黄灯
        north_red=0;north_yellow=1;north_green=0;
        %v2x spat信息：
        north_red_starttime = 6-light_run_time;
        north_red_endtime = 15-light_run_time;%9s红灯
        north_green_starttime = 15-light_run_time;
        north_green_endtime = 18-light_run_time;%3s绿灯
        north_yellow_starttime=0;
        north_yellow_endtime = 6-light_run_time;%3s黄灯
    end
    if(light_run_time>=6)%9s红灯
        north_red=1;north_yellow=0;north_green=0;
        %v2x spat信息：
        north_red_starttime = 0;
        north_red_endtime = 15-light_run_time;%9s红灯
        north_green_starttime = 15-light_run_time;
        north_green_endtime = 18-light_run_time;%3s绿灯
        north_yellow_starttime=18-light_run_time;
        north_yellow_endtime = 21-light_run_time;%3s黄灯
    end
end
