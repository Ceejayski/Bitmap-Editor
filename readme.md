# Bitmap editor

Produce a Ruby program that simulates a basic canvas editor.
A canvas is represented as an M x N matrix of pixels with each element representing a colour.
The goal of your program is to read instructions from the command line and to fill the canvas with a sequence of
adjacent letters according to the command received.

## Program input
The input consists of the user inputting a command per line, where a command is represented by a single capital letter
at the beginning of the line. After that, a list of parameters separated by white space is provided for such command.
Pixel coordinates are a pair of integers: a column number between 1 and 250, and a row number between 1 and 250.
The canvas starts at coordinates 1, 1. Colours are specified by capital letters.

## Commands
There are 10 supported commands:

`?` - Shows in program help.
`I N M` - Create a new M x N image with all pixels coloured white (O).
`C` - Clears the table, setting all pixels to white (O).
`L X Y C` - Colours the pixel (X,Y) with colour C.
`V X Y1 Y2 C` - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
`H X1 X2 Y C` - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
`S` - Show the contents of the current image
`X` - Terminate the session
`F X Y C` - Fill the region R with the colour C. R is defined as:
`W F` - Scales the canvas with the given factor F (in percentage). Notice that this might have some undesired effects on your
canvas; when you scale up you might generate more white space than you wish, or when you scale down you might
lose some pixels. It’s ok with a sub-optimal scaled canvas as long as the tradeoffs are discussed. Here is an example with
the case limit of a 1x1 canvas where we scale by a 200% factor:

## Example
You start the application by running it like so
`./bin/bitmap-editor`, the application is an interactive command line program.

Input Command:
```
I 5 6
L 1 3 A
V 2 3 6 W
H 3 5 2 Z
S
```

Expected Output:
```
OOOOO
OOZZZ
AWOOO
OWOOO
OWOOO
OWOOO
```
..

# Running

`>bin/bitmap_editor`