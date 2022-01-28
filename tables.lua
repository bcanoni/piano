topButtons = {'2', '3', '5', '6', '7', '9', '0', '='}
midButtons = {'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', '[', ']'}
notes = {'C', 'D', 'E', 'F', 'G', 'A', 'B'}
sharps = {'C#', 'D#', 'F#', 'G#', 'A#'}
oscillatorsEnum = {'sinus', 'square', 'sawtooth', 'triangle', 'whitenoise'}--, 'pinknoise', 'brownnoise'}
sharpX = {0,0,1,1,1,2,2,3}

sineFrames = {}
for i=0,8 do
    table.insert(sineFrames, love.graphics.newImage("res/sine_" .. i .. ".png"))
end

squareFrames = {}
for i=0,10 do
    table.insert(squareFrames, love.graphics.newImage("res/square_" .. i .. ".png"))
end

sawFrames = {}
for i=0,7 do
    table.insert(sawFrames, love.graphics.newImage("res/saw_" .. i .. ".png"))
end

triangleFrames = {}
for i=0,9 do
    table.insert(triangleFrames, love.graphics.newImage("res/triangle_" .. i .. ".png"))
end

noiseFrames = {}
for i=0,7 do
    table.insert(noiseFrames, love.graphics.newImage("res/noise_" .. i .. ".png"))
end

waveTable = {}
table.insert(waveTable, sineFrames)
table.insert(waveTable, squareFrames)
table.insert(waveTable, sawFrames)
table.insert(waveTable, triangleFrames)
table.insert(waveTable, noiseFrames)
table.insert(waveTable, noiseFrames)
table.insert(waveTable, noiseFrames)