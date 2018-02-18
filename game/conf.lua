-- on love
if love.filesystem then
	-- loverocks
	require 'rocks' ()
	
	-- src
	love.filesystem.setRequirePath("src/?.lua;" .. love.filesystem.getRequirePath())

	-- lib
	love.filesystem.setRequirePath("lib/?;lib/?.lua;lib/?/init.lua;" .. love.filesystem.getRequirePath())
end

function love.conf(t)
	t.identity = "stargazers-plus"
	t.version = "0.10.2"

	t.window.title = "STARGAZERS+"
	t.window.icon = nil
	t.window.width = 256
	t.window.height = 240
	t.window.resizable = true
	t.window.minwidth = 256
	t.window.minheight = 240

	t.dependencies = {
		"rxlove",
		"middleclass",
		"lovetoys"
	}
end
