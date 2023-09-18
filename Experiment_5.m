%%%%% Problem 1
alpha = 1 + mod(509,3);
Fs = 100;
T = 10;
t = 0:1/Fs:T-1/Fs;


F_start = 2 + 2*alpha;
F_end = 5 + 5*alpha;
x = sin(2*pi * ((F_start + (F_end - F_start) * t / T) .* t));

% Task 1
figure;
plot(t, x, 'm');
title('Chirp Signal')
xlabel('Time (s)')
ylabel('Amplitude')

% Task 2
N = length(x);
X = fft(x);
f = Fs * (0:(N-1)) / N;  % Frequency vector

figure;
stem(f, abs(X));
title('Frequency Spectrum of Chirp Signal')
xlabel('Frequency (Hz)')
ylabel('Amplitude')

% Task 3: spectrogram
window_length = 100; % Hamming window length
overlap = 10;        % Overlap length

figure;
spectrogram(x, hamming(window_length), overlap, window_length, Fs, 'yaxis');
title('Spectrogram of Chirp Signal at window length=100')
xlabel('Time (s)')
ylabel('Frequency (Hz)')
colorbar;

figure;
spectrogram(x, hamming(150), overlap, window_length, Fs, 'yaxis');
title('Spectrogram of Chirp Signal at window length=150')
xlabel('Time (s)')
ylabel('Frequency (Hz)')
colorbar;

figure;
spectrogram(x, hamming(200), overlap, window_length, Fs, 'yaxis');
title('Spectrogram of Chirp Signal at window length=200')
xlabel('Time (s)')
ylabel('Frequency (Hz)')
colorbar;




%%%%%Problem 2
[y, fs] = audioread('instru3.wav');
window = 500;
overlap = 300;
figure
spectrogram(y, blackman(window), overlap, window, fs, 'yaxis');

figure
[y, fs] = audioread('Opera.wav');
window = 500;
overlap = 200;
spectrogram(y, hamming(window), overlap, window, fs, 'yaxis');




%%%%% Problem 3
Fs = 4000; 
duration = 1.5; 

% Record voice
recorder = audiorecorder(Fs, 16, 1); % 16-bit mono audio
disp('Start speaking...');
recordblocking(recorder, duration);
disp('Recording finished.');


voice_data = getaudiodata(recorder);

audiowrite('AmarPratapSingh.wav', voice_data, Fs);

[y, Fs] = audioread('your_name.wav');


% Calculate the spectrogram
figure;
spectrogram(y, hamming(512), 256, [], Fs, 'yaxis');
title('Spectrogram of Your Name Recording');
xlabel('Time (seconds)');
ylabel('Frequency (Hz)');
colorbar;