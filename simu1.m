%   (7; 4) Hamming code over BEC
%
%
%    Autor: WANG Yuqing
%    Last Modify:2021.11.23
%    Runtime:MATLAB(R) 2016a

clc,clear all,close all

load('Data.mat')
Data = b;

x=Data(:,1);y=Data(:,2);z=Data(:,3); 

[X Y] =  meshgrid(min(x):2:max(x),min(y):2:max(y));
[X,Y,Z] = griddata(x,y,z,X,Y);
figure('NumberTitle', 'off', 'Name', 'Fuzzy control plane');
mesh(X,Y,z)     %3D surface

row = size(Data,1);
x=Data(:,1);y=Data(:,2);z=Data(:,3); 
T=[x y x.*y x.*x y.*y ones(row,1)]\z;
syms x y
z = vpa([x y x*y x*x y*y 1]*T,4);
z
