[Copy From](http://stackoverflow.com/questions/19865158/what-is-the-difference-among-col-lg-col-md-and-col-sm-in-twitter-bootstra)
The Bootstrap 3 grid comes in 4 sizes (or "breakpoints").

Extra small (for smartphones .col-xs-*), small (for tablets .col-sm-*), medium (for laptops .col-md-*) and large (for laptops/desktops .col-lg-*). These grid sizes enable you to control grid behavior on different devices, i.e. desktop, laptops, tablet, smartphone, etc.

So:

col-sm-3 is 3 grid columns wide (25%) on a typical small device width (more than 768 pixels)

col-md-3 is 3 grid columns wide (25%) on a typical medium device width (more than 992 pixels)

etc.

Combine the classes to use change column widths on different grid sizes..

`<div class="col-md-3 col-sm-6">..</div>`

The sm, md and lg grids will all "stack" vertically on screens/viewports less than 768 pixels. This is where the xs grid fits in. Columns that use the col-xs-* classes will not stack vertically and continue to scale down on the smallest screens.

Resize your browser using this demo and you'll see the grid scaling effects.

Update In Bootstrap 4, there is a new XL size, see this demo

Also, read this article that explains more about the Bootstrap grid

Code

```
<div class="container">
    <div class="visible-lg"><span class="label label-default">lg</span></div> <div class="visible-md"><span class="label label-default">md</span></div> <div class="visible-sm"><span class="label label-default">sm</span></div> <div class="visible-xs"><span class="label label-default">xs</span></div>
</div>
<hr>
<div class="container">
  <div class="row">
    <div class="col-lg-3 col-md-4 col-xs-6">col-lg-3 col-md-4 col-xs-6</div>
    <div class="col-lg-3 col-md-4 col-xs-6">col-lg-3 col-md-4 col-xs-6</div>
    <div class="col-lg-3 col-md-4 col-xs-6">col-lg-3 col-md-4 col-xs-6</div>
    <div class="col-lg-3 col-md-4 col-xs-6">col-lg-3 col-md-4 col-xs-6</div>
  </div>
</div>
<hr>
<div class="container">
  <div class="row">
    <div class="col-xs-6">col-xs-6</div>
    <div class="col-xs-6">col-xs-6</div>
  </div>
</div>
<hr>
<div class="container">
  <div class="row">
	<div class="col-xs-6 col-sm-8">col-xs-6 col-sm-8</div>
	<div class="col-xs-6 col-sm-4">col-xs-6 col-sm-4</div>
	</div>
</div>
<hr>
<div class="container">
  <div class="row">
    <div class="col-xs-6 col-md-8">col-xs-6 col-md-8</div>
    <div class="col-xs-6 col-md-4">col-xs-6 col-md-4</div>
  </div>
</div>
```