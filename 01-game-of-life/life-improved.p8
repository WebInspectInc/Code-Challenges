pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- the game of life
-- by howlermiller
-- slightly improved post video

grid = {}
cols = 32
rows = 32
res = 4

function makemap(rows, cols)
	local newmap = {}
	
	for x=1,cols do
		newmap[x] = {}
		for y=1,rows do
			newmap[x][y] = 0
		end
	end

	return newmap;
end


function countneighbors(cmap,x,y)
	local sum = 0
	for i=-1,1 do
		for j=-1,1 do
			local row = x+i
			local col = y+j
			
			if (row < 1) then row = rows end
			if (row > rows) then row = 1 end
			if (col < 1) then col = cols end
			if (col > cols) then col = 1 end

			sum += cmap[row][col]
		end
	end -- end loops
	sum -= cmap[x][y]
	return sum
end



function _init()
	grid = makemap(rows,cols)

 for x=1,rows do
  for y=1,cols do
   grid[x][y] = flr(rnd(2))
  end
 end
end




function updatecells()
	local newgrid = makemap(rows,cols)
	
	for x=1,rows do
		for y=1,cols do
			local n = countneighbors(grid,x,y)
			local alive = grid[x][y] == 1
			
			if not alive and n == 3 then
				-- reproduction
				newgrid[x][y] = 1
			elseif alive and (n < 2 or n > 3) then
				-- over and underpopulation
				newgrid[x][y] = 0
			else
				newgrid[x][y] = grid[x][y]
			end

		end
	end -- end loops
	
	grid = newgrid
end




function _draw()
	cls()
	camera(res,res)

		for x=1,rows do
			for y=1,cols do
				rectfill(
					x*res,
					y*res,
					x*res+res,
					y*res+res,
					grid[x][y]
				)
			end
		end

  updatecells()
end
