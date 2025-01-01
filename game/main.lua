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
	y = y + dx * dt

	if x > 600 - width then
		print("Out of X bounds!")
		dx = -dx
	end
		if y > 600 - height then
		print("Out of Y bounds!")
		dy = -dy
	end
end

function love.draw()
	love.graphics.rectangle("fill", x, y, width, height)
end
