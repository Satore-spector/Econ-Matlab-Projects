%how this model works
%two agents of two differnt types are scattered randomly
%on each iteration a random agent checks its neighbor within radius r
%if fewer than the fraction of the share of its type, itll jump to a new random spot

%defining the parameters
n = 200;
r = 0.10;
th = 0.50;
steps = 2000; %no. of iterations
redraw_every = 200; %how often the plot is updated
%setting it up
pos = rand(n,2); %taking rand(x,y) in pos [0,1]
type = randi([0 1], n, 1); %agent type of 0 or 1

%visualising
figure("Color","w");

colorA = [0.50 0.30 0.10]; %col for 0
colorB = [0.00 0.40 0.70]; %col for 1

hA = scatter(pos(type==0,1), pos(type==0,2), 45, colorA, "filled")
hold on;
hB = scatter(pos(type==1,1), pos(type==1,2), 45, colorB, "filled")
hold off;

axis([0 1 0 1]);

axis square;

box on;
title('step 0');
drawnow;

%simulation loop

for step = 1:steps
    i = randi(n); %picking a random agent
d2 = sum((pos - pos(i,:)).^2, 2);
d2(i) = Inf; %dont cout yourself
neighbors =  find(d2<r^2);

if ~isempty(neighbors)
    frac_same = sum(type(neighbors) == type(i))/numel(neighbors);
    if frac_same < th
        pos(i,:) = rand(1,2); %unhappy state
    end
end

%redraw every period
if mod(step, redraw_every) == 0
    set(hA, 'XData', pos(type == 0.1), 'YData', pos(type==0,2));
    set(hB, 'XData', pos(type == 1,1), 'YData', pos(type==1,2));
    title(sprintf('step %d/%d', step, steps));
    drawnow limitrate;
end
end

title(sprintf('Final state (step %d)', steps));
