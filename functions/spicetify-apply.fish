function spicetify-apply
    set -l spotify_path /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify
    set -l verbose 0
    test "$argv[1]" = "-v"; and set verbose 1

    set -l redir ">/dev/null 2>&1"
    test $verbose -eq 1; and set redir ""

    sudo chmod a+wr $spotify_path
    or begin; echo "Error: chmod spotify-client failed."; return 1; end

    sudo chmod a+wr -R $spotify_path/Apps
    or begin; echo "Error: chmod Apps directory failed."; return 1; end

    if eval spicetify backup apply $redir; echo "Spicetify applied."; return 0; end

    eval spicetify restore $redir
    and eval spicetify apply $redir
    or begin; echo "Error: spicetify failed. Try: flatpak repair com.spotify.Client"; return 1; end

    echo "Spicetify applied."
end