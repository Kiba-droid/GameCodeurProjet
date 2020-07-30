local Lander = {}
Lander.x = 0 
Lander.y = 0
Lander.angle = 270
Lander.vx = 0
Lander.vy = 0
Lander.speed = 3
Lander.engineOn = false
Lander.HB = false
Lander.img = love.graphics.newImage("images/ship.png")
Lander.imgEngine = love.graphics.newImage("images/engine.png")
function love.load()
  love.window.setTitle("Exercices de l'atelier : comment faire voler un vaisseau")
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  Lander.x = largeur/2
  Lander.y = hauteur/2
end
function love.update(dt)
  local angle_radian = math.rad(Lander.angle)
  local force_x = math.cos(angle_radian) * ( Lander.speed * dt )
  local force_y = math.sin(angle_radian) * ( Lander.speed * dt )
  if love.keyboard.isDown("up") then
    Lander.engineOn = true
    if math.abs(Lander.vx) <= 2 then
      Lander.vx = Lander.vx + force_x
    else
      if Lander.vx > 0 then
        Lander.vx = 2
      else
        Lander.vx = -2
      end
    end
    if math.abs(Lander.vy) <= 2 then
      Lander.vy = Lander.vy + force_y
      else
      if Lander.vy > 0 then
        Lander.vy = 2
      else
        Lander.vy = -2
      end
    end
    else
      Lander.engineOn = false
  end
  if love.keyboard.isDown("down") then
    if math.abs(Lander.vx) <= 2 then
      Lander.vx = Lander.vx - force_x
    else
      if Lander.vx > 0 then
        Lander.vx = 2
      else
        Lander.vx = -2
      end
    end
    if math.abs(Lander.vy) <= 2 then
      Lander.vy = Lander.vy - force_y
    else
      if Lander.vy > 0 then
        Lander.vy = 2
      else
        Lander.vy = -2
      end
    end
  end
  if love.keyboard.isDown("right") then
    Lander.angle = Lander.angle + ( 90 * dt )
    if Lander.angle > 360 then 
      Lander.angle = 0 
    end
  end
  if love.keyboard.isDown("left") then
    Lander.angle = Lander.angle - ( 90 * dt )
    if Lander.angle < 0 then
      Lander.angle = 360 
    end
  end
  if love.keyboard.isDown("up") or love.keyboard.isDown("down") then
    Lander.HB = true
  else
    Lander.HB = false
  end
  if Lander.HB == false then
    if Lander.vx < 0 then
      Lander.vx = Lander.vx + ( 0.6 * dt )
    end
    if Lander.vx > 0 then
      Lander.vx = Lander.vx - ( 0.6 * dt )
    end
    if Lander.vy < 0 then
      Lander.vy = Lander.vy + ( 0.6 * dt )
    end
    if Lander.vy > 0 then
      Lander.vy = Lander.vy - ( 0.6 * dt )
    end
  else 
    Lander.HB = true 
  end
  if Lander.x < -15 then
    Lander.x = 814
  end
  if Lander.x > 814 then
    Lander.x = -15
  end
  if Lander.y < -15 then
    Lander.y = 614
  end
  if Lander.y > 614 then
    Lander.y = -15
  end
  Lander.x = Lander.x + Lander.vx
  Lander.y = Lander.y + Lander.vy
end
function love.draw()
  love.graphics.draw(Lander.img, Lander.x, Lander.y,
  math.rad(Lander.angle), 1, 1, Lander.img:getWidth()/2, Lander.img:getHeight()/2)
  if Lander.engineOn == true then
    love.graphics.draw(Lander.imgEngine, Lander.x, Lander.y,
    math.rad(Lander.angle), 1, 1, Lander.imgEngine:getWidth()/2, Lander.imgEngine:getHeight()/2)
  end
end