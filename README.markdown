# Gauge Raphaël Plugin

## Samples:
[http://renatoalbano.github.com/raphael-gauge/](http://renatoalbano.github.com/raphael-gauge/)

## Usage:
    // Creates 320 × 320 px raphael canvas
    var r = Raphael("holder", 320, 320);

    // Create a gauge with 0 min angle and 360 max angle
    var g = r.gauge(0, 360);

    // Attach Background to gauge with x=140 and y=140 center point
    g.bg(r.circle(140, 140, 140).attr({fill:"#ccc"}), [140, 140]);

    // Attach Pointer to gauge with x=140 and y=5 center point
    g.pointer(r.rect(0, 0, 140, 10).attr({fill: "#000"}), [140, 5]);

    // Move pointer with random value
    setInterval(function(){
      var percent = Math.floor(Math.random()*100);
      g.move(percent);
    }, 2000);

## License:
[http://www.opensource.org/licenses/mit-license.php](http://www.opensource.org/licenses/mit-license.php)

