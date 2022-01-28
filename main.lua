function love.load()

    denver = require 'lib.denver'
    Class = require 'lib.middleclass'

    require "tables"
    require "class/Key"
    require "class/Keyboard"

    love.window.setTitle("Piano")

    currentOctave = 3
    waveform = 1
    keyboard = Keyboard(currentOctave, oscillatorsEnum[waveform])
    love.graphics.setBackgroundColor(1,1,1)
    waveFrame = 1
    animate = false
    back = love.graphics.newImage("res/back20.png")
end

function love.update(dt)
    for i=1,#keyboard.keys do 
        if love.keyboard.isDown(keyboard.keys[i].assignedButton) then
            updateWaveFrame(dt)    
            keyboard.keys[i]:play()
        else 
            keyboard.keys[i]:stop()
        end
    end
end

function updateWaveFrame(dt)
    if waveform == 1 then
        waveFrame = waveFrame + 33*dt
        if waveFrame >= #sineFrames then
            waveFrame = 1
        end
    elseif waveform == 2 then
        waveFrame = waveFrame + 33*dt
        if waveFrame >= #squareFrames then
            waveFrame = 1
        end
    elseif waveform == 3 then
        waveFrame = waveFrame + 33*dt
        if waveFrame >= #sawFrames then
            waveFrame = 1
        end
    elseif waveform == 4 then
        waveFrame = waveFrame + 33*dt
        if waveFrame >= #triangleFrames then
            waveFrame = 1
        end
    elseif waveform >= 5 then
        waveFrame = waveFrame + 33*dt
        if waveFrame >= #noiseFrames then
            waveFrame = 1
        end
    end
end

function love.keypressed(button) 
    if button == "," and currentOctave > 0 then
        currentOctave = currentOctave - 1
        for i=1,#keyboard.keys do 
            keyboard.keys[i]:stop()
        end
        keyboard = Keyboard(currentOctave, oscillatorsEnum[waveform])
    end

    if button == "." and currentOctave < 7 then
        currentOctave = currentOctave + 1
        for i=1,#keyboard.keys do 
            keyboard.keys[i]:stop()
        end
        keyboard = Keyboard(currentOctave, oscillatorsEnum[waveform])
    end

    if button == "z" and waveform > 1 then
        waveform = waveform - 1
        for i=1,#keyboard.keys do 
            keyboard.keys[i]:stop()
        end
        keyboard = Keyboard(currentOctave, oscillatorsEnum[waveform])
    end

    if button == "x" and waveform < #oscillatorsEnum then
        waveform = waveform + 1
        for i=1,#keyboard.keys do 
            keyboard.keys[i]:stop()
        end
        keyboard = Keyboard(currentOctave, oscillatorsEnum[waveform])
    end
end

function love.draw()
    
    for i=1,#keyboard.keys do
        love.graphics.draw(keyboard.keys[i].currentImage, keyboard.keys[i].xCord, keyboard.keys[i].yCord)
    end

    love.graphics.draw(back,50,50)
    love.graphics.draw(waveTable[waveform][math.floor(waveFrame)], 410, 90)

    love.graphics.setColor(0,0,0)
    love.graphics.print("Octave:".. currentOctave .. " [,]-[.] to change" , 50,20)
    love.graphics.print("Waveform:".. oscillatorsEnum[waveform].. " [z]-[x] to change", 400,20)
    love.graphics.print("Top row of letters and numbers to play!", 400,650)
    love.graphics.setColor(1,1,1,1)

end