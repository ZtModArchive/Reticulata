include "scenario/scripts/entity.lua"
include "scenario/scripts/token.lua"
include "scenario/scripts/ui.lua"
include "scenario/scripts/misc.lua"
include "scenario/scripts/awards.lua"

awards_group={
    {
        flag_name="ZT2API",
        icon_name="ZT2API",
        locid="ZT2API",
        args={}
    },
    test_func=ZT2API, group_xml="awards/ZT2API.xml"
}

function ZT2API(args)
    displayZooMessageTextWithZoom("test")
    print("test")
    io.flush()
end
