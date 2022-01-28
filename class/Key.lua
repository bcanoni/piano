Key = Class("Key")

function Key:initialize(assignedButton , xCord, yCord, waveForm,noteName, sharp)

    self.keyFrames = {}
    if sharp then
        table.insert(self.keyFrames, love.graphics.newImage('res/Ssprite_0.png'))
        table.insert(self.keyFrames, love.graphics.newImage('res/Ssprite_1.png'))
    else 
        table.insert(self.keyFrames, love.graphics.newImage('res/sprite_0.png'))
        table.insert(self.keyFrames, love.graphics.newImage('res/sprite_1.png'))
    end

    self.assignedButton = assignedButton
    self.currentImage = self.keyFrames[1]
    self.xCord = xCord
    self.yCord = yCord
    self.note = denver.get({waveform= waveForm, frequency= noteName})
    self.note:setLooping(true)

    self.noteName = noteName
end


function Key:play()
    love.audio.play(self.note)
    self.currentImage = self.keyFrames[2]
    print(self.noteName)
end

function Key:stop()
    love.audio.stop(self.note)
    self.currentImage = self.keyFrames[1]
end
