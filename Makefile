.PHONY: all build

all: clean build

build:
	dam -x create ../dam.mongodb --name=mongodb

clean:
	rm -rf meta/utils/mongo meta/utils/mongodump meta/utils/mongoexport meta/utils/mongofiles meta/utils/mongooplog meta/utils/mongoperf meta/utils/mongorestore meta/utils/mongostat meta/utils/mongotop meta/install
