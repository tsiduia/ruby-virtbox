module VirtBox
  class VM

    def initialize(name)
      @name = name
      @id = nil
      _read_vbox
    end

    def _read_vbox
      %x{VBoxManage list vms}.split(/\n/).each { |line|
        line.scan(/"([^"]+)"\s+\{([^\}]+)\}/) { |match|
          if match[0] == @name
            @id = match[1]
            return
          end
        }
      }
    end

    def exists?
      if @id
        return true
      else
        return false
      end
    end

    def snapshots
      snaps = Array.new
      %x{VBoxManage snapshot #{@id} list --machinereadable}.split(/\n/).each { |line|
        line.scan(/^SnapshotName(\-\d+)?="([^"]+)"/) { |match|
          snaps << match[1]
        }
      }

      snaps
    end

    def revert_to_snapshot(snap)
      %{VBoxManage snapshot #{@id} restore #{snap}}
    end

    def start(options = {})
      if options[:headless] && options[:headless] == true
        %{VBoxManage startvm #{@id} --type headless}
      else
        %{VBoxManage startvm #{@id} --type gui}
      end
    end

  end
end
