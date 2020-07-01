function []=mapping()

% OBS.: Este algoritmo está genérico para qualquer tamanho de imagem

%resolucao
resFig = 50;  % resolução que transforma pixel em metros

%% Mapa normal para OcupancyGrid
figure
image = imread('mapaexemplo.png');
grayimage = rgb2gray(image);
bwimage = grayimage < 0.5;
gridmap = robotics.BinaryOccupancyGrid(bwimage, resFig); %% o mapa aqui já está em metros
show(gridmap)  %% Ocupancy Grid                       

figure
% Infla o OcuppancyGrid map
robotRadius = 0.15;
mapInflated = copy(gridmap);
inflate(mapInflated,robotRadius);  %% o mapa aqui já está em metros
show(mapInflated);


matrix = occupancyMatrix(mapInflated); %% o mapa aqui volta a ser representado em pixels

% Salva a matriz em arquivo txt
fid = fopen('mymap.txt', 'wt');
for ii = 1:size(matrix,1)
    fprintf(fid, '%g\t', matrix(ii,:));
    fprintf(fid, '\n');
end
fclose(fid);



