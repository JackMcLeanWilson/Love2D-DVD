function love.load()

	love.window.setMode(600, 600)

	x = 100
	y = 50
	width = 200
	height = 150
	dx = 40 
	dy = 60
end

function love.update(dt)
	x = x + dx * dt
	y = y + dy * dt

	if (x > 600 - width) or (x < 0) then
		dx = -dx
		print("New dx: " .. tostring(dx))
	end
		if (y > 600 - height) or (y < 0) then
		print("New dy: " .. tostring(dy))
		dy = -dy
	end
end

function love.draw()
	love.graphics.rectangle("fill", x, y, width, height)
end
