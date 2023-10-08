t0=0.15;fc=250;
snr=20;ts=0.001; %Intervalo de muestreo.
fs=1/ts;
df=0.3;%Resolucion frecuencia.
t=(0:ts:t0);
snr_lin=10^(snr/10);
%% Señal mensaje.
m=[ones(1,t0/(3*ts)), -2*ones(1,t0/(3*ts)),zeros(1,t0/(3*ts)+ 1 )];
c=cos(2*pi*fc.*t);
u=m.*c;
[M,m,dfl]=fftseq(m,ts,df);
M=M/fs;
[U,u,dfl]=fftseq(u,ts,df);
U=U/fs; % scaling 
[C,c,dfl]=fftseq(c,ts,df);
C=C/fs; % scaling 
f=[0:dfl:dfl *(length(m)-1 )]-fs/2;
signaLpower=spower(u(1 :length(t))); % power in modulated signal 
noise_power=signaLpower/snr_lin; % Compute noise power. 
noise_std=sqrt(noise_power); % Compute noise standard deviation.
noise=noise_std*randn(1,length(u)); % Generate noise.
r=u+noise; % Add noise to the modulated signal.
[R,r,dfl]=fftseq(r,ts,df);
R=R/fs; % scaling
subplot(3,3, 1 ) 
plot(t,m(1 :length(t))) 
xlabel( ' Time ' ) 
title(' The message signal' ) 
subplot(3,3,2) 
plot(t,c(1 :length(t))) 
xlabel( ' Time ' ) 
title(' The carrier' ) 
subplot(3,3,3) 
plot(t,u(1 :length(t))) 
xlabel( ' Time ' ) 
title(' The modulated signal' )
subplot(3, 3, 4 ) 
plot(f,abs(fftshift(M))) 
xlabel(' Frequency' ) 
title('Spec Message Sig' ) 
subplot(3, 3, 5 ) 
plot(f,abs(fftshift(C))) 
xlabel(' Frequency' ) 
title('Spec Message Sig' ) 
subplot(3, 3,6) 
plot(f,abs(fftshift(U))) 
title(' Spec Modul SIg' ) 
xlabel(' Frequency' )
subplot(3, 3,7) 
plot(t,noise(1 :length(t))) 
title(' Noise sample' ) 
xlabel( ' Time ' )
subplot(3, 3,8) 
plot(t,r(1 :length(t))) 
title(' Signal and noise' )
xlabel(' Time ')
subplot(3, 3,9) 
plot(f,abs(fftshift(R))) 
title(' Signal and noise spectrum' ) 
xlabel(' Frequency' ) 
