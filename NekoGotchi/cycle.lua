-- cycle des nuit et des jours

cycle = {}

listeNuits = {}
nuits = 1
drawNuits = false

listeJours = {}
jours = 1
drawJours = false

function cycle.load()
  
  listeNuits[1] = love.graphics.newQuad(0,448,84,84,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  listeNuits[2] = love.graphics.newQuad(84,448,84,84,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  listeNuits[3] = love.graphics.newQuad(168,448,84,84,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  listeNuits[4] = love.graphics.newQuad(252,448,84,84,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  listeNuits[5] = love.graphics.newQuad(0,532,84,84,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  listeNuits[6] = love.graphics.newQuad(84,532,84,84,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  listeNuits[7] = love.graphics.newQuad(168,532,84,84,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  listeNuits[8] = love.graphics.newQuad(252,532,84,84,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  
  listeJours[1] = love.graphics.newQuad(336,448,84,84,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  listeJours[2] = love.graphics.newQuad(420,448,84,84,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  listeJours[3] = love.graphics.newQuad(336,532,84,84,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  listeJours[4] = love.graphics.newQuad(420,532,84,84,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  
end

function cycle.update(dt)
  
  if temps[3] >= 21 or temps[3] <= 5 then
    
    drawJours = false
    
    if drawJours == false then
      drawNuits = true
    end
    
    if temps[3] == 21 and temps[2] == 00 and temps[1] == 00 then
      nuits = nuits + 1
    end
    
  else
    
    drawNuits = false
    
    if drawNuits == false then
    drawJours = true
    end
    
    if temps[3] == 6 and temps[2] == 00 and temps[1] == 00 then
      jours = love.math.random(4)
    end
    
  end
  
  if nuits >= 8 then
  nuits = 1
  end
  
end

function cycle.draw()
  
  if drawNuits == true then
  love.graphics.draw(TileSheetNG, listeNuits[nuits], 40, 40)
  end
  if drawJours == true then
    love.graphics.draw(TileSheetNG, listeJours[jours], 40, 40)
  end
  
end

return cycle