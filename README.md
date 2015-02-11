# Small pure ruby library to control VirtualBox VMs

You need VBoxManage in your PATH. On OSX you can do this by adding */Applications/VirtualBox.app/Contents/MacOS* to your PATH.

```
export PATH=/Applications/VirtualBox.app/Contents/MacOS:$PATH
```

```
require "virtbox"

vm = VirtBox::VM.new("vm-name")

exist = vm.exists?

vm_snaps = vm.snapshots

vm.revert_to_snapshot "snap-name"

vm.stop

vm.start
```
