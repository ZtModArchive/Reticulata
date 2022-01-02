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
            local animalSpeciesList = animalsInZoo()
            local speciesJson = '[\n';
            for i = 1, table.getn(animalSpeciesList), 1 do
                speciesJson = speciesJson .. '        "' .. animalSpeciesList[i] .. '"'
                if i < table.getn(animalSpeciesList) then
                    speciesJson = speciesJson .. ',\n'
                else
                    speciesJson = speciesJson .. '\n'
                end
            end
            speciesJson = speciesJson .. '    ]';

            print(
                '{\n' ..
                '    "timestamp": "' .. getRealTime() .. '",\n' ..
                '    "zooFame": "' .. getZooFame() .. '",\n' ..
                '    "zooName": "' .. getZooName() .. '",\n' ..
                '    "currentMonth": "' .. getCurrentMonth() .. '",\n' ..
                '    "currentTimeOfDay": "' .. getCurrentTimeOfDay() .. '",\n' ..
                '    "currentSimTime": "' .. getCurrentSimTime() .. '",\n' ..
                '    "cash": "' .. howMuchCash() .. '",\n' ..
                '    "donationsAllAnimals": "' .. getDonationsAllAnimals() .. '",\n' ..
                '    "educationDonations": "' .. getDonations("Education") .. '",\n' ..
                '    "totalDonations": "' .. getTotalDonations() .. '",\n' ..
                '    "speciesCount": "' .. howManyAnimalsInZoo() .. '",\n' ..
                '    "species": ' .. speciesJson .. ',\n' ..
                --'    "adultAdmissionPrice": "' .. getAdmissionPrice("adult_admission") .. '",\n' ..
                --'    "childAdmissionPrice": "' .. getAdmissionPrice("child_admission") .. '"\n' ..
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