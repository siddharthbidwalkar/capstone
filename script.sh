cd openvswitch-2.5.1
./configure --prefix=/usr --with-linux=/lib/modules/`uname -r`/build
make
make install
make modules_install
lsmod | grep open
ovs-appctl -t ovs-vswitchd exit
ovs-appctl -t ovsdb-server exit
ovs-dpctl del-dp system@ovs-system
lsmod | grep open
rmmod openvswitch
depmod -a
/etc/init.d/openvswitch-switch start
ovs-vsctl show
modinfo openvswitch | grep version:
