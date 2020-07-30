
listeMenu = {}

listeMenu[1] = "Fiche perso"
listeMenu[2] = "Affection"
listeMenu[3] = "Jeux"
listeMenu[4] = "Lumiere"
listeMenu[5] = "Manger"
listeMenu[6] = "Boire"
listeMenu[7] = "Soin"
listeMenu[8] = "Toillette"

listeMenu.images = {}

bouton = {}

bouton[0] = "OK"
bouton[1] = "gauche"
bouton[2] = "droite"
action = false
bouton.images = {}

menuSelect = 1

sousMenu = {}
sousMenu[1] = "pas afficher"
sousMenu[2] = "afficher"
sousMenu[3] = "test"
sousMenu.images = {}
sousMenu.profile = false

smSelect = 1

modeNuit = {}
modeNuit[1] = "pas afficher"
modeNuit[2] = "afficher"
modeNuit[3] = "test"
modeNuit.drawNuit = false

mnSelect = 1

function listeMenu.load()
  
  listeMenu.images[1] = love.graphics.newQuad(44,368,36,36,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  listeMenu.images[2] = love.graphics.newQuad(44,328,36,36,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  listeMenu.images[3] = love.graphics.newQuad(124,328,36,36,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  listeMenu.images[4] = love.graphics.newQuad(4,368,36,36,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  listeMenu.images[5] = love.graphics.newQuad(4,328,36,36,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  listeMenu.images[6] = love.graphics.newQuad(84,368,36,36,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  listeMenu.images[7] = love.graphics.newQuad(124,368,36,36,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  listeMenu.images[8] = love.graphics.newQuad(84,328,36,36,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  listeMenu.images[9] = love.graphics.newQuad(4,408,36,36,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  
  bouton.images[0] = love.graphics.newQuad(44,408,76,36,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  bouton.images[1] = love.graphics.newQuad(508,424,20,36,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  bouton.images[2] = love.graphics.newQuad(528,424,20,36,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  
  sousMenu.images[1] = love.graphics.newQuad(692,368,236,236,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  
  LumiEtainte = love.graphics.newCanvas(324, 324)
  
  love.graphics.setCanvas(LumiEtainte)
    --love.graphics.clear()
    --love.graphics.setBlendMode("alpha")
    love.graphics.setColor(0,0,0,0.66)
    love.graphics.rectangle("fill", 124, 44, 156, 80)
    love.graphics.rectangle("fill", 44, 124, 236, 156)
  love.graphics.setCanvas()
  love.graphics.setColor(1,1,1,1)
  
end

function listeMenu.update(dt)
  
  if menuSelect < 1 then
    menuSelect = #listeMenu
    end
  if menuSelect > #listeMenu then
    menuSelect = 1
  end
  
  if smSelect <= 1 then
    smSelect = #sousMenu
    end
  if smSelect >= #sousMenu then
    smSelect = 1
  end

  if smSelect == 2 then
    sousMenu.profile = true
  else
    sousMenu.profile = false
  end
  
  if mnSelect <= 1 then
    mnSelect = #modeNuit
  end
  
  if mnSelect >= #modeNuit then
    mnSelect = 1
  end
  
  if mnSelect == 2 then
    modeNuit.drawNuit = true
  else
    modeNuit.drawNuit = false
  end
  
  barSize1 = 40 * ( stats.sleep / 100 )
  barSize2 = 40 * ( stats.play / 100 )
  barSize3 = 40 * ( stats.eat / 100 )
  barSize4 = 40 * ( stats.drink / 100 )
  barSize5 = 40 * ( stats.like / 100 )
  barSize6 = 40 * ( stats.poop / 100 )

end

function listeMenu.draw()
  
  MS = menuSelect
  -- coordonnée X et Y de chaque option mis s'éparément pour etre utiliser pour le selecteur avec une simple variable ''MS''
  X = {}
  Y = {}
  X[1] = 84
  Y[1] = 4
  X[2] = 124
  Y[2] = 4
  X[3] = 164
  Y[3] = 4
  X[4] = 204
  Y[4] = 4
  X[5] = 44
  Y[5] = 284
  X[6] = 84
  Y[6] = 284
  X[7] = 204
  Y[7] = 284
  X[8] = 244
  Y[8] = 284
  
  -- image des different option
  love.graphics.draw(TileSheetNG,listeMenu.images[1], X[1], Y[1])
  love.graphics.draw(TileSheetNG,listeMenu.images[2], X[2], Y[2])
  love.graphics.draw(TileSheetNG,listeMenu.images[3], X[3], Y[3])
  love.graphics.draw(TileSheetNG,listeMenu.images[4], X[4], Y[4])
  love.graphics.draw(TileSheetNG,listeMenu.images[5], X[5], Y[5])
  love.graphics.draw(TileSheetNG,listeMenu.images[6], X[6], Y[6])
  love.graphics.draw(TileSheetNG,listeMenu.images[7], X[7], Y[7])
  love.graphics.draw(TileSheetNG,listeMenu.images[8], X[8], Y[8])
  
  -- image des different bouton
  love.graphics.draw(TileSheetNG,bouton.images[0], 124, 284)
  love.graphics.draw(TileSheetNG,bouton.images[1], 12, 144)
  love.graphics.draw(TileSheetNG,bouton.images[2], 292, 144)
  
  -- image du selecteur qui ce deplace selon le choix de l'option.
  love.graphics.draw(TileSheetNG,listeMenu.images[9], X[MS], Y[MS])
  
  if modeNuit.drawNuit == true then
    love.graphics.draw(LumiEtainte, 0, 0)
    --love.graphics.rectangle("fill", 124, 44, 156, 80)
    --love.graphics.rectangle("fill", 44, 124, 236, 156)
  end

  if sousMenu.profile == true then
    -- dessine le fond
    love.graphics.draw(TileSheetNG,sousMenu.images[1], 44, 44)
    -- dessine les coeur 
    -- le chat
    -- les barre
    -- sleep
    local barSleep = love.graphics.newQuad(376,408,barSize1,4,TileSheetNG:getWidth(),TileSheetNG:getHeight())
    love.graphics.draw(TileSheetNG,barSleep,52,108)
    -- jeux
    local barJeux = love.graphics.newQuad(376,408,barSize2,4,TileSheetNG:getWidth(),TileSheetNG:getHeight())
    love.graphics.draw(TileSheetNG,barJeux,232,108)
    -- manger
    local barEat = love.graphics.newQuad(376,408,barSize3,4,TileSheetNG:getWidth(),TileSheetNG:getHeight())
    love.graphics.draw(TileSheetNG,barEat,52,140)
    -- boire
    local barDrink = love.graphics.newQuad(376,408,barSize4,4,TileSheetNG:getWidth(),TileSheetNG:getHeight())
    love.graphics.draw(TileSheetNG,barDrink,232,140)
    -- affection
    local barLove = love.graphics.newQuad(376,408,barSize5,4,TileSheetNG:getWidth(),TileSheetNG:getHeight())
    love.graphics.draw(TileSheetNG,barLove,52,172)
    --toilette
    local barPoop = love.graphics.newQuad(376,408,barSize6,4,TileSheetNG:getWidth(),TileSheetNG:getHeight())
    love.graphics.draw(TileSheetNG,barPoop,232,172)
  end
  
end
function listeMenu.mousepressed(x,y,bouton)
  
  if x >= 12 and x <= 31 
    and y >= 144 and y <= 179 
      and bouton == 1 then
        menuSelect = menuSelect - 1
  end
  
  if x >= 292 and x <= 311 
    and y >= 144 and y <= 179
      and bouton == 1 then
        menuSelect = menuSelect + 1
  end
  
  if x >= 124 and x <= 199 
    and y >= 284 and y <= 319
      and bouton == 1 then
        action = true
      else
        action = false
  end
  
  if menuSelect == 1 and action == true then
    smSelect = smSelect + 1 
  end
  
  if menuSelect == 4 and action == true then
    mnSelect = mnSelect + 1
  end
  
  print(x,y,bouton)

  if menuSelect == 5 and action == true then
    stats.eat = stats.eat + 50
  end
  
  if menuSelect == 6 and action == true then
    stats.drink = stats.drink + 50
  end

end
function listeMenu.keypressed(pKey)
  
  
  if pKey == "right" then
    menuSelect = menuSelect + 1
  end
  
  if pKey == "left" then
    menuSelect = menuSelect - 1
  end
  
  if pKey == "space" then
    action = true
  else
    action = false
  end
  
  print(pKey)
  
  if menuSelect == 1 and action == true then
    smSelect = smSelect + 1 
  end
  
  if menuSelect == 4 and action == true then
    mnSelect = mnSelect + 1
  end
  
  if menuSelect == 5 and action == true then
    stats.eat = stats.eat + 50
  end
  
  if menuSelect == 6 and action == true then
    stats.drink = stats.drink + 50
  end
  
  action = false
  
end

return listeMenu