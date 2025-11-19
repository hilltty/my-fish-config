function zerotier
    set action $argv[1]

    switch $action
        case on
            sudo systemctl is-active --quiet zerotier-one
            if test $status -eq 0
                echo "ZeroTier already running."
                return 1
            else
                sudo systemctl start zerotier-one
                echo "ZeroTier started."
                return 0
            end

        case off
            sudo systemctl is-active --quiet zerotier-one
            if test $status -ne 0
                echo "ZeroTier already stopped."
                return 1
            else
                sudo systemctl stop zerotier-one
                echo "ZeroTier stopped."
                return 0
            end

        case switch
            sudo systemctl is-active --quiet zerotier-one
            if test $status -ne 0
                echo "ZeroTier is not running."
                return 2
            end

            set netjson (sudo zerotier-cli listnetworks -j 2>/dev/null | jq -r '.[] | select(.status=="OK")')
            if test -z "$netjson"
                echo "No active ZeroTier network found."
                return 2
            end

            set netid (echo $netjson | jq -r '.nwid')
            set g (echo $netjson | jq -r '.allowGlobal')
            set d (echo $netjson | jq -r '.allowDNS')
            set f (echo $netjson | jq -r '.allowDefault')

            if test "$g" = "true" -a "$d" = "true" -a "$f" = "true"
                sudo zerotier-cli set $netid allowGlobal=0 >/dev/null
                sudo zerotier-cli set $netid allowDNS=0 >/dev/null
                sudo zerotier-cli set $netid allowDefault=0 >/dev/null
                echo "Proxy mode disabled."
            else
                sudo zerotier-cli set $netid allowGlobal=1 >/dev/null
                sudo zerotier-cli set $netid allowDNS=1 >/dev/null
                sudo zerotier-cli set $netid allowDefault=1 >/dev/null
                echo "Proxy mode enabled."
            end
            return 0

        case status
            sudo systemctl is-active --quiet zerotier-one
            if test $status -eq 0
                set svc "active"
                set svc_color (set_color green)
            else
                set svc "inactive"
                set svc_color (set_color red)
            end
            echo -n "ZeroTier service: "
            echo $svc_color$svc(set_color normal)

            if test "$svc" = "active"
                set netjson (sudo zerotier-cli listnetworks -j 2>/dev/null | jq -r '.[] | select(.status=="OK")')
                if test -n "$netjson"
                    set netid (echo $netjson | jq -r '.nwid')
                    set g (echo $netjson | jq -r '.allowGlobal')
                    set d (echo $netjson | jq -r '.allowDNS')
                    set f (echo $netjson | jq -r '.allowDefault')
                    set m (echo $netjson | jq -r '.allowManaged')
                    echo "Network: $netid"
                    echo "allowGlobal  = $g"
                    echo "allowDNS     = $d"
                    echo "allowDefault = $f"
                    echo "allowManaged = $m"
                else
                    echo "No active network."
                end
            end
            return 0

        case '*'
            echo "Usage: zerotier {switch|on|off|status}"
            return 1
    end
end

