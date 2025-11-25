local turtle_files = {"turtle.lua", "task_move.lua", "task_dig.lua"}
local computer_files = {"computer.lua", "commander.lua"}

local function clear(time)
    local timeM = time or 0
    os.sleep(timeM)
    term.clear()
    term.setCursorPos(1,1)
end

local function bootloader(platform, files)
    for _, f in ipairs(files) do
        if fs.exists(f) then
            fs.delete(f)
        end

        local url
        if platform == "turtle" then
            url = "https://raw.githubusercontent.com/Forcas76/LittleFriend/main/turtle/" .. f
        elseif platform == "computer" then
            url = "https://raw.githubusercontent.com/Forcas76/LittleFriend/main/computer/" .. f
        else
            url = "https://raw.githubusercontent.com/Forcas76/LittleFriend/main/" .. f
        end

        local success = false
        for attempt = 1, 3 do
            local resp = http.get(url)
            if resp then
                local file = fs.open(f, "w")
                file.write(resp.readAll())
                file.close()
                resp.close()
                print("Letoltve: " .. f)
                os.sleep(0.5)
                success = true
                break
            else
                print("Hiba a letoltesnel: " .. f .. " (Ujraprobalkozas: " .. attempt .. "/3)")
                os.sleep(0.5)
            end
        end

        if not success then
            print("Vegleges hiba: " .. f .. " nem toltheto le (ellenorizd az URL-t vagy a HTTP engedelyt)")
           clear(2)
        end
    end
end
local function download()
    if turtle then
        bootloader("turtle", turtle_files)
        if fs.exists("turtle.lua") then
            shell.run("turtle.lua")
        else
            clear(2)
            print("Hiba: turtle.lua nem talalhato")
        end
    elseif pocket then
        print("Pocket computer detected - nincs meg platform tamogatas")
    else
        bootloader("computer", computer_files)
        if fs.exists("computer.lua") then
            shell.run("computer.lua")
        else
            clear(2)
            print("Hiba: computer.lua nem talalhato")
        end
    end
end

local function update()
    bootloader("main", {"main.lua"})
    shell.run("main.lua")
end

local args = {...}
local what_platform
if turtle then
    what_platform = "Turtle"
else
    what_platform = "Computer"
end

if #args == 0 then
    clear()
    print("Letoltes megkezdese: " .. what_platform)
    download()
elseif args[1] == "update" then
    print("Frissites... Biztosan le szeretned frissiteni a programot? (y/n)")
    if read().lower() == "y" then
        update()
    end
    clear(1)
end