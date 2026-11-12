local snake={}

function snake:init()
    self.head = {x=0, y=0}
    self.tail={}
    self.length = 3

    self.speed = 0.2
    self.time = 0
    self.direction=1
end

function snake:update(dt)
    self.time = self.time + dt
    if self.time > self.speed then
        self.time=0

        if self.direction==1 then
            self.head.x=self.head.x+1
        elseif self.direction==2 then
            self.head.x=self.head.x-1
        elseif self.direction==3 then
            self.head.y=self.head.y+1
        elseif self.direction==4 then
            self.head.y=self.head.y-1
        end
    end
end

function snake:draw()
    love.graphics.setColor(0.4, 1, 0.1)
    love.graphics.rectangle("fill", self.head.x * grid.tileWidth, self.head.y * grid.tileHeight, grid.tileWidth, grid.tileHeight)
end

function snake:key(key)
    if key=="up" then
        self.direction=4
    elseif key=="down" then
        self.direction=3
    elseif key=="left" then
        self.direction=2
    elseif key=="right" then
        self.direction=1
    end
end

return snake