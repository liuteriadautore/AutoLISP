# AutoLISP-Files
My own autolisp routines, with some commands and routines for luthiery specific drawing tasks

## startup.lsp
My CorelCAD startup file, to automatically load my customizations

## divisions.lsp
It allow to construct new lines from the division between two defined points

#### Line From Mid Point
`linefrommidpoint`

Ask to define two points; a mid point is calculated, and a line start to be drawn from there. The new line finish when defining the third and last point.

#### Line From Third Point
`linefromthirdpoint`

Ask to define two points; the point at one third their distances is calculated, and a line start to be drawn from there. The new line finish when defining the third and last point.

#### Line From Golden Section
`linefromgoldensection`

Ask to define two points; then, a point at the golden section from them is calculated, and a line start to be drawn from there. The new line finish when defining the third and last point.

## vesicapiscis.lsp
It construct a Vesica Piscis from two defined points

#### Vesica by Start End
`vesicastartend`

Ask to define both opposite extreme points, then draw the Vesica.

#### Vesica by Center End
`vesicacenterend`

Ask to define the center and one of the opposite extreme points, then draw the Vesica.
