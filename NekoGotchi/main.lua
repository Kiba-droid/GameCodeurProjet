-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-degub" then require("mobdebug").start() end


  love.window.setMode(324, 324)
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  local myTemps    = require("temps")
  local myCycle    = require("cycle")
  local myCat      = require("cat")
  local myliste    = require("listeMenu")
  local myStats    = require("stats")
  
-- images
TileSheetNG = love.graphics.newImage("images/tilesheetNG.png")
icon = love.graphics.newImage("images/icon.png")


-- ecrant courant 
ecran_courant = "ecran Wolf Vanguard"


function love.load()
  
  love.window.setTitle("NEKOGOTCHI")
  canvas = love.graphics.newCanvas(64,64)
           love.graphics.setCanvas(canvas)
           love.graphics.draw(icon, 0,0)
           love.graphics.setCanvas()
           love.window.setIcon(canvas:newImageData())

  love.window.setMode(324, 324)
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  fond = love.graphics.newQuad(0,0,324,324,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  
  myTemps.load()
  myCycle.load()
  myCat.load()
  myliste.load()
  myStats.load()
  
end

function love.update(dt)
  
  myTemps.update(dt)
  myCycle.update(dt)
  myCat.update(dt)
  myliste.update(dt)
  myStats.update(dt)
  
end

function love.draw()
  
  love.graphics.draw(TileSheetNG,fond, 0, 0)
  myCycle.draw()
  myCat.draw()
  myliste.draw()
  myTemps.draw()
  myStats.draw()
  love.graphics.setColor(1,0,0)
  love.graphics.print("eat : "..stats.eat, 124, 50)
  love.graphics.print("drink : "..stats.drink, 124, 65)
  love.graphics.print("sleep : "..stats.sleep, 124, 80)
  love.graphics.setColor(1,1,1)
  
end
function love.mousepressed(x,y,bouton)
  
  myliste.mousepressed(x,y,bouton)
  
end

function love.keypressed(pKey)
  
  myliste.keypressed(pKey)
  
end