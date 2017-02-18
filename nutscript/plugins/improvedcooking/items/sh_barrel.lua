ITEM.name = nut.lang.Get("cook_barrel_name")
ITEM.uniqueID = "cbarrel"
ITEM.category = nut.lang.Get("c_cooking")
ITEM.model = Model("models/props_phx/empty_barrel.mdl")
ITEM.desc = nut.lang.Get("cook_barrel_desc")
ITEM.functions = {}
ITEM.functions.Use = {
	tip = "Set up a Barrel on the ground.",
	icon = "icon16/fire.png",
	run = function(itemTable, client, data, entity)
		if (SERVER) then
			local position

			if (IsValid(entity)) then
				position = entity:GetPos() + Vector(0, 0, 4)
			else
				local data2 = {
					start = client:GetShootPos(),
					endpos = client:GetShootPos() + client:GetAimVector() * 72,
					filter = client
				}
				local trace = util.TraceLine(data2)
				position = trace.HitPos + Vector(0, 0, 16)
			end

			local entity2 = entity
			local entity = ents.Create("nut_barrel")
			entity:SetPos(position)

			if (IsValid(entity2)) then
				entity:SetAngles(entity2:GetAngles())
			end
			
			entity:Spawn()
			entity:Activate()
		end
	end
}