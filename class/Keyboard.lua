Keyboard = Class('Keyboard', Key)

function Keyboard:initialize(octave, waveform)
    self.keys = {}

    self.startingX = 61
    self.startingY = 300

    self.waveform = waveform
    self.startingOctave = octave

    local currentOctave = octave
    local spacing = love.graphics.newImage("res/sprite_0.png"):getWidth()-5

    for i=1, #midButtons do
        --LUA PLZ
        local temp = i%#notes
        if temp == 0 then
            temp = #notes
        end

        if i == #notes+1 then
            currentOctave = currentOctave + 1
        end

        local key = Key(midButtons[i], self.startingX+(spacing*i), self.startingY, self.waveform, notes[temp]..currentOctave, false )
        table.insert(self.keys, key) 
    end

    currentOctave = octave
    for i=1, #topButtons do
        --LUA PLZ
        local temp = i%#sharps
        if temp == 0 then
            temp = #sharps
        end

        if i == #sharps+1 then
            currentOctave = currentOctave + 1
        end
        local key = Key(topButtons[i], self.startingX+spacing/1.35+(spacing*sharpX[i])+(spacing*i), self.startingY, self.waveform, sharps[temp]..currentOctave, true )
        table.insert(self.keys, key) 
    end
end
