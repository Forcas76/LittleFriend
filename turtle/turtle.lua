first_run = {"Szia! Udvozollek a LittleFriend turtle oldali rendszereben!",
             "Fontos! Eloszor a turtle-t kell beuzemelni!",
             "Kell par adat, amit meg kell adnod, hogy a rendszer mukodjon.",
             "Eloszor is kell egy rednet a computer valamelyik oldalara.",
             "A turtle id-je a kovetkezo:" .. os.getComputerID(),
             "Mi a computer ID-je?: "}

local computer_id
local function boot()
    for i, line in ipairs(first_run) do
        print(line)
        if i == 6 then
            computer_id = read(line)
        end
    end
    
    if computer_id ~= nil then
        local modem = peripheral.find("modem")
        if modem then
            rednet.open(1)
            local sender, message, protocol = rednet.receive("LittleFriend", 10)
            if sender == turtle_id and message == "boot" and protocol == "LittleFriend" then
                rednet.send(turtle_id, "connected", "LittleFriend")
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