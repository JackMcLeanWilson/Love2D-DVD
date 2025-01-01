function love.load()

	love.window.setMode(600, 600)

	-- Position
	x = 100
	y = 50

	-- Velocity
	dx = 40 
	dy = 60

	-- Dimensions
	width = 200
	height = 150

	-- Multiplier
	speedMult = 1

	-- Colour
	colourR = 255
	colourG = 255 
	colourB = 255
	
end

function love.update(dt)

	-- Position Update
	x = x  + (dx * dt * speedMult)
	y = y + (dy * dt * speedMult)

	-- Rectangle Movement
	if (x > 600 - width) or (x < 0) then
		dx = -dx
		print("New dx: " .. tostring(dx))
	end
		if (y > 600 - height) or (y < 0) then
		dy = -dy
		print("New dy: " .. tostring(dy))
	end

	-- User Input
	if love.keyboard.isDown("up") and speedMult < 8 then
		speedMult = speedMult + 0.01
		print("New mult: " .. tostring(speedMult))
	elseif love.keyboard.isDown("down") and speedMult > 0.5 then 
		speedMult = speedMult - 0.01	
		print("New mult: " .. tostring(speedMult))
	end
end

function love.draw()
	love.graphics.setColor(colourR,colourG,colourB)
	love.graphics.rectangle("fill", x, y, width, height)
end
