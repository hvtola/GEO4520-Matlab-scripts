function [long, lat] = sin2ll_MOD(nx,h,v)
% nx: number of pixels in east direction
% h: horz-tile
% v: vert-tile
% convert sinusoidal projection like MODIS products to long-lat.
% 
% from:
% MODIS Collection 5 Burned Area Product - MCD45
% User?s Guide Version 2.0, November 2009
% Luigi Boschetti, University of Maryland
% David Roy, South Dakota State University
% Anja A. Hoffmann, LM University of Munich
%
% PAGE 30-31
% The MODIS data are re-projected using an equiareal sinusoidal projection, defined on a
% sphere of radius
%rho=6371007.181 m,
%and with the Greenwich meridian as the central meridian of the projection.
%Defining (x, y) as the East and North coordinate in meters of a point in the map space, and
%its latitude and longitude in degrees, the direct formulas is:
%
% Torbjørn, nov 2011


rho     = 6371007.181;  % sphere radius [m]
t       = 1111950;      % m
ny      = nx;           % number of pixels in north
sz_pix  = t/nx;         % pixel size

% array
i=0:nx-1;
j=0:ny-1;


% zero in london
h=h-18;

% mesh, since x,y interact in 2longlat
[i,j]= meshgrid(i,j);

% projection in map space
x = (i +.5)*sz_pix + h*t;
y = (9-v)*t - (j+.5)*sz_pix;

% to long lat
lat     = y * (180/pi)/rho;
long    = x./(rho.*cosd((y.*180)./(rho.*pi))) .* 180./pi;


