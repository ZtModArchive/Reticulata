include "scenario/scripts/entity.lua"
include "scenario/scripts/token.lua"
include "scenario/scripts/ui.lua"
include "scenario/scripts/misc.lua"
include "scenario/scripts/awards.lua"
include "scenario/scripts/economy.lua"
include "scripts/ZooFame.lua"

function Reticulata(sender, customData)
    try(
        function ()
            local animalSpeciesList = animalsInZoo()
            local speciesJson = '[';
            for i = 1, table.getn(animalSpeciesList), 1 do
                speciesJson = speciesJson .. '"' .. animalSpeciesList[i] .. '"'
                if i < table.getn(animalSpeciesList) then
                    speciesJson = speciesJson .. ','
                end
            end
            speciesJson = speciesJson .. ']';

            local guests = findType("Guest")
            local avgEducation = getAverageAttribute(guests, "f_Education")
            local avgHappiness = getAverageAttribute(guests, "happiness")

            local admission = 0
            if not getAdmissionPrice() == nil then
                admission = getAdmissionPrice()
            end

            print(
                '{' ..
                    '"type":"reticulata",' ..
                    '"sender":"' .. sender .. '",' ..
                    '"timestamp":"' .. getRealTime() .. '",' ..
                    '"admission":"' .. admission .. '",' ..
                    '"zooFame":"' .. getZooFame() .. '",' ..
                    '"zooName":"' .. getZooName() .. '",' ..
                    '"currentMonth":"' .. getCurrentMonth() .. '",' ..
                    '"currentTimeOfDay":"' .. getCurrentTimeOfDay() .. '",' ..
                    '"currentSimTime":"' .. getCurrentSimTime() .. '",' ..
                    '"cash":"' .. howMuchCash() .. '",' ..
                    '"donationsAllAnimals":"' .. getDonationsAllAnimals() .. '",' ..
                    '"educationDonations":"' .. getDonations("Education") .. '",' ..
                    '"totalDonations":"' .. getTotalDonations() .. '",' ..
                    '"speciesCount":"' .. howManyAnimalsInZoo() .. '",' ..
                    '"guestCount":"' .. getNumGuests(-1) .. '",' ..
                    '"averageEducation":"' .. avgEducation .. '",' ..
                    '"averageHappiness":"' .. avgHappiness .. '",' ..
                    '"species":' .. speciesJson .. ',' ..
                    '"customData":"' .. customData .. '"' ..
                '}'
            )
            io.flush()
        end
    )
end

function try(func)
    -- Try
    local status, exception = pcall(func)
    -- Catch
    if not status then
        -- Show exception in the message panel in-game
        local increment =  50
        for i = 0, string.len(exception), increment
        do 
            displayZooMessageTextWithZoom(string.sub(exception, i, i+increment-1), 1, 30)
        end
    end
end