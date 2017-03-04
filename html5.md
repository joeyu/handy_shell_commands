# `HTML5` tricks

## Size of element
[Element.getBoundingClientRect()](https://developer.mozilla.org/en-US/docs/Web/API/Element/getBoundingClientRect)

[HTMLElement.offsetWidth](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/offsetWidth)
& [HTMLElement.offsetHeight](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/offsetHeight)

## Canvas size
For `<canvas>`, its CSS dimensional size may not be the same as its pixel buffer size.


```
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" >
		var canvas = document.getElementById('canvas');
		console.log("canvas CSS dimentional width: %d, height: %d", canvas.offsetWidth, canvas.offsetHeight);
		console.log("canvas pixel buffer width: %d, height: %d", canvas.width, canvas.height); 
	</script>
</head>
<body>
	<canvas id="canvas" style="width: 100px; height: 100px> </canvas>
</body>
</html>
```

Note that: the pixel buffer size can be changed by setting the values of canvas.width and canvas.height. 
This is useful when a same aspect ratio as the CSS dimension is needed.  




