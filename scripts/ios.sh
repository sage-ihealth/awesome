 
export HOME=/Users/sagegu; cd /Users/sagegu/Documents/GitHub/sage/AwesomeProject
echo 'home:' $HOME

export PATH="/Users/sagegu/.nvm/versions/node/v12.16.2/bin/:$PATH"
echo 'PATH:' $PATH
 
# npx react-native start
# /Users/sagegu/.nvm/versions/node/v12.16.2/bin/npx react-native start

 # ------------------------------fastlane----------------------------------
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
cd ios
fastlane release

 
