$RESOLUTION = 500;
$GRID = Array.new($RESOLUTION);
$OUTFILE = "image.ppm";

## Create board
for i in (0...$RESOLUTION)
  $GRID[i] = Array.new($RESOLUTION);
  for j in (0...$RESOLUTION)
    $GRID[i][j] = [0, 0, 0];
  end
end

## Write GRID to OUTFILE
def writeOut()
  file = File.open($OUTFILE, 'w');
  file.puts "P3 #$RESOLUTION #$RESOLUTION 255";
  for row in $GRID
    for pixel in row
      for rgb in pixel
        file.print rgb;
        file.print ' ';
      end
      file.print '   ';
    end
    file.puts '';
  end
  file.close();
end

# Plot a point on GRID
def plot(x, y, r:255, g:255, b:255) $GRID[y][x] = [r, g, b]; end

def line(x1, y1, x2, y2)
  # x1 is always < x2
  line(x2, y2, x1, y1) if (x1 < x2);
end


## Main

writeOut();
