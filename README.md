# v8b10b
Verilog 8b10b encoder/decoder

## Encoder
### Ports
* `clk` - input Clock
* `rst` - input Reset (Active-HIGH)
* `en` - input Enable (Active-HIGH)
* `kin` - K- or D-symbol selection (`1 - K`, `0 - D`)
* `din` - 8-bit data input
* `dout` - 10-bit data output
* `disp` - Disparity flag output 
* `kin_err` - K-symbol error output

## Decoder
### Ports
* `clk` - input Clock
* `rst` - input Reset (Active-HIGH)
* `en` - input Enable (Active-HIGH)
* `din` - 10-bit data input
* `dout` - 8-bit data output
* `kout` - K- or D-symbol flag (`1 - K`, `0 - D`)
* `code_err` - Code error flag output
* `disp` - Disparity output
* `disp_err` - Disparity error flag output