first_run = {"Szia! Udvozollek a LittleFriend computer oldali rendszereben!",
             "Fontos! Eloszor a turtle-t kell beuzemelni!",
             "Kell par adat, amit meg kell adnod, hogy a rendszer mukodjon.",
             "Eloszor is kell egy rednet a computer valamelyik oldalara.",
             "A computer id-je a kovetkezo:" .. os.getComputerID(),
             "Mi a turtle ID-je?: "}

local turtle_id
local function boot()
    for i, line in ipairs(first_run) do
        print(line)
        if i == 6 then
            turtle_id = read(line)
        end
    end

    if turtle_id ~= nil then
        local modem = peripheral.find("modem")
        local modemside = peripheral.getName(modem)
        rednet.open(modemside)
        if modem then
            rednet.send(tonumber(turtle_id), "boot", "LittleFriend")
            local sender, message, protocol = rednet.receive("LittleFriend", 10)
            
            if sender == turtle_id and message == "connected" and protocol == "LittleFriend" then
                print("A LittleFriend rendszert beuzemeltu")
            else
                print("Nincs kapcsolat.")
            end
        else
            print("Nincs modem")
        end
    end
end

boot()