# first fix our mirror to a solid local mirror
# I have been a lot of problems lately with other mirrors
echo "# no frills, no junk" | sudo tee /etc/pacman.d/mirrorlist > /dev/null
echo "# USA" | sudo tee /etc/pacman.d/mirrorlist > /dev/null
echo "Server = http://mirror.clarkson.edu/manjaro/stable/$repo/$arch" | sudo tee --append /etc/pacman.d/mirrorlist > /dev/null

# make sure you already have nodejs installed
sudo pacman -Syy
sudo pacman -Sy nodejs
sudo pacman -Sy npm
sudo pacman -Sy dnsutils
sudo pacman -Sy vi
sudo pacman -Sy youtube-dl
sudo pacman -Sy curl
sudo pacman -Sy kdenlive

# upgrade everything else
sudo pacman -Su
