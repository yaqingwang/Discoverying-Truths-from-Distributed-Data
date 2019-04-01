function [abs_distance,sq_distance,error_rate] = evaluate_distance(truth, groundtruth)
% ----------------------------------------------------------------------
% Function for evalute result in terms of distance
% Qi Li
%version 1
% Input:   truth--the result from aggregation method 
%                   1st col is id index 
%                   2rd col is truth
%          groundtruth--same format as truth
%
% Output:  abs_distance--sum of absolute distance
%          sq_distance--sum of square of distance
%          error_rate--if the absolute distance is greater than 10% of
%          ground truth, it is considered as an error
% ----------------------------------------------------------------------
[~,truth_index,g_index]= intersect(truth(:,1),groundtruth(:,1));
difference=truth(truth_index,2)-groundtruth(g_index,2);
length(truth_index)
abs_distance=sum(abs(difference))/length(truth_index);
sq_distance=sqrt(sum(difference.^2)/length(truth_index));

abs_diff=abs(difference);
rlt_diff=abs(difference);
error_rate=sum(rlt_diff>10)/length(truth_index);