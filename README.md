让佳能旧的EOS胶卷机身，兼容新款数码副厂镜头（如永诺35F2）
参考指令表https://blog.csdn.net/hu5566798/article/details/103187033
## Installation

To use it, you need to cut the DCL line from the camera to the lens and insert
a 220Ω resistor in line, then attach the programmed ATtiny13 as follows:

```
                                   Camera side
                    =========================================
                    DGND  LCLK  DLC  DCL  VDD  PGND/DET  VBAT
                     |     |     |    |    |      |       |
      ATtiny13    ,------------------------+      |       |
     __________   |  |     |     |    |    |      |       |
    |o         |  |  |     |     |    \    |      |       |
   1|RESET  VCC|8-'  |     |     | 220/    |      |       |
   2|PB3    PB2|7    |     |     |  Ω \    |      |       |
   3|PB4    PB1|6----------+     |    /    |      |       |
 ,-4|GND    PB0|5---------------------+    |      |       |
 |  |__________|     |     |     |    |    |      |       |
 `-------------------+     |     |    |    |      |       |
                     |     |     |    |    |      |       |
                    DGND  LCLK  DLC  DCL  VDD  PGND/DET  VBAT
                    =========================================
                                    Lens side
See [this gist](https://gist.github.com/marcan/858c242db2fc595da1e0bb70a05192fc)
for more details about the Canon EF protocol.
