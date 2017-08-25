minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname:sub(1, 14) ~= "node_formspec:" then
		return
	end
	local f = formname:find(")") or 15
	local pos = minetest.string_to_pos(formname:sub(15, f))
	if not pos then
		return
	end
	local node_def = minetest.registered_nodes[minetest.get_node(pos).name]
	if not node_def or not node_def.on_receive_fields then
		return
	end
	node_def.on_receive_fields(pos, formname:sub(f+1), fields, player)
	return true
end)
