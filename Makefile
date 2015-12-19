all: extract

build-disunity:
	command -v java >/dev/null 2>&1 || { echo >&2 "I require java but it's not installed.  Aborting."; exit 1; }
	command -v mvn >/dev/null 2>&1 || { echo >&2 "I require mvn but it's not installed.  Aborting."; exit 1; }
	mvn -f ./disunity package
	
extract: build-disunity
	command -v java >/dev/null 2>&1 || { echo >&2 "I require java but it's not installed.  Aborting."; exit 1; }
	cp /Applications/Hearthstone/Data/OSX/cardxml0.unity3d .
	cp ./disunity/disunity-dist/target/disunity*.jar disunity.jar
	cp -r /Applications/Hearthstone/DBF .
	java -jar disunity.jar extract cardxml0.unity3d
	rm disunity.jar
	rm cardxml0.unity3d

.PHONY: extract
