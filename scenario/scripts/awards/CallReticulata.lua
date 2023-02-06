include "scenario/scripts/entity.lua"
include "scenario/scripts/token.lua"
include "scenario/scripts/ui.lua"
include "scenario/scripts/misc.lua"
include "scenario/scripts/awards.lua"

include "scripts/Reticulata.lua"

awards_group={
    {
        flag_name="CallReticulata",
        icon_name="CallReticulata",
        locid="CallReticulata",
        args={}
    },
    test_func=CallReticulata, group_xml="awards/CallReticulata.xml"
}

function CallReticulata(args)
    Reticulata("Reticulata", "Test")
end
