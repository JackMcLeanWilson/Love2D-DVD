function love.load()
	x = 100
	y = 50
	dx =2 
	dy = 3
end

function love.update(dt)
	x = x + dx * dt
	y = y + dx * dt
end

function love.draw()
	love.graphics.rectangle("fill", x, y, 200, 150)
end
