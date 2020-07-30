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
modeNuit.drawNuit = false

mnSelect = 1

function sousMenu.load()
  
  sousMenu.images[1] = love.graphics.newQuad(692,368,236,236,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  
end

function sousMenu.update(dt)
  
  if smSelect <= 1 then
    smSelect = #sousMenu
    end
  if smSelect >= #sousMenu then
    smSelect = 1
  end
  
  --if menuSelect == 1 and action == true then
    --smSelect = smSelect + 1
    --if smSelect == 2 then
      --sousMenu.profile = true
   -- end
  --else
    --smSelect = 1
    --sousMenu.profile = false
 --end
  print(action)
  print(smSelect)
  if smSelect == 2 then
    sousMenu.profile = true
  else
    sousMenu.profile = false
  end
  
end

function sousMenu.draw()
  
  if sousMenu.profile == true then
    -- dessine le fond
    love.graphics.draw(TileSheetNG,sousMenu.images[1], 44, 44)
    -- dessine les coeur 
    -- le chat
  end
  
end

return sousMenu