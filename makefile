
export project-path := $(CURDIR)
export project-name := $(notdir $(project-path))

.PHONY: install re-install clean test cover pre-release release

install:
	@npm install

re-install:
	@rm -Rf node_modules package-lock.json
	@npm install

clean:
	@npx shx rm -Rf coverage

test:
	@npx eslint index.cjs test
	@npx ava

cover:
	@npx shx rm -Rf coverage
	@npx eslint index.cjs test
	@npx c8 ava
	@npx shx mkdir -p ../Shared/$(project-name)
	@npx shx rm -Rf ../Shared/$(project-name)/coverage
	@npx shx cp -R coverage ../Shared/$(project-name)

pre-release: clean cover
	@npx shx echo -n

release: clean test
	@npm version prerelease
	@npm publish --access public
	@git push origin master

include include/update
include include/commit
