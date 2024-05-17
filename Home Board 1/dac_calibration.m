%% Board tag: 1
%% DAC1, Channel 0
clc;
x = [0, 0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 2.25, 2.5];
y = [0.0002, 0.2499, 0.499, 0.75, 1, 1.25, 1.501, 1.751, 2.001, 2.251, 2.501];

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
y = [5.00E-04 ,0.25, 0.4993, 0.75, 1.001, 1.251, 1.501, 1.752, 2.002, 2.252, 2.502];

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
y = [8.00E-04 , 0.2506, 0.4997, 0.751, 1.001, 1.251, 1.502, 1.752, 2.002, 2.252, 2.502];

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
y = [4.00E-04 , 0.2504, 0.4996, 0.751, 1.001, 1.251, 1.502, 1.752, 2.002, 2.252, 2.502];

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
y = [9.00E-04 , 0.2506, 0.4998, 0.751, 1.001, 1.251, 1.502, 1.752, 2.002, 2.252, 2.502];

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

%% DAC1, Channel 5
clc;
x = [0, 0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 2.25, 2.5];
y = [2.00E-04 , 0.2499, 0.499, 0.75, 1, 1.251, 1.501, 1.751, 2.001, 2.252, 2.501];

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

%%
%% DAC2, Channel 0 
clc;
x = [0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2];
y = [4.00E-04 , 0.1996, 0.399, 0.5983, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2];

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

%% DAC2, Channel 1 
clc;
x = [0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2];
y = [1.00E-04 , 0.1993, 0.3984, 0.5975, 0.799, 0.999, 1.199, 1.398, 1.598, 1.798, 1.998];

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

%% DAC2, Channel 2 
clc;
x = [0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2];
y = [4.00E-04 , 0.1997, 0.3987, 0.5978, 0.799, 0.999, 1.199, 1.399, 1.599, 1.799, 1.998];

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

%% DAC2, Channel 3 
clc;
x = [0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2];
y = [2.00E-04 , 0.1992, 0.3982, 0.5974, 0.798, 0.999, 1.199, 1.398, 1.598, 1.798, 1.998];

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

%% DAC2, Channel 4 
clc;
x = [0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2];
y = [4.00E-04 , 0.1994, 0.3986, 0.5977, 0.799, 0.999, 1.199, 1.399, 1.599, 1.799, 1.998];

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

%% DAC2, Channel 5
clc;
x = [0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2];
y = [2.00E-04 , 0.199, 0.398, 0.5972, 0.798, 0.998, 1.198, 1.398, 1.598, 1.798, 1.998];

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

%% DAC2, Channel 6
clc;
x = [0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2];
y = [5.00E-04 , 0.1991, 0.3982, 0.5974, 0.799, 0.999, 1.199, 1.398, 1.599, 1.799, 1.998];

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

%% DAC2, Channel 7
clc;
x = [0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2];
y = [2.00E-04 , 0.1997, 0.3988, 0.5979, 0.799, 0.999, 1.199, 1.399, 1.599, 1.799, 1.998];

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

%%
%% DAC3, Channel 0
clc;
x = [0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2];
y = [1.10E-03 , 0.2006, 0.3995, 0.5987, 0.8, 1, 1.2, 1.399, 1.599, 1.799, 1.999];

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

%% DAC3, Channel 1
clc;
x = [0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2];
y = [5.0E-04 , 0.1997, 0.3989, 0.5981, 0.799, 0.999, 1.199, 1.399, 1.599, 1.799, 1.998];

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

%% DAC3, Channel 2
clc;
x = [0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2];
y = [4.0E-04 , 0.2, 0.399, 0.5981, 0.799, 0.999, 1.199, 1.399, 1.599, 1.799, 1.998];

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

%% DAC3, Channel 3
clc;
x = [0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2];
y = [7.0E-04 , 0.2002, 0.3992, 0.5983, 0.799, 0.999, 1.199, 1.399, 1.599, 1.799, 1.999];

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

%% DAC3, Channel 4
clc;
x = [0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2];
y = [0.0014, 0.2007, 0.3997, 0.5988, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2];

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

%% DAC3, Channel 5
clc;
x = [0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2];
y = [0.0004, 0.1988, 0.3979, 0.5971, 0.798, 0.998, 1.198, 1.398, 1.598, 1.798, 1.998];

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

%% DAC3, Channel 6
clc;
x = [0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2];
y = [0.0007, 0.1996, 0.3986, 0.5977, 0.799, 0.999, 1.199, 1.399, 1.599, 1.799, 1.998];

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

%% DAC3, Channel 7
clc;
x = [0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2];
y = [0.0004, 0.2001, 0.399, 0.598, 0.799, 0.999, 1.199, 1.399, 1.599, 1.799, 1.998];

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

%%
%% DAC4, Channel 0
clc;
x = [0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2];
y = [0.0006, 0.1987, 0.3978, 0.5969, 0.798, 0.998, 1.198, 1.398, 1.598, 1.798, 1.997];

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

%% DAC4, Channel 1
clc;
x = [0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2];
y = [0.0002, 0.1997, 0.3987, 0.5977, 0.799, 0.999, 1.199, 1.399, 1.598, 1.798, 1.998];

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

%% DAC4, Channel 2
clc;
x = [0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2];
y = [0.0009, 0.1997, 0.3988, 0.598, 0.799, 0.999, 1.199, 1.399, 1.599, 1.799, 1.998];

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

%% DAC4, Channel 3
clc;
x = [0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2];
y = [0.0007, 0.2004, 0.3994, 0.5986, 0.8, 1, 1.2, 1.399, 1.599, 1.799, 1.999];

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

%% DAC4, Channel 4
clc;
x = [0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2];
y = [0.0006, 0.1994, 0.3984, 0.5976, 0.799, 0.999, 1.199, 1.398, 1.598, 1.798, 1.998];

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

%% DAC4, Channel 5
clc;
x = [0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2];
y = [0.0005, 0.1996, 0.3988, 0.598, 0.799, 0.999, 1.199, 1.399, 1.599, 1.799, 1.998];

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

%% DAC4, Channel 6
clc;
x = [0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2];
y = [0.0007, 0.2001, 0.3991, 0.5981, 0.799, 0.999, 1.199, 1.399, 1.599, 1.798, 1.998];

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

%% DAC4, Channel 7
clc;
x = [0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2];
y = [0.0006, 0.2, 0.3991, 0.5982, 0.799, 0.999, 1.199, 1.399, 1.599, 1.799, 1.999];

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

%%
%% DAC5, Channel 0
clc;
x = [0, 0.18, 0.36, 0.54, 0.72, 0.9, 1.08, 1.26, 1.44, 1.62, 1.8];
y = [0.0006, 0.1799, 0.3596, 0.5394, 0.721, 0.902, 1.082, 1.263, 1.443, 1.624, 1.804];

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

%% DAC5, Channel 1
clc;
x = [0, 0.18, 0.36, 0.54, 0.72, 0.9, 1.08, 1.26, 1.44, 1.62, 1.8];
y = [0.0006, 0.181, 0.3607, 0.5405, 0.722, 0.903, 1.083, 1.264, 1.444, 1.625, 1.805];

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

%% DAC5, Channel 2
clc;
x = [0, 0.18, 0.36, 0.54, 0.72, 0.9, 1.08, 1.26, 1.44, 1.62, 1.8];
y = [0.0006, 0.1798, 0.3595, 0.5393, 0.721, 0.901, 1.082, 1.263, 1.443, 1.624, 1.804];

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

%% DAC5, Channel 3
clc;
x = [0, 0.18, 0.36, 0.54, 0.72, 0.9, 1.08, 1.26, 1.44, 1.62, 1.8];
y = [0.0005, 0.1806, 0.3603, 0.5402, 0.722, 0.902, 1.083, 1.263, 1.444, 1.624, 1.805];

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

%% DAC5, Channel 4
clc;
x = [0, 0.18, 0.36, 0.54, 0.72, 0.9, 1.08, 1.26, 1.44, 1.62, 1.8];
y = [0.0007, 0.1802, 0.36, 0.5398, 0.721, 0.902, 1.082, 1.263, 1.443, 1.624, 1.804];

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

%% DAC5, Channel 5
clc;
x = [0, 0.18, 0.36, 0.54, 0.72, 0.9, 1.08, 1.26, 1.44, 1.62, 1.8];
y = [0.0005, 0.1798, 0.3596, 0.5395, 0.721, 0.902, 1.082, 1.263, 1.443, 1.624, 1.804];

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

%% DAC5, Channel 6
clc;
x = [0, 0.18, 0.36, 0.54, 0.72, 0.9, 1.08, 1.26, 1.44, 1.62, 1.8];
y = [0.0008, 0.1797, 0.3593, 0.539, 0.72, 0.901, 1.081, 1.261, 1.441, 1.622, 1.802];

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

%% DAC5, Channel 7
clc;
x = [0, 0.18, 0.36, 0.54, 0.72, 0.9, 1.08, 1.26, 1.44, 1.62, 1.8];
y = [0.0007, 0.1802, 0.3599, 0.5397, 0.721, 0.902, 1.082, 1.263, 1.443, 1.624, 1.804];

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