local snake={}

function snake:init()
    self.head = {x=0, y=0}
    self.tail={}
    self.length = 3

    self.speed = 1
    self.time = 0
end

function snake:update(dt)
    self.time = self.time + dt
    if self.time > self.speed then
        self.time=0
        self.head.x=self.head.x+1
    end
end

function snake:draw()
    love.graphics.setColor(0.4, 1, 0.1)
    love.graphics.rectangle("fill", self.head.x * grid.tileWidth, self.head.y * grid.tileHeight, grid.tileWidth, grid.tileHeight)
end

return snake