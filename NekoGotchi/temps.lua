-- horlorge :
temps = {}
--secondes
temps[1] = 0
--minutes
temps[2] = 0
--heures
temps[3] = 0
--jours
temps[4] = 0
--années
temps[5] = 0
-- n = 1 variable pour changer la vitesse du defilement des seconde pour les teste 
n = 66666666666666
temps.chiffre = {}

function temps.load()

  temps.chiffre[1]  =
    love.graphics.newQuad(368,416,12,28,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  temps.chiffre[2]  =
    love.graphics.newQuad(380,416,12,28,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  temps.chiffre[3]  =
    love.graphics.newQuad(392,416,12,28,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  temps.chiffre[4]  =
    love.graphics.newQuad(404,416,12,28,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  temps.chiffre[5]  =
    love.graphics.newQuad(416,416,12,28,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  temps.chiffre[6]  =
    love.graphics.newQuad(428,416,12,28,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  temps.chiffre[7]  =
    love.graphics.newQuad(440,416,12,28,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  temps.chiffre[8]  =
    love.graphics.newQuad(452,416,12,28,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  temps.chiffre[9]  =  
    love.graphics.newQuad(464,416,12,28,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  temps.chiffre[0] =
    love.graphics.newQuad(476,416,12,28,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  temps.chiffre[10] =
    love.graphics.newQuad(488,416,12,28,TileSheetNG:getWidth(),TileSheetNG:getHeight())
  
end

function temps.update(dt)

  temps[1] = temps[1] + n*dt
  if temps[1] >= 60 then
    temps[1] = 0 
    temps[2] = temps[2] + 1
  end
  
  if temps[2] >= 60 then
    temps[2] = 0
    temps[3] = temps[3] + 1
  end
  
  if temps[3] >= 24 then
    temps[3] = 0 
    temps[4] = temps[4] + 1
  end
  
  if temps[4] > 365 then
    temps[4] = 1
    temps[5] = temps[5] + 1
  end
  
  if temps[5] > 9 then
    temps[5] = 0
  end

end
function temps.draw()
  
  -- Coordonnée Y des heures minutes et seconde
  local CY   = 8
  -- Coordonnée X des Dizaines d'Heures
  local CXDH = 248
  -- Coordonnée X des Unités d'Heures
  local CXUH = 264
  -- Coordonnée X des Seconde
  local CXS = 276
  -- Coordonnée X des Dizaines de Minutes
  local CXDM = 288
  -- Coordonnée X des Unitée de Minutes
  local CXUM = 304
  -- Coordonnée X des Unités de Jours
  local CXUJ = 64
  -- Coordonnée X des Dizaines de Jours
  local CXDJ = 48
  -- Coordonnée X des Centaines de Jours
  local CXCJ = 32
  -- Coordonnée X des Années
  local CXA = 8
  
  -- affiche les secondes ":" qui clignonte chaque seconde 
    love.graphics.draw(TileSheetNG, temps.chiffre[10], CXS, CY)
  
  -- affiche les minutes
  if temps[2] >= 0 and temps[2] <= 9 then
    love.graphics.draw(TileSheetNG, temps.chiffre[0], CXDM, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[temps[2]], CXUM, CY)
  elseif temps[2] >= 10 and temps[2] <= 19 then
    love.graphics.draw(TileSheetNG, temps.chiffre[1], CXDM, CY)
    local calcule = temps[2] - 10
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUM, CY)
  elseif temps[2] >= 20 and temps[2] <= 29 then
    love.graphics.draw(TileSheetNG, temps.chiffre[2], CXDM, CY)
    local calcule = temps[2] - 20
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUM, CY)
  elseif temps[2] >= 30 and temps[2] <= 39 then
    love.graphics.draw(TileSheetNG, temps.chiffre[3], CXDM, CY)
    local calcule = temps[2] - 30
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUM, CY)
  elseif temps[2] >= 40 and temps[2] <= 49 then
    love.graphics.draw(TileSheetNG, temps.chiffre[4], CXDM, CY)
    local calcule = temps[2] - 40
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUM, CY)
  elseif temps[2] >= 50 and temps[2] <= 59 then
    love.graphics.draw(TileSheetNG, temps.chiffre[5], CXDM, CY)
    local calcule = temps[2] - 50
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUM, CY)
  end
  
  -- affiche les heures
  if temps[3] >= 0 and temps[3] <= 9 then
    love.graphics.draw(TileSheetNG, temps.chiffre[0], CXDH, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[temps[3]], CXUH, CY)
  elseif temps[3] >= 10 and temps[3] <= 19 then
    love.graphics.draw(TileSheetNG, temps.chiffre[1], CXDH, CY)
    local calcule = temps[3] - 10
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUH, CY)
  elseif temps[3] >= 20 and temps[3] <= 29 then
    love.graphics.draw(TileSheetNG, temps.chiffre[2], CXDH, CY)
    local calcule = temps[3] - 20
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUH, CY)
  end
  -- affiche les jours de 001 a 009 
  if temps[4] >= 0 and temps[4] <= 9 then
    love.graphics.draw(TileSheetNG, temps.chiffre[temps[4]], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[0], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[0], CXCJ, CY)
    
  -- affiche les jours de 010 a 019
  elseif temps[4] >= 10 and temps[4] <= 19 then
    local calcule = temps[4] - 10
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[1], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[0], CXCJ, CY)
    
  -- affiche les jours de 020 a 029
  elseif temps[4] >= 20 and temps[4] <= 29 then
    local calcule = temps[4] - 20
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[2], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[0], CXCJ, CY)
    
  -- affiche les jours de 030 a 039
  elseif temps[4] >= 30 and temps[4] <= 39 then
    local calcule = temps[4] - 30
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[3], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[0], CXCJ, CY)
    
  -- affiche les jours de 040 a 049
  elseif temps[4] >= 40 and temps[4] <= 49 then
    local calcule = temps[4] - 40
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[4], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[0], CXCJ, CY)
    
  -- affiche les jours de 050 a 059
  elseif temps[4] >= 50 and temps[4] <= 59 then
    local calcule = temps[4] - 50
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[5], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[0], CXCJ, CY)
    
  -- affiche les jours de 060 a 069
  elseif temps[4] >= 60 and temps[4] <= 69 then
    local calcule = temps[4] - 60
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[6], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[0], CXCJ, CY)
    
  -- affiche les jours de 070 a 079
  elseif temps[4] >= 70 and temps[4] <= 79 then
    local calcule = temps[4] - 70
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[7], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[0], CXCJ, CY)
    
  -- affiche les jours de 080 a 089
  elseif temps[4] >= 80 and temps[4] <= 89 then
    local calcule = temps[4] - 80
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[8], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[0], CXCJ, CY)
    
  -- affiche les jours de 090 a 099
  elseif temps[4] >= 90 and temps[4] <= 99 then
    local calcule = temps[4] - 90
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[9], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[0], CXCJ, CY)
    
  -- affiche les jours de 100 a 109
  elseif temps[4] >= 100 and temps[4] <= 109 then
    local calcule = temps[4] - 100
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[0], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[1], CXCJ, CY)
    
  -- affiche les jours de 110 a 119
  elseif temps[4] >= 110 and temps[4] <= 119 then
    local calcule = temps[4] - 110
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[1], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[1], CXCJ, CY)
    
  -- affiche les jours de 120 a 129
  elseif temps[4] >= 120 and temps[4] <= 129 then
    local calcule = temps[4] - 120
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[2], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[1], CXCJ, CY)
    
  -- affiche les jours de 130 a 139
  elseif temps[4] >= 130 and temps[4] <= 139 then
    local calcule = temps[4] - 130
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[3], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[1], CXCJ, CY)
    
  -- affiche les jours de 140 a 149
  elseif temps[4] >= 140 and temps[4] <= 149 then
    local calcule = temps[4] - 140
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[4], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[1], CXCJ, CY)
    
  -- affiche les jours de 150 a 159
  elseif temps[4] >= 150 and temps[4] <= 159 then
    local calcule = temps[4] - 150
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[5], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[1], CXCJ, CY)
    
  -- affiche les jours de 160 a 169
  elseif temps[4] >= 160 and temps[4] <= 169 then
    local calcule = temps[4] - 160
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[6], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[1], CXCJ, CY)
    
  -- affiche les jours de 170 a 179
  elseif temps[4] >= 170 and temps[4] <= 179 then
    local calcule = temps[4] - 170
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[7], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[1], CXCJ, CY)
    
  -- affiche les jours de 180 a 189
  elseif temps[4] >= 180 and temps[4] <= 189 then
    local calcule = temps[4] - 180
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[8], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[1], CXCJ, CY)
    
  -- affiche les jours de 190 a 199
  elseif temps[4] >= 190 and temps[4] <= 199 then
    local calcule = temps[4] - 190
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[9], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[1], CXCJ, CY)
    
  -- affiche les jours de 200 a 209
  elseif temps[4] >= 200 and temps[4] <= 209 then
    local calcule = temps[4] - 200
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[0], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[2], CXCJ, CY)
    
  -- affiche les jours de 210 a 219
  elseif temps[4] >= 210 and temps[4] <= 219 then
    local calcule = temps[4] - 210
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[1], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[2], CXCJ, CY)
    
  -- affiche les jours de 220 a 229
  elseif temps[4] >= 220 and temps[4] <= 229 then
    local calcule = temps[4] - 220
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[2], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[2], CXCJ, CY)
    
  -- affiche les jours de 230 a 239
  elseif temps[4] >= 230 and temps[4] <= 239 then
    local calcule = temps[4] - 230
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[3], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[2], CXCJ, CY)
    
  -- affiche les jours de 240 a 249 
  elseif temps[4] >= 240 and temps[4] <= 249 then
    local calcule = temps[4] - 240
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[4], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[2], CXCJ, CY)
    
  -- affiche les jours de 250 a 259
  elseif temps[4] >= 250 and temps[4] <= 259 then
    local calcule = temps[4] - 250
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[5], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[2], CXCJ, CY)
    
  -- affiche les jours de 260 a 269
  elseif temps[4] >= 260 and temps[4] <= 269 then
    local calcule = temps[4] - 260
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[6], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[2], CXCJ, CY)
    
  -- affiche les jours de 270 a 279
  elseif temps[4] >= 270 and temps[4] <= 279 then
    local calcule = temps[4] - 270
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[7], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[2], CXCJ, CY)
    
  -- affiche les jours de 280 a 289
  elseif temps[4] >= 280 and temps[4] <= 289 then
    local calcule = temps[4] - 280
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[8], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[2], CXCJ, CY)
    
  -- affiche les jours de 290 a 299
  elseif temps[4] >= 290 and temps[4] <= 299 then
    local calcule = temps[4] - 290
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[9], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[2], CXCJ, CY)
    
  -- affiche les jours de 300 a 309
  elseif temps[4] >= 300 and temps[4] <= 309 then
    local calcule = temps[4] - 300
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[0], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[3], CXCJ, CY)
    
  -- affiche les jours de 310 a 319
  elseif temps[4] >= 310 and temps[4] <= 319 then
    local calcule = temps[4] - 310
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[1], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[3], CXCJ, CY)
    
  -- affiche les jours de 320 a 329
  elseif temps[4] >= 320 and temps[4] <= 329 then
    local calcule = temps[4] - 320
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[2], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[3], CXCJ, CY)
    
  -- affiche les jours de 330 a 339 
  elseif temps[4] >= 330 and temps[4] <= 339 then
    local calcule = temps[4] - 330
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[3], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[3], CXCJ, CY)
    
  -- affiche les jours de 340 a 349
  elseif temps[4] >= 340 and temps[4] <= 349 then
    local calcule = temps[4] - 340
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[4], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[3], CXCJ, CY)
    
  -- affiche les jours de 350 a 359
  elseif temps[4] >= 350 and temps[4] <= 359 then
    local calcule = temps[4] - 350
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[5], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[3], CXCJ, CY)
    
  -- affiche les jours de 360 a 369
  elseif temps[4] >= 360 and temps[4] <= 369 then
    local calcule = temps[4] - 360
    love.graphics.draw(TileSheetNG, temps.chiffre[calcule], CXUJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[6], CXDJ, CY)
    love.graphics.draw(TileSheetNG, temps.chiffre[3], CXCJ, CY)
  end
  
  -- affiche les année de 0 a 9
  if temps[5] >= 0 and temps[5] <= 9 then
    love.graphics.draw(TileSheetNG, temps.chiffre[temps[5]], CXA, CY)
  end
  
  --love.graphics.print("Année :"..temps[5],0,45)
  --love.graphics.print("Jours :"..temps[4],0,60)
  --love.graphics.print("Heures :"..temps[3],0,45)
  --love.graphics.print("Minutes :"..temps[2],0,60)
  --love.graphics.print("Secondes :"..temps[1],0,75)
  
end

return temps
