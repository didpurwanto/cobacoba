clc
close all
clear

x = -5:0.1:5;
m = 0;
var = 1;
m1 = 1.5;
t = 1;

for z = -5:0.1:5
    f(:,t) = (1/var*(sqrt(2*pi)))*exp(-(((z-m).^2)/(2*var.^2)));
    f1(:,t) = (1/var*(sqrt(2*pi)))*exp(-(((z-m1).^2)/(2*var.^2)));
    t=t+1;
end

garis1 = [0 0];
tegak1 = [0 2.7];
garis2 = [1.5 1.5];
tegak2 = [0 2.5];

figure(1);
plot(x,f1,'blue');
hold on
h = area(x(1:66),f1(1:66));
hold on
area(x(66:100),f(66:100));
hold on
plot(x,f,'red');
hold on
plot(garis1,tegak1, 'black');
plot(garis2,tegak2, '--g');
hold off
legend('p(x|0|;H_{1})','P(H_{0};H_{1})','P(H_{1};H_{0})','p(x|0|;H_{0})');
h(1).FaceColor = [0.5 0.25 1];


title('Trading of errors by adjusting threshold');
xlabel('new threshold');
ylabel('ylabel');