gh:
	./node_modules/gatsby/bin/gatsby.js build
	cd public && git remote -v
	ls
	git add .
	git commit -m "new post"

netl:
	gatsby build
	cd public
	git add .
	git commit -m "new post"
	n
