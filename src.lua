-- get the start and end region
local model = script.Parent
local function GetRegionAnchor(name)
	local box = model:FindFirstChild(name)
	if box then
		box.CanCollide = false
		box.Anchored = true
		box.CanTouch = false
		box.Transparency = 0.5
	end
	return box
end

-- handle creation and deletion of parts 
local box_start = GetRegionAnchor("BoxStart")
local box_end = GetRegionAnchor("BoxEnd")
local part_count = 0
local part_limit = 50
local function SpawnPart()
	if part_count >= part_limit then
		return
	else
		part_count = part_count + 1
	end
	-- create a new part within the region
	local start_pos = box_start.Position
	local end_pos = box_end.Position
	local random_pos = Vector3.new(
			math.random(start_pos.X, end_pos.X),
			math.random(start_pos.Y, end_pos.Y),
			math.random(start_pos.Z, end_pos.Z))
	local new_part = Instance.new("Part")
	new_part.Parent = model
	new_part.Position = random_pos
	new_part.Size = Vector3.new(1, 1, 1)
	new_part.Shape = "Ball"
	-- delete the part if the player touches it
	new_part.Touched:Connect(function(collider)
		local collider_parent = collider.Parent
		if collider_parent:FindFirstChildWhichIsA("Humanoid") then
			part_count = part_count - 1
			new_part:Destroy()			
		end
	end)
end

-- create new parts periodically
local run_service = game:GetService("RunService")
local current_time = 0
local duration = 1
run_service.Heartbeat:Connect(function(delta_time)
	current_time = current_time + delta_time;
	if current_time >= duration then
		current_time = current_time - duration
		SpawnPart()
	end
end)
