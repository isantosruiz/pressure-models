function p = pressureModels(P,sensors)
%pressureModels Fit GPR models for pressures on each node of a water
%   distribution network, using the pressures in certain sensors as
%   predictor variables.
%
%   Syntax:
%      p = pressureModels(P,sensors)
%
%   Arguments:
%            P ... Matrix P = [P_1,P_2,...,P_N] containing pressure data
%                  for different scenarios, where P_k is a column vector
%                  with pressure values in the k-th node.
%      sensors ... List of nodes with sensors (predictors).
%            p ... Cell array of GPR models for pressures on each node,
%                  where p{k} is the prediction function for k-th node.
%
%   Example:
%      % Build a model for all nodes of Hanoi WDN using three sensors 
%      data = load('HanoiData');
%      p = pressureModels(data.P,[12,21,27]);
%      % Predict pressure on node 15 from measurements
%      Psensors = [4.0962,6.2420,6.2807];
%      p{15}(Psensors)
%
%   Author:
%      Ildeberto de los Santos Ruiz
%      idelossantos@ittg.edu.mx

N = size(P,2);
p = cell(N,1);
for node = 1:N
    p{node} = pressureModel(P,sensors,node);
end