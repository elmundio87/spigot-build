LATEST_VERSION=`curl -L https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r ."latest"."release"`
echo "##vso[build.updatebuildnumber]${LATEST_VERSION}"

wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
java -jar BuildTools.jar --rev $LATEST_VERSION -o output
cp output/spigot-${LATEST_VERSION}.jar output/spigot-release.jar 

