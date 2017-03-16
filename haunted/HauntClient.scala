import scala.audio.osc._

case class Haunted(port: Int = 7700) {
    private var client = OscClient(7700)

    private var skipChn = client.channel[Float]("/set-skip")
    private var rateChn = client.channel[Float]("/set-rate")
    private var widthChn = client.channel[Float]("/set-width")
    private var xChn = client.channel[Float]("/set-x")
    private var yChn = client.channel[Float]("/set-y")

    private var tapChn = client.channel[Boolean]("/tap")
    private var stopChn = client.channel[Boolean]("/stop")
    private var startChn = client.channel[Boolean]("/start")


    def tap   = tapChn.send(true)
    def start = startChn.send(true)
    def stop  = stopChn.send(true)

    def skip(x: Float)  = skipChn.send(x)
    def rate(x: Float)  = rateChn.send(x)
    def width(x: Float) = widthChn.send(x)
    def x(value: Float) = xChn.send(value)
    def y(value: Float) = yChn.send(value)
}
