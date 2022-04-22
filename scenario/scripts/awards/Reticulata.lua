include "scenario/scripts/entity.lua"
include "scenario/scripts/token.lua"
include "scenario/scripts/ui.lua"
include "scenario/scripts/misc.lua"
include "scenario/scripts/awards.lua"
include "scenario/scripts/economy.lua"

awards_group={
    {
        flag_name="Reticulata",
        icon_name="Reticulata",
        locid="Reticulata",
        args={}
    },
    test_func=Reticulata, group_xml="awards/Reticulata.xml"
}

function Reticulata(args)
    try(
        function ()
            displayZooMessageTextWithZoom("Reticulata fired", 1, 30)
            local animalSpeciesList = animalsInZoo()
            local speciesJson = '[';
            for i = 1, table.getn(animalSpeciesList), 1 do
                speciesJson = speciesJson .. '"' .. animalSpeciesList[i] .. '"'
                if i < table.getn(animalSpeciesList) then
                    speciesJson = speciesJson .. ','
                end
            end
            speciesJson = speciesJson .. ']';

            print(
                '{' ..
                    '"type":"reticulata",' ..
                    '"timestamp":"' .. getRealTime() .. '",' ..
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
                    '"species":' .. speciesJson ..
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