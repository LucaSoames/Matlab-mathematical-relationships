% This MATLAB .m file contains examples of creating a contour plot with 
% labelled level curves (Q1C), and comparison between numerical and exact 
% solution of an ODE (Q2D).  To answer Q1C and Q2D, you will have to change
% the functions, and other information (such as domain/range to plot over,
% which level curves, axis labels) as appropriate.

%% Question 1D - Example contour plot (Ex 1.11 from lecture notes)

%Define a multivariable function
f = @(x, y) 3*x.*y - x.^2.*y - 3*x.*y.^2;

%Create the contour plot using fcontour, and specify the x and y limits
figure(1)
fc = fcontour(f, [0, 3, 0, 1]); 

%this command turns on the labels for the level curves
[f,c] = contour(fc.XData, fc.YData, fc.ZData, 'ShowText', 'on'); 

%Choose the level curves to display
c.LevelList = [0,1/12, 1/6, 0.33]; 

%add axis labels
xlabel('x')
ylabel('y')


%% Question 2C - Example plot of numerical solution of ODE (Ex 4.6 from lecture notes)

%define the exact solution of the ODE
Q_exact = @(t) sin(5.*t) - 2*cos(5.*t)/3 + (2/15*exp(-5/2.*t));

%define the right hand side function F of the ODE
F = @(t, Q) 5*sin(5.*t)-5/2.*Q; 

%Define the initial condition
Q0 = 0; 

%Define the time span
tspan = linspace(0,1,100);

%Use ode45 to calculate the solution
[t, Q] = ode45(F, tspan, Q0);

%plot the solution compared to the exact solution
figure(2)
plot(t, Q, '.k', t, Q_exact(t), '--b')

%add axis labels
xlabel('t')
ylabel('Q')

%create a legend
legend('numerical', 'exact')

