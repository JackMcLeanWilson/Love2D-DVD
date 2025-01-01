function love.load()

	--Sprites 
	DVDSprite = love.graphics.newImage("assets/DVDlogo/LogoW.png")

	--Audio
	SoundHit = love.audio.newSource("assets/Sound/hit.wav", "static") --Loads into memory, DONT LOAD LARGE SOUNDS INTO MEMORY

	-- Position
	Xpos = 100
	Ypos = 50

	-- Velocity
	DX = 40
	DY = 60

	-- Dimensions
	Width = 173
	Height = 76

	-- Multiplier
	SpeedMult = 1.5

	-- Colour
	SpriteColor = {1, 1, 1, 1}
	
end

function love.update(dt)

	-- Position Update
	Xpos = Xpos  + (DX * dt * SpeedMult)
	Ypos = Ypos + (DY * dt * SpeedMult)

	-- Rectangle Bounds Check
	if (Xpos > 600 - Width) or (Xpos < 0) then
		DX = -DX
		print("New DX: " .. tostring(DX))
		RandomColor()
		love.graphics.setColor(SpriteColor)
		SoundHit:play()
	end
	if (Ypos > 600 - Height) or (Ypos < 0) then
		DY = -DY
		print("New DY: " .. tostring(DY))
		RandomColor()
		love.graphics.setColor(SpriteColor)
		SoundHit:play()
	end

	-- User Input
	if love.keyboard.isDown("up") and SpeedMult < 8 then --Speed Up
		SpeedMult = SpeedMult + 0.01
		print("New mult: " .. tostring(SpeedMult))
	elseif love.keyboard.isDown("down") and SpeedMult > 0.5 then  -- Speed Down
		SpeedMult = SpeedMult - 0.01
		print("New mult: " .. tostring(SpeedMult))
	elseif love.keyboard.isDown("r") then -- Reset Speed 
		SpeedMult = 1
		print("Mult Reset")
	end
end

function love.draw()
	love.graphics.setColor(SpriteColor)
	love.graphics.draw(DVDSprite, Xpos, Ypos, 0, Width / DVDSprite:getWidth(), Height / DVDSprite:getHeight())
end

function RandomColor()
	SpriteColor[1] = math.random()
    SpriteColor[2] = math.random()
    SpriteColor[3] = math.random()
end
