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
                clear(0)
                print("Letoltve: " .. f)
                os.sleep(1)
                success = true
                break
            else
                clear(0)
                print("Hiba a letoltesnel: " .. f .. " (Ujraprobalkozas: " .. attempt .. "/3)")
                os.sleep(1)
            end
        end

        if not success then
            clear(0)
            print("Vegleges hiba: " .. f .. " nem toltheto le (ellenorizd az URL-t vagy a HTTP engedelyt)")
            os.sleep(1)
        end
    end
end

if turtle then
    bootloader("turtle", {"turtle.lua", "task_move.lua", "task_dig.lua"})
    if fs.exists("turtle.lua") then
        shell.run("turtle.lua")
    else
        clear(0)
        print("Hiba: turtle.lua nem talalhato")
    end
elseif pocket then
    print("Pocket computer detected - nincs meg platform tamogatas")
else
    bootloader("computer", {"computer.lua", "commander.lua"})
    if fs.exists("computer.lua") then
        shell.run("computer.lua")
    else
        clear(0)
        print("Hiba: computer.lua nem talalhato")
    end
end