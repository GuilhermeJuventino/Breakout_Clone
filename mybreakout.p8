pico-8 cartridge // http://www.pico-8.com
version 36
__lua__
function _init()
	ball_x = 50
	ball_y = 50
	ball_dx = 2
	ball_dy = 2
	ball_r = 2

	pad_x = 52
	pad_y = 120
	pad_dx = 0
	pad_w = 24
	pad_h = 3
	pad_c = 7
	cls()
end


function _update()
	local buttpress = false
	if btn(0) then
		--left
		pad_dx = -5
		buttpress = true
	end
	
	if btn(1) then
		--right
		pad_dx = 5
		buttpress = true
	end
	
	if not(buttpress) then
		pad_dx /= 1.7
	end
	
	pad_x += pad_dx

	ball_x += ball_dx
	ball_y += ball_dy

	
	if ball_x > 127 or ball_x < 0 then
		ball_dx = -ball_dx
		sfx(0)
	end
	
	if ball_y > 127 or ball_y < 0 then
		ball_dy = -ball_dy
		sfx(0)
	end
	
	pad_c = 7
	
	-- check if ball hits the pad.
	if ball_box(pad_x,pad_y,pad_w,pad_h) then
		--handle collision
		pad_c = 8
		ball_dy = -ball_dy
	end
end


function _draw()
	rectfill(0,0,127,127,1)
	circfill(ball_x,ball_y,ball_r,10)
	rectfill(pad_x,pad_y,pad_x+pad_w,pad_y+pad_h,pad_c)
end


function ball_box(box_x,box_y,box_w,box_h)
	-- checks for collision between the ball and a rectangle.
	if ball_y - ball_r > box_y + box_h then
		return false
	end
	
	if ball_y + ball_r < box_y then
		return false
	end
	
	if ball_x - ball_r > box_x + box_w then
		return false
	end
	
	if ball_x + ball_r < box_x then
		return false
	end
	
	return true
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00010000133200f3300d3300b3300b3300b3200b3200b3200b3200d3200f3200f32011330133200a4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
