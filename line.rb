$RESOLUTION = 500
$GRID = Array.new($RESOLUTION)
$DEBUGGING = true
$OUTFILE = "image.ppm"

## Create board
for i in (0...$RESOLUTION)
  $GRID[i] = Array.new($RESOLUTION)
  for j in (0...$RESOLUTION)
    $GRID[i][j] = [0, 0, 0]
  end
end

## Write GRID to OUTFILE
def write_out()
  file = File.open($OUTFILE, 'w')
  file.puts "P3 #$RESOLUTION #$RESOLUTION 255"
  for row in $GRID
    for pixel in row
      for rgb in pixel
        file.print rgb
        file.print ' '
      end
      file.print '   '
    end
    file.puts ''
  end
  file.close()
end

# Plot a point on GRID (from top left)
def plot(x, y, r:255, g:255, b:255) $GRID[y][x] = [r, g, b] end
# Plot a point on GRID (from bottom left)
def plot_bot(x, y, r:255, g:255, b:255) plot(x, $RESOLUTION - y, r:255, g:255, b:255) end

def line(x0, y0, x1, y1, r:255, g:255, b:255)
  # x0 is always left of x1
  if x1 < x0; line(x1, y1, x0, y0) else

    #init vars
    dy = y1-y0
    dx = x1-x0
    x = x0
    y = y0
    d = 2*dy - dx

    if dy <= 0 #if the line is in octants I or II
      if dy.abs <= dx #octant I
        puts "Drawing line in Octant I" if $DEBUGGING
        while x <= x1
          plot(x, y, r:r, g:g, b:b)
          if d > 0
            y-=1
            d-=2*dx
          end
          x+=1
          d-=2*dy
        end
      else #octant II
        puts "Drawing line in Octant II" if $DEBUGGING
        while y >= y1
          plot(x, y, r:r, g:g, b:b)
          if d > 0
            x+=1
            d+=2*dy
          end
          y-=1
          d+=2*dx
        end
      end
    else #if the line is in octants VII or VIII

    end
  end
end

## Main

##========================== Test cases ==========================
line(250, 250, 499, 240, r:0) #Octant I
line(250, 250, 499, 200, r:0) #Octant I
line(250, 250, 499, 150, r:0) #Octant I
line(250, 250, 260, 0, g:0) #Octant II
line(250, 250, 350, 0, g:0) #Octant II
line(250, 250, 400, 0, g:0) #Octant II
#line(1, 99, 99, 1) #Octant VII
#line(1, 99, 99, 1) #Octant VIII

## literal edge cases
line(0, 499, 499, 0, r:0)
line(250, 499, 250, 0, g:0)
# line(1, 10, 99, 10, r:0, b:0)
# line(1, 1, 99, 99)


write_out()
