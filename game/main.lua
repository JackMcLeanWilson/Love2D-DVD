function love.load()

	love.window.setMode(600, 600)

	DVDSprite = love.graphics.newImage("assets/DVDlogo/LogoW.png")

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
	ColourR = 255
	ColourG = 255
	ColourB = 255
	
end

function love.update(dt)

	-- Position Update
	Xpos = Xpos  + (DX * dt * SpeedMult)
	Ypos = Ypos + (DY * dt * SpeedMult)

	-- Rectangle Movement
	if (Xpos > 600 - Width) or (Xpos < 0) then
		DX = -DX
		print("New DX: " .. tostring(DX))
	end
		if (Ypos > 600 - Height) or (Ypos < 0) then
		DY = -DY
		print("New DY: " .. tostring(DY))
	end

	-- User Input
	if love.keyboard.isDown("up") and SpeedMult < 8 then
		SpeedMult = SpeedMult + 0.01
		print("New mult: " .. tostring(SpeedMult))
	elseif love.keyboard.isDown("down") and SpeedMult > 0.5 then 
		SpeedMult = SpeedMult - 0.01	
		print("New mult: " .. tostring(SpeedMult))
	end
end

function love.draw()
	love.graphics.draw(DVDSprite, Xpos, Ypos, 0, Width / DVDSprite:getWidth(), Height / DVDSprite:getHeight())
end
