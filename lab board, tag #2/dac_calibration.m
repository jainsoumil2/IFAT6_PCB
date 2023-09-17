%% Board tag: 2
%% DAC1, Channel 0
clc;
x = [0, 0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 2.25, 2.5];
y = [0.0003, 0.2483, 0.496, 0.745, 0.993, 1.241, 1.49, 1.738, 1.986, 2.234, 2.482];

[p,S] = polyfit(x,y,1);
[y_fit,delta] = polyval(p,x,S); 

% x_corrected = x_target/p(1) - p(2)/p(1)
disp(1/p(1));
disp(-p(2)/p(1));

figure(1);
plot(x,y,'bo')
hold on
plot(x,x,'g-')
plot(x,y_fit,'r-')
plot(x,y_fit+2*delta,'m--',x,y_fit-2*delta,'m--')
title('Linear Fit of Data with 95% Prediction Interval')
legend({'Data','Ideal Fit','Linear Fit','95% Prediction Interval'}, 'Location','northwest')
hold off

%% DAC1, Channel 1
clc;
x = [0, 0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 2.25, 2.5];
y = [4.00E-04 ,2.49E-01, 0.497, 0.745, 0.994, 1.242, 1.49, 1.739, 1.987, 2.235, 2.483];

[p,S] = polyfit(x,y,1);
[y_fit,delta] = polyval(p,x,S); 

% x_corrected = x_target/p(1) - p(2)/p(1)
disp(1/p(1));
disp(-p(2)/p(1));

figure(2);
plot(x,y,'bo')
hold on
plot(x,x,'g-')
plot(x,y_fit,'r-')
plot(x,y_fit+2*delta,'m--',x,y_fit-2*delta,'m--')
title('Linear Fit of Data with 95% Prediction Interval')
legend({'Data','Ideal Fit','Linear Fit','95% Prediction Interval'}, 'Location','northwest')
hold off

%% DAC1, Channel 2
clc;
x = [0, 0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 2.25, 2.5];
y = [3.00E-04 , 0.2487, 0.497, 0.745, 0.993, 1.241, 1.49, 1.738, 1.986, 2.234, 2.483];

[p,S] = polyfit(x,y,1);
[y_fit,delta] = polyval(p,x,S); 

% x_corrected = x_target/p(1) - p(2)/p(1)
disp(1/p(1));
disp(-p(2)/p(1));

figure(3);
plot(x,y,'bo')
hold on
plot(x,x,'g-')
plot(x,y_fit,'r-')
plot(x,y_fit+2*delta,'m--',x,y_fit-2*delta,'m--')
title('Linear Fit of Data with 95% Prediction Interval')
legend({'Data','Ideal Fit','Linear Fit','95% Prediction Interval'}, 'Location','northwest')
hold off

%% DAC1, Channel 3
clc;
x = [0, 0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 2.25, 2.5];
y = [7.00E-04 , 0.2491, 0.497, 0.745, 0.994, 1.242, 1.49, 1.739, 1.987, 2.235, 2.483];

[p,S] = polyfit(x,y,1);
[y_fit,delta] = polyval(p,x,S); 

% x_corrected = x_target/p(1) - p(2)/p(1)
disp(1/p(1));
disp(-p(2)/p(1));

figure(3);
plot(x,y,'bo')
hold on
plot(x,x,'g-')
plot(x,y_fit,'r-')
plot(x,y_fit+2*delta,'m--',x,y_fit-2*delta,'m--')
title('Linear Fit of Data with 95% Prediction Interval')
legend({'Data','Ideal Fit','Linear Fit','95% Prediction Interval'}, 'Location','northwest')
hold off

%% DAC1, Channel 4
clc;
x = [0, 0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 2.25, 2.5];
y = [3.00E-04 , 0.2485, 0.497, 0.745, 0.993, 1.241, 1.49, 1.738, 1.987, 2.235, 2.483];

[p,S] = polyfit(x,y,1);
[y_fit,delta] = polyval(p,x,S); 

% x_corrected = x_target/p(1) - p(2)/p(1)
disp(1/p(1));
disp(-p(2)/p(1));

figure(3);
plot(x,y,'bo')
hold on
plot(x,x,'g-')
plot(x,y_fit,'r-')
plot(x,y_fit+2*delta,'m--',x,y_fit-2*delta,'m--')
title('Linear Fit of Data with 95% Prediction Interval')
legend({'Data','Ideal Fit','Linear Fit','95% Prediction Interval'}, 'Location','northwest')
hold off