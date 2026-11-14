local commit
pcall(function()
	commit = readfile('HeliumV8/profiles/commit.txt')
end)

local function wipe(path)
	if isfolder(path) then
		for _, item in listfiles(path) do
			wipe(item)
		end
		pcall(delfolder, path)
	elseif isfile(path) then
		pcall(delfile, path)
	end
end

if isfolder('Helium v8') then
	wipe('Helium v8')
end

pcall(function()
	game:GetService('StarterGui'):SetCore('SendNotification', {
		Title = 'Helium v8',
		Text = 'deleted HeliumV8, reinjecting now',
		Duration = 4
	})
end)

task.wait(0.67)

loadstring(game:HttpGet('https://raw.githubusercontent.com/0lyzll/HeliumV8/'..(commit or 'main')..'/main.lua', true))()
