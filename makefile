all: line.rb
	ruby line.rb

cat: all
	cat image.ppm

convert: all
	convert image.ppm image.png
	rm image.ppm

display: convert
	display image.png

clean:
	rm *~ *.ppm *.png
