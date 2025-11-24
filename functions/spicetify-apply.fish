function spicetify-apply
    sudo chmod a+wr /usr/lib64/spotify-client
    or begin
        echo "Error: chmod spotify-client failed."
        return 1
    end

    sudo chmod a+wr /usr/lib64/spotify-client/Apps -R
    or begin
        echo "Error: chmod Apps directory failed."
        return 1
    end

    spicetify update >/dev/null 2>&1
    or begin
        echo "Error: spicetify update failed."
        return 1
    end

    spicetify restore >/dev/null 2>&1
    or begin
        echo "Error: spicetify restore failed."
        return 1
    end

    spicetify backup apply >/dev/null 2>&1
    or begin
        echo "Error: spicetify backup apply failed."
        return 1
    end

    echo "Spicetify applied."
end