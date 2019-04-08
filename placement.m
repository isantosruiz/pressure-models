function [nodes,t] = placement(P,numsensors,sorted)
%PLACEMENT Pressure sensors placement (PSP) for WDN using PCA.
%
%   nodes = PLACEMENT(P,numsensors) compute the PSP from pressure matrix
%   P = [P_1,P_2,...,P_N] containing the data for different leak scenarios.
%   Each P_k is a column vector with the pressure values in the k-th node.
%   Output argument "nodes" contains the "numsensors" optimal locations.
%   The default value of "numsensors" is 3.
%
%   nodes = PLACEMENT(P,numsensors,sorted) returns the selected nodes
%   in priority order if "sorted" is true (by default is false).
%
%   Example:
%      % Compute the five best nodes to place sensors from leak data
%      data = load('HanoiData');
%      sensors = PLACEMENT(data.P,5,true);
%
%   Requires:
%      Statistics and Machine Learning Toolbox
%
%   Author:
%      Ildeberto de los Santos Ruiz
%      idelossantos@ittg.edu.mx
%
%   See also PCA.

if nargin < 2
    numsensors = 3;
end
if nargin < 3
    sorted = false;
end

tic
nodes = pcareduce(P,numsensors,sorted);
t = toc;
