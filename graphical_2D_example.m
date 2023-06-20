clear all;
close all;

% define positions
d=2;
N = 4;%4+floor(3*log(d));
mu = [10;5];
sigma = 1;
x = mu + sigma*randn(2,N);
video_flag = true;
% define objective function and mapping function
 %z = @rastrigin;
z = @quadratic;
%z = @schwefel;
%f = @(y,x) 1-exp(min(y)-y);
f = @(y,x) y;

xlim = 20;
xp = -xlim:0.5:xlim;
[X,Y] = meshgrid(xp,xp);
Z = z([X(:),Y(:)]');
Z = reshape(Z, size(X));
    
  
T = 500;
if video_flag
    figure(1);
    %pause;
    myVideo = VideoWriter('SUSD_ForGG.mp4', 'MPEG-4');
    myVideo.FrameRate = 20;
    myVideo.Quality = 100;
    open(myVideo);
end
for t=1:T
    % run the SUSD search
    % - susd(objective function, mapping function, agents, gain)
    %x = x + susd(z,f,x,5);
    [u,z_] =susd(z,f,x,0.2);
    x = x + u + dist_form(sigma,x,0.100);
    
     
    figure(1); clf;
    % show the agent positions
    plot(x(1,:), x(2,:), 'ro', 'MarkerFaceColor','r'); hold on;
    
    % show the objective function
    contour(X,Y,Z,50);
    
    % other plotting tools
    grid on;
    axis(xlim*[-1 1 -1 1]);
    pbaspect([1 1 1]);
    drawnow;
    if video_flag
        frame = getframe(gcf);
        writeVideo(myVideo, frame);
      end
%     %pause(0.01);
end
if video_flag; close(myVideo); end