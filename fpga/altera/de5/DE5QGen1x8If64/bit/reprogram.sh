 
echo "Removing active driver modules"

sudo rmmod riffa
sudo rmmod altera_cvp
sudo rmmod fpga_mgr
sleep 1

echo "Reprogramming the fpga and Performing hot reset of port $port..."


set -e
nios=$QUARTUSPATH/nios2eds/nios2_command_shell.sh
$nios quartus_pgm -m jtag -c 1 -o "p;DE5QGen1x8If64.sof"

echo "Reprogramming done"

sudo sh rescan.sh
