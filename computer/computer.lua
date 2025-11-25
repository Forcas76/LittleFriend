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
        if rednet.isOpen("left") == false then
            if rednet.isOpen("right") == false then
                rednet.open("left")
            else
                rednet.open("right")
            end
        end
    end
end

boot()