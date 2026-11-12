function love.load()
    local font=love.graphics.newFont("font.ttf",20)
    love.graphics.setFont(font)

    grid={
        tileWidth=20,
        tileHeight=20
    }

    local w,h=love.graphics.getDimensions()
    grid.width=w/grid.tileWidth
    grid.height=h/grid.tileHeight

    score=0

    snake=require("snake")
    snake:init()

    apple=require("apple")
    apple:init()

    gameover=false
end

function love.update(dt)
    if not gameover then
        snake:update(dt)
        apple:update(dt)
    else
        if love.keyboard.isDown("return") then
            snake:init()
            apple:init()
            score=0
            gameover=false
        end
    end
end

function love.draw()
    love.graphics.setColor(0.1,0.3,0.6,1)
    for y=0,grid.height-1 do
        for x=0,grid.width-1 do
            love.graphics.rectangle("line",x*grid.tileWidth,y*grid.tileHeight,grid.tileWidth,grid.tileHeight)
        end
    end
    snake:draw()
    apple:draw()

    if gameover then
        local w,h=love.graphics.getDimensions()

        love.graphics.setColor(0,0,0,0.5)
        love.graphics.rectangle("fill",0,0,w,h)

        love.graphics.setColor(1,1,1,1)
        local text="Game Over! Press enter to try again."
        local font=love.graphics.getFont()
        love.graphics.print(text,w/2-font:getWidth(text)/2,h/2-font:getHeight()/2)
    end

    love.graphics.setColor(1,1,1,1)
    love.graphics.print("Score: "..score,5,5)
end

function love.keypressed(key)
    snake:key(key)
end